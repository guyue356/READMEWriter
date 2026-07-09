#!/usr/bin/env bash
# install.sh — Cross-platform installer for github-readme-writer-skill
# Usage: ./install.sh [--platform <platform>] [--all] [--dry-run]

set -euo pipefail

SKILL_NAME="github-readme-writer-skill"
SKILL_DIR="$(cd "$(dirname "$0")" && pwd)"
DRY_RUN=false
TARGET_PLATFORM=""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

log() { echo -e "${GREEN}[install]${NC} $1"; }
warn() { echo -e "${YELLOW}[warn]${NC} $1"; }
error() { echo -e "${RED}[error]${NC} $1"; }

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --platform) TARGET_PLATFORM="$2"; shift 2 ;;
        --all) TARGET_PLATFORM="all"; shift ;;
        --dry-run) DRY_RUN=true; shift ;;
        -h|--help)
            echo "Usage: $0 [--platform <platform>] [--all] [--dry-run]"
            echo ""
            echo "Platforms: claude, copilot, codex, gemini, kiro, cline, roo, cursor, windsurf, trae"
            echo ""
            echo "Options:"
            echo "  --platform <name>  Install to specific platform"
            echo "  --all              Install to all detected platforms"
            echo "  --dry-run          Show what would be done without doing it"
            exit 0
            ;;
        *) error "Unknown option: $1"; exit 1 ;;
    esac
done

install_to() {
    local dest="$1"
    local platform="$2"

    if $DRY_RUN; then
        log "[dry-run] Would copy $SKILL_DIR → $dest"
        return
    fi

    mkdir -p "$(dirname "$dest")"
    if [[ -d "$dest" ]]; then
        rm -rf "$dest"
    fi
    cp -R "$SKILL_DIR" "$dest"
    log "Installed to $dest ($platform)"
}

# Detect and install
install_for_platform() {
    local platform="$1"
    case "$platform" in
        claude)
            install_to "$HOME/.claude/skills/$SKILL_NAME" "Claude Code"
            ;;
        copilot)
            install_to "$HOME/.copilot/skills/$SKILL_NAME" "GitHub Copilot CLI"
            ;;
        codex)
            install_to "$HOME/.agents/skills/$SKILL_NAME" "Codex CLI"
            ;;
        gemini)
            install_to "$HOME/.gemini/skills/$SKILL_NAME" "Gemini CLI"
            ;;
        kiro)
            install_to "$HOME/.kiro/skills/$SKILL_NAME" "Kiro"
            ;;
        cline)
            install_to "$HOME/.cline/skills/$SKILL_NAME" "Cline"
            ;;
        roo)
            install_to "$HOME/.roo/skills/$SKILL_NAME" "Roo Code"
            ;;
        cursor)
            install_to ".cursor/skills/$SKILL_NAME" "Cursor (project)"
            ;;
        windsurf)
            install_to "$HOME/.codeium/windsurf/skills/$SKILL_NAME" "Windsurf"
            ;;
        trae)
            install_to ".trae/rules/$SKILL_NAME" "Trae (project)"
            ;;
        *)
            error "Unknown platform: $platform"
            return 1
            ;;
    esac
}

auto_detect() {
    local detected=()

    [[ -d "$HOME/.claude" ]] && detected+=("claude")
    [[ -d "$HOME/.copilot" ]] && detected+=("copilot")
    [[ -d "$HOME/.gemini" ]] && detected+=("gemini")
    [[ -d "$HOME/.kiro" ]] && detected+=("kiro")
    [[ -d "$HOME/.cline" || -d ".clinerules" ]] && detected+=("cline")
    [[ -d "$HOME/.roo" ]] && detected+=("roo")
    [[ -d ".cursor" ]] && detected+=("cursor")
    [[ -d "$HOME/.codeium/windsurf" || -d ".windsurf" ]] && detected+=("windsurf")
    [[ -d ".trae" ]] && detected+=("trae")

    if [[ ${#detected[@]} -eq 0 ]]; then
        warn "No supported platform detected."
        echo ""
        echo "Install manually by specifying a platform:"
        echo "  $0 --platform claude"
        echo "  $0 --platform cursor"
        echo ""
        echo "Or install to all platforms:"
        echo "  $0 --all"
        exit 0
    fi

    log "Detected platforms: ${detected[*]}"
    for p in "${detected[@]}"; do
        install_for_platform "$p"
    done

    # Also install to universal path
    install_to "$HOME/.agents/skills/$SKILL_NAME" "Universal"
}

# Also create symlink at universal path if installing to specific platform
install_universal_link() {
    local universal="$HOME/.agents/skills/$SKILL_NAME"
    if [[ ! -e "$universal" ]] && ! $DRY_RUN; then
        mkdir -p "$HOME/.agents/skills"
        ln -sf "$SKILL_DIR" "$universal" 2>/dev/null || true
    fi
}

# Main
if [[ -n "$TARGET_PLATFORM" ]]; then
    if [[ "$TARGET_PLATFORM" == "all" ]]; then
        for p in claude copilot codex gemini kiro cline roo cursor windsurf trae; do
            install_for_platform "$p" || true
        done
    else
        install_for_platform "$TARGET_PLATFORM"
    fi
    install_universal_link
else
    auto_detect
fi

log "Done! Open a new session and type: /github-readme-writer"

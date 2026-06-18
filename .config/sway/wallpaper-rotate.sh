#!/bin/bash
export SWAYSOCK=$(ls /run/user/$(id -u)/sway-ipc.*.sock 2>/dev/null | head -1)
WALLPAPER_DIR="$HOME/Pictures/wallpapers"
CURRENT_LINK="$HOME/.config/hypr/wallpaper_effects/.wallpaper_current"
INTERVAL=1800  # 30 minutes

mapfile -t WALLS < <(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.webp" \) | sort)

if [ ${#WALLS[@]} -eq 0 ]; then
    exit 1
fi

IDX_FILE="/tmp/wallpaper_idx"
IDX=$(cat "$IDX_FILE" 2>/dev/null || echo 0)
IDX=$(( (IDX + 1) % ${#WALLS[@]} ))
echo "$IDX" > "$IDX_FILE"

NEXT="${WALLS[$IDX]}"
ln -sf "$NEXT" "$CURRENT_LINK"
swaymsg output '*' bg "$NEXT" fill

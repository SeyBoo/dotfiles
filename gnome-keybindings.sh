#!/bin/bash
# GNOME keybindings restore

dconf load /org/gnome/desktop/wm/keybindings/ << 'EOF'
[/]
close=['<Alt>F4', '<Super>w']
maximize=@as []
move-to-workspace-1=['<Super><Shift>1']
move-to-workspace-2=['<Super><Shift>2']
move-to-workspace-3=['<Super><Shift>3']
move-to-workspace-4=['<Super><Shift>4']
move-to-workspace-5=['<Super><Shift>5']
switch-input-source=['<Super><Shift>space', 'XF86Keyboard']
switch-to-workspace-1=['<Super>1']
switch-to-workspace-2=['<Super>2']
switch-to-workspace-3=['<Super>3']
switch-to-workspace-4=['<Super>4']
switch-to-workspace-5=['<Super>5']
toggle-fullscreen=['<Super>f']
unmaximize=@as []
EOF

echo "GNOME keybindings applied"

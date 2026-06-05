#!/bin/bash
# GNOME keybindings — Sway-like setup

# Close window
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>F4', '<Super>w']"

# Fullscreen
gsettings set org.gnome.desktop.wm.keybindings toggle-fullscreen "['<Super>f']"

# Workspaces (static, 5)
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.desktop.wm.preferences num-workspaces 5

# Switch to workspace
for i in 1 2 3 4 5; do
  gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
  gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-$i "['<Super><Shift>$i']"
done

# Clear dash app shortcuts (conflict with workspace switching)
for i in 1 2 3 4 5 6 7 8 9; do
  gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
done

# Input source switcher → Super+Shift+Space
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Super><Shift>space', 'XF86Keyboard']"

# Terminal → Super+Enter
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings \
  "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/', \
    '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/']"

gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/ptyxis --new-window'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>Return'

# Launcher (ulauncher) → Super+Space
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ name 'Launcher'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ command 'ulauncher-toggle'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/ binding '<Super>space'

echo "Done! Restart GNOME Shell or log out/in to apply."

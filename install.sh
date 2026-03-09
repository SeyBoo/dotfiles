#!/bin/bash
# Dotfiles install script
# Symlinks configs to the right locations

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR"

# Symlink .config directories
for dir in "$DOTFILES_DIR"/.config/*/; do
    name=$(basename "$dir")
    target="$HOME/.config/$name"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing $target -> ${target}.bak"
        mv "$target" "${target}.bak"
    fi

    ln -sfn "$dir" "$target"
    echo "Linked ~/.config/$name"
done

# Symlink home dotfiles
for file in "$DOTFILES_DIR"/home/.*; do
    [ "$(basename "$file")" = "." ] || [ "$(basename "$file")" = ".." ] && continue
    name=$(basename "$file")
    target="$HOME/$name"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing $target -> ${target}.bak"
        mv "$target" "${target}.bak"
    fi

    ln -sfn "$file" "$target"
    echo "Linked ~/$name"
done

# Symlink home dotfiles (non-hidden, like .zshrc stored without dot)
for file in "$DOTFILES_DIR"/home/*; do
    [ ! -f "$file" ] && continue
    name=".$(basename "$file")"
    target="$HOME/$name"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing $target -> ${target}.bak"
        mv "$target" "${target}.bak"
    fi

    ln -sfn "$file" "$target"
    echo "Linked ~/$name"
done

echo "Done!"

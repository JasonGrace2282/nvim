if test -d "$HOME/.config/nvim"; then
  echo "Backing up neovim config"
  mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup"
fi

"Cloning config"
git clone https://github.com/JasonGrace2282/nvim.git "$HOME/.config/nvim"
rm -rf "$HOME/.config/nvim/.git"

echo "Setting up projects"
echo "return {}" > "$HOME/.config/nvim/lua/config/projects.lua"

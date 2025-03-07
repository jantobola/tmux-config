#!/bin/sh

tpm_dir="$HOME/.tmux/plugins/tpm"

if [ -d "$tpm_dir" ]; then
  rd=$(pwd)
  cd $tpm_dir
  echo "Updating TPM..."
  git pull
  cd $rd
else
  git clone https://github.com/tmux-plugins/tpm "$tpm_dir" && "$tpm_dir/bin/install_plugins" \
    && echo "TPM installed"
fi

ln -sf "$HOME/.tmux/cfg/.tmux.conf" ~/

if [ "$1" = "zsh" ]; then
  tmux_zsh_init="$(cat ./zsh/zsh_init.sh)"
  sed -i '/#--\[tmux-start\]--/,/#--\[tmux-end\]--/d' "$HOME/.zshrc"
  printf '%s\n%s\n' "$tmux_zsh_init" "$(cat "$HOME/.zshrc")" >"$HOME/.zshrc" \
    && echo "Updated ~/.zshrc"
fi
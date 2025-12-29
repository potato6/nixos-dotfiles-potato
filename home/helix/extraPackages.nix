{ pkgs, ... }:
with pkgs; [

  rustfmt
  rust-analyzer
  clippy
  rustc
  cargo

  lldb
  clang-tools

  # Toml
  taplo

  # Yaml
  yaml-language-server

  # Nix
  nixd
  nixfmt-classic

  # Lua
  stylua
  lua-language-server

  # Python
  ruff
  ty

  # Bash / Shell
  bash-language-server
  shfmt

  # web
  # vscode-css-language-server vscode-eslint-language-server vscode-html-language-server
  # vscode-json-language-server vscode-markdown-language-server
  vscode-langservers-extracted
  emmet-ls

  typescript-language-server
  tailwindcss-language-server
  svelte-language-server
  prettier

  # Markdown
  markdown-oxide
]

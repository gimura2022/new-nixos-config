{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ss = "sudo nixos-rebuild switch --flake ~/nix#nixos";
      v = "vim";
      c = "cd";
      t = "tmux";
    };

    oh-my-zsh = {
      enable = true;

      plugins = [
        "git"
      ];

      theme = "fishy";
    };

    zplug = {
      enable = true;

      plugins = [
        { name = "jeffreytse/zsh-vi-mode"; }
      ];
    };

    plugins = [
      {
        name = "vi-mode";
        src = pkgs.zsh-vi-mode;
        file = "share/zsh-vi-mode/zsh-vi-mode.plugin.zsh";
      }
    ];

    initContent = ''
      export ZVM_SYSTEM_CLIPBOARD_ENABLED=true

      fastfetch
    '';
  };
}

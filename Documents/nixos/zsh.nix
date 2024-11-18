{ inputs, config, pkgs, ... }:
{
programs.zsh = {

  enable = true;
  #autosuggestion.enable = true;
  enableCompletion = true;
  autocd = true;

  dotDir = ".config/zsh/";

  history = {
    expireDuplicatesFirst = true;
    ignoreSpace = false;
    save = 15000;
    share = true;
  };

  shellAliases = {

    c="clear"; # clear terminal
    l="${pkgs.eza}/bin/eza -lh --icons=auto"; # long list
    ls="${pkgs.eza}/bin/eza -1 --icons=auto"; # short list
    ll="${pkgs.eza}/bin/eza -lha --icons=auto --sort=name --group-directories-first"; # long list all
    ld="${pkgs.eza}/bin/eza -lhD --icons=auto"; # long list dirs
    lt="${pkgs.eza}/bin/eza --icons=auto --tree"; # list folder as tree
    llm = "${pkgs.eza}/bin/eza -lbGd --git --sort=modified --group-directories-first --icons";
    la = "${pkgs.eza}/bin/eza -lbhHigmuSa --time-style=long-iso --git --color-scale --group-directories-first --icons";
    lx = "${pkgs.eza}/bin/eza -lbhHigmuSa@ --time-style=long-iso --git --color-scale --group-directories-first --icons";
    # lt = "${pkgs.eza}/bin/eza --tree --level=2 --group-directories-first --icons";
    
    nixgit  = "/home/quiet/.config/hypr/scripts/chezmoi.sh";
    vc="code"; # gui code editor
    lsblk = "lsblk -o name,mountpoint,label,size,type,uuid";

    rebuild = "/home/quiet/.config/hypr/scripts/nix.sh rebuild";
    update = "/home/quiet/.config/hypr/scripts/nix.sh update";
    cleanup = "/home/quiet/.config/hypr/scripts/nix.sh gc";
    nixconf = "code /home/quiet/Documents/nixos/";
    hyprconf = "code /home/quiet/.config/hypr/";
    mkdir = "mkdir -p";

    # dl = "yt-dlp";
    # flakedir = "nix flake new -t github:nix-community/nix-direnv . & direnv allow";
    # pyvenv = "python -m venv .venv --copies & echo 'export VIRTUAL_ENV=.\"venv\"' >> .direnv & echo 'layout python' >> .envrc & echo & direnv allow";
    # pia = "cd ~/Documents/PIA/ && sudo PIA_USER= PREFERRED_REGION= PIA_PASS= VPN_PROTOCOL=wireguard ./get_region.sh && cd -";
    # piad = "sudo wg-quick down pia";
  };
  initExtraFirst = ''
      # show wives
      fastfetch
      # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
      # Initialization code that may require console input (password prompts, [y/n]
      # confirmations, etc.) must go above this block; everything else may go below.
    #   if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
    #     source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
    #   fi
  '';
  initExtra = ''
    export PATH=$HOME/.local/bin:$PATH
    eval "$(zoxide init zsh)"
    eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/config.toml)"
    # eval "$(direnv hook zsh)"
  '';

  zplug = {
    enable = true;
    plugins = [
      { name = "zsh-users/zsh-autosuggestions"; }
      { name = "zsh-users/zsh-completions"; }
      { name = "zsh-users/zsh-syntax-highlighting"; }
      { name = "chisui/zsh-nix-shell"; }
      { name = "nix-community/nix-zsh-completions"; }
      { name = "zsh-users/zsh-history-substring-search"; }
      { name = "chrissicool/zsh-256color"; }
      { name = ""; }

    ];
  };
};
}
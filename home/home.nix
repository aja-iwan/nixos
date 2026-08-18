{ config, lib, pkgs, ... }:

{
  home.username = "iwan";
  home.homeDirectory = "/home/iwan";
  home.stateVersion = "26.05"; 
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      rebuild = "sudo nixos-rebuild switch --flake .#nixos";
      garbage = "sudo nix-collect-garbage -d";
      ls = "ls -a";
      ll = "ls -la";
      mkdir = "mkdir -pv";
      n = "nvim";
      c = "clear";
      h = "history";
      q = "exit";
    };

    oh-my-zsh = {
      enable = true;
      theme = "bira"; 
      plugins = [ "git" "sudo" ]; 
    };
    
    initContent = ''
      function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d ''''\'''' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
	command rm -f -- "$tmp"
      }
    '';
  };
  
  xdg.configFile."kitty" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/config/kitty";
  };
  
  xdg.configFile."yazi" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/config/yazi";
  };
  
  xdg.configFile."nvim" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/config/nvim";
  };

  xdg.configFile."niri" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixos/home/config/niri";
  };
}

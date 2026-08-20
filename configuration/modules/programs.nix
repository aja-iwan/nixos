{ config, lib, pkgs, ... }:

{
  # Packages User.
  users.users."iwan" = {
    isNormalUser = true;
    description = "iwan";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      gcc 
      git 
      curl 
      wget 
      perl 
      cmake 
      sassc 
      wmctrl
      gnumake
    ];
  };

  # Packages System.
  environment.systemPackages = with pkgs; [
    brave
    neovim
    yazi
    kitty
    #python3
    #vscode.fhs
    #kdePackages.kdenlive
    #ffmpeg-full
    #frei0r
    wl-clipboard
    gnome-tweaks
    tree-sitter
    ripgrep
    fzf
    fd
  ];
  
  # Packages Program.
  programs.zsh.enable = true;
  programs.firefox.enable = false;
  virtualisation.waydroid = {
    enable = true;
    package = pkgs.waydroid-nftables;
  };
  

  # Packages Font.
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
  
  # Settings.
  xdg.terminal-exec = {
    enable = true;
    settings = {
      default = [ "kitty.desktop" ];
    };
  };
}

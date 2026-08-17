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
    librewolf
    neovim
    yazi
    kitty
    #python3
    #vscode.fhs
    #kdePackages.kdenlive
    #ffmpeg-full
    #frei0r
    gnome-tweaks
    tree-sitter
    ripgrep
    fzf
    fd
  ];
  
  # Packages Program.
  programs.zsh.enable = true;
  programs.firefox.enable = false;

  # Packages Font.
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

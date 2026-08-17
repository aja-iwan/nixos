{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [ ./noctalia.nix ];

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };
  
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
  
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  
  security.polkit.enable = true;
  
  environment.systemPackages = with pkgs; [
    hyprpolkitagent
    kdePackages.qtwayland
    qt5.qtwayland
  ];
}

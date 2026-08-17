{ inputs, config, lib, pkgs, ... }:

{
  imports =
    [
      ./modules/hardware.nix
      ./modules/programs.nix
      ./modules/system.nix
      ./features/niri.nix
      #./features/hyprland.nix
    ];

  services.flatpak.enable = true;
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "26.05";
}

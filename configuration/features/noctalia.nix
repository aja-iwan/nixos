{ inputs, config, lib, pkgs, ... }:

{
  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  
  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
}

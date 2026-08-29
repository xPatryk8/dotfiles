{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  users.users.patryk = {
      isNormalUser = true;
      extraGroups = [ "wheel" ]; 
  };

  nix.optimise = {
    automatic = true;
    dates = [ "daily" ];
    persistent = true;
  }; 

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 31d";
  };

  nix.settings.experimental-features = ["nix-command" "flakes" ];

  programs.hyprland.enable = true;

  time.timeZone = "Europe/Warsaw";
  i18n.defaultLocale = "en_US.UTF-8";

  services.power-profiles-daemon.enable = true;
  services.upower.enable = true;
  services.printing.enable = true;
  services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
  };

  hardware.graphics.enable = true;
  hardware.bluetooth.enable = true;
  hardware.enableRedistributableFirmware = true;
    
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "26.05"; # Did you read the comment?
}


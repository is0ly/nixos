{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "oivoss"; # Define your hostname.


  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  users.users.ilia = {
    isNormalUser = true;
    description = "ilia";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    packages = with pkgs; [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
  wget
  btop
  lsd
  neovim
  git
  neofetch
  kitty
  google-chrome
  rofi-wayland-unwrapped
  blueman
  pavucontrol
  zsh
  telegram-desktop
  starship
  swww
  dunst
  spotify
  cbonsai
   ];

  programs.hyprland = {
	enable = true;
};


  services.openssh.enable = true;

   hardware.bluetooth.enable = true;
   hardware.bluetooth.powerOnBoot = true;
   services.blueman.enable = true;

   security.rtkit.enable = true;
   services.pipewire = {
   	enable = true;
	alsa.enable = true;
	alsa.support32Bit = true;
	pulse.enable = true;
};

  fonts.packages = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  noto-fonts-color-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "JetBrainsMono"]; })
];

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  system.stateVersion = "24.05"; # Did you read the comment?

}

{ config, pkgs, ... }:
{
boot.supportedFilesystems = [ "ntfs" ];
services.flatpak.enable = true;

environment.gnome.excludePackages = (with pkgs; [
  gnome-photos
  gnome-tour
  gnome-console
]) ++ (with pkgs.gnome; [
  # cheese # webcam tool
  gnome-music
  # gnome-terminal
  gedit # text editor
  gnome-shell-extensions
  epiphany # web browser
  geary # email reader
  evince # document viewer
  # gnome-characters
  totem # video player
  tali # poker game
  iagno # go game
  hitori # sudoku game
  atomix # puzzle game
]);

services.xserver.excludePackages = [ pkgs.xterm ];


nixpkgs.config.allowUnfree = true;

services.xserver.videoDrivers = [ "amdgpu" "radeon" "nvidia" ];
hardware.opengl.enable = true;
# Optionally, you may need to select the appropriate driver version for your specific GPU.
hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.stable;


programs.kdeconnect.package = pkgs.gnomeExtensions.gsconnect;
programs.kdeconnect.enable = true;
}

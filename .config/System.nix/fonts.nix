{ config, pkgs, ... }:
{
fonts.fonts = with pkgs; [
  noto-fonts
  noto-fonts-cjk
  noto-fonts-emoji
  liberation_ttf
  fira-code
  fira-code-symbols
  mplus-outline-fonts.githubRelease
  dina-font
  proggyfonts
  corefonts
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" ]; })
];

fonts.fontDir.enable = true;

}

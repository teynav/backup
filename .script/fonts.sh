#!/bin/bash
extra_fonts="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0-RC/Hack.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0-RC/FiraMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0-RC/FiraCode.zip"
mkdir extra_fonts
cd extra_fonts
for fonts in $extra_fonts
do
    wget $fonts
done

for fonts_d in  *.zip
do
    unzip -o $fonts_d -d ~/.local/share/fonts
done

cd ..
rm -rf extra_fonts

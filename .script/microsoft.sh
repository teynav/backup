# Define mirror
# List of mirrors => 
# mirrors="aarnet  cdnetworks-kr-1  citylan  dfn  freefr  garr  heanet  hivelocity  ignum  internode  iweb  jaist  nchc  netcologne  space  superb-dca2  superb-dca3  superb-sea2  switch  tenet  ufpr  voxel  waix" 
mirror=freefr
link="http://$mirror.dl.sourceforge.net/project/corefonts/the%20fonts/final/"
to_download="andale32.exe arial32.exe arialb32.exe comic32.exe courie32.exe georgi32.exe impact32.exe times32.exe trebuc32.exe webdin32.exe verdan32.exe wd97vwr32.exe"


#Install wget and cabextract

mkdir microsoft_fonts
cd microsoft_fonts

for i in $to_download
do
    echo Downloading $i
    wget $link$i 2>/dev/null
    cabextract $i &
done

wait
mkdir fonts
mv *.ttf fonts/
mv *.TTF fonts/

mkdir ~/.local/share/fonts 2> /dev/null

mv -f fonts/* ~/.local/share/fonts/
cd ..
rm -rf microsoft_fonts

# -----------------------------------------------------
# Check to use wallpaper cache
# -----------------------------------------------------

if [ -f ~/.config/ml4w/settings/wallpaper_cache ]; then
  use_cache=1
  echo ":: Using Wallpaper Cache"
else
  use_cache=0
  echo ":: Wallpaper Cache disabled"
fi

# -----------------------------------------------------
# Set defaults
# -----------------------------------------------------

force_generate=0
generatedversions="$HOME/.config/ml4w/cache/wallpaper-generated"
cachefile="$HOME/.config/ml4w/cache/current_wallpaper"
blurredwallpaper="$HOME/.config/ml4w/cache/blurred_wallpaper.png"
blurfile="$HOME/.config/ml4w/settings/blur.sh"
defaultwallpaper="$HOME/wallpaper/default.jpg"
blur="50x30"
blur=$(cat $blurfile)

# Create folder with generated versions of wallpaper if not exists
if [ ! -d $generatedversions ]; then
  mkdir $generatedversions
fi

# -----------------------------------------------------
# Get selected wallpaper
# -----------------------------------------------------

if [ -z $1 ]; then
  if [ -f $cachefile ]; then
    wallpaper=$(cat $cachefile)
  else
    wallpaper=$defaultwallpaper
  fi
else
  wallpaper=$1
fi
used_wallpaper=$wallpaper
echo ":: Setting wallpaper with source image $wallpaper"
tmpwallpaper=$wallpaper

# -----------------------------------------------------
# Copy path of current wallpaper to cache file
# -----------------------------------------------------

if [ ! -f $cachefile ]; then
  touch $cachefile
fi
echo "$wallpaper" >$cachefile
echo ":: Path of current wallpaper copied to $cachefile"

# -----------------------------------------------------
# Get wallpaper filename
# -----------------------------------------------------
wallpaperfilename=$(basename $wallpaper)
echo ":: Wallpaper Filename: $wallpaperfilename"

# -----------------------------------------------------
# Execute matugen
# -----------------------------------------------------

echo ":: Execute matugen with $used_wallpaper"
$HOME/.cargo/bin/matugen image $used_wallpaper

# -----------------------------------------------------
# Reload Waybar
# -----------------------------------------------------

killall -SIGUSR2 waybar

# -----------------------------------------------------
# Reload Ghostty
# -----------------------------------------------------

systemctl reload --user app-com.mitchellh.ghostty.service

# -----------------------------------------------------
# Update SwayNC
# -----------------------------------------------------
sleep 0.1
swaync-client -rs

# -----------------------------------------------------
# Created blurred wallpaper
# -----------------------------------------------------

if [ -f $generatedversions/blur-$blur-$effect-$wallpaperfilename.png ] && [ "$force_generate" == "0" ] && [ "$use_cache" == "1" ]; then
  echo ":: Use cached wallpaper blur-$blur-$effect-$wallpaperfilename"
else
  echo ":: Generate new cached wallpaper blur-$blur-$effect-$wallpaperfilename with blur $blur"
  # notify-send --replace-id=1 "Generate new blurred version" "with blur $blur" -h int:value:66
  magick $used_wallpaper -resize 75% $blurredwallpaper
  echo ":: Resized to 75%"
  if [ ! "$blur" == "0x0" ]; then
    magick $blurredwallpaper -blur $blur $blurredwallpaper
    cp $blurredwallpaper $generatedversions/blur-$blur-$effect-$wallpaperfilename.png
    echo ":: Blurred"
  fi
fi
cp $generatedversions/blur-$blur-$effect-$wallpaperfilename.png $blurredwallpaper

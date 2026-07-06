#!/usr/bin/env bash
# install.sh
# Corre esto en una instalación NUEVA de Arch Linux para dejar todo listo:
# pacman, flatpak, y tus dotfiles de Hyprland (incluye el script de
# logout/apagado, porque va dentro de .config).
#
# Uso (dentro del repo ya clonado):
#   git clone git@github.com:Wuwilaptop/negro.git ~/dotfiles
#   cd ~/dotfiles
#   chmod +x install.sh
#   ./install.sh

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DST="$HOME/.config"
WALL_DST="$HOME/wall"

echo "==================================================================="
echo " Instalador de dotfiles - $(date)"
echo "==================================================================="

# --- 1. Sistema base al día -------------------------------------------------
echo "==> Actualizando sistema ..."
sudo pacman -Syu --noconfirm

# --- 2. Paquetes oficiales (pacman) -----------------------------------------
if [ -s "$REPO_DIR/packages/pacman.txt" ]; then
  echo "==> Instalando paquetes de pacman ..."
  sudo pacman -S --needed --noconfirm - < "$REPO_DIR/packages/pacman.txt"
fi

# --- 3. Flatpak ---------------------------------------------------------------
if [ -s "$REPO_DIR/packages/flatpak.txt" ]; then
  echo "==> Configurando flatpak ..."
  sudo pacman -S --needed --noconfirm flatpak
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  while IFS= read -r app; do
    [ -z "$app" ] && continue
    echo "   Instalando flatpak: $app"
    flatpak install -y flathub "$app" || echo "   (no se pudo instalar $app, sigo con los demás)"
  done < "$REPO_DIR/packages/flatpak.txt"
fi

# --- 4. Dotfiles (.config y wall) --------------------------------------------
echo "==> Respaldando .config actual (si existe) ..."
if [ -d "$CONFIG_DST" ]; then
  mv "$CONFIG_DST" "${CONFIG_DST}.bak-$(date +%Y%m%d-%H%M%S)"
fi
mkdir -p "$CONFIG_DST"

echo "==> Copiando configs de Hyprland/waybar/etc ..."
cp -r "$REPO_DIR"/config/. "$CONFIG_DST"/

echo "==> Copiando wallpapers ..."
mkdir -p "$WALL_DST"
cp -r "$REPO_DIR"/wall/. "$WALL_DST"/

# --- 5. Extras típicos de un setup Hyprland (ajusta a tu gusto) -------------
echo "==> Habilitando servicios comunes (si están instalados) ..."
for svc in NetworkManager bluetooth sddm; do
  if pacman -Qq "$svc" &>/dev/null; then
    sudo systemctl enable --now "$svc" 2>/dev/null || true
  fi
done

echo ""
echo "==================================================================="
echo " Listo. Reinicia sesión / el sistema y entra a Hyprland."
echo " Tu config vieja (si existía) quedó en ${CONFIG_DST}.bak-*"
echo "==================================================================="

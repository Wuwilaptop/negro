# negro 🖤

Mis dotfiles de **Hyprland** en Arch Linux. Incluye configuración completa
(`.config`), wallpapers, y un script para reinstalar todo (paquetes de
pacman + flatpak + configs) en una sola línea cuando reinstale el sistema.

## Contenido

```
negro/
├── install.sh          # instala todo automáticamente
├── config/             # copia de ~/.config (hypr, waybar, wofi, kitty, etc.)
├── wall/                # wallpapers
└── packages/
    ├── pacman.txt       # apps instaladas con pacman
    └── flatpak.txt      # apps instaladas con flatpak
```

## Instalación en un sistema nuevo

```bash
sudo pacman -S --needed git
git clone https://github.com/Wuwilaptop/negro.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

Esto:
1. Actualiza el sistema.
2. Instala todos los paquetes de `packages/pacman.txt`.
3. Instala flatpak y todas las apps de `packages/flatpak.txt`.
4. Copia `config/` a `~/.config` (haciendo respaldo del `.config` viejo si existía).
5. Copia `wall/` a `~/wall`.

Al terminar, solo hace falta reiniciar sesión y entrar a Hyprland — nada de
configuración manual, incluyendo el script de apagado/logout, que ya viene
dentro de `.config`.

## Actualizar el repo después de cambiar algo

Desde la máquina donde tengo todo configurado:

```bash
./backup-dotfiles.sh   # regenera config/, wall/ y las listas de paquetes
cd ~/dotfiles
git push
```

## Notas de seguridad

Este repo **no incluye** perfiles de navegador (Firefox, Chrome, Brave),
Discord, ni ninguna carpeta con sesiones/contraseñas/cookies — quedan
excluidas a propósito en `backup-dotfiles.sh`. Si agrego apps nuevas con
datos sensibles en `.config`, hay que sumarlas a la lista de exclusiones
antes de correr el backup de nuevo.

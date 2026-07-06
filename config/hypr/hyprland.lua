-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- EDIT THIS CONFIG ACCORDING TO THE WIKI INSTRUCTIONS.  --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

------------------
---- MONITORS ----
------------------

-- Configuración de tu monitor eDP-1
hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "ghostty --gtk-single-instance=true"
local fileManager = "nemo"
local menu        = "wofi --show drun"

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function () 
    hl.exec_cmd("nm-applet --indicator")
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("swayosd-server")
    hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GTK_THEME", "Adwaita:dark") -- Tu tema oscuro

-----------------------
----- PERMISSIONS -----
-----------------------

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10, -- Tus gaps_out de 10

        border_size = 2,

        col = {
            active_border   = "rgb(888888)", -- Borde ventana activa (gris claro)
            inactive_border = "rgb(333333)", -- Borde ventana inactiva (gris oscuro)
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "drd", -- Tu layout drd
    },

    decoration = {
        rounding       = 8, -- Tu redondeo de 8
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 3,
            passes    = 1,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})

-- Curves y Animations por defecto del nuevo Hyprland
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easy",         style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "quick" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
    master = {
        new_status = "master",
    },
    scrolling = {
        fullscreen_on_one_column = true,
    },
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        disable_splash_rendering = true,
    },
})

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "latam", -- Tu distribución latinoamericana
        kb_variant = "",
        kb_model   = "",
        kb_options = "", -- Bloq Mayús y teclas especiales nativas
        kb_rules   = "",

        numlock_by_default = true, -- Tu numlock encendido al arrancar

        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = true,          -- Tu scroll natural activo
            tap_to_click = true,            -- Un toque para hacer clic
            clickfinger_behavior = false,   -- Dos dedos en el touchpad para Clic Derecho
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

-- — Aplicaciones básicas —
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + F", function() 
    os.execute("firefox &") 
end)

-- — Ventanas —
hl.bind(mainMod .. " + Q", hl.dsp.window.close()) -- Cerrar ventana activa (Tu atajo SUPER + Q)
hl.bind(mainMod .. " + W", hl.dsp.window.close()) -- Tu otro atajo para cerrar por si acaso
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("hyprctl dispatch exit")) -- Salida segura original

-- — Mover FOCO entre ventanas —
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- — Mover la VENTANA en sí —
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

-- — Escritorios virtuales (Workspaces 1 al 6 como tenías) —
for i = 1, 6 do
    hl.bind(mainMod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- — Captura de pantalla —
hl.bind("Print", hl.dsp.exec_cmd([[grim -g "$(slurp)" - | wl-copy]]))

-- — Audio y Brillo (Teclas multimedia directas, sin SUPER) —
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.5"), "el")
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), "el")
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), "l")
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, repeating = true })

-- — Red, Wallpaper y Menús de apagado —
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd("nm-connection-editor"))
hl.bind("CTRL + SHIFT + F", hl.dsp.exec_cmd("~/Scripts/change-wallpaper.sh"))
-- — Menú de apagado usando tu script de Rofi —
hl.bind(mainMod .. " + Escape", hl.dsp.exec_cmd("~/Scripts/powermenu.sh"))

-- EL ATAJO PARA OCULTAR/MOSTRAR WAYBAR (Estilo PewDiePie)
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("pkill -USR1 waybar"))

-- — Bloquear pantalla —
hl.bind(mainMod .. " + K", hl.dsp.exec_cmd("hyprlock"))

-- — Accesos rápidos para editar configuraciones (Nota: Ahora apunta al .lua) —
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("kitty -e nano ~/.config/hypr/hyprland.lua"))
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.exec_cmd("kitty -e nano ~/.config/waybar/config.jsonc"))
hl.bind(mainMod .. " + CTRL + H", hl.dsp.exec_cmd("kitty -e nano ~/.config/waybar/style.css"))

-- Ratón (Mantener de la plantilla)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- — Luz Nocturna (Toggle con Gammastep) —
hl.bind(mainMod .. "+N", hl.dsp.exec_cmd("~/.config/hypr/scripts/toggle-nightmode.sh"))

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())

-- Atajo para reiniciar Waybar rápido
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("pkill waybar && waybar &"))

-- Iniciar Agente de Autenticación Polkit
hl.dsp.exec_cmd("systemctl --user start hyprpolkitagent")

-- Regla flotante para hyprpolkitagent
hl.window_rule({
    name = "float-polkit",
    match = { class = "hyprpolkitagent" },
    float = true,
})

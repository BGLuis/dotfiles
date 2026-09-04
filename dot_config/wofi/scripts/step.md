-   Crie um script
-   Gere um executavel(chmod +x ~/.config/wofi/scripts/script.sh)
-   Crie um atalho(nano ~/.local/share/applications/powermenu.desktop)

```TOML
[Desktop Entry]
Version=1.0
Type=Application
Name=Script
Comment=Desligar, reiniciar, suspender o sistema
Exec=/home/seu_usuario/.config/wofi/scripts/Script.sh
Icon=system-shutdown
Terminal=false
Categories=System;Utility;
```

-   update-desktop-database ~/.local/share/applications

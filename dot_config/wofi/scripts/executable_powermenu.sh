#!/bin/bash

OPTIONS="Bloquear\nSuspender\nSair (Logout)\nReiniciar\nDesligar"

OPS=$(echo -e "$OPTIONS" | wofi --show dmenu --prompt="Sistema:")

case "$OPS" in
    "Bloquear")
        hyprlock
        ;;
    "Suspender")
        systemctl suspend
        ;;
    "Sair (Logout)")
        exit
        ;;
    "Reiniciar")
        systemctl reboot
        ;;
    "Desligar")
        systemctl poweroff
        ;;
esac

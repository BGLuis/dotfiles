#!/bin/bash
# ~/.config/hypr/scripts/sunset-startup-check.sh
# Verifica se o sistema acabou de inicializar pela manhã para aplicar cores neutras imediatas

UPTIME_SEC=$(cut -d. -f1 /proc/uptime)
CURRENT_HOUR=$(date +%-H)
CURRENT_MIN=$(date +%-M)
TIME_MINUTES=$(( CURRENT_HOUR * 60 + CURRENT_MIN ))

# Janela matinal: 05:00 (300 min) até 09:00 (540 min)
MORNING_START=300
MORNING_END=540

# Limiar de inicialização recente: 10 minutos (600s)
RECENT_BOOT_LIMIT=600

if [ "$UPTIME_SEC" -lt "$RECENT_BOOT_LIMIT" ]; then
    if [ "$TIME_MINUTES" -ge "$MORNING_START" ] && [ "$TIME_MINUTES" -lt "$MORNING_END" ]; then
        # Aguarda brevemente para garantir que o daemon hyprsunset já abriu seu socket IPC
        sleep 1
        hyprctl hyprsunset identity true
    fi
fi

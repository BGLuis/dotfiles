#!/bin/bash
# Captura a tela atual, mas não salva em arquivo, envia para stdout
grim - | swaylock-effects --screenshots --effect-blur 7x5 --indicator-idle-visible

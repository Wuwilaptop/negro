#!/bin/bash

# Comprueba si hyprsunset ya se está ejecutando
if pgrep -x "hyprsunset" > /dev/null; then
    # Si está encendido, lo apaga
    killall hyprsunset
else
    # Si está apagado, lo enciende con una temperatura cálida (ej. 3500K)
    hyprsunset -t 3500 &
fi

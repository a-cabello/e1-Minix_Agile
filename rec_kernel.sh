#!/bin/bash

greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
grayColour="\e[0;37m\033[1m"
endColour="\033[0m\e[0m"

function ctrl_c(){
    echo -e "\n\n${redColour}[!]${endColour} Saliendo...\n"
    exit 1
}

trap ctrl_c INT

echo -e "${greenColour}[+]${endColour} Copiando host..."
copyhost &>/dev/null

while true; do
    echo -ne "\n${grayColour}[+]${endColour} Introduzca ruta al fichero main.c: "
    read main
    if [ ! -f "$main" ]; then
        echo -e "\n ${redColour}[!]${endColour} No existe el fichero ${main}\n"
    else
        cp ${main} /usr/src/kernel
        cd /usr/src/kernel
        make 1>/dev/null
        
        if [ $? -eq 0 ]; then
            echo -e "\n${greenColour}[+]${endColour} Make correcto\n"
            
            cd /usr/src/tools
            make install 1>/dev/null
            
            if [ $? -eq 0 ]; then
                echo -e "${greenColour}[+]${endColour} Recompilacion exitosa, ahora realice halt + exit para reiniciar\n"
                exit 0
            else
                echo -e "\n${redColour}[!]${endColour} Recompilacion erronea\n"
                exit 1
            fi
        else
            echo -e "\n${redColour}[!]${endColour} Make incorrecto, revise el fichero main.c especificado\n"
            exit 1
        fi
    fi
done

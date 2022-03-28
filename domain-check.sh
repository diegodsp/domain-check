#!/bin/sh

echo
while true; do
    echo "*) Digite o domínio (com sufixo '.com.br' ou sem): \c"
    # Parâmetro de entrada, domínio a ser checado
    # DOMAIN="${1}" # se vier do param de entrada
    read DOMAIN # lido da digitação

    # Array de domínios para consultar
    DOMAINS=()
    # Verifica se foi completo, com algum "ponto" ex.: isul.com.br
    if [[ $DOMAIN == *.* ]]; then
        DOMAINS+=($DOMAIN)
    else
        # Testa os domínios mais comuns
        DOMAINS+=("${DOMAIN}.com.br")
        DOMAINS+=("${DOMAIN}.com")
        DOMAINS+=("${DOMAIN}.net")
        DOMAINS+=("${DOMAIN}.app")
        DOMAINS+=("${DOMAIN}.app.br")
        DOMAINS+=("${DOMAIN}.info")
        DOMAINS+=("${DOMAIN}.inf.br")
        DOMAINS+=("${DOMAIN}.me")
        DOMAINS+=("${DOMAIN}.us")
        DOMAINS+=("${DOMAIN}.ca")
        DOMAINS+=("${DOMAIN}.it")
        DOMAINS+=("${DOMAIN}.live")
        DOMAINS+=("${DOMAIN}.digital")
    fi

    # debug...
    # echo ${DOMAINS[@]}
    # exit

    # Loop nos domínios selecionados
    for d in ${DOMAINS[@]}; do
        # Testa o whois
        whois "${d}" > console.txt

        # Busca no resultado a criação
        regex="\.br"
        if [[ $d =~ $regex ]]; then
            LINE=`grep -Ei "created:.+#" console.txt`
        else
            LINE=`grep -Ei "created:.+" console.txt`
        fi
        #
        if [ "$?" -ne "0" ]; then
            echo "${d}: DISPONÍVEL" >> domain-result.txt
        else
            # Parse na data (yyyy-mm-dd)
            regex="([0-9]{4})-?([0-9]{2})-?([0-9]{2})"
            if [[ $LINE =~ $regex ]]; then
                echo "${d}: NÃO DISPONÍVEL: ${BASH_REMATCH[3]}/${BASH_REMATCH[2]}/${BASH_REMATCH[1]}" >> domain-result.txt
            else
                echo "${d}: NÃO DISPONÍVEL: ${LINE}"
            fi
        fi
        rm console.txt
    done

    # Lista os resultados
    cat domain-result.txt
    echo
    echo "Obs.: Para sair pressione ^C"
    echo
    echo
done
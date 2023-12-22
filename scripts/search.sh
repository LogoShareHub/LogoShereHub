#!/bin/bash

function display_help() {
    echo "Uso: $0 [--find FIND_TERM] [--type TYPE] [--resolution RESOLUTION] [--category CATEGORY] [--style STYLE]"
    echo "   --find FIND_TERM       Termo de pesquisa para encontrar o item"
    echo "   --type TYPE            Tipo do item (ex: svg, png)"
    echo "   --resolution RESOLUTION Resolução do item (ex: 32x32, 64x64)"
    echo "   --category CATEGORY    Categoria do item (ex: icon, logo)"
    echo "   --style STYLE          Estilo do item (ex: fill, outline)"
    echo "   -h, --help             Exibe esta mensagem de ajuda"
    exit 1
}
function check_link() {
    local = url="$1"
    if curl --output /dev/null --silent -head --fail "$url"; then
        echo "[.]:$url"
    else
        echo "[X]:$url"
    fi
}
if [ "$#" -lt 2 ]; then
    display_help
fi

while [ "$#" -gt 0 ]; do
    case "$1" in
        --find)
            FIND_TERM="$2"
            shift 2
            ;;
        --type)
            TYPE="$2"
            shift 2
            ;;
        --resolution)
            RESOLUTION="$2"
            shift 2
            ;;
        --category)
            CATEGORY="$2"
            shift 2
            ;;
        --style)
            STYLE="$2"
            shift 2
            ;;
        -h|--help)
            display_help
            ;;
        *)
            echo "Opção desconhecida: $1"
            display_help
            ;;
    esac
done
GITHUB_REPO="https://github.com/LogoShareHub/LogoShereHub/assets"
SEARCH_URL="$GITHUB_REPO/$CATEGORY/$STYLE/$RESOLUTION/$FIND_TERM.$TYPE"
check_link "$SEARCH_URL"
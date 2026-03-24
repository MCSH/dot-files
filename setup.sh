#!/bin/sh

FILES=".zshrc .oh-my-zsh .zsh-custom .config/rofi .config/i3 .config/nvim bin .emacs .emacs.d"

# Files where LINK differs from the repo path: "repo_path:link_path"
CUSTOM_LINKS="zsh/jump.zsh:.zsh/jump.zsh"

DEST=$1

if [ -z "$DEST" ]; then
    DEST="$HOME"
fi

BASE=$(dirname $(readlink -f $0))

ask_install(){
    LINK="$DEST/$2"
    TARGET="$BASE/$1"

    read -r -p "Link $LINK to $TARGET ?[y/N] " response
    case $response in
        [yY])
        LINKDIR=$(dirname "$LINK")
        if [ ! -d "$LINKDIR" ]; then
            mkdir -p "$LINKDIR"
        fi
        if [ -e "$LINK" ]; then
            read -r -p "File exists, override? [y/N]" response
            case $response in
                [yY])
                    rm -r -f "$LINK"
                    ln -s "$TARGET" "$LINK"
                    ;;
            esac
        else
            ln -s "$TARGET" "$LINK"
        fi
        ;;
    esac
}

for FILE in $FILES; do
    ask_install "$FILE" "$FILE"
done

for ENTRY in $CUSTOM_LINKS; do
    SRC="${ENTRY%%:*}"
    DST="${ENTRY#*:}"
    ask_install "$SRC" "$DST"
done

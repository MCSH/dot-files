#!/bin/sh

FILES=".vim .vimrc bin .zshrc .zsh .tmux.conf .tmuxinator .emacs .emacs.d .oh-my-zsh .conkyrc .conky .config/i3"

DEST=$1

if [ -z "$DEST" ]; then
	DEST="$HOME"
fi

BASE=$(dirname $(readlink -f $0))

ask_install(){
	FILENAME=$1

	LINK="$DEST/$FILENAME"
	TARGET="$BASE/$FILENAME"

	read -r -p "Link $LINK to $TARGET ? [y/N] " response
	case $response in
		[yY])
		if [ -e $LINK ]; then
			read -r -p "File exists, override? [y/N]" response
			case $reponse in
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
	ask_install $FILE
done
    	

echo $PWD

ln -s  $PWD/zsh-syntax-highlighting ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 

#ln  ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting zsh-syntax-highlighting

echo "Now add this in the .zshrc plugin as the last element:  zsh-syntax-highlighting"

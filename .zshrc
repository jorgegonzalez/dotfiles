export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/Users/jorge/.oh-my-zsh"

autoload -U promptinit; promptinit
prompt pure

ZSH_THEME=""
plugins=(
  brew
  git
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
)


export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"

unsetopt beep
source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

alias c="clear"
alias vi="nvim"
alias vim='nvim'
alias brewup='brew update; brew upgrade; brew cleanup'
alias zshconfig='nvim ~/.zshrc'
alias fetchconfig='nvim ~/.config/neofetch/config'
alias gitconfig='nvim ~/.gitconfig'
alias rm='trash'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias pipes='pipes.sh'
alias lines='git ls-files | xargs wc -l'
alias npmls='npm -g ls --depth=0'
alias yup='yarn global upgrade --latest'
alias vimconfig='nvim ~/.config/nvim/init.vim'
alias tmuxconfig='nvim ~/.tmux.conf'
alias l="exa -l"


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias dotfiles='/usr/bin/git --git-dir=/Users/jorge/.myconf/ --work-tree=/Users/jorge'

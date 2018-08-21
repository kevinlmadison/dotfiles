# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation.
#. ~/repos/dotfiles/z.sh
# source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
source ~/repos/dotfiles/.abbr_pwd
source /etc/profile.d/quartus.sh
source /opt/Xilinx/Vivado/2018.2/settings64.sh

export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src/
export ZSH=/home/kelevra/.oh-my-zsh
export GOPATH=$HOME/repos/go
export PATH=/home/kelevra/fuchsia/.jiri_root/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/kelevra/bin
export PATH=$PATH:/opt/altera/18.0/nios2eds/sdk2/bin
export QUARTUS_ROOTDIR=$PATH:/opt/altera/18.0/quartus
export SOPC_KIT_NIOS2=$PATH:/opt/altera/18.0/nios2eds
export MONGO_DATABASE_USER='piketest'
export MONGO_DATABASE_PASS='hurraypike1'
export MONGO_DATABASE_IP_ADDRESS='ds263791.mlab.com'
export MONGO_DATABASE_PORT='63791'
export MONGO_DATABASE_NAME='pike-test'
export AUTH_TEST='TRUE'
#Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#export POWERLEVEL9K_MODE='nerdfont-complete'
#ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="agnoster"
#Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"
#Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"
#Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
#Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
#Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"
#Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"keyj
#Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"
#Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"
#Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
#Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
#Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
#Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    z
    rust
    vi-mode
)
source $ZSH/oh-my-zsh.sh
if [ $commands[kubectl] ]; then
    source <(kubectl completion zsh)
fi

#User configuration
#export MANPATH="/usr/local/man:$MANPATH"
#You may need to manually set your language environment
# export LANG=en_US.UTF-8
#Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

#Compilation flags
# export ARCHFLAGS="-arch x86_64"
#ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"
#Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls='exa'
alias gdbxx='gdb --batch --ex run --ex bt --ex q --args'
alias gpom='git push origin master'
alias gcm='git commit -m'
alias wifilist='nmcli dev wifi list'
alias wificonnect='nmcli dev wifi con'
alias vup='. venv/bin/activate'
alias vdown='deactivate'
alias chicago='ssh kelevra@192.3.17.119'
alias uscvpn="sudo openvpn --config ~/client.ovpn --auth-retry interact"
alias fixwifi="sudo systemctl start wpa_supplicant.service"
alias ignite="ssh -p 803 -i ~/Downloads/cloud kevin@carolinaignites.org"
alias hack="traceroute"
alias atlantis='ssh kelevra@162.243.95.220'
alias smashdb='sudo -u kelevra psql -d smash_rankings'

alias memhog='du -a /home | sort -n -r | head -n 5'
alias imaps='ssh -i cloud.key imaps@35.185.49.208'
alias zed='cu -l /dev/ttyACM0 -s 115200'
alias cores='nproc --all'
alias drjava='java -jar drjava-beta-20160913-225446.jar'
alias usclinux='ssh -Y madisonk@129.252.130.176 -p 222'
alias nord='xrdb .Xresources_nord'
alias gruvbox='xrdb .Xresources_gruvbox'
alias vim="nvim"
alias k="kubectl"
alias av='cd ~/repos/cadet/avtec-stack'
alias colemak='setxkbmap -v us -variant colemak'
alias qw='setxkbmap -v us -layout querty'
alias ezsh='vim ~/.zshrc'
alias szsh='source ~/.zshrc'
alias grep='rg'
alias quartus64='quartus --64bit'
alias c='cd'
alias v='vim'
alias grav='ssh -Y micron@graviton.cse.sc.edu'
alias openports='netstat -tupan'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

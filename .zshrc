# Force to load .zshenv
source $HOME/.zshenv

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="cloud"
#ZSH_THEME="fino-time"
#ZSH_THEME="mortalscumbag"
#ZSH_THEME="af-magic"
#ZSH_THEME="macovsky"
ZSH_THEME="bullet-train"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
xcode
jsontools
git git-extras gitfast
osx brew brew-cask
battery laravel5
dirhistory
# common-aliases
rvm mercurial
cp bower composer node
vagrant meteor
atom sublime
urltools
tmux
themes
emacs
scd
sbt scala
autojump
zsh_reload
extract
dircycle
pip python
history-substring-search
terminalapp
emoji-clock
colored-man
web-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:%PATH"
export MANPATH="/usr/local/Cellar/php56/5.6.5/share/man:/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"
source $HOME/.aliases
source $(brew --prefix php-version)/php-version.sh && php-version 5


function cls {
/usr/bin/osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "k" using command down'
}

##hg-prompt

# the bash function
# function hg_prompt_info {
#   hg prompt --angle-brackets "<%{$fg[green]%}@%{$fg[yellow]%}\
# %{$fg[magenta]%}<branch>%{$reset_color%}> " 2>/dev/null
# }

# And the usage of the function. I don't set PS1 directly because
# I'm in a theme of oh-my-zsh but for vanilla bash it is similar
# PROMPT='%{$fg[$NCOLOR]%}%n%{$fg[green]%}@%m%{$reset_color%} %~ \
# $(hg_prompt_info)\
# %{$fg[red]%}%(!.#.»)%{$reset_color%} '
# PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
# RPS1='${return_code}'



# Backspace zsh vim mode
bindkey -v
bindkey "^?" backward-delete-char
bindkey -M vicmd '?' history-incremental-search-backward


[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh
. `brew --prefix`/etc/profile.d/z.sh



############# ENV #############

export EDITOR=vim
export HOMEBREW_GITHUB_API_TOKEN=
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="$HOME/bin:$PATH"
#export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"

# GNU coreutils
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# http://www.yannlaviolette.com/2011/08/mac-removing-dot-underscore-files.html
export COPYFILE_DISABLE=true

# Disable lag when use vim mode in zsh 'bindkey -v'
export KEYTIMEOUT=1

# Short of learning how to actually configure OSX, here's a hacky way to use
# GNU manpages for programs that are GNU ones, and fallback to OSX manpages otherwise
# alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'

# JAVA
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_25.jdk/Contents/Home

# LANG
# export LANG=en_US.UTF8
# export LC_COLLATE=en_US.UTF8
# export LC_CTYPE=en_US.UTF8
# export LC_MESSAGES=en_US.UTF8
# export LC_MONETARY=en_US.UTF8
# export LC_NUMERIC=en_US.UTF8
# export LC_TIME=en_US.UTF8
# export LC_ALL=en_US.UTF8




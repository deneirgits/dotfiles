# Change terminal colors based on pywal output
(cat ~/.cache/wal/sequences &)
# If you come from bash you might have to change your $PATH.
export PATH=/usr/bin:$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="spaceship"

# Spaceship theme options
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  golang        # Go section
  rust          # Rust section
  docker        # Docker section
  pyenv         # Pyenv section
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_RPROMPT_ORDER=(
  exec_time     # Execution time
  time          # Time stamps section
)

SPACESHIP_PROMPT_DEFAULT_PREFIX="| "

SPACESHIP_CHAR_SUFFIX=" "

SPACESHIP_TIME_SHOW="true"
SPACESHIP_TIME_12HR="true"

SPACESHIP_DIR_TRUNC="0"

SPACESHIP_TIME_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_GIT_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_PACKAGE_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_DOCKER_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX
SPACESHIP_EXEC_TIME_PREFIX=$SPACESHIP_PROMPT_DEFAULT_PREFIX

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
#
# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM=/home/deneir/.oh-my-zsh/custom

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
    sudo
    cargo
    docker
    docker-compose
    pip
    pyenv
    python
    rustup
    yarn
	zsh-autosuggestions
)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias zshconfig="vim ~/.zshrc"
alias yay="paru --skipreview --removemake --cleanafter --sudoloop"
alias yeet="paru -Rs"
alias vim="nvim"
alias rm="echo 'Use trash-cli'"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

export EDITOR=vim

export FZF_DEFAULT_COMMAND='rg --hidden --no-ignore --files'
export FZF_CTRL_T_COMMAND='rg --hidden --no-ignore --files'
export FZF_ALT_C_COMMAND='rg --hidden --files --null 2> /dev/null | xargs -0 dirname | sort -u'

source $ZSH/oh-my-zsh.sh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

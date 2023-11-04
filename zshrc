setopt autocd              # change directory just by typing its name
setopt correct             # auto correct mistakes
setopt magicequalsubst     # enable filename expansion for arguments of the form ‘anything=expression’
setopt nonomatch           # hide error message if there is no match for the pattern
setopt notify              # report the status of background jobs immediately
setopt numericglobsort     # sort filenames numerically when it makes sense
setopt promptsubst         # enable command substitution in prompt

export PROMPT_EOL_MARK=""  # hide EOL sign ('%')

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case insensitive tab completion

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=2000
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it

# Enabling and setting git info var to be used in prompt config.
    autoload -Uz vcs_info
    zstyle ':vcs_info:*' enable git svn
    # This line obtains information from the vcs.
    zstyle ':vcs_info:git*' formats "(%b) "
    precmd() {
        vcs_info
    }

# Prompt
prompt="%B%F{red}┌%f"'${VIRTUAL_ENV:+($(basename$VIRTUAL_ENV))}'"%F{red}[%f%F{green}%n%f %F{yellow}🐦‍⬛%f %F{cyan}%m%f%F{red}]─[%F{magenta}%(6~.%-1~/…/%4~.%5~)%f%F{red}]%f%F{204}"'${vcs_info_msg_0_}'"%f"$'\n'"%F{red}└╼%f%F{yellow}$%f %b"

# Load zsh-syntax-highlighting
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [[ -d /opt/homebrew/share/zsh-completions ]]; then
    fpath+=("/opt/homebrew/share/zsh-completions")
    autoload -Uz compinit
    compinit
fi

if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Select all suggestion instead of top on result only
zstyle ':autocomplete:tab:*' insert-unambiguous yes
zstyle ':autocomplete:tab:*' widget-style menu-select
zstyle ':autocomplete:*' min-input 2
bindkey $key[Up] up-line-or-history
bindkey $key[Down] down-line-or-history

# Apply colors for ls command
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
alias ll="ls -alG"

eval "$(rbenv init - zsh)"

export GOPATH=/Users/ms/dev/programmingLanguages/imperative/static/go

export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@17/include"

export PATH="/opt/homebrew/opt/node@18/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/node@18/lib"
export CPPFLAGS="-I/opt/homebrew/opt/node@18/include"

if [[ -r /Users/ms/.opam/opam-init/init.zsh ]]; then
     source /Users/ms/.opam/opam-init/init.zsh > /dev/null 2> /dev/null
fi

. /opt/homebrew/opt/asdf/libexec/asdf.sh

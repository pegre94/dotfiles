source ~/.zsh_env_vars
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
PATH=$PATH:$HOME/.emacs.d/bin
PATH=$PATH:$HOME/.cargo/bin


# Path to your oh-my-zsh installation.
export ZSH="/home/pegre/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"


# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"


FZF_PLUG=/home/pegre/.oh-my-zsh/plugins/fzf/fzf.plugin.zsh
ZVM_INIT_MODE=sourcing
export ZSH_PYENV_QUIET=true
my_init () {
[ -f $FZF_PLUG ] && source $FZF_PLUG
}
# Add wisely, as too many plugins slow down shell startup.
plugins=( git you-should-use zsh-autosuggestions pyenv docker pm2 docker-compose sudo fzf thefuck fasd kubectl zsh_codex)
command -v flux >/dev/null && . <(flux completion zsh)

if ! [  ${INSIDE_EMACS:-null} = vterm ]; then
  plugins=("zsh-vi-mode" "${plugins[@]}")
else
 # start with insert mode
 ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
fi


# User configuration
kall () { ps -ef | grep $1 | grep -v grep | awk '{print $2}' | xargs -r sudo kill -9}
alias startnoise="nohup play -v 0.6 -n synth brownnoise & command >/dev/null 2>&1 &"
alias stopnoise="kall brownnoise"
alias startnoise="nohup play -v 0.6 -n synth brownnoise & command >/dev/null 2>&1 &"
alias startnoise="nohup play -v 0.6 -n synth brownnoise & command >/dev/null 2>&1 &"
alias stopnoise="kall brownnoise"
alias stopnoise="kall brownnoise"
alias startapp="bash ${HOME}/startapp.sh"
alias pi='sshpass -p ondeckpi ssh -o StrictHostKeyChecking=no ubuntu@192.168.5.46'
alias startfire='cd /home/pegre/system-repos/firebase; firebase emulators:start;'

#emacs
alias ec='emacsclient -nw'
CURRENT_REPO=${HOME}/work/backend2
alias startf='pm2 start npm --name "front" -- start --prefix ~/work/frontend'
alias ls='exa'                                                          # ls
alias l='exa -lbF --git'                                                # list, size, type, git
alias ll='exa -lbGF --git'                                             # long list
alias llm='exa -lbGd --git --sort=modified'                            # long list, modified date sort
alias la='exa -lbhHigUmuSa --time-style=long-iso --git --color-scale'  # all list
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --git --color-scale' # all + extended list
alias cat="bat"

kwp () {
 # check if process is running with given id is running and name
 # and kill it
 lsof -i :$1 | grep LISTEN | grep $2 | awk '{print $2}' | xargs -r kill -9
    echo "killed process port $1"
}
get_ngrok_url () {
http_name="${1}"
curl --silent http://127.0.0.1:4040/api/tunnels | jq -r --arg http_name "$http_name" '.tunnels[] | select(.name == $http_name) | .public_url'
}
ra-api () {
export FLASK_CUSTOM_SETTINGS_FILE=.env
export FLASK_APP=app.py
api_path="${HOME}/quant/robo_advisory_api"
port=5000
cd $api_path
flask run -p $port
}
rf-api () {
export FLASK_CUSTOM_SETTINGS_FILE=.env
export QUART_APP=wsgi:app
api_path="${HOME}/quant/robo-front-api"
port=5001
kwp $port "quart"
cd $api_path
quart run -p $port
}
ap-api () {
export FLASK_CUSTOM_SETTINGS_FILE=.env
export FLASK_APP=wsgi:app
export FLASK_DEBUG=1
api_path="${HOME}/quant/qap-api"
port=5005
# kill services running on port 5005
kwp $port "flask"
cd $api_path
flask run -p $port

kwp $port
}

rf () {
export REACT_APP_FRONT_API_URL=`get_ngrok_url rf-api`;
export REACT_APP_FRONT_API_V2_URL=`get_ngrok_url rf-api`/api/v2;
export REACT_APP_REPORT_FRONT_URL=`get_ngrok_url rf`
echo "Starting robo-front with following config:"
echo $REACT_APP_FRONT_API_URL
echo $REACT_APP_FRONT_API_V2_URL
echo $REACT_APP_REPORT_FRONT_URL
cd ~/quant/robo-front;
yarn start;
}

rf-pm2 () {
robo_path="${HOME}/quant/robo-front"
cd $robo_path;
pm2 start npm --name 'robo-front' -- start
}
da () {
da_path="${HOME}/quant/DeepAlpha_front"
cd $da_path;
pm2 start npm --name 'deep-alpha' -- start
}
db () {
  db_path="${HOME}/quant/quant_dco"
  cd $db_path;
  docker-compose up -d;
}
alias insert-data="cd ~/quant/robo-front-api; export FLASK_CUSTOM_SETTINGS_FILE=.env; export QUART_ENV="development"; export QUART_DEBUG=0; export QUART_APP=wsgi:app; python -m quart insert-data;"
alias update-application-defaults="cd ~/quant/robo-front-api; export FLASK_CUSTOM_SETTINGS_FILE=.env; export QUART_ENV="development"; export QUART_DEBUG=0; export QUART_APP=wsgi:app; python -m quart update-application-defaults;"
new-customer-mapping() {cd ~/quant/robo-front-api; export FLASK_CUSTOM_SETTINGS_FILE=.env; export QUART_ENV="development"; export QUART_DEBUG=0; export QUART_APP=wsgi:app; python -m quart new-customer-mapping} 
qf-config-upgrade() {
    rm -rf ~/quant/qf-config/qf-config*;
    gh release download  --repo quantfolio/qf-config  --pattern '*linux*' --dir ~/quant/qf-config;
    chmod +x ~/quant/qf-config/qf-config*
    sudo ln -fs ~/quant/qf-config/qf-config-linux-ldd* /usr/local/bin/qf-config;
}
qfc() {
  cd ${HOME}/quant/qf-config;
  qf-config "$@"
}

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export NODE_PATH=`npm root -g`
export INSOMNIA_PATH="test"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
zle -N create_completion
bindkey '^X' create_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $ZSH/oh-my-zsh.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/pegre/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/pegre/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/pegre/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/pegre/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


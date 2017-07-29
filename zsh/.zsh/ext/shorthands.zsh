# Shorthands
alias ws='cd ~/Workspaces/'
alias reload='source ~/.zshrc'
alias jsdev='docker run -it --rm -v $(pwd):/src -w /src -p 4200:4200 davd/jsdev'
alias dc='docker-compose'
alias ytd="docker run --rm -u $(id -u):$(id -g) -v $PWD:/data vimagick/youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' -k"

export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# Shorthands
alias ws='cd ~/Workspace/ && ls'
alias reload='source ~/.zshrc'
alias jsdev='docker run -it --rm -v $(pwd):/src -w /src -p 4200:4200 davd/jsdev'
alias dc='docker-compose'
alias dm='docker-machine'
alias reload-docker='docker-machine env default'

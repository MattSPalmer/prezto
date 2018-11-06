load_module "${0:h}/git.zsh"

take() {
  nocorrect mkdir -p $1
  cd $1
}

# fns
bot() {
  npm run test -- $@
}

botw() {
  npm run test -- --watch $@
}

function _open_results_in_tabs() {
  if [[ $@ ]]; then
    vim -p $@
    return 0
  fi
  return 1
}

function _select_args() {
  echo $1 | fzf -m
}

function fzp() {
  candidates=$(fd '' $HOME/.zprezto)
  _open_results_in_tabs $(_select_args $candidates)
}

function gim() {
  results=$(rg -l ${@:1})
  if [[ ! $results ]]; then
    return 1
  fi
  _open_results_in_tabs $(_select_args $results)
}

function initdir() {
  for arg in "$@"; do
    nocorrect mkdir -p $arg
    touch $arg/index.js
  done
}

alias idi='initdir'

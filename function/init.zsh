load_module "${0:h}/git.zsh"

# fns
bot() {
  npm run test -- --silent --path=$1
}

botw() {
  npm run test -- --silent --watch --path=$1
}

function _open_results_in_tabs() {
  if [[ $@ ]]; then
    vim -p $@
    return 0
  fi
  return 1
}

function fzp() {
  selection=$(fd '' $HOME/.zprezto | fzf -m)
  _open_results_in_tabs $selection
}

function gim() {
  results=$(rg -l ${@:1})
  if [[ ! $results ]]; then
    return 1
  fi

  selection=$(echo $results | fzf)
  _open_results_in_tabs $selection
}

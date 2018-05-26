load_module "${0:h}/git.zsh"

# fns
bot() {
  npm run test -- --path=$1
}

botw() {
  npm run test -- --watch --path=$1
}

function _open_results_in_tabs() {
  if [[ $@ ]]; then
    vim -p $@
    return 0
  fi
  return 1
}

function gim() {
  results=$(rg -l ${@:1})
  if [[ ! $results ]]; then
    return 1
  fi

  selection=$(echo $results | fzf)
  _open_results_in_tabs $selection
}

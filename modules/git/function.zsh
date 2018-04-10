commit_file() {
  git reset HEAD
  git add $1 && git commit -m "$1"
}

changed_files() {
  echo $(git ls-files -m) $(git ls-files -o --exclude-standard) | tr ' ' '\n'
}

select_commit_range() {
  local count branch initial
  count=${1:=10} &&
  branch=$(fbr) &&
  git log --oneline $branch~$count..$branch | fzf -m | cut -d ' ' -f 1
}

ref_heads() {
  git for-each-ref --sort=committerdate refs/heads/ $@
}

last_branches() {
  ref_heads --format='%(refname:short)' | perl -e 'print reverse <>'
}

fmb() {
  local branches branch
  branches=$(last_branches) &&
  branch=$(echo "$branches" | fzf-tmux -d 15 -m +s) &&
  echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##"
}

fbr() {
  local branches branch
  branches=$(git branch -a --format='%(refname:short)') &&
  branch=$(echo "$branches" | fzf-tmux -d 15 -m +s) &&
  echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##"
}

find_sha() {
  git log --oneline $1 | fzf -m | cut -d ' ' -f 1
}

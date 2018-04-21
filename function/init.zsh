# fns
bot() {
  npm run test -- --path=$1
}

botw() {
  npm run test -- --watch --path=$1
}

#! /usr/bin/env bash

make_lookup_table() {
  # simultatinous declaring as global and assigning will not work in bash 4.2
  # therefore this odd looking declaration is needed
  declare -Ag lookup_table; lookup_table=(
    ["bash_profile"]=".bash_profile"
    ["bashrc"]=".bashrc"
    ["conky.conf"]=".config/conky/conky.conf"
    ["emacs"]=".emacs"
    ["gitconfig"]=".gitconfig"
    ["profile"]=".profile"
    ["tmux.conf"]=".tmux.conf"
    ["vim/vimrc"]=".vimrc"
    ["vim/vimrc_plugins"]=".vimrc_plugins"
  )
}

set_dir_str() {
  declare -r tmp="$1"
  test "/" == "${tmp:-1}" && files_dir="${tmp:0:-1}"
  files_dir="${files_dir}/files"
}

list_files() {
  case "$1" in
    available)
      local f
      for f in $(find "$files_dir" -type f)
      do
        echo "${f/$files_dir}" | sed 's#/##'
      done
      ;;
    enabled)
      local f
      for f in $(find "$HOME" -type l -exec readlink {} \; | grep "$files_dir")
      do
        echo "${f/$files_dir}" | sed 's#/##'
      done
      ;;
  esac
}

enable_file() {
  declare -r f="$1"
  test -f "${files_dir}/${f}" || exit 1
  make_lookup_table
  declare -r dot_file="${lookup_table[${f}]}"
  echo "enabling ${dot_file}"
  ln -s "${files_dir}/${f}" "${HOME}/${dot_file}"
}

disable_file() {
  declare -r f="$1"
  test -f "${files_dir}/${f}" || exit 1
  make_lookup_table
  declare -r dot_file="${lookup_table[${f}]}"
  echo "disabling ${dot_file}"
  rm "${HOME}/${dot_file}"
}

print_help() {
  echo "$0 -l | -e | -d"
}

if test ! "$#" -eq 2
then
  print_help
  exit 1
fi

if test -z "$DOT_FILES_DIR"
then
  echo -n "DOT_FILES_DIR: "
  read files_dir
  set_dir_str "$files_dir"
else
  files_dir="$DOT_FILES_DIR"
  set_dir_str "$files_dir"
fi

case "$1" in
  -l)
    list_files "$2"
    ;;
  -e)
    enable_file "$2"
    ;;
  -d)
    disable_file "$2"
    ;;
  *)
    print_help
    exit 2
    ;;
esac

exit 0

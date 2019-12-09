_up() {
  local -a args
  args=(`echo ${PWD#/} | sed 's/\// /g'`)
  _arguments ':paths:($args[@])'
}

up() {
  local dir

  print_help() {
    echo 'usage: up [integer | directory]'
  }

  while [[ $1 =~ ^- && ! $1 == '--' ]]; do
    case $1 in
      --help | -h)
        print_help
        return 0
        ;;
      *)
        echo 'up: '$1': unknown option.'
        print_help
        return 1
        ;;
    esac
    shift
  done

  if [ -z $1 ]; then
    cd ..
  elif [[ $1 =~ ^[0-9]+$ ]]; then
    dir=$PWD`echo $(yes '/..' | head -n $1) | sed 's/ //g'`
    cd $dir
  elif [[ $1 == $HOME && $PWD =~ $HOME ]]; then
    cd $HOME
  else
    if [[ ! $PWD =~ /$1(/|$) ]]; then
      echo 'up: '$1': could not find directory.'
      return 1
    fi
    dir=${PWD%$1*}$1
    cd $dir &>/dev/null
  fi
}

compdef _up up

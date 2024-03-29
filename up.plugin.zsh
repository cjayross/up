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

    if (( $# > 1 )); then
        echo 'up: trailing arguments.'
        return 1
    fi

    if [ -z $1 ]; then
        cd ..
    elif [[ $1 =~ ^[0-9]+$ ]]; then
        dir=$PWD`echo $(yes '/..' | head -n $1) | sed 's/ //g'`
        cd $dir
    elif [[ $1 == / || $1 =~ $HOME && $PWD =~ $HOME ]]; then
        cd $1
    else
        base=${1%%/*}
        if [[ ! $PWD =~ /$base(/|$) ]]; then
            echo 'up: '$base': could not find directory in $PWD.'
            return 1
        fi
        dir=${PWD%/$base*}/$1
        cd $dir &>/dev/null
        if [[ $? != 0 ]]; then
            echo 'up: '$dir': no such directory.'
        fi
    fi
}

SCM_DEBUG=yes
SCM_ROOT= # stores the current path of detected SCM directory
SCM_TYPE= # stores the repository type (hg|git|svn) of possible detected SCM
SCM_PROMPT_INFO= # stores current SCM specific prompt suffix

[ $SCM_DEBUG ] && unset chpwd_functions \
  precmd_functions \
  scm_aliases_creators \
  scm_prompt_cache \
  scm_prompt_cache_updates
  
declare -A scm_aliases
declare -A scm_aliases_creators
declare -A scm_prompt_creators
declare -A scm_prompt_cache
declare -A scm_prompt_cache_updates

# alias definitions
scm_aliases["add"]=add
scm_aliases["bisect"]=bs
scm_aliases["branch"]=br
scm_aliases["branches"]=lbr
scm_aliases["checkout"]=co
scm_aliases["commit"]=com
scm_aliases["diff"]=dif
scm_aliases["fetch"]=fetch
scm_aliases["grep"]=sgrep
scm_aliases["log"]=sl
scm_aliases["merge"]=x
scm_aliases["move"]=smv
scm_aliases["pull"]=pull
scm_aliases["push"]=push
scm_aliases["rebase"]=rb
scm_aliases["reset"]=reset
scm_aliases["rm"]=srm
scm_aliases["status"]=st
scm_aliases["tag"]=tag
scm_aliases["help"]=help
scm_aliases["record"]=rec
scm_aliases["forget"]=forget

for scm_specifics ($ZSH/lib/scm-prompt/*.zsh) source $scm_specifics

function _scm_debug { [ $SCM_DEBUG ] && echo $* >&2 }
function _scm_init {
  SCM_ROOT=
  SCM_TYPE=
  SCM_PROMPT_INFO=

  # reset aliases (counterpart of scm_create_aliases[])
  for al ($scm_aliases) unalias $al 2> /dev/nul
}

function _scm_get_scm_type {
  if [ $# -eq 1 ]; then
    # missing second arg -> recursive invokation
    _scm_get_scm_type $1 "hg"  || \
    _scm_get_scm_type $1 "git" || \
    _scm_get_scm_type $1 "svn" && return 0 
    return 1
  fi

  [ ! -d "$1/.$2" ] && return 1

  _scm_debug "   -> Is a $2 repository"
  export SCM_ROOT="$1"
  export SCM_TYPE=$2
  $scm_aliases_creators["$SCM_TYPE"] # initialize specific aliases defined scm-prompt.XXX.zsh#XXX_create_aliases
}

# Walks from inital seed path up to the root
# trying to detect a SCM path.
function scm_detect_root {
  # check passed argument
  [ $# -eq 0 ] && _scm_init
  [[ $# -eq 1 && "$1" = "" ]] && return # touched the root (/)
  _DETECT_WD=${1:-$PWD}
  
  echo -ne "." >&2

  # check if current $1 is matching existing HG_CURRENT_ROOT
  # [ ! $HG_CURRENT_ROOT ]  && [[ "$CURRENT_WD" =~ ^$HG_CURRENT_ROOT ]] && return

  _scm_get_scm_type "$_DETECT_WD" && return
  scm_detect_root "${_DETECT_WD%/*}"
}

function scm_update_prompt {
  $scm_prompt_creators["$SCM_TYPE"]
}

# hook up the functions to ZSH events
declare -a chpwd_functions
declare -a precmd_functions
chpwd_functions+='scm_detect_root'
precmd_functions+='scm_update_prompt'



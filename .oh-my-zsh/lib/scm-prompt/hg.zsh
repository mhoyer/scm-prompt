function hg_create_aliases {
  alias $scm_aliases["add"]='hg add' # Add file contents to the index
  alias $scm_aliases["bisect"]='hg bisect' # Find by binary search the change that introduced a bug
  alias $scm_aliases["branch"]='hg branch' # List, create, or delete branches
  alias $scm_aliases["branches"]='hg branches' # List all branches
  alias $scm_aliases["checkout"]='hg update' # Checkout a branch or paths to the working tree
  alias $scm_aliases["commit"]='hg commit' # Record changes to the repository
  alias $scm_aliases["diff"]='hg diff' # Show changes between commits, commit and working tree, etc
  alias $scm_aliases["fetch"]='hg pull' # Download objects and refs from another repository
  alias $scm_aliases["grep"]='hg grep' # Print lines matching a pattern
  alias $scm_aliases["log"]='hg log' # Show commit logs
  alias $scm_aliases["merge"]='hg merge' # Join two or more development histories together
  alias $scm_aliases["move"]='hg mv' # Move or rename a file, a directory, or a symlink
  alias $scm_aliases["pull"]='hg pull --rebase' # Fetch from and merge with another repository or a local branch
  alias $scm_aliases["push"]='hg push' # Update remote refs along with associated objects
  alias $scm_aliases["rebase"]='hg rebase' # Forward-port local commits to the updated upstream head
  alias $scm_aliases["reset"]='hg update' # Reset current HEAD to the specified state
  alias $scm_aliases["rm"]='hg rm' # Remove files from the working tree and from the index
  alias $scm_aliases["status"]='hg status' # Show the working tree status
  alias $scm_aliases["tag"]='hg tag' # Create, list, delete or verify a tag object signed with GPG
  alias $scm_aliases["help"]='hg help' # Show help for commands
  alias $scm_aliases["record"]='hg record' # Hunk based, interactive add
  alias $scm_aliases["forget"]='hg forget' # Remove a file from repository, but not physically from disk
}

HG_PROMPT_CHAR="%{$fg[cyan]%}ʜɢ%{$reset_color%}>"

function hg_create_prompt {
  local HG_ROOT="$SCM_ROOT/.$SCM_TYPE"
  [[ "$SCM_ROOT" = "" || ! -d "$HG_ROOT" ]] && \
    SCM_PROMPT_INFO= && return 

  [[ "$scm_prompt_cache[$HG_ROOT]" = "" || \
     `stat -c %Y $HG_ROOT/dirstate` -gt $scm_prompt_cache_updates[$HG_ROOT] ]] && _update_hg_prompt_info
  #SCM_PROMPT_INFO=${SCM_PROMPT_INFO:-$(hg_prompt_info)}
  SCM_PROMPT_INFO="$scm_prompt_cache[$HG_ROOT]"
}

function _update_hg_prompt_info {
  _scm_debug " >> Updating HG prompt"
  scm_prompt_cache[$HG_ROOT]=$(_print_hg_prompt_info)
  scm_prompt_cache_updates[$HG_ROOT]=$(date +%s)
}

function _print_hg_prompt_info {
  hg prompt --angle-brackets "\
< on $(_xterm_color 166 "<branch>")>\
< at $(_xterm_color 203 "<tags|, >")>\
$(_xterm_color 226 "<status|modified|unknown><update>")< \
patches: <patches|join( → )|pre_applied(%{$fg[yellow]%})|post_applied(%{$reset_color%})|pre_unapplied(%{$fg_bold[black]%})|post_unapplied(%{$reset_color%})>>" 2>/dev/null
}

scm_aliases_creators["hg"]=hg_create_aliases
scm_prompt_creators["hg"]=hg_create_prompt


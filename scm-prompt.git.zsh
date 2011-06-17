function git_create_aliases {
  alias $scm_aliases["add"]='git add' # Add file contents to the index
  alias $scm_aliases["bisect"]='git bisect' # Find by binary search the change that introduced a bug
  alias $scm_aliases["branch"]='git branch' # List, create, or delete branches
  alias $scm_aliases["branches"]='git branch -a' # List branches (inspired from HG) 
  alias $scm_aliases["checkout"]='git checkout' # Checkout a branch or paths to the working tree
  alias $scm_aliases["commit"]='git commit' # Record changes to the repository
  alias $scm_aliases["diff"]='git diff' # Show changes between commits, commit and working tree, etc
  alias $scm_aliases["fetch"]='git fetch' # Download objects and refs from another repository
  alias $scm_aliases["grep"]='git grep' # Print lines matching a pattern
  alias $scm_aliases["log"]='git log' # Show commit logs
  alias $scm_aliases["merge"]='git merge' # Join two or more development histories together
  alias $scm_aliases["move"]='git mv' # Move or rename a file, a directory, or a symlink
  alias $scm_aliases["pull"]='git pull' # Fetch from and merge with another repository or a local branch
  alias $scm_aliases["push"]='git push' # Update remote refs along with associated objects
  alias $scm_aliases["rebase"]='git rebase' # Forward-port local commits to the updated upstream head
  alias $scm_aliases["reset"]='git reset' # Reset current HEAD to the specified state
  alias $scm_aliases["rm"]='git rm' # Remove files from the working tree and from the index
  alias $scm_aliases["status"]='git status' # Show the working tree status
  alias $scm_aliases["tag"]='git tag' # Create, list, delete or verify a tag object signed with GPG
  alias $scm_aliases["help"]='git help' # Show help for commands
  alias $scm_aliases["record"]='git add -p' # Hunk based, interactive add
  alias $scm_aliases["forget"]='git rm --cached' # Remove a file from repository, but not physically from disk
}

scm_aliases_creators["git"]=git_create_aliases


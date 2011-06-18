SCM Prompt
===

SCM Prompt is an extension for zsh to provide almost generic support for SCM commands and visual feedback of current repository state. It automatically detects 

Shared aliases over all SCM types
---

The following mapping shows the aliases and its corresponding SCM commands:

<pre>
Alias    Git:              Mercurial:          Comment:

add      git add           hg add              Add file contents to the index
bs       git bisect        hg bisect           Find by binary search the change that introduced a bug
br       git branch        hg branch           List, create, or delete branches
lbr      git branch -a     hg branches         List branches (inspired from HG)
co       git checkout      hg update           Checkout a branch or paths to the working tree
com      git commit        hg commit           Record changes to the repository
dif      git diff          hg diff             Show changes between commits, commit and working tree, etc
fetch    git fetch         hg pull             Download objects and refs from another repository
sgrep    git grep          hg grep             Print lines matching a pattern
sl       git log           hg log              Show commit logs
x        git merge         hg merge            Join two or more development histories together
smv      git mv            hg mv               Move or rename a file, a directory, or a symlink
pull     git pull          hg pull --rebase    Fetch from and merge with another repository or a local branch
push     git push          hg push             Update remote refs along with associated objects
rb       git rebase        hg rebase           Forward-port local commits to the updated upstream head
reset    git reset         hg update           Reset current HEAD to the specified state
srm      git rm            hg rm               Remove files from the working tree and from the index
st       git status        hg status           Show the working tree status
tag      git tag           hg tag              Create, list, delete or verify a tag object signed with GPG
help     git help          hg help             Show help for commands
rec      git add -p        hg record           Hunk based, interactive add
forget   git rm --cached   hg forget           Remove a file from repository, but not physically from disk
</pre>

Hence you just have to remember the aliases in the most left column to run appropriate commands within every SCM scope.

Supported SCMs
---

By now SCM Prompt supports the following SCMs:

* git
* hg
* svn (in progress)


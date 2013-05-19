function __zle_git_status
{
  echo git status
  git status
  zle redisplay
}
zle -N __zle_git_status __zle_git_status

bindkey "" __zle_git_status

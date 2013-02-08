local return_code="%(?..%{$fg[red]%}%? %{$reset_color%})"

function triggered_git_prompt_info () { echo "" }
function git-showprompt () {
  if [[ $ZSH_THEME_GIT_PROMPT_TRIGGERED -eq 0 ]]; then
    echo 'Activate git infos in prompt.'
    ZSH_THEME_GIT_PROMPT_TRIGGERED=1
    function triggered_git_prompt_info () {
      echo "$(git_prompt_info)"
    }
  else
    echo 'Deactivate git infos in prompt.'
    ZSH_THEME_GIT_PROMPT_TRIGGERED=0
    function triggered_git_prompt_info () {
      echo ""
    }
  fi
  return 0
}
alias gsp=git-showprompt

function triggered_rbenv_prompt_info () { echo "" }
function rbenv-showprompt () {
  if [[ $ZSH_THEME_RBENV_PROMPT_TRIGGERED -eq 0 ]]; then
    echo 'Activate rbenv infos in prompt.'
    ZSH_THEME_RBENV_PROMPT_TRIGGERED=1
    function triggered_rbenv_prompt_info () {
      echo "%{$fg[magenta]%}r:($(rbenv_prompt_info)) %{$reset_color%}"
    }
  else
    echo 'Deactivate rbenv infos in prompt.'
    ZSH_THEME_RBENV_PROMPT_TRIGGERED=0
    function triggered_rbenv_prompt_info () {
      echo ""
    }
  fi
  return 0
}
alias rsp=rbenv-showprompt

function grsp () { gsp && rsp }
alias rgsp=grsp

PROMPT='%{$fg[green]%}[%D{%T}]%{$fg[yellow]%}%n %{$fg[cyan]%}%~ $(triggered_git_prompt_info)$(triggered_rbenv_prompt_info)${return_code}%{$reset_color%}-> '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}g:("
ZSH_THEME_GIT_PROMPT_SUFFIX=") %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="⚡"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="✹"
ZSH_THEME_GIT_PROMPT_DELETED="✖"
ZSH_THEME_GIT_PROMPT_RENAMED="➜"
ZSH_THEME_GIT_PROMPT_UNMERGED="="
ZSH_THEME_GIT_PROMPT_UNTRACKED="✭"


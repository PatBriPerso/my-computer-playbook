# Theme added by Ansible role patbriperso.bash_git_prompt
# To use it add git_prompt_theme with value 'Custom' to the vars of the role
# Like below:
#   role: patbriperso.bash_git_prompt
#   vars:
#     bash_git_prompt_env:
#       git_prompt_theme: Custom

override_git_prompt_colors() {
  GIT_PROMPT_THEME_NAME="Patrick"

  function prompt_callback {
    local PS1="$(whoami)@$(hostname):$(gp_truncate_pwd)"
    gp_set_window_title "$PS1"
  }

  Time12a="\$(date +%H:%M:%S)"
  if [ "$(id -u)" != "0" ]; then
     UserHost_Color="${BoldGreen}"
  else
     UserHost_Color="${BoldRed}"
  fi

  local gp_end="${NewLine}${UserHost_Color}$(whoami)@$(hostname)${NewLine}${White}${Time12a}${ResetColor}"

  GIT_PROMPT_END_USER="${gp_end} $ "
  GIT_PROMPT_END_ROOT="${gp_end} # "

  # branch name(s) that will use $GIT_PROMPT_MASTER_BRANCH color
  # To specify multiple branches, use
  shopt -s extglob
  GIT_PROMPT_MASTER_BRANCHES='@(master|main)'
  GIT_PROMPT_MASTER_BRANCH="${Red}"
}

reload_git_prompt_colors "Patrick"

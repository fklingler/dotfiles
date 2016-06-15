#
# Integrates zsh-syntax-highlighting into Prezto.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

zstyle ':prezto:module:syntax-highlighting' color 'yes'

# Set syntax highlighters.
# By default main, brackets, and cursor are enabled.
# zstyle ':prezto:module:syntax-highlighting' highlighters \
#   'main' \
#   'brackets' \
#   'pattern' \
#   'cursor' \
#   'root'




# Return if requirements are not found.
if ! zstyle -t ':prezto:module:syntax-highlighting' color; then
  return 1
fi

# Source module files.
source "${0:h}/lib/zsh-syntax-highlighting.zsh"

# Set highlighters.
zstyle -a ':prezto:module:syntax-highlighting' highlighters 'ZSH_HIGHLIGHT_HIGHLIGHTERS'
if (( ${#ZSH_HIGHLIGHT_HIGHLIGHTERS[@]} == 0 )); then
  ZSH_HIGHLIGHT_HIGHLIGHTERS=(main)
fi

# Set highlighting styles.
typeset -A syntax_highlighting_styles
zstyle -a ':prezto:module:syntax-highlighting' styles 'syntax_highlighting_styles'
for syntax_highlighting_style in "${(k)syntax_highlighting_styles[@]}"; do
  ZSH_HIGHLIGHT_STYLES[$syntax_highlighting_style]="$syntax_highlighting_styles[$syntax_highlighting_style]"
done
unset syntax_highlighting_style{s,}
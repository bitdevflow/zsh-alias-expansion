# Alias Expansion (like fish abbr)
expand-alias-space() {
  # Get the last word (space delimited)
  local last_word="${LBUFFER##* }"

  # Check regular aliases
  if [[ -n "$aliases[$last_word]" ]]; then
    LBUFFER="${LBUFFER%$last_word}${aliases[$last_word]}"
  # Check global aliases
  elif [[ -n "$galiases[$last_word]" ]]; then
    LBUFFER="${LBUFFER%$last_word}${galiases[$last_word]}"
  fi

  zle self-insert
}

expand-alias-enter() {
  local last_word="${LBUFFER##* }"

  if [[ -n "$aliases[$last_word]" ]]; then
    LBUFFER="${LBUFFER%$last_word}${aliases[$last_word]}"
  elif [[ -n "$galiases[$last_word]" ]]; then
    LBUFFER="${LBUFFER%$last_word}${galiases[$last_word]}"
  fi

  zle accept-line
}

zle -N expand-alias-space
zle -N expand-alias-enter
bindkey ' ' expand-alias-space
bindkey '^M' expand-alias-enter

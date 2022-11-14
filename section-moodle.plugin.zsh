#
# Moodle
#
# Moodle is an Open-Source learning platform written in PHP
# Link: https://moodle.org/

# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------

SPACESHIP_MOODLE_SHOW="${SPACESHIP_MOODLE_SHOW=true}"
SPACESHIP_MOODLE_ASYNC="${SPACESHIP_MOODLE_ASYNC=true}"
SPACESHIP_MOODLE_PREFIX="${SPACESHIP_MOODLE_PREFIX="$SPACESHIP_PROMPT_DEFAULT_PREFIX"}"
SPACESHIP_MOODLE_SUFFIX="${SPACESHIP_MOODLE_SUFFIX="$SPACESHIP_PROMPT_DEFAULT_SUFFIX"}"
SPACESHIP_MOODLE_SYMBOL="${SPACESHIP_MOODLE_SYMBOL="🎓 "}"
SPACESHIP_MOODLE_COLOR="${SPACESHIP_MOODLE_COLOR="blue"}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

# Show current version of PHP
spaceship_section-moodle() {
  [[ $SPACESHIP_MOODLE_SHOW == false ]] && return

  # Check requirements
  spaceship::exists awk || return

  # Show only if version.php exist in current directory
  [[ -f version.php ]] || return

  # only if the version.php file contains MOODLE_INTERNAL
  spaceship::grep -q "MOODLE_INTERNAL" version.php; [ $? -eq 0 ]  || return

  # Parse the $release variable
  local moodle_version=$(cat version.php | spaceship::grep -E '^(\s+?)\$release' | awk '{print $3}' | awk '{print substr($1,2);}')
  [[ -z $moodle_version ]] && return

  spaceship::section::v4 \
    --color "$SPACESHIP_MOODLE_COLOR" \
    --prefix "$SPACESHIP_MOODLE_PREFIX" \
    --suffix "${SPACESHIP_MOODLE_SUFFIX}" \
    --symbol "${SPACESHIP_MOODLE_SYMBOL}" \
    "${moodle_version}"
}

#!/usr/bin/env zsh

# Required for shunit2 to run correctly
CWD="${${(%):-%x}:A:h}"
setopt shwordsplit
SHUNIT_PARENT=$0

# Use system Spaceship or fallback to Spaceship Docker on CI
typeset -g SPACESHIP_ROOT="${SPACESHIP_ROOT:=/spaceship}"

# ------------------------------------------------------------------------------
# SHUNIT2 HOOKS
# ------------------------------------------------------------------------------

setUp() {
  # Enter the test directory
  cd $SHUNIT_TMPDIR
}

oneTimeSetUp() {
  export TERM="xterm-256color"

  source "$SPACESHIP_ROOT/spaceship.zsh"
  source "$(dirname $CWD)/section-moodle.plugin.zsh"
  SPACESHIP_MOODLE_PREFIX="Moodle "
  SPACESHIP_PROMPT_ASYNC=false
  SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=true
  SPACESHIP_PROMPT_ADD_NEWLINE=false
  SPACESHIP_PROMPT_ORDER=(moodle)

  echo "Spaceship version: $(spaceship --version)"
}

oneTimeTearDown() {
  unset SPACESHIP_MOODLE_PREFIX
  unset SPACESHIP_PROMPT_ASYNC
  unset SPACESHIP_PROMPT_FIRST_PREFIX_SHOW
  unset SPACESHIP_PROMPT_ADD_NEWLINE
  unset SPACESHIP_PROMPT_ORDER
}

# ------------------------------------------------------------------------------
# TEST CASES
# ------------------------------------------------------------------------------

test_moodle_no_files() {
  local expected=""
  local actual="$(spaceship::testkit::render_prompt)"
  assertEquals "should not render without files" "$expected" "$nactual"
}

test_moodle_version() {
    local ASSERT_MOODLE_VERSION="4.0.5"
    cat <<EOF | tee version.php > /dev/null 2>/dev/null
    <?php
    /**
     * MOODLE VERSION INFORMATION
     * @copyright  1999 onwards Martin Dougiamas (http://dougiamas.com)
     * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
     */
    defined('MOODLE_INTERNAL') || die();

    \$version  = 2022041905.00;              // 20220419      = branching date YYYYMMDD - do not modify!
                                            //         RR    = release increments - 00 in DEV branches.
                                            //           .XX = incremental changes.
        \$release  = '4.0.5 (Build: 20221114)'; // Human-friendly version name
    \$branch   = '400';                     // This version's branch.
    \$maturity = MATURITY_STABLE;             // This version's maturity level.
EOF
    local expected="%{%B%}Moodle %{%b%}%{%B%F{$SPACESHIP_MOODLE_COLOR}%}${SPACESHIP_MOODLE_SYMBOL}${ASSERT_MOODLE_VERSION}%{%b%f%}%{%B%} %{%b%}"
    local actual="$(spaceship::testkit::render_prompt)"
    rm -f version.php
    assertEquals "should render with file version.php" "$expected" "$actual"
}

# ------------------------------------------------------------------------------
# SHUNIT2
# Run tests with shunit2
# ------------------------------------------------------------------------------

source "$SPACESHIP_ROOT/tests/shunit2/shunit2"

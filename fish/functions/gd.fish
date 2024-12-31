function gd
# Shortcut for git diff
set -xg BUILD_ARGS_TMP $argv
git diff $argv[1]
end

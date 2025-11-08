function ga
# Shortcut for git add
set -xg BUILD_ARGS_TMP $argv
git add $argv
end

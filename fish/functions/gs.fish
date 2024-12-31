function gs
# Shortcut for git status
set -xg BUILD_ARGS_TMP $argv
git status $argv[1]
end

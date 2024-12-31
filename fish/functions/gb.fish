function gb
# Shortcut for git branch
set -xg BUILD_ARGS_TMP $argv
git branch $argv[1]
end

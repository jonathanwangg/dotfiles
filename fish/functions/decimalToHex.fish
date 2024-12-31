function decimalToHex
# Quick utility function for converting decimal numbers to hexadecimal when debugging assert tags...
set -xg BUILD_ARGS_TMP $argv
printf "0x%x\n" $argv[1]
end

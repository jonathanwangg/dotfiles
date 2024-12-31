if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ll="ls -alG"
alias beep="afplay /System/Library/Sounds/Submarine.aiff -v 1"

#############################
# Git-based Functions
#############################

alias update="git checkout main; git pull; ocheck -fix"
alias clean="mv /Volumes/Builds/buildsOMR/devmain /Volumes/Builds/buildsOMR/devmainold;rm -rf /Volumes/Builds/buildsOMR/devmainold"
alias build="time mbu build -m hosable -c debug -P mac simulator" 

#############################
# terminal-notifier Functions
#############################

function send_notification
	# Set the sound to be played
	if test (count $argv) -eq 2
		set SoundToPlay ""
	else
		if test (count $argv) -eq 3
			set SoundToPlay "$argv[3]"
		else
			echo (count $argv)
			echo $argv
			echo "Unable to send notification!"
			echo "Usage: "
		end
	end

	# Play a sound if it exists
	if test -z "$SoundToPlay"
		terminal-notifier -title "$argv[1]" -message "mbu build $argv[2]"
	else
		terminal-notifier -title "$argv[1]" -message "$argv[2]" -sound "$SoundToPlay"
	end
end

function build_notif --description "Function to call mdk build"
	echo "Building $argv..."

	set -xg BUILD_ARGS_TMP $argv
	send_notification "Building...⏳" "$BUILD_ARGS_TMP"

	# mbu build $argv
	mdk build $argv

	set $build_status $status
	set BUILD_STATUS $status

	if test $BUILD_STATUS != 0
		send_notification "🛑 FAILED 🛑" "mbu build $BUILD_ARGS_TMP" "Sosumi"
	else
		send_notification "✅ SUCCESS ✅" "mbu build $BUILD_ARGS_TMP" "Glass"
	end
	set -eg BUILD_ARGS_TMP
	return $build_status
end

function ocheckfix
    set password $argv[1]

    while true;
        echo $password;
        echo "\
        set timeout 900
        log_user 1
        spawn ocheck -fix
        expect {
            timeout {
                send_user "\nTimed out waiting for a result after 15 minutes.\n"
                exit 1
            }
            "Please enter your local administrator password:" {
                send "$password\r"
                exp_continue
            }
            "All appears to be well." {
                exit 0
            }
            eof {
                send_user "\nocheck finished, but no success message found. Re-running the command...\n"
                exit 1
            }
        }" | /usr/bin/expect

    if test $status -eq 0
        break
    end
        sleep 1  # Adding a small delay to avoid rapid looping
    end
end

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish


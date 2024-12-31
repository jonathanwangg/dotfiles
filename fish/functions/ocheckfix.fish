# This is my fish implementation.

function ocheckfix
    set password $argv[1]

    while true;
        echo $password;
        # /usr/bin/expect <<- EOF # TODO
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

function buildnew
    echo "\nPlease enter your local administrator password: "
    stty -echo

    read password
    stty echo

    echo "\nRemoving $MS_BUILD_ROOT/devmain..."
    rm -rf $MS_BUILD_ROOT/devmain

    echo "\nCleaning git repository..."
    git clean -f -x -d

    echo "\nStashing changes..."
    git stash

    echo "\nChecking out main branch..."
    git checkout main

    echo "\nPulling latest changes...\n"
    git pull

    while true;
        set output $(ocheckfix $password)
        echo "\n$output\n"
        if [[ $output == *"All appears to be well."* ]];
            echo "\nStarting build...\n"
            mdk build hosable -c debug --clean-build branch
            break
        end
    end
end
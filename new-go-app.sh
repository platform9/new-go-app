#!/bin/bash

NGA=/usr/local/bin/new-go-app/
export PATH=$PATH:$NGA/

cat << EOF

| \ | |                / ____|           /\                 | | | |
|  \| | _____      __ | |  __  ___      /  \   _ __  _ __   | | | |
| . ` |/ _ \ \ /\ / / | | |_ |/ _ \    / /\ \ | '_ \| '_ \  | | | |
| |\  |  __/\ V  V /  | |__| | (_) |  / ____ \| |_) | |_) | |_|_|_|
|_| \_|\___| \_/\_/    \_____|\___/  /_/    \_\ .__/| .__/  (_|_|_)
                                              | |   | |            
                                              |_|   |_|            
Q: Does this have to be done in bash?
A: No.
EOF


function getinput {
        echo "Enter your git or github username, anything will do:"
        read YOUR_USERNAME

        echo "Enter the name of this app, again, anything will do:"
        read PROJECT

        echo "Creating project $PROJECT under $YOUR_USERNAME, ok ?"
        read x
}

function install_new_go_app {

	git clone https://github.com/platform9/new-go-app/ /tmp/new-go-app
	# just in case its already there, update...
	pushd /tmp/new-go-app
		git pull
	popd
	mkdir -p $NGA
	echo "Updating $NGA with contents from /tmp !"
	# Hardcoded to avoid anything bad, NGA shouldnt need to ever change.
	rm -rf /usr/local/bin/new-go-app/ && mv /tmp/new-go-app /usr/local/bin/new-go-app
}

function setup_app {
        WORKSPACE=$HOME/go/src/github.com/$YOUR_USERNAME/$PROJECT
        mkdir -p $WORKSPACE ;
        cp -r $NGA/my-app/* $WORKSPACE

	chmod 755 $WORKSPACE/run.sh
}

function yay {
        echo "All done ! Now run ... "
        echo "cd $WORKSPACE ; ./run.sh"
        echo "And do something useful !!!"
}

install_new_go_app
getinput
setup_app
yay

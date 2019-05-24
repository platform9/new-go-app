#!/bin/bash

NGA=/usr/local/bin/new-go-app/
export PATH=$PATH:$NGA/


echo "Q: Does this have to be written in Golang?"
echo "A: No dear."
echo "Q: Then why are we doing this?"
echo "A: Because new-go-app is so easy! AND I LIKE TYPES!"
echo "Q: Are you sure about that?"
echo "A: Yes dear."

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

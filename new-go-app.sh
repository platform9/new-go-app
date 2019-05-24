source go-bootstrap.sh
NGA=/usr/local/bin/new-go-app/
export PATH=$PATH:$NGA/
#### CHANGE THESE AS NEEDED AFTER CLONING, or keep them as defaults.  Either way should work.

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
	# Again, update if needed.
	cp -r /tmp/new-go-app $NGA
}

function setup_app {
        WORKSPACE=$HOME/go/src/github.com/$YOUR_USERNAME/$PROJECT
        mkdir -p $WORKSPACE ;
        cp -r $NGA/my-app/* $WORKSPACE

	# Add gimme there to, just so everythings totally totally portable
	cp go-bootstrap.sh $WORKSPACE
	chmod 755 $WORKSPACE/run.sh
}

function yay {
        echo "All done ! Now run ... "
        echo "cd $WORKSPACE ; ./run.sh"
        echo "And do something useful !!!"
}

getinput
install_new_go_app
setup_app
yay

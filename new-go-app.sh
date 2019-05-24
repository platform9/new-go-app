source other.sh

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
        # Install new-go-app !
        if [[ ! -d ~/.new-go-app ]] ; then
                NEW_GO_APP="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
                mv $NEW_GO_APP ~/.new-go-app/
        fi
}

function setup_app {
        WORKSPACE=$HOME/go/src/github.com/$YOUR_USERNAME/$PROJECT
        mkdir -p $WORKSPACE ;
        cp -r ~/.new-go-app/my-app/* $WORKSPACE
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

#### CHANGE THESE AS NEEDED AFTER CLONING, or keep them as defaults.  Either way should work.

YOUR_USERNAME=jayunit100 # change this
PROJECT=new-go-app

#### Any edits you need to make after here == a bug that i need to fix :)

WORKSPACE=$HOME/go/src/github.com/$YOUR_USERNAME/$PROJECT
cd $WORKSPACE

export PATH=$PATH:$HOME/bin/

function install_prerequisites {
	if [[ ! -f ~/bin/gimme ]] ; then 	
		mkdir ~/bin/gimme
		curl -sL -o ~/bin/gimme https://raw.githubusercontent.com/travis-ci/gimme/master/gimme
		chmod +x ~/bin/gimme
	else
		echo "gimme found"
	fi
}
function install_go {
	eval "$(GIMME_GO_VERSION=1.4 gimme)"
	go version
}

install_prerequisites
install_go
go run my-app/main.go

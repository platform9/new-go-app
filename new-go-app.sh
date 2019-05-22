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
pushd my-app
go run main.go

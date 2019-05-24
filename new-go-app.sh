source other.sh

#### CHANGE THESE AS NEEDED AFTER CLONING, or keep them as defaults.  Either way should work.

echo "Enter your git or github username, anything will do:"
read YOUR_USERNAME
echo "Enter the name of this app, again, anything will do:"
read PROJECT

echo "Creating project $PROJECT under $YOUR_USERNAME, ok ?"
read x

# Install new-go-app !
if [[ ! -d ~/.new-go-app ]] ; then
        NEW_GO_APP=`pwd`
        mv $NEW_GO_APP ~/.new-go-app/
fi

#### Any edits you need to make after here == a bug that i need to fix :)

WORKSPACE=$HOME/go/src/github.com/$YOUR_USERNAME/$PROJECT
mkdir -p $WORKSPACE ;

echo "Changed directory to $WORKSPACE, created."
cp -r ~/.new-go-app/my-app/* $WORKSPACE

echo "All done ! Now run ... "
echo "cd $WORKSPACE ; go run main.go"
echo "And do something useful !!!"

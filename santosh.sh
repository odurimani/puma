echo "Creating the repository in the org"
echo "Please enter GitHub org:"
read org
echo "Please enter new repository name:"
read repo
echo "please enter GitHub token"
read token
echo "Creating repo in this org:"$org
curl -X POST  -H "Content-type: application/json" https://api.github.com/orgs/{$org}/repos?access_token=$token  -d "{\"name\": \"$repo\"}" >> repoop.log
if [ $? -eq 0 ] ; then
        echo "Successfully created new repo" $repo
else
        echo "Failed to created repo, please check the logs."
fi



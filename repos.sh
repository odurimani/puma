echo "plz enter your personal access token"
read token
echo "plz enter your orgnization name"
read org
curl https://github.com/$org/
if [ $? -eq 0 ]
then
echo "you given correct org name"
echo "creating repo"
echo "plz enter repo name"
read repo
curl -X  POST -H "Content-type: application/json" -d"{\"Repository Name\": \"$repo\"}" "https://api.github.com/orgs/{$org}/repos?access_token=$token" >> repoops.log
if [ $? -eq 0 ]
then
echo "successfully created your $repo "
exit 0
else
echo "failed generating repo"
exit 1
fi
else
echo "check org name"
exit 1
fi

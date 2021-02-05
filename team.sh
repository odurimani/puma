echo "please enter your org name"
read org
echo "pleace enter your reqired team name"
read team
echo "please enter your personal access token"
read token
curl -X POST -H "Content-type: aplication/json"  -d "{\"team name\": \"$team\"}" "https://api.github.com/orgs/{$org}/teams?access_token=$token" >> manis.log
if [ $? -eq 0 ]
then
echo "team create successfully"
else
echo "somthing went wrong"
fi


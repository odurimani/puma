echo "please enter personal access token"
read token
cat ~/.ssh/id_rsa.pub
if [ $? -eq 0 ]
then 
echo "already we have ssh key"
else 
echo "generate ssh key"
ssh-keygen
fi

sshkey=`cat ~/.ssh/id_rsa.pub`

if [ $? -eq 0 ]
then
echo "mapping ssh key to github"
curl -X POST -H "Content-type: application/json" -d "{\"title\": \"sshkey\",\"key\": \"$sshkey\"} "https://api.github.com/user/keys?access_token=$token" 
if [ $? -eq 0 ]
then
echo "successfully key mapped"
exit 0
else 
echo "failed"
exit 1
fi
else
echo "loos"
exit 1
fi



echo "plz enter personal access token"
read token
cat ~/.ssh/id_rsa.pub
if [ $? -eq 0 ] 
then 
echo "we have alrdy ssh key"
else 
echo "generating ssh key"
ssh-keygen
fi

sshkey=`cat ~/.ssh/id_rsa.pub`

if [ $? -eq 0 ]  
then
echo "maping ssh key to github"
curl -X POST -H "Content-type: application/json" -d "{\"title\": \"sshkey\",\"key\": \"$sshkey\"}" "https://api.github.com/uer/keys?access_token=$token"
if [ $? -eq 0 ]
then
echo "key mapped succesfully"
exit 0
else
echo "failed to map"
exit 1
fi
else
echo "prblem in generating key"
exit 1
fi



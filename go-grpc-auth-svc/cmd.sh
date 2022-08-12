# curl --request POST \
#   --url http://localhost:3000/auth/register \
#   --header 'Content-Type: application/json' \
#   --data '{
#  "email": "yale@gmail.com",
#  "password": "12345"
# }'



curl --request POST \
  --url http://localhost:3000/auth/login \
  --header 'Content-Type: application/json' \
  --data '{
 "email": "yale@gmail.com",
 "password": "12345"
}'
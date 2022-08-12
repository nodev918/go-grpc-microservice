# #create user
# curl --request POST \
#   --url http://localhost:3000/auth/register \
#   --header 'Content-Type: application/json' \
#   --data '{
#  "email": "test2@gmail.com",
#  "password": "12345"
# }'

# #login
# curl --request POST \
#   --url http://localhost:3000/auth/login \
#   --header 'Content-Type: application/json' \
#   --data '{
#  "email": "test1@gmail.com",
#  "password": "12345"
# }'

# # create product
# curl --request POST \
#   --url http://localhost:3000/product \
#   --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODIxNTMyNDMsImlzcyI6ImdvLWdycGMtYXV0aC1zdmMiLCJJZCI6MiwiRW1haWwiOiJ0ZXN0MUBnbWFpbC5jb20ifQ.iyeNNUV0GF1SSM_wzJqxhrW20MzpDYAzseCPxLQXU5I' \
#   --header 'Content-Type: application/json' \
#   --data '{
#  "name": "Product A",
#  "stock": 5,
#  "price": 15
# }'

# find one
curl --request GET \
  --url http://localhost:3000/product/1 \
  --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODIxNTMyNDMsImlzcyI6ImdvLWdycGMtYXV0aC1zdmMiLCJJZCI6MiwiRW1haWwiOiJ0ZXN0MUBnbWFpbC5jb20ifQ.iyeNNUV0GF1SSM_wzJqxhrW20MzpDYAzseCPxLQXU5I'

# # create order
# curl --request POST \
#   --url http://localhost:3000/order \
#   --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODIxNTMyNDMsImlzcyI6ImdvLWdycGMtYXV0aC1zdmMiLCJJZCI6MiwiRW1haWwiOiJ0ZXN0MUBnbWFpbC5jb20ifQ.iyeNNUV0GF1SSM_wzJqxhrW20MzpDYAzseCPxLQXU5I' \
#   --header 'Content-Type: application/json' \
#   --data '{
#  "productId": 1,
#  "quantity": 1
# }'
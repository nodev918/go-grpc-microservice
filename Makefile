proto:
		protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative pkg/**/pb/*.proto

server:
	go run cmd/main.go


user:
	curl --request POST \
	--url http://localhost:3000/auth/register \
	--header 'Content-Type: application/json' \
	--data '{"email": "test3@gmail.com","password": "12345"}'

login:
	curl --request POST \
	--url http://localhost:3000/auth/login \
	--header 'Content-Type: application/json' \
	--data '{"email": "test3@gmail.com","password": "12345"}'

product:
	curl --request POST \
	--url http://localhost:3000/product/ \
	--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODIyODM2NzQsImlzcyI6ImdvLWdycGMtYXV0aC1zdmMiLCJJZCI6NCwiRW1haWwiOiJ0ZXN0M0BnbWFpbC5jb20ifQ.Fm4Y7fHyxGtNIqQXf66FUBhETcEtHxFpE-LAOwn5bUw' \
	--header 'Content-Type: application/json' \
	--data '{"name": "Product test","stock": 1,"price": 3}'



find:
	curl --request GET \
	--url http://localhost:3000/product/1 \
	--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODIyODM2NzQsImlzcyI6ImdvLWdycGMtYXV0aC1zdmMiLCJJZCI6NCwiRW1haWwiOiJ0ZXN0M0BnbWFpbC5jb20ifQ.Fm4Y7fHyxGtNIqQXf66FUBhETcEtHxFpE-LAOwn5bUw'


order:
	curl --request POST \
	--url http://localhost:3000/order/ \
	--header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2ODIyODM2NzQsImlzcyI6ImdvLWdycGMtYXV0aC1zdmMiLCJJZCI6NCwiRW1haWwiOiJ0ZXN0M0BnbWFpbC5jb20ifQ.Fm4Y7fHyxGtNIqQXf66FUBhETcEtHxFpE-LAOwn5bUw' \
	--header 'Content-Type: application/json' \
	--data '{"productId": 1,"quantity": 1}'
assert=$1

curl -s http://localhost:8080/api/users/123/boards | $assert "boards for user"

curl -s http://localhost:8080/api/boards/123 | $assert "board access"

curl -s http://localhost:8080/api/boards/123/posts | $assert "posts"

curl -s http://localhost:8080/api/boards \
	-d "{
		\"location\": \"32.0,54.0\", \
		\"name\": \"Birthday\", \
		\"private\": false, \
		\"members\": [123, 456] \
	}" | $assert "create board"
	
curl -s http://localhost:8080/api/boards/{board_id}/posts \
	-d "{
		\"user\": 123, \
		\"type\": \"text\", \
		\"embeds\": [], \
		\"content\": \"hello, world\" \
	}" | $assert "create post"
	
curl -s http://localhost:8080/api/users/123/location | $assert "get user location"

curl -s http://localhost:8080/api/users/123/location \
	-d "32.0,54.0" | $assert "set user location"
	
curl -s http://localhost:8080/api/users/locate \
	-d "32.0,54.0" | $assert "locate users"
	
curl -s http://localhost:8080/api/boards/locate \
	-d "32.0,54.0" | $assert "locate boards"	
	
curl -s http://localhost:8080/api/boards/123/invite \
	-d "{
		\"from\": 123, \
		\"to\": 123, \
		\"message\": \"you should come!\" \
	}" | $assert "invite users"
	
curl -s http://localhost:8080/api/users/123/invitations	| $assert "get invitations"

curl -s http://localhost:8080/api/assets/test.txt \
	-d @test.txt | $assert "upload asset"
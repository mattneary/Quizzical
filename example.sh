assert=$1

curl -s http://localhost:8080/api/users/189713730/boards | $assert "boards for user" success=true

curl -s http://localhost:8080/api/boards/123 | $assert "board access" success=true

curl -s http://localhost:8080/api/boards/123/posts | $assert "posts" success=true

curl -s http://localhost:8080/api/boards \
	-d "{
		\"location\": \"32.0,54.0\", \
		\"name\": \"Birthday\", \
		\"private\": false, \
		\"members\": [123, 456] \
	}" | $assert "create board" success=true
	
curl -s http://localhost:8080/api/boards/123/posts \
	-d "{
		\"user\": 123, \
		\"type\": \"text\", \
		\"embeds\": [], \
		\"content\": \"hello, world\" \
	}" | $assert "create post" success=true
	
curl -s http://localhost:8080/api/users/189713730/location | $assert "get user location" success=true

curl -s http://localhost:8080/api/users/189713730/location \
	-d "32.0,54.0" | $assert "set user location" success=true
	
curl -s http://localhost:8080/api/users/locate \
	-d "32.0,54.0" | $assert "locate users" success=true
	
curl -s http://localhost:8080/api/boards/locate \
	-d "32.0,54.0" | $assert "locate boards" success=true
	
curl -s http://localhost:8080/api/boards/123/invite \
	-d "{
		\"from\": 123, \
		\"to\": 123, \
		\"message\": \"you should come!\" \
	}" | $assert "invite users" success=true
	
curl -s http://localhost:8080/api/users/189713730/invitations | $assert "get invitations" success=true

curl -s http://localhost:8080/api/assets/test.txt \
	-d @test.txt | $assert "upload asset" success=true
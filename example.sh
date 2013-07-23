assert=$1

curl -s http://localhost:8080/api/users/189713730/boards | $assert "Get Boards for User" success=true

curl -s http://localhost:8080/api/boards/123 | $assert "Get a Board" success=true

curl -s http://localhost:8080/api/boards/123/posts | $assert "Get Posts of a Board" success=true

curl -s http://localhost:8080/api/boards \
	-d "{
		\"location\": \"32.0,54.0\", \
		\"name\": \"Birthday\", \
		\"private\": false, \
		\"members\": [123, 456] \
	}" | $assert "Create a Board" success=true

curl -s http://localhost:8080/api/boards/123/posts \
	-d "{
		\"user\": 123, \
		\"type\": \"text\", \
		\"embeds\": [], \
		\"content\": \"hello, world\" \
	}" | $assert "Create a Post" success=true

curl -s http://localhost:8080/api/users/189713730/location | $assert "Get a User's Location" success=true

curl -s http://localhost:8080/api/users/189713730/location \
	-d "32.0,54.0" | $assert "Set a User's Location" success=true

curl -s http://localhost:8080/api/users/locate \
	-d "32.0,54.0" | $assert "Locate Users" success=true

curl -s http://localhost:8080/api/boards/locate \
	-d "32.0,54.0" | $assert "Locate Boards" success=true

curl -s http://localhost:8080/api/boards/123/invite \
	-d "{
		\"from\": 123, \
		\"to\": 123, \
		\"message\": \"you should come!\" \
	}" | $assert "Invite Users" success=true

curl -s http://localhost:8080/api/users/189713730/invitations | $assert "Get Invitations" success=true

curl -s http://localhost:8080/api/assets/test.txt \
	-d @test.txt | $assert "Upload an Asset" success=true

curl -s http://localhost:8080/api/assets/test.txt | $assert "Get an Asset" "#raw"
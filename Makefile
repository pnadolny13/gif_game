app_deploy:
	cd gif-game-app && yarn build
	cd gif-game-app && yarn deploy

app_local:
	cd gif-game-app && npm start

api_deploy:
	. api/api/package.bash

api_local:
	cd api/api && uvicorn main:app

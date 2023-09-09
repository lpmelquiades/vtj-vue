sh-notification:
	docker exec -it vtj sh

logs-notification:
	docker-compose logs vtj

# --no-cache is a good practice to avoid issues with unfit docker images
# Using it in the first build is enough.
build-no-cache:
	docker-compose build --no-cache

up-d:
	docker-compose up 

# Using it in the first build is enough.
init: install build-no-cache up-d


test:
	docker exec -it notification sh -c "npm run test"

install:
	docker run -dit --name install node:20.6.0-bullseye-slim \
	&& docker cp ${PWD}/package.json install:/usr/src  \
	&& docker cp ${PWD}/package-lock.json install:/usr/src  \
	&& docker exec -it install sh -c "cd /usr/src && npm install" \
	&& docker cp install:/usr/src/node_modules ${PWD}\
	&& docker cp install:/usr/src/package-lock.json ${PWD}\
	&& docker stop install && docker rm -f install \
	&& ls

prune:
	docker system prune -a -f \
	&& docker volume prune -f
















vota-skeleton:
	docker run -dit --name vota-skeleton node:20.6.0-bullseye-slim \
	&& docker exec -it vota-skeleton sh -c "cd tmp && npm create vue@latest vtj -y" \
	&& docker cp vota-skeleton:/tmp/vtj/. ${PWD} \
	&& docker stop vota-skeleton && docker rm -f vota-skeleton \
	&& ls


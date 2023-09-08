

vota-skeleton:
	docker run -dit --name vota-skeleton node:20.6.0-bullseye-slim \
	&& docker exec -it vota-skeleton sh -c "cd tmp && npm create vue@latest create-here -y" \
	&& docker cp vota-skeleton:/tmp/create-here/. ${PWD} \
	&& docker stop vota-skeleton && docker rm -f vota-skeleton \
	&& ls


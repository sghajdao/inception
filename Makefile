all:
	@if [ ! -d "/home/sghajdao/data" ]; then \
	sudo mkdir /home/sghajdao/data; \
	fi;
	@if [ ! -d "/home/sghajdao/data/db" ]; then \
	mkdir /home/sghajdao/data/db; \
	fi;
	@if [ ! -d "/home/sghajdao/data/wp" ]; then \
	mkdir /home/sghajdao/data/wp; \
	fi;
	sudo docker compose -f ./srcs/docker-compose.yml up --build 

clean:
	sudo docker compose -f ./srcs/docker-compose.yml down --rmi all -v
	sudo docker system prune -a

fclean: clean
	@if [ -d "/home/sghajdao/data/wp" ]; then \
	sudo rm -rf /home/sghajdao/data/wp/* && \
	echo "successfully removed all contents from /home/sghajdao/data/wp/"; \
	fi;

	@if [ -d "/home/sghajdao/data/db" ]; then \
	sudo rm -rf /home/sghajdao/data/db/* && \
	echo "successfully removed all contents from /home/sghajdao/data/db/"; \
	fi;

re: fclean all


ls:
	sudo docker image ls
	sudo docker ps
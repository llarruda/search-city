# Search Cities

#### Simple system to search cities
A projet using Ruby 2.7.0., Rails 5.2.2.4 and PostgreSQL 12.1

Running through Unicorn as application server and Nginx as http server and reverse-proxy

#### Requiriments
Docker and Docker-Compose

#### Running the project
###### Build images and link the containers
1. docker-compose up
###### Running containers to setting up database
1. docker-compose run --user "$(id -u):$(id -g)" search-city rake db:create

2. docker-compose run --user "$(id -u):$(id -g)" search-city rake db:migrate

3. docker-compose run --user "$(id -u):$(id -g)" search-city rake db:seed

* If you are in Windows operating sistems, you must ommit "--user "$(id -u):$(id -g)", or execute the container and running rake command inside it (e.g.: docker exec -it search-city_search-city_1 bash)

##### System access

http://127.0.0.1 or http://localhost
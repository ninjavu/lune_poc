Welcome, it's luna task

Application is fully dockerized, for launch please:

1. cp .env.sample .env
2. cp frontend/.env.sample frontend/.env
3. docker-compose up
4. docker-compose exec app rails db:setup
5. please be sure config.hosts set up correctly
6. visit frontend by opening localhost:3001

For launch rake tasks, please:

1. docker-compose exec app rake environment movie:import

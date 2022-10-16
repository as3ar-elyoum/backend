include environment.env
dev:
	docker-compose up

console:
	docker-compose exec rails console

sidekiq:
	docker-compose exec bundle exec sidekiq

bash:
	docker-compose exec backend bash

stop:
	docker-compose stop

down:
	docker-compose down
include environment.env
services:
	docker-compose up -d

server:
	rails server

console:
	rails console

sidekiq:
	bundle exec sidekiq
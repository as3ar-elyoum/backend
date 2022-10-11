# Crime Index

**Dependencies**

- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Ruby](https://github.com/ruby/ruby)
- [Rails](https://github.com/rails/rails)
- [Posgres](https://www.postgresql.org/about/news/postgresql-13-released-2077/)

### Install Docker and DockerCompose

### Setup Environment


#### since we have a makefile

- up and run dependencies
```sh
$ make services
```

- start rails server
```sh
$ make server
```

- start rails console
```sh
$ make console
```

- start sidekiq
```sh
$ make sidekiq
```
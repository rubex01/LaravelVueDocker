# What this repo contains:

this repository contains a simple docker-compose setup for the following stack:
1. Vue 
2. Laravel
3. Nginx
4. MySQL

# To get started:
To get started immediately run `make init`. Vue and Laravel will be available in the browser after the initialization process is done.

# Folder structure:

```
.
├── . src
│   ├── client
│   │   ├── app
│   │   │   └── [Vue application]
│   │   └── Dockerfile
│   └── server
│       ├── app
│       │   └── [Laravel application]
│       ├── db
│       │   └── [Persisted database]
│       ├── nginx
│       │   └── [Nginx configuration]
│       └── Dockerfile
├── .env
├── docker-compose.yml
├── Makefile
└── README.md
```

# Commands:
Run `make` to see all commands.

Here are the important ones:
- `make init` to initialize the project
- `make start` to start all containers
- `make stop` to stop all containers
- `make restart` to restart all containers
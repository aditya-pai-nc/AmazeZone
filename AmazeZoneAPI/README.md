# AmazeZoneAPI

## Description

This is a project aimed at helping the students get accustomed with writing APIs in Ruby on Rails. This backend application works along with an AmazeZone frontend written in React and Typescript linked [here](link).

## Prerequisites

- Docker Desktop, as it comes with Docker Engine and Docker Desktop.
- RubyMine (recommended) or your preferred editor (VSCode works perfectly too)
  To install RubyMine on Linux, e.g., if you are using Virtual Box, use
  sudo snap install rubymine --classic
  rubymine
  or see this installation guide.
- Git

## Starting Up

1. Clone this project.
2. Open the project in your favourite editor. Open a terminal in the project's root folder.
3. Give execute permission to entrypoint.sh by typing in the following command.

```
chmod +x entrypoint.sh
```

4. Run the following command to start up the application using docker-compose.

```
docker-compose up
```

5. Open a different terminal in the same folder and run the following command to run migrate database.

```
docker-compose exec web rails db:migrate
```

- Run this command after creating a migration to run it.
- $\textcolor{blue}{\textsf{web}}$ is the docker-compose service that is associated with the backend application. Whenever a command needs to be run inside the backend container ( The Amazezone backend application composed in Ruby on Rails ), $\textcolor{blue}{\textsf{docker-compose exec web}}$ can be prepended to the command and executed while the service is up and running. i.e, while $\textcolor{blue}{\textsf{docker-compose up}}$ is running in a different terminal.
- If at any point, you are adding a new gem, you should instruct docker-compose to rebuild by stopping the existing service by using $\textcolor{blue}{\textsf{Ctrl + C}}$ on the terminal running $\textcolor{blue}{\textsf{docker-compose up}}$, and then running $\textcolor{blue}{\textsf{docker-compose up –build}}$

# Wordpress SQLite

The goal of this project is to run the latest Wordpress software with **SQLite** as a database instead of MySQL.

The container has been built at the time of wordpress version 6.0.2, but it can be run with the latest version simply passing the new version as environment variable.

This is possible via [wp-sqlite-db](https://github.com/aaemnnosttv/wp-sqlite-db), a single file drop-in for using a SQLite database with WordPress.

If you have Docker installed on your machine, simply run:

```
docker run -e WORDPRESS_VERSION=6.3.2 -p 8080:80 ghcr.io/thomascenni/wordpress-sqlite
```

or:

```
docker compose up
```

and then open your browser to [http://localhost:8080](http://localhost:8080) and finish the Wordpress installation.

## For Developers

First clone the repository:

```
git clone https://github.com/thomascenni/wordpress-sqlite.git
cd wordpress-sqlite
```

Build the Docker image:

```
docker build --tag ghcr.io/thomascenni/wordpress-sqlite ./
```

Run the Docker image on your machine:

```
docker run -p 8080:80 ghcr.io/thomascenni/wordpress-sqlite
```

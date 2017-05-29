# stardog docker container


## Build 

- download stardog release .zip (e.g. `stardog-5.0-beta.zip`) and `stardog-license-key.bin` license file (community or enterprise) from [http://stardog.com/#download](http://stardog.com/#download) and save both in this folder.
- run the script ./docker-publish.sh to build and publish the image
- to build only run `docker build -t stardog:5.0-beta .`



## Run

```shell
docker run -d --name stardog -p 5820:5820 stardog:5.0-beta
```

**HINT:** A default database named `stardog` will be created.

## Data

By default `STARDOG_HOME` is set to `/data`, this is where your runtime data / database data goes.

### Use a data volume
To create a volume container run:

```shell
docker volume create --name stardog-data
```

To run the stardog image using this volume do:

```shell
docker run -d --name stardog -p 5820:5820 -v stardog-data:/data stardog:5.0-beta
```

## Access

open [http://< your-docker-host-ip >:5820](http://<your-docker-host-ip>:5820) in your browser for the stardog admin web interface. 
e.g.: [http://localhost:5820](http://localhost:5820) or [http://docker.local:5820](http://docker.local:5820)


## Default admin credentials

The default administrator credentials (as stated by the [Stardog documentation](http://docs.stardog.com/#_insecurity)) are the following:

- username: `admin`
- password: `admin`

For more information on security enforcement in Stardog, check the [official documentation](http://docs.stardog.com/#_security).

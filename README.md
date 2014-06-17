# Dashing
Run [Dashing](http://dashing.io/) in a [Docker](http://docker.io/) container.

Link: [frvi/dashing](https://registry.hub.docker.com/u/frvi/dashing/)

## Config
To provide a custom dashboard, use Docker's VOLUME:
```
docker run -v=/my/custom/dashboards:/dashboards -d -p 8080:3030 frvi/dashing
```
To provide a custom dashboard, use Docker's VOLUME:
```
docker run -v=/local/jobs:/jobs -d -p 8080:3030 frvi/dashing
```
## Run
```
docker run -d -p 8080:3030 frvi/dashing
```
And point your browser to [http://localhost:8080/](http://localhost:8080/).

### Extras
Thanks to [@rowanu](https://github.com/rowanu) for the [Hotness Widget](https://gist.github.com/rowanu/6246149).

### TODO:
- Use custom widgets via *GitHub* gists; ```dashing install <gist>```.

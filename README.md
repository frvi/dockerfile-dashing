# Dashing
Run [Dashing](http://dashing.io/) in a [Docker](http://docker.io/) container.

Link: [frvi/dashing](https://registry.hub.docker.com/u/frvi/dashing/)

## Config
To provide a custom dashboard, use container volume */dashboards*:

```docker run -v=/my/custom/dashboards:/dashboards -d -p 8080:3030 frvi/dashing```

To provide custom jobs, use container volume */jobs*:

```docker run -v=/my/cool/job:/jobs -d -p 8080:3030 frvi/dashing```

## Run
```docker run -d -p 8080:3030 frvi/dashing```

And point your browser to [http://localhost:8080/](http://localhost:8080/).

## Widgets
To install custom widgets supply the gist IDs of the widgets as runtime arguments to the container:

```docker run -d -p 8080:3030 frvi/dashing 5641535```

This example will install the "Random Aww" widget (from https://gist.github.com/chelsea/5641535
) before starting dashing. Multiple widgets can be supplied.

## Debugging
To get a shell use the ```--entrypoint``` flag:

```docker run -i --entrypoint /bin/bash -t frvi/dashing```

### Thanks
- [@rowanu](https://github.com/rowanu), [Hotness Widget](https://gist.github.com/rowanu/6246149) plugin.
- [@munkius](https://github.com/munkius), [fork](https://gist.github.com/munkius/9209839) of Hotness Widget plugin.
- [@chelsea](https://github.com/chelsea), [Random Aww](https://gist.github.com/chelsea/5641535) plugin.

### TODO:
- Update Gemfile somehow?

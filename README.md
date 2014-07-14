# Dashing
Run [Dashing](http://dashing.io/) in a [Docker](http://docker.io/) container.

Link: [frvi/dashing](https://registry.hub.docker.com/u/frvi/dashing/)


## Run
```docker run -d -p 8080:3030 frvi/dashing```

And point your browser to [http://localhost:8080/](http://localhost:8080/).


## Configuration
### Dashboards
To provide a custom dashboard, use container volume */dashboards*:

```docker run -v=/my/custom/dashboards:/dashboards -d -p 8080:3030 frvi/dashing```

### Jobs
To provide custom jobs, use container volume */jobs*:

```docker run -v=/my/cool/job:/jobs -d -p 8080:3030 frvi/dashing```

### Widgets
To install custom widgets supply the gist IDs of the widgets as an environment variable:

```docker run -d -e WIDGETS=5641535 -p 8080:3030 frvi/dashing```

This example will install the [Random Aww](https://gist.github.com/chelsea/5641535) widget
before starting dashing. Multiple widgets can be supplied.

If the widget needs a gem, supply the gem name as an environment variable:

```docker run -d -e GEMS=instagram -e WIDGETS=5278790 -p 8080:3030 frvi/dashing```

This example installs the [Instagram photos by location](https://gist.github.com/mjamieson/5278790) widget,
which depends on the instagram gem. Multiple gems can be supplied.

### Configuration File
The configuration file ```config.ru``` is available on volume */config*.

Edit this file to change your API key, to add authentication and more.


### Thanks
- [@rowanu](https://github.com/rowanu), [Hotness Widget](https://gist.github.com/rowanu/6246149).
- [@munkius](https://github.com/munkius), [fork](https://gist.github.com/munkius/9209839) of Hotness Widget.
- [@chelsea](https://github.com/chelsea), [Random Aww](https://gist.github.com/chelsea/5641535).

### TODO:
- Update Gemfile somehow?

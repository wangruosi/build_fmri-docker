# build_fmri-docker

## Build
Specify `name` and `tag` in your building command

```
docker build . -t fmri:latest
```

## Run
Start Jupyterlab

```
docker run -it --rm --network host --ipc host fmri:latest
```

It is equivalent to

```
docker run -it --rm --network host --ipc host fmri:latest jupyter lab /workspace --ip=0.0.0.0 --allow-root --no-browser
```

## Run with mounting home directory as `/workspace`

```
docker run -it --rm --network host --ipc host -v $HOME:/workspace fmri:latest
```

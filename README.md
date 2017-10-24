# docker-rclone-alpine

Docker image for rclone based on alpine linux image, just over 10MB in size.

From [rclone.org](http://rclone.org):

## Usage
- version

```sh
docker run --rm jiapantw/rclone-alpine
```

- mount config

```sh
docker run --rm -it -v "$PWD"/config:/config jiapantw/rclone-alpine config
```

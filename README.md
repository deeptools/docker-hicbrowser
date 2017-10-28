# HiCBrowser Docker Image

Docker container for easy deployment of the [HiCBrowser](https://github.com/maxplanck-ie/HiCBrowser).

## Usage

You can download and run the container with the following command. Navigating to `http://localhost` will display
HiCBrowser with a test dataset that we have assembled for you.

```
docker run --rm -i -t -p 80:80 bgruening/hicbrowser
```

If you want to include your own data you need to put everything into one directory (e.g. `/home/rosi/data/`) and the main
configuration file needs to have the name `browserConfig.ini`. This folder needs to be mounted into the container with the
following command.

```
docker run --rm -i -t -p 80:80 -v /home/rosi/data/:/data/ bgruening/hicbrowser
```

Open a webbrowser and your own data can be visualised on `http://localhost`.

If you want to start the HiCExplorer under a proxy prefix you can pass the environment variable `PROXY_PREFIX` into the container and your website will be available on `http://localhost/hicexplorer/`.

```
docker run -p 80:80 -e PROXY_PREFIX=/hicexplorer -v /home/rosi/data/:/data/ bgruening/hicbrowser
```

This image can also be used as a [Galaxy](https://github.com/galaxyproject/galaxy) Interactive Environment in conjunction with [HiCExplorer](https://github.com/maxplanck-ie/HiCExplorer).

# Python, pysipp and SIPp Docker image

Run/automate SIPp scenarios from Python using [pysipp](https://github.com/SIPp/pysipp) with [unittest](https://docs.python.org/3.10/library/unittest.html) or [pytest](https://docs.pytest.org/en/7.4.x/). Package/distribute your tests in a Docker image.

## Tags

* latest: Python 3.10, pysipp 0.1.0
* v0.1.0: Python 3.10, pysipp 0.1.0

[SIPp image tags](https://hub.docker.com/r/p4irin/sipp)

## References

* [Dockerfile](https://github.com/p4irin/pysipp)
* [pysipp](https://github.com/SIPp/pysipp)
* [unittest](https://docs.python.org/3.10/library/unittest.html)
* [pytest](https://docs.pytest.org/en/7.4.x/)
* [SIPp](https://hub.docker.com/r/p4irin/sipp)

## Usage examples

To run [pysipp](https://github.com/SIPp/pysipp) interactively and play around with it, spin up a container using [this](https://hub.docker.com/r/p4irin/pysipp) image:

```bash
$ docker run -it --rm --network host p4irin/pysipp
$
```

This will pull the image from Docker Hub and drop you in a Python REPL

```Python
Python 3.10.6 (main, May 29 2023, 11:10:38) [GCC 11.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

Import [pysipp](https://github.com/SIPp/pysipp)

```Python
>>> import pysipp
>>> pysipp.__author__
'Tyler Goodlet (tgoodlet@gmail.com)'
>>> 
```

Running the default _uac --calls--> uas_ scenario

```Python
>>> uas = pysipp.server(srcaddr=('localhost', 5060))
>>> uac = pysipp.client(destaddr=uas.srcaddr)
>>> uas(block=False)
>>> uac_runner = uac()
```

To see the default options used to run SIPp

```Python
>>> uac_runner.get()
OrderedDict([("'/usr/local/bin/sipp' -sn 'uac' -recv_timeout '5000' -r '1' -l '1' -m '1' -log_file '/tmp/uac_log_file' -screen_file '/tmp/uac_screen_file' -trace_logs -trace_screen 'localhost':'5060'", <Popen: returncode: 0 args: ['/usr/local/bin/sipp', '-sn', 'uac', '-recv_tim...>)])
```

To see the _log_ and/or _screen_ files generated, setup a _bash_ session with the container

```bash
$ docker exec -it <CONTAINER ID> bash
root@host:/tests#
root@host:/tests# ls -l /tmp/
total 16
-rw-r--r-- 1 root root 4397 Jul 28 12:56 uac_screen_file
-rw-r--r-- 1 root root 4150 Jul 28 12:56 uas_screen_file
root@host:/tests#
```

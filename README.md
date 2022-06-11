# DEPRECATION NOTICE

Please note that this repository has been deprecated and is no longer actively maintained by Polyverse Corporation.  It may be removed in the future, but for now remains public for the benefit of any users.

Importantly, as the repository has not been maintained, it may contain unpatched security issues and other critical issues.  Use at your own risk.

While it is not maintained, we would graciously consider any pull requests in accordance with our Individual Contributor License Agreement.  https://github.com/polyverse/contributor-license-agreement

For any other issues, please feel free to contact info@polyverse.com

---

# tcp-echo-server
Simple TCP echo server with buffer overflow vulnerability.

## Building

The file `main.c` is built as part of the Docker image build process, resulting in a binary called `tcp-echo-server`.

```
sh build.sh [options to pv build docker]

-or for a complete build and push to both repos (as in Jenkins)
pv switch jenkins
sh build.sh all
```

## Usage

```
docker run -it --privileged --rm -p 8080:8080 polyverse/tcp-echo-server
```

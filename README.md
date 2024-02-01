# BP-OWASP-DEPENDENCY-CHECK-STEP
A BP step to leverage OWASP Dependency-Check to identify publicly disclosed vulnerabilities contained within a project’s dependencies

## Setup
* Clone the code available at [BP-OWASP-DEPENDENCY-CHECK-STEP](https://github.com/OT-BUILDPIPER-MARKETPLACE/BP-OWASP-DEPENDENCY-CHECK-STEP)
* Build the docker image
```
git submodule init
git submodule update
docker build -t ot/owasp_dependency_check:0.1 .
```
* Do local testing

Using Dockerimage
```
DC_DIRECTORY=$HOME/OWASP-Dependency-Check
DATA_DIRECTORY="$DC_DIRECTORY/data"
CACHE_DIRECTORY="$DC_DIRECTORY/data/cache"
mkdir -p "$DATA_DIRECTORY"
mkdir -p "$CACHE_DIRECTORY"
docker run -it --rm -v $(pwd):/src:z -v "$DATA_DIRECTORY":/usr/share/dependency-check/data:z -e OWASP_REPORT=target -e WORKSPACE=/ -e CODEBASE_DIR=src ot/owasp_dependency_check:0.1
```
For Debugging
```
docker run -it --rm -v $(pwd):/src:z --entrypoint bash ot/owasp_dependency_check:0.1
```

## References
* [Documentation](https://jeremylong.github.io/DependencyCheck/)
* [Docker image](https://hub.docker.com/r/owasp/dependency-check)
* [CLI Arguments](https://jeremylong.github.io/DependencyCheck/dependency-check-cli/arguments.html)
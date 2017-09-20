# Concourse Pipeline README

This README explains how to update the concourse pipeline using the `pipeline.yml` file provided in the `concourse` folder.

Concourse's pipelines are stateless. They do not store anything other than the instructions to operate that pipeline, all contained in the `pipeline.yml` file. Any additional resources are fetched at build time, for instance, a git repository, or a docker image.

To update the pipeline, use the `fly` command line tool, which can be downloaded from Concourse (https://concourse.ci/downloads.html).

You will need credentials to authenticate and view the pipelines.

## Useful commands

Note that all the below commands assume you have setup a team named `concourse-presentation` and have authenticated using `fly login`.

You will also need to create the `secrets.yml` file, which contains sensitive variables not appropriate to commit to git. These can be obtained from another developer, or by using `get-pipeline` to obtain them from the Concourse server's current pipeline state.


To update or create a new pipeline and trigger a task:

```
cd concourse

# To update the pipeline named "concourse-presentation-staff"
fly -t concourse-presentation set-pipeline -c pipeline.yml -p ruby-hello-world -l secrets.yml

# To trigger a job manually, and watch the build log.
# This will return a build id.
fly -t concourse-presentation trigger-job -j ruby-hello-world/test-master -w

# To abort a currently running build, using the build id
fly -t concourse-presentation abort-build -j ruby-hello-world/test-master -b 12

# To pull down an existing pipeline
fly -t concourse-presentation get-pipieline -p ruby-hello-world`
```

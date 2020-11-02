#!/busybox/sh
# Kaniko executor runs a busybox shell

CI_COMMIT_REF_NAME=$1
CI_DEFAULT_BRANCH=$2
CI_REGISTRY=$3
CI_REGISTRY_IMAGE=$4
CI_REGISTRY_USER=$5
CI_REGISTRY_PASSWORD=$6
CI_PROJECT_DIR=$7
docker_image_name=$8

if [ "$CI_COMMIT_REF_NAME" = "$CI_DEFAULT_BRANCH" ]; then
   docker_tagged_name="$docker_image_name:latest"
else
   docker_tagged_name="$docker_image_name:$CI_COMMIT_REF_NAME"
fi

echo "Preparing Kaniko Build Context to build Docker images"
echo "{\"auths\":{\"$CI_REGISTRY\":{\"username\":\"$CI_REGISTRY_USER\",\"password\":\"$CI_REGISTRY_PASSWORD\"}}}" > /kaniko/.docker/config.json
/kaniko/executor --context "$CI_PROJECT_DIR" --dockerfile "$CI_PROJECT_DIR"/"$docker_image_name".dockerfile --destination "$CI_REGISTRY_IMAGE/$docker_tagged_name"


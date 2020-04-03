export PROJECT_NAME=Poco
export WK_DIR="$BASE_DIR"
export SOURCE_DIR="$BASE_DIR"
export BUILD_DIR="$BASE_DIR/build-output"
export PROJECT_PATH="poco"

BUILD_ENV="$BASE_DIR/build-env/poco-build-env-ubuntu/set-build-env.sh"
if [ ! -f "$BUILD_ENV" ];then
    pushd "$BASE_DIR"
    git clone https://github.com/Bjoe/DockerImages.git build-env
    popd
else
    pushd "$BASE_DIR/build-env"
    git pull
    popd
fi
source "$BUILD_ENV"

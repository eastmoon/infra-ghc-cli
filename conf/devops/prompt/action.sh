## Execute prompt with
GITHUB_TOKEN_FILE=${CLI_REPO_DIR}/conf/devops/keys/GITHUB_API_KEY
if [ -e ${GITHUB_TOKEN_FILE} ]; then
    GITHUB_TOKEN=$(cat ${GITHUB_TOKEN_FILE})
    docker run -ti --rm \
        -e GITHUB_TOKEN=${GITHUB_TOKEN} \
        copilot-cli:${CLI_REPO_NAME} prompt "${@}"
else
    echo "[-] Error : Can't find Github API key ( Personal Access Token、PAT )."
fi

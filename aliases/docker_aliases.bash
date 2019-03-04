function clean-docker () {
  # Kill and remove leftovers
  docker ps -a || true
  (docker ps -q  | xargs --no-run-if-empty docker kill | xargs --no-run-if-empty docker rm) || true
  (docker ps -qa | xargs --no-run-if-empty docker rm) || true
  (docker network ls --filter type=custom -q | xargs --no-run-if-empty docker network rm) || true
  docker ps -a || true
  (docker images -aq -f dangling=true | xargs --no-run-if-empty docker rmi) || true
  docker images -aq -f dangling=true || true
}

function dockerRunInteractive () {
  docker exec -i -t '$1' /bin/bash
}

export -f clean-docker
export -f dockerRunInteractive

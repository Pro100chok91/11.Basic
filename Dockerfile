FROM ubuntu:22.04
 
 ARG RUNNER_VERSION
  
 RUN apt-get update -y && apt-get upgrade -y && useradd -m runner
 
 RUN DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
     curl jq build-essential libssl-dev libffi-dev python3 python3-venv python3-dev
 
 RUN cd /home/runner && mkdir actions-runner && cd actions-runner \
     && curl -O -L https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
     && tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
 
 RUN chown -R runner ~runner && /home/runner/actions-runner/bin/installdependencies.sh
 
 COPY start.sh start.sh
 
 RUN chmod +x start.sh
 
 USER runner
 
 ENTRYPOINT ["./start.sh"]

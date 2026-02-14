\# OpenClaw + Ollama (GPU Accelerated)



This repository provides a unified Docker environment for running \*\*OpenClaw\*\* alongside \*\*Ollama\*\* in a single container. It is optimized for NVIDIA GPU passthrough and persistent model storage.



\## 🚀 Quick Start



\### 1. Prerequisites

\- \*\*Docker Desktop\*\* or \*\*Docker Engine\*\* installed.

\- \*\*NVIDIA Container Toolkit\*\* installed (for GPU support).

\- Docker version 19.03 or higher (for `--gpus all` support).



\### 2. Project Structure

Ensure your local directories for persistence exist on your host machine (update these paths in the run command if necessary):

\- `D:/ai/ollama` (For LLM models)

\- `D:/ai/openclaw` (For configuration and logs)



\### 3. Build the Image

From the root of this repository, run:

```bash

docker build -t openclaw-ollama .



\### 4. Run docker image

docker run -d \\

&nbsp; --gpus=all \\

&nbsp; -v //d/ai/ollama:/root/.ollama \\

&nbsp; -v //d/ai/openclaw:/root/.openclaw \\

&nbsp; -p 11435:11435 \\

&nbsp; -p 18789:18789 \\

&nbsp; --name openclaw-ollama \\

&nbsp; openclaw-ollama



\### 5.

```bash
docker ps #find id of openclaw-ollama container
docker exec -it \\\[container-id] sh
openclaw onboard --install-daemon

exit

docker stop \[container-id]

docker rm \[container-id]
```



Note: this will generate openclaw config run again step 4



\### 6. Access container to get token

```bash

docker ps #find id of openclaw-ollama container

docker exec -it \[container-id] sh

openclaw config get gateway.auth.token

```



\### 7. Access ollama or openclaw dashboard



\#### OpenClaw dashboard

http://localhost:18789/chat?token=\[token]

\#### Ollama endpoint

curl localhost:11435


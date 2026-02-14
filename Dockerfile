# Use the Node image as the base
FROM node:22-bookworm

# Set environment variables
ENV OLLAMA_HOST="0.0.0.0:11435"
ENV DEBIAN_FRONTEND=noninteractive

# 1. Install system dependencies and Ollama
RUN apt-get update && apt-get install -y \
    zstd \
    curl \
    && curl -fsSL https://ollama.com/install.sh | sh \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 2. Install OpenClaw globally
RUN npm install -g openclaw@latest

# 3. Create a startup script to handle both services
RUN echo '#!/bin/bash\n\
ollama serve &\n\
sleep 5\n\
openclaw onboard --install-daemon\n\
openclaw gateway --bind lan\n\
wait' > /usr/local/bin/entrypoint.sh && chmod +x /usr/local/bin/entrypoint.sh

# Expose the ports you defined
EXPOSE 11435 18789

# Start the services
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
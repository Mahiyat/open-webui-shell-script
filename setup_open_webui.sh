#!/bin/bash

# Define variables for the container and image names
CONTAINER_NAME="open-webui"
IMAGE_NAME="ghcr.io/open-webui/open-webui:ollama"
OLLAMA_VOLUME="ollama"
WEBUI_VOLUME="open-webui"

# Function to check if a command was successful
check_success() {
  if [ $? -ne 0 ]; then
    echo "Error: $1"
    exit 1
  fi
}

echo "Starting the setup for Open WebUI with Ollama..."

# Run the Docker container
echo "Running the Docker container..."
docker run -d -p 3000:8080 --gpus=all \
  -v $OLLAMA_VOLUME:/root/.ollama \
  -v $WEBUI_VOLUME:/app/backend/data \
  --name $CONTAINER_NAME --restart always $IMAGE_NAME
check_success "Failed to run the Docker container."

# Pull the llama3.2 model
echo "Pulling the llama3.2 model..."
docker exec -it $CONTAINER_NAME ollama pull llama3.2
check_success "Failed to pull the llama3.2 model."

# Pull the llava model
echo "Pulling the llava model..."
docker exec -it $CONTAINER_NAME ollama pull llava
check_success "Failed to pull the llava model."

echo "Setup completed successfully!"

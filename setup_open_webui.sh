#!/bin/bash

# Define variables for the container name
CONTAINER_NAME="open-webui-custom"

# Function to check if a command was successful
check_success() {
  if [ $? -ne 0 ]; then
    echo "Error: $1"
    exit 1
  fi
}

echo "Starting the setup for Open WebUI with Ollama, and Stable Diffusion..."

# Run the Docker container
echo "Running the Docker containers..."
docker compose up -d --build
check_success "Failed to run the Docker containers."

# Pull the llama3.2 model
echo "Pulling the llama3.2 model..."
docker exec -it $CONTAINER_NAME ollama pull llama3.2
check_success "Failed to pull the llama3.2 model."

# Pull the llava model
echo "Pulling the llava model..."
docker exec -it $CONTAINER_NAME ollama pull llava
check_success "Failed to pull the llava model."

# Pull the deepseek-r1:7b model
echo "Pulling the deepseek-r1:7b model..."
docker exec -it $CONTAINER_NAME ollama pull deepseek-r1:7b

# Pull the stable diffusion model
echo "Pulling the stable diffusion model..."
docker exec -it $CONTAINER_NAME ollama pull brxce/stable-diffusion-prompt-generator

# Pull the codellama model
echo "Pulling the codellama model..."
docker exec -it $CONTAINER_NAME ollama pull codellama

# Pull the deepseek-r1:7b model
echo "Pulling the deepseek-r1:8b model..."
docker exec -it $CONTAINER_NAME ollama pull deepseek-r1:8b

echo "Setup completed successfully!"

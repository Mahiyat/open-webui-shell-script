# Open WebUI with Ollama Setup Script

This repository contains a shell script to set up and configure Open WebUI with Ollama.

## Prerequisites

Before running the script, ensure you have the following installed on your system:
- Docker
- GPU drivers compatible with Docker and NVIDIA
- Sufficient disk space for the models and data volumes

N.B. To run the docker container without GPU support remove ```--gpus=all``` from line 21 of the setup_open_webui.sh file.

## Usage

1. **Clone the repository or copy the script:**
   Save the `setup_open_webui.sh` file in your preferred directory.

2. **Make the script executable:**
   ```bash
   chmod +x setup_open_webui.sh
3. **Run the script:**
   ```bash
   ./setup_open_webui.sh
## What the Script Does

1. **Runs a Docker container:**

    * Launches the Open WebUI container with GPU support.
    * Maps volumes for persistent data storage:
        * ollama volume for model files.
        * open-webui volume for backend data.
    * Exposes port 3000 to access the web UI.
    * Automatically restarts the container on failure.
  
2. **Downloads required AI models:**
   
    * Pulls the llama3.2 model.
    * Pulls the llava model.
  
3. **Ensures smooth setup with error handling:**

    * Checks for errors after each command and exits if an error occurs.

## Accessing Open WebUI Interface

Once the script finishes:

1. Open a browser and navigate to http://localhost:3000 to access the web interface.
2. Start interacting with the models.

## Troubleshooting
If the setup script fails:

* Ensure Docker is installed and running.
* Verify that your GPU drivers and Docker GPU support are configured properly.
* Check if ports are available (default is 3000).

For additional support, please refer to [Open WebUI Documentation](https://docs.openwebui.com/).
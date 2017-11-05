# COMMANDS
DOCKER_COMMAND=docker
NVIDIA_DOCKER_COMMAND=nvidia-docker
CPU_DOCKER_FILE=Dockerfile.cpu
GPU_DOCKER_FILE=Dockerfile.gpu
SVC=tensorflow-opencv-py3
VERSION_CPU=latest-cpu
VERSION_GPU=latest-gpu
REGISTRY_URL=so77id


build-cpu bc:
	@echo "[build] Building cpu docker image..."
	@$(DOCKER_COMMAND) build -t $(REGISTRY_URL)/$(SVC):$(VERSION_CPU) -f $(CPU_DOCKER_FILE) .
	@echo "[build] Delete old versions..."
	@$(DOCKER_COMMAND) images|sed "1 d"|grep "<none> *<none>"|awk '{print $$3}'|sort|uniq|xargs $(DOCKER_COMMAND) rmi -f
build-gpu bg:
	@echo "[build] Building gpu docker image..."
	@$(DOCKER_COMMAND) build -t $(REGISTRY_URL)/$(SVC):$(VERSION_GPU) -f $(GPU_DOCKER_FILE) .
	@echo "[build] Delete old versions..."
	@$(DOCKER_COMMAND) images|sed "1 d"|grep "<none> *<none>"|awk '{print $$3}'|sort|uniq|xargs $(DOCKER_COMMAND) rmi -f
run-cpu rc:
	@echo "[run] Running cpu docker image..."
	@$(DOCKER_COMMAND) run -t -i $(REGISTRY_URL)/$(SVC):$(VERSION_CPU)
run-gpu rg:
	@echo "[run] Running gpu docker image..."
	@$(NVIDIA_DOCKER_COMMAND) run -t -i $(REGISTRY_URL)/$(SVC):$(VERSION_GPU)
upload-cpu uc:
	@echo "[upload] Uploading cpu docker image..."
	@$(DOCKER_COMMAND) push $(REGISTRY_URL)/$(SVC)
upload-gpu ug:
	@echo "[upload] Uploading gpu docker image..."
	@$(DOCKER_COMMAND) push $(REGISTRY_URL)/$(SVC)
clean c:
	@echo "[clean] Cleaning docker images..."
	@$(DOCKER_COMMAND) rmi -f $(REGISTRY_URL)/$(SVC):$(VERSION_CPU)
	@$(DOCKER_COMMAND) rmi -f $(REGISTRY_URL)/$(SVC):$(VERSION_GPU)
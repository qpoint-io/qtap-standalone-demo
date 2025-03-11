# Start the VM
start-vm:
	@./scripts/start-vm.sh

# Stop the VM
stop-vm:
	@./scripts/stop-vm.sh

# Run qtap
qtap:
	@./scripts/run-qtap.sh

# Build the Docker image
build:
	@./scripts/build-server.sh

# Run the Docker container
run:
	@./scripts/run-server.sh

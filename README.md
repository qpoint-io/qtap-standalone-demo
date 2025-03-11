# QTap Demo

This repository contains a demo application that can be inspected with Qtap (from Qpoint).

## Prerequisites

- Make sure you have lima installed on your system
- Make sure you have Docker installed on your system

## Getting Started

Follow these steps to build and run the application:

### 1. Start the VM

Start the virtual machine environment:

```bash
make start-vm
```

### 2. Build the Application

Build the Docker image:

```bash
make build
```

### 3. Run the Application

Run the Docker container:

```bash
make run
```

### 4. Run QTap

Execute QTap against your running application:

```bash
make qtap
```

### 5. Stop the VM

When you're done, you can stop the virtual machine:

```bash
make stop-vm
```

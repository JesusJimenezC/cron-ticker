# Cron Ticker - Docker Practice Project

> **🐳 Docker Learning Project**: This repository demonstrates the complete workflow of creating, optimizing, and deploying a containerized application using Docker best practices.

## 📋 Project Overview

Cron Ticker is a lightweight TypeScript application built with Bun runtime that demonstrates scheduled task execution using cron jobs. The primary focus of this project is to showcase Docker containerization workflows, multi-stage builds, and production-ready image optimization techniques.

### Key Features

- **Scheduled Task Execution**: Implements a cron job that executes every 5 seconds
- **TypeScript Implementation**: Fully typed codebase with modern ES modules
- **Comprehensive Testing**: Unit tests with Bun's built-in test runner
- **Production-Ready Docker Image**: Multi-stage build with optimized final image size
- **Development Workflow**: Complete CI/CD pipeline demonstration

## 🛠️ Technology Stack

- **Runtime**: [Bun](https://bun.sh) v1.2.17 - Fast all-in-one JavaScript runtime
- **Language**: TypeScript with ES modules
- **Scheduling**: node-cron for task scheduling
- **Testing**: Bun's built-in test framework
- **Containerization**: Docker with Alpine Linux base image

## 🚀 Quick Start

### Prerequisites

- [Bun](https://bun.sh) v1.2.17 or higher
- [Docker](https://docker.com) (for containerization)

### Local Development

1. **Install dependencies**:
   ```bash
   bun install
   ```

2. **Run the application**:
   ```bash
   bun run index.ts
   ```

3. **Run tests**:
   ```bash
   bun test
   ```

### Docker Deployment

#### Option 1: Use Pre-built Image from Docker Hub

```bash
docker run jjimenezc/cron-ticker
```

**Docker Hub Repository**: [jjimenezc/cron-ticker](https://hub.docker.com/r/jjimenezc/cron-ticker)

#### Option 2: Build Locally

1. **Build the Docker image**:
   ```bash
   docker build -t cron-ticker .
   ```

2. **Run the container**:
   ```bash
   docker run cron-ticker
   ```

## 📁 Project Structure

```
cron-ticker/
├── tasks/
│   └── sync-db.ts          # Database synchronization task
├── tests/
│   └── tasks/
│       └── sync-db.test.ts # Unit tests for sync task
├── index.ts                # Application entry point
├── package.json            # Project dependencies and scripts
├── tsconfig.json           # TypeScript configuration
├── Dockerfile              # Multi-stage Docker build configuration
└── README.md               # Project documentation
```

## 🐳 Docker Implementation Details

### Multi-Stage Build Process

The Dockerfile implements a sophisticated multi-stage build process that demonstrates production-ready containerization:

1. **Development Stage**: Installs all dependencies including dev dependencies
2. **Testing Stage**: Runs comprehensive test suite
3. **Cleanup Stage**: Removes test files and dev dependencies
4. **Production Stage**: Creates minimal production image with only runtime dependencies

### Key Docker Features Demonstrated

- **Platform-specific builds** using `--platform=$BUILDPLATFORM`
- **Layer optimization** through strategic COPY operations
- **Dependency management** with separate dev and production installs
- **Image size optimization** by removing unnecessary files
- **Security best practices** with non-root user execution

### Build Optimization Techniques

- Leverages Docker layer caching for faster builds
- Separates dependency installation from source code copying
- Removes development dependencies in production image
- Uses Alpine Linux for minimal base image size

## 🧪 Testing Strategy

The project includes comprehensive unit tests that verify:

- Task execution functionality
- Cron job scheduling behavior
- State management across multiple executions

Tests are automatically executed during the Docker build process, ensuring that only verified code reaches production.

## 📊 Application Behavior

The application implements a simple but effective demonstration of scheduled tasks:

- **Execution Frequency**: Every 5 seconds (configurable via cron expression)
- **Task Function**: Database synchronization simulation with execution counter
- **Output**: Console logging with execution timestamps and counters
- **State Management**: Persistent execution counter across task runs

## 🔧 Configuration

### Cron Schedule

The current cron expression `"1-59/5 * * * * *"` executes the task:
- Every 5 seconds
- Starting from second 1 through 59
- Continuously throughout all minutes, hours, days, and months

### Environment Variables

The application can be configured through environment variables (extend as needed):
- `NODE_ENV`: Environment mode (development/production)
- `LOG_LEVEL`: Logging verbosity level

## 🚀 Deployment Considerations

### Production Deployment

For production environments, consider:

1. **Resource Limits**: Configure appropriate CPU and memory limits
2. **Logging**: Implement structured logging for monitoring
3. **Health Checks**: Add Docker health check endpoints
4. **Secrets Management**: Use Docker secrets for sensitive configuration
5. **Monitoring**: Integrate with monitoring solutions (Prometheus, Grafana)

### Scaling Options

- **Horizontal Scaling**: Deploy multiple instances with load balancing
- **Kubernetes**: Use Kubernetes CronJobs for distributed scheduling
- **Container Orchestration**: Implement with Docker Swarm or Kubernetes

## 📈 Performance Metrics

- **Image Size**: Optimized Alpine-based image (~50MB)
- **Build Time**: Fast builds with effective layer caching
- **Memory Usage**: Minimal runtime memory footprint
- **Startup Time**: Near-instantaneous container startup

## 🤝 Contributing

This project serves as a learning resource for Docker containerization. Contributions that enhance the educational value are welcome:

1. Fork the repository
2. Create a feature branch
3. Implement changes with tests
4. Ensure Docker build passes
5. Submit a pull request

## 📄 License

This project is created for educational purposes and Docker workflow demonstration.

---

**Note**: This project is specifically designed to demonstrate Docker containerization workflows and best practices. It serves as a practical example of modern application deployment strategies using container technology.

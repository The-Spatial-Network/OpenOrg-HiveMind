# Installation Guide

This guide will walk you through setting up the OpenOrg-HiveMind on your system.

## Prerequisites

### System Requirements

- **Operating System**: Linux, macOS, or Windows with WSL2
- **RAM**: Minimum 8GB, recommended 16GB+
- **Storage**: Minimum 50GB free space
- **CPU**: Multi-core processor recommended

### Required Software

1. **Docker Engine 20.10+**
   - [Install Docker](https://docs.docker.com/get-docker/)
   - Verify installation: `docker --version`

2. **Docker Compose 2.0+**
   - Usually included with Docker Desktop
   - Verify installation: `docker-compose --version` or `docker compose version`

## Quick Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/The-Spatial-Network/OpenOrg-HiveMind.git
   cd OpenOrg-HiveMind
   ```

2. **Run the setup script**
   ```bash
   ./setup.sh
   ```

3. **Configure environment variables**
   ```bash
   cp .env.example .env
   nano .env  # Edit with your specific configuration
   ```

4. **Start the HiveMind**
   ```bash
   docker-compose up -d
   ```

## Manual Installation

If you prefer to set up manually:

### 1. Environment Configuration

Copy the example environment file and customize it:

```bash
cp .env.example .env
```

**Important**: Change all default passwords in the `.env` file for security!

### 2. Create Required Directories

```bash
mkdir -p data/open-webui
mkdir -p data/ollama
mkdir -p scripts
mkdir -p logs
mkdir -p config
```

### 3. Start Services

Start all services in detached mode:

```bash
docker-compose up -d
```

### 4. Verify Installation

Check that all services are running:

```bash
docker-compose ps
```

## Service Access

Once installation is complete, you can access the services at:

| Service | URL | Default Credentials |
|---------|-----|-------------------|
| Zulip Chat | http://localhost:8080 | Set during first run |
| Jitsi Meet | https://localhost:8443 | No authentication |
| NextCloud | http://localhost:8081 | admin / (from .env) |
| Gitea | http://localhost:3000 | Set during first run |
| Open WebUI | http://localhost:3001 | No authentication |
| n8n | http://localhost:5678 | admin / (from .env) |
| Flowise | http://localhost:3002 | admin / (from .env) |
| Jaeger UI | http://localhost:16686 | No authentication |
| ElasticSearch | http://localhost:9200 | No authentication |

## Initial Setup

### 1. Zulip Configuration

1. Navigate to http://localhost:8080
2. Create your organization and admin account
3. Configure email settings (optional)
4. Set up channels and invite users

### 2. NextCloud Setup

1. Navigate to http://localhost:8081
2. Complete the setup wizard
3. Configure storage and apps
4. Set up user accounts

### 3. Gitea Configuration

1. Navigate to http://localhost:3000
2. Complete the initial setup
3. Create admin user
4. Configure repositories and organizations

### 4. AI Tools Setup

1. **Open WebUI**: Access at http://localhost:3001
   - Configure LLM models
   - Set up user accounts

2. **n8n**: Access at http://localhost:5678
   - Create workflows
   - Connect to other services

3. **Flowise**: Access at http://localhost:3002
   - Build LLM applications
   - Configure data sources

## Troubleshooting

### Common Issues

1. **Port Conflicts**
   - Check if ports are already in use: `netstat -tulpn | grep :PORT`
   - Modify port mappings in `docker-compose.yml`

2. **Memory Issues**
   - Increase Docker memory limit
   - Reduce ElasticSearch heap size in docker-compose.yml

3. **Permission Issues**
   - Ensure Docker daemon is running
   - Add user to docker group: `sudo usermod -aG docker $USER`

4. **Service Won't Start**
   - Check logs: `docker-compose logs [service-name]`
   - Verify environment variables in `.env`

### Getting Help

- Check the [main README](../README.md)
- Review service logs: `docker-compose logs -f`
- Open an issue on GitHub
- Join our community discussions

## Security Considerations

1. **Change Default Passwords**: Update all passwords in `.env`
2. **Network Security**: Consider using a reverse proxy with SSL
3. **Regular Updates**: Keep Docker images updated
4. **Backup Strategy**: Implement regular backups of volumes
5. **Access Control**: Configure proper user permissions

## Next Steps

After installation, see:
- [Configuration Guide](CONFIGURATION.md)
- [Usage Guide](USAGE.md)
- [Integration Guide](INTEGRATION.md)

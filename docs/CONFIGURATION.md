# Configuration Guide

This guide covers how to configure the OpenOrg-HiveMind services for your specific needs.

## Environment Variables

The `.env` file contains all the configuration variables for the HiveMind. Copy `.env.example` to `.env` and modify as needed.

### Database Configuration

```bash
# PostgreSQL settings used by multiple services
POSTGRES_DB=hivemind
POSTGRES_USER=hivemind
POSTGRES_PASSWORD=your_secure_password_here
```

### Service-Specific Configuration

#### Zulip Chat

```bash
ZULIP_HOST=localhost:8080                    # External host for Zulip
ZULIP_ADMIN=admin@yourdomain.com            # Admin email
ZULIP_SECRET_KEY=your_zulip_secret_key      # Unique secret key
ZULIP_RABBITMQ_PASSWORD=secure_password     # RabbitMQ password
ZULIP_MEMCACHED_PASSWORD=secure_password    # Memcached password
ZULIP_REDIS_PASSWORD=secure_password        # Redis password

# Optional email configuration
EMAIL_HOST=smtp.yourdomain.com
EMAIL_HOST_USER=noreply@yourdomain.com
ZULIP_EMAIL_PASSWORD=your_email_password
```

#### NextCloud

```bash
NEXTCLOUD_ADMIN_USER=admin
NEXTCLOUD_ADMIN_PASSWORD=secure_password
NEXTCLOUD_TRUSTED_DOMAINS=localhost,yourdomain.com
```

#### n8n Workflow Automation

```bash
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=secure_password
```

#### Flowise AI

```bash
FLOWISE_USERNAME=admin
FLOWISE_PASSWORD=secure_password
```

#### Open WebUI

```bash
WEBUI_SECRET_KEY=your_webui_secret_key
```

## Service Configuration

### OpenTelemetry Collector

The OpenTelemetry collector configuration is in `config/otel-collector-config.yaml`. Key settings:

- **Receivers**: OTLP (gRPC/HTTP) and Prometheus
- **Processors**: Batch processing and memory limiting
- **Exporters**: Jaeger, Elasticsearch, and Prometheus

To modify telemetry collection:

1. Edit `config/otel-collector-config.yaml`
2. Restart the collector: `docker-compose restart otel-collector`

### Elasticsearch

Default configuration:
- Single node cluster
- Security disabled for development
- 512MB heap size

For production, consider:
- Enabling security features
- Increasing heap size
- Setting up cluster mode

### Jaeger Tracing

Configured to:
- Store traces in Elasticsearch
- Accept OTLP traces
- Provide web UI on port 16686

### AI Model Configuration

#### Ollama Models

To add models to Ollama:

```bash
# Access the Ollama container
docker-compose exec ollama bash

# Pull a model (e.g., Llama 2)
ollama pull llama2

# List available models
ollama list
```

#### Open WebUI Models

1. Access Open WebUI at http://localhost:3001
2. Go to Settings → Models
3. Configure model endpoints
4. Set default models for different tasks

## Network Configuration

### Port Mapping

Default port mappings:

| Service | Internal Port | External Port |
|---------|---------------|---------------|
| Zulip | 80 | 8080 |
| Jitsi Meet | 80 | 8443 |
| NextCloud | 80 | 8081 |
| Gitea | 3000 | 3000 |
| Open WebUI | 8080 | 3001 |
| n8n | 5678 | 5678 |
| Flowise | 3000 | 3002 |
| Jaeger UI | 16686 | 16686 |
| ElasticSearch | 9200 | 9200 |
| Jaguar | 8888 | 8888 |

To change ports, modify the `ports` section in `docker-compose.yml`.

### Internal Network

All services communicate through the `hivemind` Docker network. Services can reach each other using their container names.

## Data Integration

### Connecting AI Tools to Data Sources

#### n8n Workflows

Create workflows to:
1. Extract data from Zulip channels
2. Process NextCloud file metadata
3. Analyze Git repository activity
4. Send processed data to AI tools

Example workflow nodes:
- **Zulip Trigger**: Monitor new messages
- **HTTP Request**: Send data to AI services
- **Database**: Store processed results

#### Flowise Integrations

Configure Flowise to access:
- Elasticsearch indices for search
- PostgreSQL for structured data
- File system for document processing

#### Open WebUI Connections

Connect Open WebUI to:
- Local Ollama models
- External API endpoints
- Custom model servers

## Security Configuration

### Authentication

1. **Change Default Passwords**: Update all passwords in `.env`
2. **Enable 2FA**: Where supported (Zulip, NextCloud, Gitea)
3. **API Keys**: Generate secure API keys for service integration

### Network Security

1. **Reverse Proxy**: Use Traefik for SSL termination
2. **Firewall**: Restrict external access to necessary ports
3. **VPN**: Consider VPN access for remote users

### Data Protection

1. **Encryption**: Enable encryption at rest where possible
2. **Backups**: Regular automated backups
3. **Access Logs**: Monitor service access logs

## Performance Tuning

### Resource Allocation

Adjust resource limits in `docker-compose.yml`:

```yaml
services:
  elasticsearch:
    deploy:
      resources:
        limits:
          memory: 2G
        reservations:
          memory: 1G
```

### Database Optimization

PostgreSQL tuning:
- Increase `shared_buffers`
- Tune `work_mem`
- Optimize `checkpoint_segments`

### Elasticsearch Tuning

- Increase heap size for large datasets
- Configure index templates
- Set up index lifecycle management

## Monitoring Configuration

### Metrics Collection

Configure Prometheus scraping:
1. Add service endpoints to `otel-collector-config.yaml`
2. Set up custom metrics in applications
3. Create Grafana dashboards (optional)

### Log Aggregation

Centralize logs:
1. Configure log drivers in Docker Compose
2. Set up log parsing in Elasticsearch
3. Create log-based alerts

### Health Checks

Add health checks to services:

```yaml
healthcheck:
  test: ["CMD", "curl", "-f", "http://localhost:8080/health"]
  interval: 30s
  timeout: 10s
  retries: 3
```

## Backup Configuration

### Automated Backups

Create backup scripts for:
- PostgreSQL databases
- Docker volumes
- Configuration files

Example backup script:

```bash
#!/bin/bash
# Backup PostgreSQL
docker-compose exec postgres pg_dumpall -U hivemind > backup_$(date +%Y%m%d).sql

# Backup volumes
docker run --rm -v hivemind_postgres_data:/data -v $(pwd):/backup alpine tar czf /backup/postgres_data_$(date +%Y%m%d).tar.gz /data
```

### Restore Procedures

Document restore procedures for:
- Database restoration
- Volume restoration
- Configuration recovery

## Troubleshooting Configuration

### Common Configuration Issues

1. **Service Dependencies**: Ensure dependent services start first
2. **Environment Variables**: Verify all required variables are set
3. **Network Connectivity**: Check internal service communication
4. **Resource Limits**: Monitor memory and CPU usage

### Configuration Validation

Validate configuration:

```bash
# Check Docker Compose syntax
docker-compose config

# Validate environment variables
docker-compose config --resolve-envvars

# Test service connectivity
docker-compose exec service-name ping other-service
```

## Advanced Configuration

### Custom Service Images

Build custom images:
1. Create Dockerfile for customizations
2. Build and tag image
3. Update docker-compose.yml to use custom image

### External Services

Integrate external services:
1. Add service definitions to docker-compose.yml
2. Configure network connectivity
3. Update environment variables

### Scaling Services

Scale services horizontally:

```bash
# Scale specific services
docker-compose up -d --scale n8n=3

# Use Docker Swarm for production scaling
docker swarm init
docker stack deploy -c docker-compose.yml hivemind
```

For more advanced configurations, see the individual service documentation linked in the main README.

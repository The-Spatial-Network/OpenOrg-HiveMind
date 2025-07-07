#!/bin/bash

# OpenOrg-HiveMind Service Test Script
# This script tests if all services are running and accessible

set -e

echo "🧠 OpenOrg-HiveMind Service Test"
echo "================================"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to test HTTP endpoint
test_http() {
    local service=$1
    local url=$2
    local expected_code=${3:-200}
    
    echo -n "Testing $service... "
    
    if curl -s -o /dev/null -w "%{http_code}" --connect-timeout 5 "$url" | grep -q "$expected_code"; then
        echo -e "${GREEN}✅ OK${NC}"
        return 0
    else
        echo -e "${RED}❌ FAILED${NC}"
        return 1
    fi
}

# Function to test if service is running
test_container() {
    local service=$1
    local container_name=$2
    
    echo -n "Checking $service container... "
    
    if docker ps --format "table {{.Names}}" | grep -q "$container_name"; then
        echo -e "${GREEN}✅ Running${NC}"
        return 0
    else
        echo -e "${RED}❌ Not Running${NC}"
        return 1
    fi
}

echo ""
echo "📦 Container Status Check"
echo "------------------------"

# Test containers
test_container "PostgreSQL" "hivemind-postgres"
test_container "Redis" "hivemind-redis"
test_container "Elasticsearch" "hivemind-elasticsearch"
test_container "Zulip" "hivemind-zulip"
test_container "NextCloud" "hivemind-nextcloud"
test_container "Gitea" "hivemind-gitea"
test_container "Jitsi Web" "hivemind-jitsi-web"
test_container "Open WebUI" "hivemind-open-webui"
test_container "n8n" "hivemind-n8n"
test_container "Flowise" "hivemind-flowise"
test_container "Jaeger" "hivemind-jaeger"

echo ""
echo "🌐 Service Accessibility Check"
echo "------------------------------"

# Test HTTP endpoints
test_http "Zulip Chat" "http://localhost:8080" "200"
test_http "Jitsi Meet" "http://localhost:8443" "200"
test_http "NextCloud" "http://localhost:8081" "200"
test_http "Gitea" "http://localhost:3000" "200"
test_http "Open WebUI" "http://localhost:3001" "200"
test_http "n8n" "http://localhost:5678" "200"
test_http "Flowise" "http://localhost:3002" "200"
test_http "Jaeger UI" "http://localhost:16686" "200"
test_http "Elasticsearch" "http://localhost:9200" "200"

echo ""
echo "📊 Service Information"
echo "---------------------"

echo "Service URLs:"
echo "• Zulip Chat: http://localhost:8080"
echo "• Jitsi Meet: https://localhost:8443"
echo "• NextCloud: http://localhost:8081"
echo "• Gitea: http://localhost:3000"
echo "• Open WebUI: http://localhost:3001"
echo "• n8n: http://localhost:5678"
echo "• Flowise: http://localhost:3002"
echo "• Jaeger UI: http://localhost:16686"
echo "• Elasticsearch: http://localhost:9200"

echo ""
echo "🔧 Quick Commands"
echo "----------------"
echo "• View all services: docker-compose ps"
echo "• View logs: docker-compose logs -f [service-name]"
echo "• Restart service: docker-compose restart [service-name]"
echo "• Stop all: docker-compose down"
echo "• Start all: docker-compose up -d"

echo ""
echo "📖 Documentation"
echo "---------------"
echo "• Installation: docs/INSTALLATION.md"
echo "• Configuration: docs/CONFIGURATION.md"
echo "• Usage Guide: docs/USAGE.md"
echo "• Contributing: CONTRIBUTING.md"

echo ""
echo -e "${GREEN}🎉 Service test completed!${NC}"
echo ""
echo "If any services failed, check:"
echo "1. Docker containers are running: docker-compose ps"
echo "2. Service logs: docker-compose logs [service-name]"
echo "3. Port conflicts: netstat -tulpn | grep [port]"
echo "4. Environment configuration: .env file"

#!/bin/bash

# OpenOrg-HiveMind Setup Script
# This script helps set up the HiveMind environment

set -e

echo "🧠 OpenOrg-HiveMind Setup"
echo "=========================="

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    echo "   Visit: https://docs.docker.com/get-docker/"
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null && ! docker compose version &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    echo "   Visit: https://docs.docker.com/compose/install/"
    exit 1
fi

echo "✅ Docker and Docker Compose are installed"

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating .env file from template..."
    cp .env.example .env
    echo "⚠️  Please edit .env file with your specific configuration before starting services"
    echo "   Especially change default passwords for security!"
else
    echo "✅ .env file already exists"
fi

# Create necessary directories
echo "📁 Creating necessary directories..."
mkdir -p data/open-webui
mkdir -p data/ollama
mkdir -p scripts
mkdir -p logs

echo "✅ Directories created"

# Set proper permissions
echo "🔐 Setting proper permissions..."
chmod +x setup.sh

echo ""
echo "🚀 Setup complete! Next steps:"
echo ""
echo "1. Edit .env file with your configuration:"
echo "   nano .env"
echo ""
echo "2. Start the HiveMind:"
echo "   docker-compose up -d"
echo ""
echo "3. Check service status:"
echo "   docker-compose ps"
echo ""
echo "4. View logs:"
echo "   docker-compose logs -f [service-name]"
echo ""
echo "5. Access services:"
echo "   - Zulip Chat: http://localhost:8080"
echo "   - Jitsi Meet: https://localhost:8443"
echo "   - NextCloud: http://localhost:8081"
echo "   - Gitea: http://localhost:3000"
echo "   - Open WebUI: http://localhost:3001"
echo "   - n8n: http://localhost:5678"
echo "   - Flowise: http://localhost:3002"
echo "   - Jaeger UI: http://localhost:16686"
echo "   - ElasticSearch: http://localhost:9200"
echo ""
echo "📖 For more information, see README.md"

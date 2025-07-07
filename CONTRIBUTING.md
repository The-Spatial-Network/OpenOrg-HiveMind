# Contributing to OpenOrg-HiveMind

Thank you for your interest in contributing to OpenOrg-HiveMind! This document provides guidelines and information for contributors.

## 🤝 How to Contribute

### Types of Contributions

We welcome various types of contributions:

- **Bug Reports**: Help us identify and fix issues
- **Feature Requests**: Suggest new functionality
- **Documentation**: Improve or add documentation
- **Code Contributions**: Fix bugs or implement features
- **Testing**: Help test new features and releases
- **Community Support**: Help other users in discussions

### Getting Started

1. **Fork the Repository**
   ```bash
   git clone https://github.com/The-Spatial-Network/OpenOrg-HiveMind.git
   cd OpenOrg-HiveMind
   ```

2. **Set Up Development Environment**
   ```bash
   ./setup.sh
   cp .env.example .env
   # Edit .env with your configuration
   docker-compose up -d
   ```

3. **Create a Branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/issue-description
   ```

## 📋 Contribution Guidelines

### Code Style

- **Docker Compose**: Follow YAML best practices
- **Documentation**: Use clear, concise language
- **Shell Scripts**: Follow bash best practices
- **Configuration**: Use environment variables for customization

### Commit Messages

Use conventional commit format:

```
type(scope): description

[optional body]

[optional footer]
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks

Examples:
```
feat(docker): add new AI service integration
fix(config): resolve environment variable issue
docs(readme): update installation instructions
```

### Pull Request Process

1. **Before Submitting**
   - Test your changes locally
   - Update documentation if needed
   - Ensure all services start correctly
   - Check for any breaking changes

2. **Pull Request Template**
   ```markdown
   ## Description
   Brief description of changes

   ## Type of Change
   - [ ] Bug fix
   - [ ] New feature
   - [ ] Documentation update
   - [ ] Breaking change

   ## Testing
   - [ ] Tested locally
   - [ ] All services start correctly
   - [ ] Documentation updated

   ## Checklist
   - [ ] Code follows project style
   - [ ] Self-review completed
   - [ ] Documentation updated
   - [ ] No breaking changes (or documented)
   ```

3. **Review Process**
   - Maintainers will review your PR
   - Address any feedback
   - Once approved, your PR will be merged

## 🐛 Bug Reports

### Before Reporting

1. Check existing issues
2. Test with latest version
3. Verify it's not a configuration issue

### Bug Report Template

```markdown
**Describe the Bug**
Clear description of the issue

**To Reproduce**
Steps to reproduce:
1. Go to '...'
2. Click on '...'
3. See error

**Expected Behavior**
What you expected to happen

**Environment**
- OS: [e.g., Ubuntu 20.04]
- Docker Version: [e.g., 20.10.8]
- Docker Compose Version: [e.g., 2.0.1]

**Logs**
```
Paste relevant logs here
```

**Additional Context**
Any other relevant information
```

## 💡 Feature Requests

### Feature Request Template

```markdown
**Is your feature request related to a problem?**
Clear description of the problem

**Describe the solution you'd like**
Clear description of desired feature

**Describe alternatives you've considered**
Alternative solutions or features

**Additional context**
Any other context, screenshots, etc.
```

## 📚 Documentation Contributions

### Documentation Standards

- Use clear, concise language
- Include code examples where helpful
- Keep documentation up-to-date
- Follow existing structure and style

### Areas Needing Documentation

- Service configuration guides
- Integration tutorials
- Troubleshooting guides
- Best practices
- Use case examples

## 🔧 Development Setup

### Prerequisites

- Docker Engine 20.10+
- Docker Compose 2.0+
- Git
- Text editor or IDE

### Local Development

1. **Clone and Setup**
   ```bash
   git clone https://github.com/The-Spatial-Network/OpenOrg-HiveMind.git
   cd OpenOrg-HiveMind
   ./setup.sh
   ```

2. **Configuration**
   ```bash
   cp .env.example .env
   # Edit .env with development settings
   ```

3. **Start Services**
   ```bash
   docker-compose up -d
   ```

4. **Monitor Logs**
   ```bash
   docker-compose logs -f
   ```

### Testing Changes

1. **Test Service Startup**
   ```bash
   docker-compose down
   docker-compose up -d
   docker-compose ps
   ```

2. **Test Service Connectivity**
   ```bash
   # Test each service endpoint
   curl http://localhost:8080  # Zulip
   curl http://localhost:3000  # Gitea
   # etc.
   ```

3. **Test Integrations**
   - Verify service-to-service communication
   - Test data flow between services
   - Validate configuration changes

## 🏗️ Architecture Contributions

### Adding New Services

1. **Service Requirements**
   - Must be open source
   - Should integrate with existing services
   - Must be containerized
   - Should follow security best practices

2. **Integration Steps**
   - Add service to `docker-compose.yml`
   - Update environment variables
   - Add configuration files if needed
   - Update documentation
   - Test integration

3. **Documentation Updates**
   - Update README.md
   - Add service to installation guide
   - Include configuration instructions
   - Add usage examples

### Modifying Existing Services

1. **Backward Compatibility**
   - Maintain existing functionality
   - Provide migration path if needed
   - Document breaking changes

2. **Testing**
   - Test with existing configurations
   - Verify integrations still work
   - Test upgrade scenarios

## 🔒 Security Considerations

### Security Guidelines

- Never commit secrets or passwords
- Use environment variables for configuration
- Follow security best practices
- Report security issues privately

### Reporting Security Issues

For security vulnerabilities, please email security@example.com instead of creating a public issue.

## 📞 Community

### Communication Channels

- **GitHub Issues**: Bug reports and feature requests
- **GitHub Discussions**: General questions and ideas
- **Pull Requests**: Code contributions

### Code of Conduct

We are committed to providing a welcoming and inclusive environment. Please:

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Follow the golden rule

## 🎯 Project Roadmap

### Current Priorities

- [ ] Improve service integrations
- [ ] Add more AI tools
- [ ] Enhance monitoring capabilities
- [ ] Improve documentation

### Future Goals

- [ ] Advanced analytics
- [ ] Cloud deployment options

## 📄 License

By contributing to OpenOrg-HiveMind, you agree that your contributions will be licensed under the MIT License.

## 🙏 Recognition

Contributors will be recognized in:
- README.md contributors section
- Release notes
- Project documentation

Thank you for contributing to OpenOrg-HiveMind! 🧠✨

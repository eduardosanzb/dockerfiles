# Security Guidelines

## Overview
This repository contains configuration files and Dockerfiles for development environments. Security best practices should be followed when using these configurations.

## Known Security Considerations

### 1. Default Passwords in Dockerfiles
The Dockerfiles contain default passwords (`password`) that are **for development purposes only**. 

**⚠️ WARNING**: Never use these default passwords in production environments.

**How to override**:
```bash
# When building Docker images
docker build --build-arg USER_PASSWORD=your_secure_password .

# In docker-compose
USER_PASSWORD=your_secure_password docker-compose up --build
```

### 2. Environment Variables and Secrets

**Protected Files** (already in .gitignore):
- `.env` files - for local environment secrets
- `~/.env` - sourced by .zshrc
- `~/.local/bin/env` - sourced by .zshrc  
- SSH keys and AWS credentials

**Best Practices**:
1. Never commit actual tokens, API keys, or passwords to the repository
2. Use the provided `.env.example` as a template
3. Copy `.env.example` to `.env` and fill in your actual values
4. The `.env` file is already gitignored

### 3. Token Placeholders

The `.zshrc` file contains:
```bash
export NPM_GITHUB_TOKEN=noesuntoken
```

This is a **placeholder value**, not a real token. To use a real token:
1. Add it to your `~/.env` file: `export NPM_GITHUB_TOKEN=your_actual_token`
2. The .zshrc already sources `~/.env`, so it will override the placeholder

### 4. Git History

This repository does not contain any real secrets in its commit history. All sensitive values are:
- Placeholder values (like "noesuntoken")
- Default development passwords (like "password")
- Personal email addresses (which are public)

## Security Checklist

Before committing changes:
- [ ] No real API keys, tokens, or passwords in code
- [ ] All secrets are in gitignored files (.env, credentials, etc.)
- [ ] Default passwords are clearly marked as development-only
- [ ] New secret files are added to .gitignore

## Reporting Security Issues

If you discover a security vulnerability, please email: eduardosanzb@gmail.com

# Eduardosanzb dotfiles in dockerfiles

How to setup with stow in mac


1. Install stow with brew
```bash
brew install stow
```

2. Clone this repo
```bash
git clone ssh://github.com/eduardosanzb/dockerfiles.git
```

3. Go to the repo folder
```bash
cd dockerfiles
```

4. Run stow
```bash
stow -t $HOME .
```

## Security

⚠️ **Important**: This repository contains configuration files with placeholder values and default passwords. Before using in any environment, please review the [SECURITY.md](SECURITY.md) file for important security considerations.

A comprehensive security audit was completed on December 12, 2025. See [SECURITY-AUDIT.md](SECURITY-AUDIT.md) for detailed findings and recommendations.

Key points:
- Copy `.env.example` to `.env` and add your actual secrets (already gitignored)
- Override default Docker passwords when building images
- Never commit real API keys or tokens to the repository
- Set Weather API key in environment variables (see SECURITY.md)

#

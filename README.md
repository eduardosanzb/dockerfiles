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

Key points:
- Copy `.env.example` to `.env` and add your actual secrets (already gitignored)
- Override default Docker passwords when building images
- Never commit real API keys or tokens to the repository

#

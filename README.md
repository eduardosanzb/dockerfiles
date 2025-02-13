## Eduardosanzb dotfiles in dockerfiles

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


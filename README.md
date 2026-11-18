# environment

macOSの開発環境を管理するリポジトリ。

## Setup

Homebrewがインストール済みであることを前提とする。

### 0. Directories

```bash
mkdir -p ~/dev ~/work
```

### 1. Clone

```bash
cd ~
git clone https://github.com/96yukiv2/environment.git
cd environment
```

### 2. Homebrew

```bash
brew bundle --file=10-homebrew/Brewfile
brew bundle --file=10-homebrew/Brewfile.cask
```

### 3. Symbolic Links

設定ファイルをシンボリックリンクで配置する。

```bash
mkdir -p ~/.config/git

ln -s "$PWD/00-config/zsh/.zshrc" ~/.zshrc
ln -s "$PWD/00-config/git/config" ~/.config/git/config
ln -s "$PWD/00-config/git/ignore" ~/.config/git/ignore
ln -s "$PWD/00-config/starship/starship.toml" ~/.config/starship.toml
```

### 4. GitHub CLI

```bash
gh auth login
gh auth setup-git
gh auth status
```

GitHub.com / HTTPSを選択する。

### 5. Git Identity

コミット用のユーザー情報はローカルの `~/.gitconfig` に保存する。

```bash
git config --file ~/.gitconfig user.name "Your Name"
git config --file ~/.gitconfig user.email "your-email@example.com"
```
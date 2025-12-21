### curl:
```
sudo apt install curl
```

### btop:
```
sudo apt install btop
```

### git:
```
sudo apt install git-all
```

### git config:
```
git config --global user.name "Mile Cilic"
git config --global user.email mile.cilic@gmail.com
git config --global init.defaultBranch master
```

### sublime:
```
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
sudo apt-get update
sudo apt-get install sublime-text
```

### brave:
```
curl -fsS https://dl.brave.com/install.sh | CHANNEL=nightly sh
```

### pycharm:
```
sudo snap install pycharm --classic
```

### webstorm:
```
sudo snap install webstorm --classic
```

### xournalpp:
```
sudo apt install xournalpp
```

### claude code
```
curl -fsSL https://claude.ai/install.sh | bash
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc && source ~/.bashrc
```
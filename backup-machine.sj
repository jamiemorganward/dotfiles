# copy paste this file in bit by bit.
# don't run it.
  echo "do not run this script in one go. hit ctrl-c NOW"
  read -n 1

mkdir -p ~/migration
mkdir -p ~/migration/configs

# take a backup of .config
tar zcvf home_config.tar.gz $HOME/.config
mv home_config.tar.gz ~/migration/configs/

# docker volumes?
mkdir -p ~/migration/docker
https://medium.com/@idoberko2/migrate-docker-volume-from-one-mac-osx-host-to-another-4607a5c61c58

docker run --rm -it -v ~/migration/docker:/backup -v /var/lib/docker:/docker alpine:edge tar cfz /backup/volumes.tgz /docker/volumes/
# restore: cd ~/migration/docker && tar zxvf volumes.tgz
# restore: docker run --rm -it -v /var/lib/docker:/docker -v ~/migration/docker/volumes:/volume-backup alpine:edge cp -r /volume-backup/data-vol /docker/volumes

# backup vagrant machines?
# I'm always using docker now, but just leaving this in here in case theres some legacy stuff that might be useful to keep. Plus I should check ~/VirtualBox VMs just in case
mkdir -p ~/migration/vagrant

# the usual suspects
rsync -arv ~/Desktop ~/migration/Desktop
rsync -arv ~/Documents ~/migration/Documents
rsync -arv ~/Downloads ~/migration/Downloads
rsync -arv ~/Movies ~/migration/Movies
rsync -arv ~/.gnupg ~/migration/.gnupg
rsync -arv ~/.gsutil ~/migration/.gsutil

cp ~/.gitconfig ~/migration/configs/
cp ~/.vuescanrc ~/migration/configs/
cp ~/.npmrc ~/migration/configs/
cp ~/.vuerc ~/migration/configs/

# mgitstatus - useful to check if there's any unpushed stuff in my projects
curl -s -o mgitstatus https://raw.githubusercontent.com/fboender/multi-git-status/master/mgitstatus
chmod 755 mgitstatus

# move any untracked projects here - there should be none, but just in case
mkdir -p ~/migration/projects

# keep list of projects and apps
ls -a ~/Sites > ~/migration/projects/list
ls -a /Applications > ~/migration/applist

# keys
mkdir -p ~/migration/keys
rsync -rva $HOME/.ssh ~/migration/keys/

# some other files
cp -Rp ~/Library/Services ~/migration/Library/ # automator stuff
cp -Rp ~/Library/Fonts ~/migration/Library/ # all those fonts you've installed

mkdir -p ~/migration/RootLibrary/"Application Support"
mkdir -p ~/migration/Library/"Application Support"
cp -Rp ~/Library/Application\ Support/Sublime\ Text\ * ~/migration/Library/"Application Support/Sublime Text"
cp -Rp ~/Library/Application\ Support/Tunnelblick ~/migration/Library/"Application Support/Tunnelblick"
cp -Rp /Library/Application\ Support/Tunnelblick ~/migration/RootLibrary/"Application Support/Tunnelblick"
cp -Rp /Applications/Tunnelblick.app/Contents/Resources/ ~/migration/Tunnelblick

# backup Hostfiles
# I'm using Gas Mask - so I'll copy data out of there
mkdir -p ~/migration/gasmask

# go through /Applications and just check for other config files which might need copying

# Davinci
# Export projects as drps

# Lightroom
# Preferences > Show all other lightroom presets


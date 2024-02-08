#! /bin/bash 

#This is the script meant to install Task Juggler
#By the one and only @BeckBrook


#updating/upgrading Debian
apt-get update && apt-get upgrade -y

#Donwload task juggler's dependency, RUBY environment
apt-get install ruby-full -y

#Install Ruby Gems 
sudo apt install rubygems -y

#installation de TaskJuggler
gem install taskjuggler



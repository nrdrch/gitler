# gitler
Grabs clone-able links from your Clipboard and clones them into a predefined Directory. Has the option to automatically install AUR packages after you cloned them. 
### To Download & Use:
- Put the .sh file somehwere you feel comfortable with, preferably in your home Directory.
```
git clone https://github.com/nrdrch/gitler.git | cd gitler/
```
- If the .sh file is not executable use
```
chmod +x /path/to/gitler.sg
```
- To run the script just use 
```
./gitler.sh 
```
### You could either make an alias now
Now you could define an alias to run the script more easily like this in your ~/.bashrc
```
alias gitler='/home/username/path/2/./gitler.sh'
```
Or if you use fish like this in your terminal
```
alias --save gitler="/home/username/path/2/./gitler.sh"
```
### OR
To compile the script to binary and make it even more effortless to use, move to the Install-Location of gitler.sh und run:
```
shc -f gitler.sh
```
```
sudo cp -r gitler.sh.x /usr/bin/gitler
```
After that you can just use it with the command
```
gitler
```

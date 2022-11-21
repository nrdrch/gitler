# **Gitler**
- [**Gitler**](#gitler)
    - [**:one: Recommended Method**](#one-recommended-method)
    - [**:two: You could also Run it as a Shell Script**](#two-you-could-also-run-it-as-a-shell-script)
    - [**:three: or Compile the source script on your own**](#three-or-compile-the-source-script-on-your-own)

```
git clone https://github.com/nrdrch/gitler.git
```

### **:one: Recommended Method**
- Inside the newly created folder you will find a file named "gitler-bin"  
- Copy the file gitler-bin into /usr/bin/gitler with: 
```
sudo cp -r gitler-bin /usr/bin/gitler
```
Done! To run just use:
```
gitler
```


### **:two: You could also Run it as a Shell Script**
- You have to define an alias to run the script more easily like this in your ~/.bashrc
```
alias gitler='/home/username/path/to/gitler.sh'
```
- Or if you use fish like this in your terminal
```
alias --save gitler="/home/username/path/to/gitler.sh"
```
- Make The File executable 
```
chmod +x gitler.sh
```
### **:three: or Compile the source script on your own**
- To compile the script to binary yourself, move to the Install-Location of gitler.sh und run:
```
shc -f gitler.sh
```
```
sudo cp -r gitler.sh.x /usr/bin/gitler
```

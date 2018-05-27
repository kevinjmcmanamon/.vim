# Run in Powershell
#First download the cygwin installer:

$url = "https://cygwin.com/setup-x86_64.exe"
$file = "C:\Users\$env:UserName\Downloads\setup-x86_64.exe"
Invoke-WebRequest -Uri $url -OutFile $file

#Install cygwin with the desired packages:
& C:\Users\$env:UserName\Downloads\setup-x86_64.exe `
--quiet-mode `
--packages `
git, `
the_silver_searcher, `
tmux, ` 
python3,`
gcc, `
vim
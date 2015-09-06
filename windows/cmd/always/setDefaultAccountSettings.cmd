
net accounts /forcelogoff:60 /minpwlen:8 /maxpwage:90 /minpwage:1 /lockoutthreshold:4 /lockoutwindow:4 /lockoutduration:4
call ../mangleNetUser.cmd
FOR /F "delims==" %%G IN (del2.txt) DO net user %%G Compl3xPassw0rd!
net user Guest /active:no

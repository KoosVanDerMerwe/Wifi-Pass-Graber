# Wifi-Pass-Graber

CAUTION, This is illegal to do on devices that you dont have access to. ONLY do this on devices that you have permissons to!

When you put the wifi-pass-grabber.txt file on the flipper zero and run it. It will go and download the wifi-pass-grabber.ps1 to the C:\Users\Public and automatically run it. Give it 5 seconds once powershell has closed. Then click the windows button and r to bring up windows run. Type in %Temp% and look for the file named "wifi-pass" this will contain the PC's saved wifi names and passwords.

NOTE: The wifi-pass-grabber.txt only works with newer powershell versions. If you want it to work on older versions. Change where it says "pwsh" at the start to "powershell".
e.g STRING powershell ....

I have noticed when using the flipper. It only works when the keyboard on the PC and flipper are both UK.

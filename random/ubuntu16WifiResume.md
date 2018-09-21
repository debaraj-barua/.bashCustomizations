
# Issue:

After waking up from suspend, the `network-manager` stops showing Wi-Fi networks, (although the Wi-Fi connection may still be active). 

![Wifi After resume](images/u16wifi.png)



# Solution

## Temporary workaround:
```bash
sudo service network-manager restart
```

## More permanent workaround

**Source:** https://askubuntu.com/a/761220/669558

```bash
sudo vim /etc/systemd/system/wifi-resume.service 
```

Now paste the below script in that file. 

```bash
#/etc/systemd/system/wifi-resume.service
#sudo systemctl enable wifi-resume.service
[Unit]
Description=Restart networkmanager at resume
After=suspend.target
After=hibernate.target
After=hybrid-sleep.target

[Service]
Type=oneshot
ExecStart=/bin/systemctl restart network-manager.service

[Install]
WantedBy=suspend.target
WantedBy=hibernate.target
WantedBy=hybrid-sleep.target
```
Now to activate it: 

```bash
sudo systemctl enable wifi-resume.service
```
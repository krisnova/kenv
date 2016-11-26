# Mac Address Spoofing

Particularly useful on airplanes

### 1) Connect to wifi network

### 2) After connected (but not authenticated) 

Find other devices on the network by looking in the arp table

```
arp -a
```

Most of these IP addresses are handed out via DHCP, so feel to try them all. On a particularly busy network you will find network devices (these are good) and network hardware (we don't care about these). Usually devices are in the middle of a range, while network hardware usually has the last octect ending in a `.1` or `.255` or `.254`. But really you just have to learn common network schemes to take educated guesses at what might be what.

The simplest answer is to just try them all.

EG:

```
172.19.2.67    # Probably a connected device
172.19.2.1     # Probably network hardware
192.168.0.255  # Probably network hardware
192.168.1.3    # Probably a connected device
10.100.100.100 # Probably network hardware
```


### Set new MAC address

After you find some devices you can `arp` with.. Lets try out some MAC addresses from what we hope are legitimate connected devices on the network. If the device you discovered has authenticated with the network, the network hardware typically will trust the MAC address associated with the device. We can trick the network into thinking we are ALSO the trusted device, and if all goes according to plan we should be able to browse the network as if we were the trusted device.

The syntax to set a MAC address on Mac Os X is as follows

```
sudo ifconfig en0 ether aa:bb:cc:dd:ee:ff
```

You should ALWAYS note your previous MAC address in case you need to back out at any time!

Note: If you are unsure where `en0` came from, it is the name of the network device we plan on hard coding our MAC address on. You can typically parse your network interfaces with the following command

```
ifconfig
```

Just look for an IP address in the output that matches the scheme you discovered with `arp -a` earlier. That is the address we would like to target.

### Lets see what happened!

```
ping 8.8.8.8      # Check if we can reach the internet by pinging Google's public DNS server
telnet 8.8.8.8 53 # Check if we can open up a socket to the DNS server on port 53
```

If both of these commands succeeded you should now have internet access!

Best practice dictates that you should first disable your wifi adapter BEFORE changing MAC addresses, enable and test, then disable again.

Also you must always reset your MAC when you are finished

### Resetting your MAC address

```
sudo ifconfig en0 ether b8:e8:56:37:d1:0a
```

### Reset your nic

```
ifconfig en0 down && ifconfig en0 up
```

Rinse and repeat until you can see the outside world :)



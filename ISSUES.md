
Fedora 20 VM NAT
 
     p2p1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
             inet 10.1.11.43  netmask 255.255.0.0  broadcast 10.1.255.255
             inet6 fe80::a00:27ff:fe46:cd7b  prefixlen 64  scopeid 0x20<link>
             ether 08:00:27:46:cd:7b  txqueuelen 1000  (Ethernet)
             RX packets 2887  bytes 474355 (463.2 KiB)
             RX errors 0  dropped 30  overruns 0  frame 0
             TX packets 161  bytes 14707 (14.3 KiB)
             TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

Vagrant Network Adapters.  VM with NAT

    eth0      Link encap:Ethernet  HWaddr 08:00:27:c1:f2:86  
              inet addr:10.0.2.15  Bcast:10.0.2.255  Mask:255.255.255.0
              inet6 addr: fe80::a00:27ff:fec1:f286/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:1151 errors:0 dropped:0 overruns:0 frame:0
              TX packets:947 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:107943 (105.4 KiB)  TX bytes:95672 (93.4 KiB)

    eth1      Link encap:Ethernet  HWaddr 08:00:27:ec:82:fe  
              inet addr:192.168.56.101  Bcast:192.168.56.255  Mask:255.255.255.0
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:0 errors:0 dropped:0 overruns:0 frame:0
              TX packets:7 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000 
              RX bytes:0 (0.0 B)  TX bytes:578 (578.0 B)
              
              
              
$ ping fischer.dev

    PING fischer.dev (192.168.56.101) 56(84) bytes of data.
    64 bytes from fischer.dev (192.168.56.101): icmp_seq=1 ttl=64 time=0.081 ms


$ wget fischer.dev

    --2014-11-17 12:43:39--  http://fischer.dev/
    Resolving fischer.dev (fischer.dev)... 192.168.56.101
    Connecting to fischer.dev (fischer.dev)|192.168.56.101|:80... failed: Connection refused.

# SSH to the vagrant box and pull fischer.dev
    $ vagrant ssh && wget fischer.dev
    --2014-11-17 17:47:01--  http://fischer.dev/
    Resolving fischer.dev (fischer.dev)... 127.0.0.1
    Connecting to fischer.dev (fischer.dev)|127.0.0.1|:80... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: http://fischer.dev/login [following]
    --2014-11-17 17:47:04--  http://fischer.dev/login
    Connecting to fischer.dev (fischer.dev)|127.0.0.1|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 1610 (1.6K) [text/html]
    Saving to: `index.html'
    
    100%[===========================================================================================================================================================================================>] 1,610       --.-K/s   in 0s      
    
    2014-11-17 17:47:09 (33.6 MB/s) - `index.html' saved [1610/1610]





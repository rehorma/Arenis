:global hotspotName "ad hotspot"
:global hotspotInterface "ether3"
:global hotspotPool "192.168.129.100-192.168.129.200"
:global hotspotIP "192.168.129.1"
:global trialUptime "10m/12h"



/ip address
:add address=($hotspotIP . "/24")  interface=$hotspotInterface

/ip pool
:local i [find name=($hotspotName . " DHCP pool")];:if ([:tostr $i]="") do={add name=($hotspotName . " DHCP pool")  ranges=$hotspotPool } 
set name=($hotspotName . " DHCP pool") ranges=$hotspotPool

/ip hotspot user profile
:local i [find name=($hotspotName . " user profile")];:if ([:tostr $i]="")  do={add name=($hotspotName . " user profile") }

/ip hotspot profile
:local i [find name=($hotspotName . " profile")];:if ([:tostr $i]="") do={add name=($hotspotName . " profile") }
set ($hotspotName . " profile") login-by="http-chap,trial" trial-uptime=$trialUptime trial-user-profile=($hotspotName . " user profile") hotspot-address=$hotspotIP

/ip hotspot
:local i [find name=($hotspotName)];:if ([:tostr $i]="") do={add name=$hotspotName interface=$hotspotInterface }
set ($hotspotName) interface=$hotspotInterface profile=($hotspotName . " profile") address-pool=($hotspotName . " DHCP pool") addresses-per-mac=1

/ip dhcp-server
:local i [find name=($hotspotName . " DHCP server")];:if ([:tostr $i]="") do={add name=($hotspotName . " DHCP server") interface=$hotspotInterface }
set ($hotspotName . " DHCP server") disabled=no address-pool=($hotspotName . " DHCP pool") lease-time="12h"
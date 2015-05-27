:global watchedIP "10.20.250.1"

:global ipLanIf "192.168.1.1"
:global maintPagePath "maintenance.html"
:global proxyPort "8080"
:global searchComment "maintenanceProxy"
 
/ip proxy 
set enabled=yes port=$proxyPort cache-on-disk=no

/ip proxy 
access add action=deny redirect-to=($ipLanIf . "/" . $maintPagePath)

/ip firewall nat 
add disabled=yes chain=dstnat protocol=tcp dst-port=80 action=redirect  to-ports=$proxyPort comment="$searchComment"

/ip dns static 
add disabled=yes name=".*" address=1.1.1.1 ttl=5s comment="$searchComment" 

/tool netwatch 
add host="$watchedIP" interval=5s up-script=hideMaint down-script=showMaint


/system script add name=hideMaint source="{/ip firewall nat disable [/ip firewall nat find comment=$searchComment]"; 
/ip dns static disable [/ip dns static find comment=$searchComment]}"
/system script add name=showMaint source="{/ip firewall nat enable [/ip firewall nat find comment=$searchComment]" ;
/ip dns static enable [/ip dns static find comment=$searchComment]}"
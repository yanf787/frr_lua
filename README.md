A very quick attempt to experiment with Lua and bgpd.conf set up to call a script

bgp_comm is the verification of being able to tranfer community into local preference.

first_test.lua is a debug example plus allow to see exactly what tables look like.

All print statements in Lua scripts are effectively messages in syslog, this making it easier to debug better than a route map.

More Lua stuff will go into the repository. 

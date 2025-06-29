# Packet Tracer Exercise

- [Packet Tracer Exercise](#packet-tracer-exercise)
  - [Network Setup](#network-setup)
  - [IP Address Configuration](#ip-address-configuration)
  - [DHCP Configuration on DNS Server](#dhcp-configuration-on-dns-server)
  - [Laptop receiving IP Address from DHCP Server](#laptop-receiving-ip-address-from-dhcp-server)
  - [Laptop receiving IP Address from Router](#laptop-receiving-ip-address-from-router)
  - [Pings to all devices from Laptop](#pings-to-all-devices-from-laptop)
  - [Troubleshooting](#troubleshooting)
  - [References](#references)

## Network Setup

![Image](https://github.com/user-attachments/assets/1a3ec5b8-93cb-4298-95ef-4f19cb0800a4)

## IP Address Configuration

|  Device | I.P Address  |
|---|---|
|  Router | 192.168.1.254  |
|  Server | 192.168.1.2  |
| PC | 192.168.1.11 (DHCP Assigned) |
| Laptop | 192.168.1.12 |

## DHCP Configuration on DNS Server

![Image](https://github.com/user-attachments/assets/a39418ca-82c9-4d35-af3e-9c9370c71b5a)

## Laptop receiving IP Address from DHCP Server

![Image](https://github.com/user-attachments/assets/87a0d8cd-b165-4945-984b-a1e3d4f3e238)

## Laptop receiving IP Address from Router

Once the DHCP server has been turned off on the DHCP server when we renew the IP Address it is able to pick up an ip address from the router successfully

![Image](https://github.com/user-attachments/assets/5f21cadb-e1a7-4310-b684-2788250521a0)

## Pings to all devices from Laptop

![Image](https://github.com/user-attachments/assets/9144420f-d7a1-4280-b317-9214cf0a8bf7)

## Troubleshooting

I had initially configured the DHCP server solely on the Server. I however wanted to use the router instead so tested this by shutting down the router interface to the switch.

Disabled IP lookup on the router using the command `no ip dns lookup`

## References

- [How To Configure DHCP Server On A Cisco Router](https://www.firewall.cx/cisco/cisco-routers/cisco-router-dhcp-config.html)
- [Configuring the Cisco IOS DHCP Server](https://www.cisco.com/en/US/docs/ios/12_4t/ip_addr/configuration/guide/htdhcpsv.html#wp1084769)
- [Configure SSH on Routers and Switches](https://www.cisco.com/c/en/us/support/docs/security-vpn/secure-shell-ssh/4145-ssh.html)
- [How to configure DHCP server in Packet Tracer](https://computernetworking747640215.wordpress.com/2018/07/05/how-to-configure-dhcp-server-in-packet-tracer/)
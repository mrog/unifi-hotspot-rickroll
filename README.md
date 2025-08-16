# unifi-hotspot-rickroll

A UniFi captive portal with a Rickroll

## Overview
UniFi access points provide great power.  With great power comes great ~~recreational opportunities~~ responsibility.  Don't you want to use that power to ~~flex~~ make the world better?  Free Wi-Fi makes the world better, right?  Even if the free Wi-Fi doesn't let people use the Internet, it's still technically free Wi-Fi.  So, *technically*, you can make the world better by Rickrolling your neighbors.

This project is a self-hosted captive portal based on [this awesome project](https://github.com/modem7/docker-rickroll).  It uses Nginx to host a static website with a fake login screen.  When the user clicks the button to log in, they get a special welcome video.

Why do through the trouble of adding a fake login?  It's important that the user clicks something on the page before the video plays.  Without a click, many browsers will refuse to play the video with sound.

Obviously, the portal doesn't actually authenticate users.  It's just not ~~a tool for grown-ups~~ that sophisticated.  The portal is just a simple static web page with a path that Unifi expects.

## Prerequisites
You need at least one UniFi access point.  If you didn't have one of those, you probably wouldn't be reading these instructions.

You need a server on your LAN that:
- can run Docker containers.
- has a static IP address.
- is reachable from your UniFi access point(s).

## Installation
You have a couple of installation options.  Once the service is running, go to the Unifi Configuration section.

### Clone Source and Run
1. Run `git clone https://github.com/mrog/unifi-hotspot-rickroll.git` to get the source code.
1. `cd unifi-hotspot-rickroll`
1. If you're on Linux, you can run these scripts:
   - `./start.sh` builds and starts the service.
   - `./stop.sh` stops the service.
   - `./upgrade.sh` rebuilds the service, then restarts it if it was running.
   - `./show_logs.sh` shows the service logs.

If you're on Linux, consider using a cron job to run `upgrade.sh` periodically so you always have the latest Nginx updates.  If you do this, you'll accumulate old Docker images that should be cleaned up occasionally using `docker image prune`.

### Docker Hub
You can use the [mrog1/unifi-hotspot-rickroll](https://hub.docker.com/r/mrog1/unifi-hotspot-rickroll) image from Docker Hub.  Make sure you map port 80 to container port 8080.  The simplest way to start it is to run `docker run -d -p 80:8080 mrog1/unifi-hotspot-rickroll`.

## UniFi Configuration
In your hotspot landing page settings:
- Authentication tab:
  - Select "External Portal Server" and enter your server's IP address.
- Settings tab:
  - Select "Show Landing Page"
  - Select "HTTPs Redirection Support"
  - The other checkboxes in this section should be unselected.

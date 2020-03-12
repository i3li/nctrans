# Description

Using `Netcat` to transfer files, between devices on the same network, using the HTTP protocol.

# Purpose

I initially wrote it for my personal use. I use it to quickly transfer files between my devices (e.g., from my laptop to my phone).

# Usage

Run the script and pass it a file or a directory. Then, use the browser of any device inside the same network to download the file. In the browser, type the sender device's IP address, followed by a : and the port number that the script is listening on (by default `9999`). For example, if the IP address is 192.168.1.2, you would type http://192.168.1.2:9999.

# Possible Enhancements

* Increasing portability

* The port number should be set dynamically (e.g., randomly assigned)

* `RESPONE_FILE` should not be fixed (to allow multiple runs of `nctrans`)

# Notes

- The script uses [Netcat](https://en.wikipedia.org/wiki/Netcat), so of course it needs to be installed :)

- I only tested it on macOS

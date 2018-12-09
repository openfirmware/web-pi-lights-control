# Systemd Auto-Start Script

This is a Systemd service for automatically running the web server when the Raspberry Pi boots and after the networking is started.

## Usage

1. Create `/lib/systemd/system/web-pi-lights-control.service` with the contents of the file with the same name in this directory.
2. Load the service into Systemd with `$ systemctl enable web-pi-lights-control.service`
3. Start the service: `$ systemctl start web-pi-lights-control.service`
4. Check the service status: `$ systemctl status web-pi-lights-control.service`

That *should* be it.

## Usage with System RVM

Same as above, except use `rvm-web-pi-lights-control.service` and edit it for your installed Ruby version.


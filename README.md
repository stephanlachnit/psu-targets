# psu-targets
This software adds two new system targets to systemd:
psu-adp.target and psu-bat.target

### How it works:
It adds a new event to [acpid](https://sourceforge.net/projects/acpid2/),
which will activate a script if there is a ACPI event dectect which involves an
externel power adapter. The script checks if there is an active external power
adapter by looking into all directories in ```/sys/class/power_supply``` which
begin with an 'A'. If there is a file called 'online' in one of the directories
which contains a '1', it starts ```psu-adp.target```, otherwise it starts
```psu-bat.target```. These targets won't be stopped until there is another
event which changes the active target.

This behaviour should work on most systems, because usually the name of the
power supply directory is something like 'ADP1' or 'AC'. If this isn't the case
with your setup, you can change psu-targets.sh accordingly.

You can check the logs with ```# journalctl -u psu-targets```.

### Installtion
You can use ```# make install``` to install all necesarry files. You also need
to restart ```acpid.servce``` and start ```psu-targets.service``` once if you
want to use the software immediately.

### Example:
```
[Unit]
Description=echo if on battery

[Service]
Type=oneshot
ExecStart=echo battery

[Install]
WantedBy=psu-bat.target
```

cold_start
==========

Build a base radiodan install from a clean raspbian distro.

How to use
----------

1. ssh into pi
2. `git clone https://github.com/radiodan/cold_start.git`
3. `cd ~/cold_start`
4. `sudo ./provision.sh`
5. Type 'Y' and 'Yes, do as I say' where appropriate
6. Run `sudo raspi-config` as usual to expand the filesystem etc.

Forcing yes
-----------

**This is dangerous, so be careful when using it.**

Running `provision.ssh` with the `--force-yes` flag will NOT ask you for permission before installing things. It's useful if you want to automate set-up.

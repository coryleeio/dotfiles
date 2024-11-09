#!/bin/sh

Shutdown_command="systemctl poweroff"
Reboot_command="systemctl reboot"
Logout_command="logout"
Hibernate_command="systemctl hibernate"
Suspend_command="systemctl suspend"

rofi_command="rofi -theme /home/marco/.config/wofi/launcherSmoll.rasi"
options=$'Shutdown\nLogout\nReboot\nHibernate\nSuspend' 

# ... because the essential options (-dmenu and -p) are added here
eval \$"$(echo "$options" | $rofi_command -dmenu -p "")_command"

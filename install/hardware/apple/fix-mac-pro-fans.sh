# Regulate the fans on a Mac Pro.
# The SMC leaves them at their minimum until the operating system asks for more,
# which macOS does and Linux does not, so the machine sits above 90 C under load
# and throttles. The service drives them from CPU and GPU temperature, and hands
# them back to the SMC if it is ever stopped.

if omarchy-hw-match MacPro && compgen -G "/sys/devices/platform/applesmc.*/fan1_output" >/dev/null; then
  sudo install -Dm644 "$OMARCHY_PATH/default/systemd/system/omarchy-mac-pro-fan-control.service" /etc/systemd/system/omarchy-mac-pro-fan-control.service
  sudo systemctl enable --now omarchy-mac-pro-fan-control.service
fi

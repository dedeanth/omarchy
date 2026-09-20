# Re-detect displays that amdgpu loses across suspend.
# Pre-Navi Radeon cards can resume without re-reading a connected display's
# EDID, which leaves the connector "disconnected" and the output gone until the
# user replugs the cable. The sleep hook re-probes only the connectors that were
# in use before suspending and that did not come back on their own.

if omarchy-hw-amdgpu; then
  sudo install -Dm755 "$OMARCHY_PATH/default/systemd/system-sleep/amdgpu-reprobe-connectors" /usr/lib/systemd/system-sleep/amdgpu-reprobe-connectors
fi

#!/bin/sh

# Check if the tunnel already exists
if ! cloudflared tunnel list | grep -q "$TUNNEL_NAME"; then
  # If the tunnel does not exist, create it
  cloudflared tunnel create "$TUNNEL_NAME"
fi

# Attempt to create new DNS record
cloudflared tunnel route dns "$TUNNEL_NAME" "$TUNNEL_HOSTNAME"

# Run the tunnel
cloudflared tunnel --loglevel debug --url "$TUNNEL_URL" run "$TUNNEL_NAME"

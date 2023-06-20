# seamless-cloudflared

An automated setup for Cloudflare's Argo Tunnel using Docker.
The repository contains scripts to seamlessly generate the necessary credentials
and run a dockerized Argo Tunnel for your projects.

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop) installed on your system.
- Access to a domain managed by Cloudflare (if not, please contact your system administrator).

### 1. Cloudflare Authorization

Run the following command:

```shell
sudo sh cloudflare-login.sh
```

A URL will be displayed.

1. Open this URL in a web browser. It will redirect you to the Cloudflare login page.
2. Log into your Cloudflare account.
3. You will be prompted to select a domain for tunneling setup.
4. Choose the domain you intend to use for your project.
   This will be part of the DOMAIN value in your .env file.

### 2. Creating .env File

```dotenv
DOMAIN=myproject.myteam.com
```

Replace `myteam.com` with the domain you selected during
the [Cloudflare authorization process](#1-cloudflare-authorization).

### In Case of Data Loss

If you lose the data stored in the `~/.cloudflared/`, which includes access credentials to your account and tunnels,
manual intervention is required. You'll have to remove the corresponding tunnel and DNS record from Cloudflare.

⚠️ **Warning:** Be cautious when deleting as this operation cannot be undone.

#### Deleting a Tunnel:

1. Log into your Cloudflare account.
2. Navigate to the "Zero Trust" from the sidebar menu.
3. Select "Access" from the sidebar menu.
4. Select "Tunnels" from the dropdown.
5. You'll see a list of your tunnels.
   Locate the one that matches the DOMAIN defined in your .env file and click "Delete".
6. Confirm the deletion.

#### Removing a DNS Record:

1. From the Cloudflare dashboard, select the domain associated with the tunnel.
2. Navigate to the "DNS" section.
3. You'll see a list of your DNS records.
   Identify the record that corresponds to your tunnel and click "Delete".
4. Confirm the deletion.

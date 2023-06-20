# seamless-cloudflared

An automated setup for Cloudflare's Argo Tunnel using Docker.
The repository contains scripts to seamlessly generate the necessary credentials
and run a dockerized Argo Tunnel for your projects.

________________________________________________________________________________________________________________________

## Cloudflare Setup & Domain Transfer

### 1. Cloudflare Setup

1. Register on [Cloudflare](https://www.cloudflare.com), and sign in to your account.
2. In the dashboard, click the `+Add a Site` button at the top.
3. Enter your domain name, then click `Add Site`.
4. Choose a plan (linking a bank card may be required), and proceed to setup.
5. Cloudflare will automatically scan and import your DNS records. Review and confirm them.

### 2. Domain Transfer

#### 2.1. Obtain Cloudflare Nameservers

1. After adding your site to Cloudflare, navigate to the `DNS` tab in your site's dashboard.
2. Here, you'll find your `Cloudflare Nameservers`. Note down the two nameservers listed.

#### 2.2. Update Nameservers at Your Domain Registrar

1. Log in to your domain registrar's control panel (the process varies depending on the registrar).
2. Locate the section to change your domain's nameservers
   (usually under `Domain Settings`, `DNS Management`, or similar).
3. Replace the existing nameservers with the two nameservers provided by Cloudflare.
4. Save the changes.

Note: After updating your nameservers, it may take up to 48 hours for the changes to propagate across the internet.
Cloudflare will send an email once the nameserver update is complete.
________________________________________________________________________________________________________________________

## Running Tunnel

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop) installed on your system.

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
   This will be part of the `DOMAIN` value in your `.env` file.

### 2. Creating `.env` File

```dotenv
DOMAIN=myproject.myteam.com
```

Replace `myteam.com` with the domain you selected during
the [Cloudflare authorization process](#1-cloudflare-authorization).

### 3. Running docker compose project

You can execute `example` run configuration from any JetBrains IDE or run the following command:

```shell
docker compose up --build --force-recreate
```

________________________________________________________________________________________________________________________

## In Case of Data Loss

If you lose the data stored in the `~/.cloudflared/`, which includes access credentials to your account and tunnels,
manual intervention is required. You'll have to remove the corresponding tunnel and DNS record from Cloudflare.

⚠️ **Warning:** Be cautious when deleting as this operation cannot be undone.

### 1. Deleting a Tunnel

1. Log into your Cloudflare account.
2. Navigate to the `Zero Trust` from the sidebar menu.
3. Select `Access` from the sidebar menu.
4. Select `Tunnels` from the dropdown.
5. You'll see a list of your tunnels.
   Locate the one that matches the DOMAIN defined in your .env file and click `Delete`.
6. Confirm the deletion.

### 2. Removing a DNS Record

1. From the Cloudflare dashboard, select the domain associated with the tunnel.
2. Navigate to the `DNS` section.
3. You'll see a list of your DNS records.
   Identify the record that corresponds to your tunnel and click `Delete`.
4. Confirm the deletion.

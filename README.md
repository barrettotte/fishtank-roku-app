# fishtank-roku-app

A basic Roku app for watching Fishtank.live on Roku (unofficial).

Shoutout to [agathanon](https://github.com/agathanon) for making the first Fishtank Roku repo, I'm glad I wasn't the only one with the idea.
Check agathanon's repo/app https://github.com/agathanon/fishtank-roku first because my repo/app was made for learning, fun, and primarily for myself.

## Setup

### Prerequisites

- Node.js 18+
- A Roku device on the same network as your dev machine

### Install

```bash
git clone https://github.com/your-username/fishtank-roku-app.git
cd fishtank-roku-app
npm install
cp .env.example .env
```

### Enable Developer Mode on your Roku

1. On your Roku remote, press: **Home Home Home Up Up Right Left Right Left Right**
2. Note the IP address shown on the Developer Settings screen
3. Enable the installer and set a password (the username is always `rokudev`)
4. Edit `.env` with your device IP and password:
   ```
   ROKU_DEV_TARGET=192.168.1.100
   ROKU_DEV_PASSWORD=password
   ```

### Build and Deploy

```sh
# Build and deploy
make deploy
```

This compiles the BrighterScript source and sideloads the app onto your Roku.

### Debugging

Connect to the BrightScript debug console via telnet:

```sh
make debug
```

All `print` statements in the code show up here.

### Other Commands

```sh
make lint     # run bslint
make test     # run unit tests
make debug    # open telnet debug console
make clean    # delete build output
```

## References

- [BrightScript language reference](https://developer.roku.com/docs/references/brightscript/language/brightscript-language-reference.md)
- [Roku Developer Portal](https://developer.roku.com/)
- [BrighterScript](https://github.com/rokucommunity/brighterscript)
- [roku-deploy](https://github.com/rokucommunity/roku-deploy)
- [BrightScript VS Code extension](https://marketplace.visualstudio.com/items?itemName=RokuCommunity.brightscript)

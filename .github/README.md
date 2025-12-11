# mbsync-alpine

[![GitHub Actions](https://github.com/Lanjelin/mbsync-alpine/actions/workflows/build-and-publish.yml/badge.svg)](https://github.com/Lanjelin/mbsync-alpine/actions/workflows/build-and-publish.yml)
![License](https://img.shields.io/badge/license-GPL--3.0--or--later-blue.svg)
![Image Size](https://ghcr-badge.egpl.dev/lanjelin/mbsync-alpine/size)
![Version](https://ghcr-badge.egpl.dev/lanjelin/mbsync-alpine/latest-version)

A lightweight Alpine-based container for **mbsync/isync**, automatically tracking the
latest `isync` version available in Alpine Linux.
Tagged according to the *exact* Alpine package version (e.g. `1.5.1-r0`).

---

## 🌱 Features

* Always installs the **exact** Alpine `isync` package version
* Auto-updated daily via GitHub Actions
* OCI-compliant metadata
* Ultra-minimal image based on Alpine 3.23
* Ready for drop-in IMAP → Maildir sync

---

## 🚀 Usage

```bash
docker run --rm \
  -v /path/to/mbsyncrc:/config/mbsyncrc \
  -v /path/to/maildir:/mail \
  ghcr.io/lanjelin/mbsync-alpine:latest
```

Runs the equivalent of:

```
mbsync -c /config/mbsyncrc -a
```

---

## 📁 Volumes

| Path      | Description            |
| --------- | ---------------------- |
| `/config` | Your `mbsyncrc` config |
| `/mail`   | Local Maildir storage  |

Example mount layout:

```
/config/mbsyncrc
/mail/INBOX/cur
/mail/INBOX/new
/mail/INBOX/tmp
```

---

## 📝 Example `mbsyncrc`

```ini
Sync Pull
Create Near
Expunge Near
SyncState *

IMAPAccount mailbox
Host imap.mailbox.org
User you@example.com
PassCmd "cat /run/secrets/mailbox_password"
TLSType STARTTLS
AuthMechs LOGIN

IMAPStore remote
Account mailbox

MaildirStore local
Path /mail/
Inbox /mail/INBOX
SubFolders Verbatim

Channel sync-all
Far :remote:
Near :local:
Patterns *
```

---

## 🏷️ Tags

| Tag        | Description                                             |
| ---------- | ------------------------------------------------------- |
| `latest`   | Most recent Alpine `isync` package                      |
| `1.5.x-rN` | Exact Alpine package version installed in the container |

---

## 📜 License

This project is licensed under **GPL-3.0-or-later**.
The underlying `isync` project is also GPLv3.

---

## 📦 Container Registry

Images are published to:

```
ghcr.io/lanjelin/mbsync-alpine
```


# FiveM Test Server — Build 3788

Server FiveM test ch?y artifact Windows build **31689** v?i game build GTA V **3788** (Patch 2026-1).

## Yêu c?u

- Windows 10/11 64-bit
- GTA V b?n quy?n (build 3788) cài qua Rockstar Launcher / Steam / Epic
- [FiveM Client](https://fivem.net) m?i nh?t

## Cài ð?t & Ch?y

`at
start.bat
`

Server ch?y t?i localhost:30120, LAN only.

## C?u h?nh

File server.cfg:

| Cài ð?t | Giá tr? |
|---------|--------|
| Port | 30120 |
| OneSync | On |
| Max Clients | 8 |
| Game Build | 3788 |
| License Key | *ð? ?n, t? ði?n* |

## Resources

| Resource | Mô t? |
|----------|-------|
| [carmod] | Xe ð?: AB, Demon AG, EX150 |
| chat | Chat NUI m?c ð?nh |
| Menu | Menu client (v3.5.0) |
| mapmanager | Qu?n l? map |
| spawnmanager | Qu?n l? spawn |
| sessionmanager | Qu?n l? session OneSync |
| hardcap | Gi?i h?n player |
| conlog | Log RCON |
| asic-gamemode | Gamemode cõ b?n (freeroam, PvP, xe) |

## Artifacts

- **Windows**: build 31689 — rtifact/windows/FXServer.exe
- **Linux**: build 31689 — rtifact/linux/run.sh
- T? ð?ng c?p nh?t qua GitHub Actions m?i 12h UTC

## GitHub Actions

Workflow .github/workflows/update_artifacts.yml t? ð?ng t?i artifact m?i nh?t t? FiveM API m?i ngày.
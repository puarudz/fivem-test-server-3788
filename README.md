# FiveM Test Server — Build 3788

Server FiveM test chạy artifact Windows build **31689** với game build GTA V **3788** (Patch 2026-1).

## Yêu cầu

- Windows 10/11 64-bit
- GTA V bản quyền (build 3788) cài qua Rockstar Launcher / Steam / Epic
- [FiveM Client](https://fivem.net) mới nhất

## Cài đặt & Chạy

`at
start.bat
`

Server chạy tại localhost:30120, LAN only.

## Cấu hình

File server.cfg:

| Cài đặt | Giá trị |
|---------|--------|
| Port | 30120 |
| OneSync | On |
| Max Clients | 8 |
| Game Build | 3788 |
| License Key | *đã ẩn, tự điền* |

## Resources

| Resource | Mô tả |
|----------|-------|
| [carmod] | Xe độ: AB, Demon AG, EX150 |
| carcommands | Lệnh: /car, /dv, /fix, /tpm |
| chat | Chat NUI mặc định |
| Menu | Menu client (v3.5.0) |
| mapmanager | Quản lý map |
| spawnmanager | Quản lý spawn |
| sessionmanager | Quản lý session OneSync |
| hardcap | Giới hạn player |
| conlog | Log RCON |
| asic-gamemode | Gamemode cơ bản (freeroam, PvP, xe) |

## Artifacts

- **Windows**: build 31689 — rtifact/windows/FXServer.exe
- **Linux**: build 31689 — rtifact/linux/run.sh
- Tự động cập nhật qua GitHub Actions mỗi 12h UTC

## GitHub Actions

Workflow .github/workflows/update_artifacts.yml tự động tải artifact mới nhất từ FiveM API mỗi ngày.
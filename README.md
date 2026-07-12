# FiveM Test Server — Build 3788 / Máy chủ FiveM Test — Build 3788

**EN** | FiveM test server running Windows artifact build **31689** with GTA V game build **3788** (Patch 2026-1).  
**VI** | Máy chủ FiveM test chạy artifact Windows build **31689** với game build GTA V **3788** (Patch 2026-1).

---

## Requirements / Yêu cầu

- Windows 10/11 64-bit
- GTA V (build 3788) via Rockstar Launcher / Steam / Epic
- [FiveM Client](https://fivem.net) latest / mới nhất

## Install & Run / Cài đặt & Chạy

```bat
start.bat
```

Server runs at / chạy tại `localhost:30120`, LAN only.

## Configuration / Cấu hình

File `server.cfg` (rename from `server.cfg.example`):

| Setting / Cài đặt | Value / Giá trị |
|-------------------|-----------------|
| Port | 30120 |
| OneSync | On |
| Max Clients | 8 |
| Game Build | 3788 |
| License Key | *hidden, fill in / đã ẩn, tự điền* |

## Resources / Tài nguyên

| Resource | Description / Mô tả |
|----------|---------------------|
| `[carmod]` | Car mods / Xe độ: AB, Demon AG, EX150 |
| `carcommands` | Chat commands / Lệnh: `/car`, `/dv`, `/fix`, `/tpm` |
| `chat` | Chat NUI with Vietnamese support / Chat NUI hỗ trợ Tiếng Việt |
| `vMenu` | Menu client **v3.8.22** (latest) |
| `loadingscreen` | Samael City loading screen / Màn hình tải |
| `mapmanager` | Map manager / Quản lý map |
| `spawnmanager` | Spawn manager / Quản lý spawn |
| `sessionmanager` | OneSync session manager |
| `hardcap` | Player limit / Giới hạn người chơi |
| `rconlog` | RCON logger |
| `basic-gamemode` | Basic gamemode / Gamemode cơ bản (freeroam, PvP, vehicles) |

## Artifacts

- **Windows**: build `31689` — `artifact/windows/FXServer.exe`
- **Linux**: build `31689` — `artifact/linux/run.sh`
- Auto-updated via GitHub Actions every 12h / Tự động cập nhật qua GitHub Actions mỗi 12h

## Notes / Ghi chú

- `server.cfg` is gitignored to protect license key. Copy from `server.cfg.example` and fill in your key.
- `server.cfg` đã được gitignore để bảo vệ key. Copy từ `server.cfg.example` và điền key của bạn.
- Chat uses Google Fonts Noto Sans for full Vietnamese Unicode support.
- Chat sử dụng Google Fonts Noto Sans để hỗ trợ đầy đủ Tiếng Việt có dấu.
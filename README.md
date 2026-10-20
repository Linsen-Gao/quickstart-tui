# Quickstart TUI for OpenWrt (Install X86 Only)
# OpenWrt 专用的 Quickstart TUI (仅保留 Install X86)

## 📖 Overview / 项目简介

English:
This repository contains a customized OpenWrt package for the iStoreOS quickstart TUI. It is heavily stripped down to keep only the "Install X86" function, completely removing all web UI components, homepages, and network wizards. It is designed to be a lightweight, out-of-the-box tool to write OpenWrt to a local x86 hard drive.

中文:
本仓库包含一个基于 iStoreOS quickstart 深度定制的 OpenWrt 软件包。我们将其进行了极简裁剪，仅保留了“Install X86（安装到 x86 硬盘）”功能，彻底移除了所有 Web UI 前端、主页和网络向导。它是一个轻量级、开箱即用的工具，专门用于将 OpenWrt 写入本地 x86 硬盘。

---

## ✨ Features / 主要特性

- Minimalist Menu / 极简菜单: Only 3、Install X86 and q、QUIT are kept in the terminal UI. (终端菜单仅保留安装和退出选项)
- No Web Dependencies / 无 Web 依赖: Removes all LuCI and web static files. (移除了所有 LuCI 和网页静态文件)
- VMware/ESXi Compatible / 虚拟机兼容: Fixed the "root not found" bug caused by virtual disks lacking a 3rd partition. Now supports both 2-partition and 3-partition images. (修复了因虚拟磁盘缺少第3个分区导致的 root not found 错误，完美兼容双分区镜像)
- Auto Dependencies / 自动依赖: Integrates essential tools (bash, parted, lsblk, e2fsprogs, block-mount, kmod-fs-ext4) directly into the Makefile. (在 Makefile 中集成了所有必需的依赖工具)

---

## 🛠️ Build Instructions / 编译指南

English:

1. Add this repository to your feeds.conf.default:

   src-git quickstart_tui https://github.com/Linsen-Gao/quickstart-tui.git;main

2. Update and install the feeds:

   ./scripts/feeds update quickstart_tui
   ./scripts/feeds install -a -p quickstart_tui

3. Select the package in menuconfig:
   Navigate to Utilities -> <*> quickstart-tui

4. Compile the firmware:

   make -j$(nproc) V=s

中文:

1. 将本仓库添加到 feeds.conf.default 文件中：

   src-git quickstart_tui https://github.com/Linsen-Gao/quickstart-tui.git;main

2. 更新并安装 feed：

   ./scripts/feeds update quickstart_tui
   ./scripts/feeds install -a -p quickstart_tui

3. 在 menuconfig 中选中该包：
   进入 Utilities -> <*> quickstart-tui

4. 编译固件：

   make -j$(nproc) V=s

---

## 🚀 Usage / 使用方法

1. Boot your OpenWrt system (from a USB drive or VMDK).
   (启动你的 OpenWrt 系统，可通过 U 盘或 VMDK 启动)

2. SSH or use the console to run:
   (SSH 登录或使用控制台运行：)

   quickstart

3. Select 3、Install X86 and follow the prompts to choose your target disk.
   (选择 3、Install X86，按照提示选择目标磁盘。)
   WARNING: All data on the target disk will be erased.
   (警告：目标磁盘上的所有数据将被清空。)

4. Reboot and change the boot order to the new disk.
   (重启系统，并在 BIOS/虚拟机设置中修改启动顺序，从新硬盘启动)

---

## ⚠️ Notice / 注意事项

- Disk Size: The target disk must be larger than 2.5 GiB.
  (目标磁盘容量必须大于 2.5 GiB)
- Virtual Machine: Please ensure the VM has at least 2 CPU cores and the correct boot mode (BIOS/UEFI) is selected to prevent kernel panic on boot.
  (在虚拟机中，请确保分配至少 2 个 CPU 核心，并选择正确的引导模式 BIOS/UEFI，以防内核崩溃无限重启)

---
Based on iStoreOS quickstart. Licensed under the original open-source license.

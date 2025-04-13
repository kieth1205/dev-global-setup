# Global Development Environment Setup / Thiết lập Môi trường Phát triển Toàn cầu

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![GitHub issues](https://img.shields.io/github/issues/kieth1205/dev-global-setup)](https://github.com/kieth1205/dev-global-setup/issues)
[![Tests](https://github.com/kieth1205/dev-global-setup/actions/workflows/tests.yml/badge.svg)](https://github.com/kieth1205/dev-global-setup/actions/workflows/tests.yml)
[![Security](https://github.com/kieth1205/dev-global-setup/actions/workflows/security.yml/badge.svg)](https://github.com/kieth1205/dev-global-setup/actions/workflows/security.yml)

[Tiếng Việt](#tiếng-việt) | [English](#english)

---

# Tiếng Việt

## Mục lục

- [Tổng quan](#tổng-quan)
- [Tính năng](#tính-năng)
- [Cài đặt](#cài-đặt)
- [Cách sử dụng](#cách-sử-dụng)
- [Thiết lập theo Hệ điều hành](#thiết-lập-theo-hệ-điều-hành)
- [Khắc phục sự cố](#khắc-phục-sự-cố)
- [Đóng góp](#đóng-góp)
- [Báo cáo lỗi](#báo-cáo-lỗi)
- [Giấy phép](#giấy-phép)

## Tổng quan

Dự án này cung cấp một cách đơn giản để thiết lập môi trường phát triển trên các hệ điều hành khác nhau (macOS, Linux và Windows). Nó bao gồm hỗ trợ cho nhiều loại phát triển, ngôn ngữ lập trình và công cụ.

## Tính năng

- Hỗ trợ đa ngôn ngữ (Tiếng Anh và Tiếng Việt)
- Tương thích đa nền tảng (macOS, Linux, Windows)
- Cấu hình môi trường tự động
- Hỗ trợ nhiều loại phát triển:
  - Phát triển Web
  - Phát triển Mobile
  - Phát triển Backend
  - DevOps
  - Khoa học dữ liệu & AI
  - Phát triển Game
  - Hệ thống nhúng
- Lựa chọn công cụ toàn diện
- Theo dõi tiến trình và cập nhật trạng thái
- Xử lý lỗi và kiểm tra tính hợp lệ
- Hỗ trợ backup và restore
- Kiểm tra bảo mật
- Hệ thống logging chi tiết
- Unit tests và integration tests

## Cài đặt

### Yêu cầu

- Git
- Bash shell
- Quyền sudo/administrator

### Cài đặt nhanh

#### Windows (PowerShell)

```powershell
# Sử dụng Invoke-WebRequest (irm)
irm https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/windows_irm.ps1 | iex

# Hoặc tải về và chạy
curl -o setup.ps1 https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/windows_irm.ps1
.\setup.ps1
```

#### macOS

```bash
# Sử dụng curl
curl -sSL https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/macos_curl.sh | bash

# Hoặc tải về và chạy
curl -o setup.sh https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/macos_curl.sh
chmod +x setup.sh
./setup.sh
```

#### Linux

```bash
# Sử dụng curl
curl -sSL https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/linux_curl.sh | bash

# Hoặc tải về và chạy
curl -o setup.sh https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/linux_curl.sh
chmod +x setup.sh
./setup.sh
```

### Cài đặt thủ công

```bash
# Clone repository
git clone https://github.com/kieth1205/dev-global-setup.git
cd dev-global-setup

# Chạy script cài đặt
./global_setup_dev.sh
```

## Cách sử dụng

1. Chọn ngôn ngữ (Tiếng Anh/Tiếng Việt)
2. Chọn hệ điều hành
3. Chọn loại phát triển
4. Chọn ngôn ngữ lập trình
5. Chọn công cụ phát triển
6. Theo dõi tiến trình cài đặt

## Thiết lập theo Hệ điều hành

### macOS

```bash
./macos_setup.sh
```

### Linux

```bash
./linux_setup.sh
```

### Windows

```bash
./windows_setup.sh
```

## Khắc phục sự cố

### Kiểm tra logs

```bash
cat ~/.config/dev-setup/logs/setup_*.log
```

### Backup và Restore

```bash
# Tạo backup
./scripts/backup.sh

# Restore từ backup
./scripts/restore.sh <backup_file>
```

### Kiểm tra bảo mật

```bash
./scripts/security_check.sh
```

## Đóng góp

1. Fork repository
2. Tạo branch mới (`git checkout -b feature/amazing-feature`)
3. Commit changes (`git commit -m 'Add some amazing feature'`)
4. Push to branch (`git push origin feature/amazing-feature`)
5. Mở Pull Request

## Báo cáo lỗi

Vui lòng sử dụng [GitHub Issues](https://github.com/kieth1205/dev-global-setup/issues) để báo cáo lỗi.

## Giấy phép

Dự án này được cấp phép theo giấy phép MIT - xem file [LICENSE](LICENSE) để biết thêm chi tiết.

---

# English

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [OS-specific Setup](#os-specific-setup)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [Reporting Issues](#reporting-issues)
- [License](#license)

## Overview

This project provides a simple way to set up a development environment on different operating systems (macOS, Linux, and Windows). It includes support for various development types, programming languages, and tools.

## Features

- Multi-language support (English and Vietnamese)
- Cross-platform compatibility (macOS, Linux, Windows)
- Automatic environment configuration
- Support for various development types:
  - Web Development
  - Mobile Development
  - Backend Development
  - DevOps
  - Data Science & AI
  - Game Development
  - Embedded Systems
- Comprehensive tool selection
- Progress tracking and status updates
- Error handling and validation
- Backup and restore support
- Security checks
- Detailed logging system
- Unit tests and integration tests

## Installation

### Requirements

- Git
- Bash shell
- Sudo/administrator privileges

### Quick Installation

#### Windows (PowerShell)

```powershell
# Using Invoke-WebRequest (irm)
irm https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/windows_irm.ps1 | iex

# Or download and run
curl -o setup.ps1 https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/windows_irm.ps1
.\setup.ps1
```

#### macOS

```bash
# Using curl
curl -sSL https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/macos_curl.sh | bash

# Or download and run
curl -o setup.sh https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/macos_curl.sh
chmod +x setup.sh
./setup.sh
```

#### Linux

```bash
# Using curl
curl -sSL https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/linux_curl.sh | bash

# Or download and run
curl -o setup.sh https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/scripts/linux_curl.sh
chmod +x setup.sh
./setup.sh
```

### Manual Installation

```bash
# Clone repository
git clone https://github.com/kieth1205/dev-global-setup.git
cd dev-global-setup

# Run installation script
./global_setup_dev.sh
```

## Usage

1. Select language (English/Vietnamese)
2. Select operating system
3. Select development type
4. Select programming languages
5. Select development tools
6. Monitor installation progress

## OS-specific Setup

### macOS

```bash
./macos_setup.sh
```

### Linux

```bash
./linux_setup.sh
```

### Windows

```bash
./windows_setup.sh
```

## Troubleshooting

### Check Logs

```bash
cat ~/.config/dev-setup/logs/setup_*.log
```

### Backup and Restore

```bash
# Create backup
./scripts/backup.sh

# Restore from backup
./scripts/restore.sh <backup_file>
```

### Security Check

```bash
./scripts/security_check.sh
```

## Development

### Branch Strategy

- `main`: Production releases
- `build-release`: Release candidates
- `debug`: Development and testing

### CI/CD Pipeline

The project uses GitHub Actions for continuous integration and deployment:

1. **Test**: Runs on all supported operating systems
2. **Build**: Creates distributable artifacts
3. **Deploy**:
   - Deploys to GitHub Pages
   - Creates releases and tags
   - Version format: YYYY.MM.DD.HHMM

### Versioning

- Production: `YYYY.MM.DD.HHMM` (e.g., 2024.03.15.1430)
- Release Candidate: `YYYY.MM.DD.HHMM-rc` (e.g., 2024.03.15.1430-rc)

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Reporting Issues

Please use [GitHub Issues](https://github.com/kieth1205/dev-global-setup/issues) to report issues.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

# Global Development Environment Setup

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![GitHub Issues](https://img.shields.io/github/issues/kieth1205/dev-global-setup)](https://github.com/kieth1205/dev-global-setup/issues)
[![GitHub Stars](https://img.shields.io/github/stars/kieth1205/dev-global-setup)](https://github.com/kieth1205/dev-global-setup/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/kieth1205/dev-global-setup)](https://github.com/kieth1205/dev-global-setup/network/members)

## Mục lục

- [Tiếng Việt](#tiếng-việt)
  - [Tổng quan](#tổng-quan)
  - [Tính năng](#tính-năng)
  - [Cài đặt](#cài-đặt)
  - [Sử dụng](#sử-dụng)
  - [Đóng góp](#đóng-góp)
  - [Báo cáo lỗi](#báo-cáo-lỗi)
  - [Giấy phép](#giấy-phép)
  - [Khắc phục sự cố](#khắc-phục-sự-cố)
- [English](#english)
  - [Overview](#overview)
  - [Features](#features)
  - [Installation](#installation)
  - [Usage](#usage)
  - [Contributing](#contributing)
  - [Bug Reports](#bug-reports)
  - [License](#license)
  - [Troubleshooting](#troubleshooting)

# Tiếng Việt

## Tổng quan

Một script cài đặt môi trường phát triển toàn diện giúp bạn cấu hình hệ thống cho nhiều loại phát triển khác nhau bao gồm web, mobile, backend, DevOps, khoa học dữ liệu, phát triển game và hệ thống nhúng.

## Tính năng

- 🚀 Hỗ trợ đa ngôn ngữ (Tiếng Anh/Tiếng Việt)
- 💻 Tương thích đa nền tảng (macOS, Linux, Windows)
- 🛠️ Lựa chọn công cụ toàn diện
- 📦 Tích hợp trình quản lý gói
- 🔧 Cấu hình môi trường tự động
- 🎯 Thiết lập theo loại phát triển
- 🔄 Tích hợp kiểm soát phiên bản
- 🧪 Thiết lập môi trường kiểm thử
- 🔍 Cấu hình công cụ gỡ lỗi

## Cài đặt

1. Clone repository:

```bash
git clone https://github.com/kieth1205/dev-global-setup.git
cd dev-global-setup
```

2. Cấp quyền thực thi cho script:

```bash
chmod +x global_setup_dev.sh
```

3. Chạy script cài đặt:

```bash
./global_setup_dev.sh
```

## Sử dụng

Script sẽ hướng dẫn bạn qua các bước:

1. Chọn ngôn ngữ
2. Chọn hệ điều hành
3. Chọn loại phát triển
4. Chọn ngôn ngữ lập trình
5. Chọn công cụ
6. Quá trình cài đặt

## Đóng góp

Chúng tôi hoan nghênh mọi đóng góp! Vui lòng làm theo các bước sau:

1. Fork repository
2. Tạo nhánh tính năng (`git checkout -b feature/TínhNăngMới`)
3. Commit thay đổi (`git commit -m 'Thêm TínhNăngMới'`)
4. Push lên nhánh (`git push origin feature/TínhNăngMới`)
5. Mở Pull Request

## Báo cáo lỗi

Tìm thấy lỗi? Vui lòng giúp chúng tôi bằng cách gửi báo cáo lỗi:

1. Truy cập trang [Issues](https://github.com/kieth1205/dev-global-setup/issues)
2. Nhấp "New Issue"
3. Chọn mẫu "Bug Report"
4. Điền thông tin cần thiết:
   - Mô tả lỗi
   - Các bước tái hiện lỗi
   - Hành vi mong đợi
   - Hành vi thực tế
   - Ảnh chụp màn hình (nếu có)
   - Chi tiết môi trường

## Giấy phép

Dự án này được cấp phép theo MIT License - xem file [LICENSE](LICENSE) để biết chi tiết.

## Khắc phục sự cố

### Các vấn đề thường gặp

1. **Lỗi Permission Denied**

   ```bash
   chmod +x global_setup_dev.sh
   ```

2. **Vấn đề cài đặt Node.js**

   - Windows: Chạy PowerShell với quyền Administrator
   - Linux: Sử dụng `sudo`
   - macOS: Kiểm tra cài đặt Homebrew

3. **Biến môi trường Java**

   - Kiểm tra JAVA_HOME được cấu hình đúng
   - Xác nhận PATH bao gồm thư mục bin của Java
   - Khởi động lại terminal sau khi cài đặt

4. **Xung đột trình quản lý gói**
   - Xóa cache npm: `npm cache clean --force`
   - Xóa node_modules: `rm -rf node_modules`
   - Cài đặt lại gói: `pnpm install`

### Hỗ trợ

Để được hỗ trợ thêm:

- Tham gia [Cộng đồng Discord](https://discord.gg/your-server)
- Tìm kiếm [các vấn đề hiện có](https://github.com/kieth1205/dev-global-setup/issues)

# English

## Overview

A comprehensive development environment setup script that helps you configure your system for various types of development including web, mobile, backend, DevOps, data science, game development, and embedded systems.

## Features

- 🚀 Multi-language support (English/Vietnamese)
- 💻 Cross-platform compatibility (macOS, Linux, Windows)
- 🛠️ Comprehensive tool selection
- 📦 Package manager integration
- 🔧 Automated environment configuration
- 🎯 Development type-specific setups
- 🔄 Version control integration
- 🧪 Testing environment setup
- 🔍 Debugging tools configuration

## Installation

1. Clone the repository:

```bash
git clone https://github.com/kieth1205/dev-global-setup.git
cd dev-global-setup
```

2. Make the script executable:

```bash
chmod +x global_setup_dev.sh
```

3. Run the setup script:

```bash
./global_setup_dev.sh
```

## Usage

The script will guide you through:

1. Language selection
2. Operating system selection
3. Development type selection
4. Programming language selection
5. Tool selection
6. Installation process

## Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## Bug Reports

Found a bug? Please help us by submitting a bug report:

1. Go to the [Issues](https://github.com/kieth1205/dev-global-setup/issues) page
2. Click "New Issue"
3. Select "Bug Report" template
4. Fill in the required information:
   - Description of the bug
   - Steps to reproduce
   - Expected behavior
   - Actual behavior
   - Screenshots (if applicable)
   - Environment details

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Troubleshooting

### Common Issues

1. **Permission Denied Error**

   ```bash
   chmod +x global_setup_dev.sh
   ```

2. **Node.js Installation Issues**

   - Windows: Run PowerShell as Administrator
   - Linux: Use `sudo`
   - macOS: Check Homebrew installation

3. **Java Environment Variables**

   - Check JAVA_HOME is set correctly
   - Verify PATH includes Java bin directory
   - Restart terminal after installation

4. **Package Manager Conflicts**
   - Clear npm cache: `npm cache clean --force`
   - Remove node_modules: `rm -rf node_modules`
   - Reinstall packages: `pnpm install`

### Support

For additional help:

- Check [FAQ](docs/FAQ.md)
- Join our [Discord Community](https://discord.gg/your-server)
- Search [existing issues](https://github.com/kieth1205/dev-global-setup/issues)

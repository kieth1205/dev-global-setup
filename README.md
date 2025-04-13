# Global Development Environment Setup

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![GitHub issues](https://img.shields.io/github/issues/kieth1205/dev-global-setup)](https://github.com/kieth1205/dev-global-setup/issues)

A comprehensive development environment setup script that supports multiple operating systems and development types.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [OS-Specific Setup](#os-specific-setup)
- [Troubleshooting](#troubleshooting)
- [Contributing](#contributing)
- [Bug Reports](#bug-reports)
- [License](#license)

## Overview

This project provides a streamlined way to set up a development environment across different operating systems (macOS, Linux, and Windows). It includes support for various development types, programming languages, and tools.

## Features

- Multi-language support (English and Vietnamese)
- Cross-platform compatibility (macOS, Linux, Windows)
- Automated environment configuration
- Support for multiple development types:
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

## Installation

### Prerequisites

- Git
- Shell access (Bash, Zsh, or PowerShell)
- Administrative privileges (for package installation)

### Quick Start

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

## OS-Specific Setup

For a more streamlined setup process, you can use the OS-specific scripts:

### macOS

```bash
curl -s https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/macos_setup.sh | bash
```

### Linux

```bash
curl -s https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/linux_setup.sh | bash
```

### Windows

```bash
curl -s https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/windows_setup.sh | bash
```

## Usage

The script will guide you through the following steps:

1. Language selection (English/Vietnamese)
2. Operating system selection
3. Development type selection
4. Programming language selection
5. Tool selection

Each step includes detailed prompts and progress indicators.

## Troubleshooting

### Common Issues

1. **Permission Denied Error**

   - Solution: Run the script with sudo or ensure proper file permissions

   ```bash
   sudo chmod +x global_setup_dev.sh
   ```

2. **Node.js Installation Issues**

   - macOS: Use Homebrew to install Node.js
   - Linux: Use the official NodeSource repository
   - Windows: Use Chocolatey or the official installer

3. **Java Environment Variables**

   - Ensure JAVA_HOME is set correctly
   - Add Java bin directory to PATH
   - Restart terminal after installation

4. **Package Manager Conflicts**
   - Use the recommended package manager for your OS
   - Avoid mixing package managers when possible
   - Clear package manager caches if needed

### Support

- Check the [FAQ](docs/FAQ.md) for common questions
- Join our [Discord community](https://discord.gg/your-community)
- Search for existing issues before creating a new one

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines.

## Bug Reports

Please use the [bug report template](.github/ISSUE_TEMPLATE/bug_report.md) when reporting issues.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

# Thiết lập Môi trường Phát triển Toàn cầu

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
[![GitHub issues](https://img.shields.io/github/issues/kieth1205/dev-global-setup)](https://github.com/kieth1205/dev-global-setup/issues)

Một script thiết lập môi trường phát triển toàn diện hỗ trợ nhiều hệ điều hành và loại phát triển khác nhau.

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

## Cài đặt

### Yêu cầu

- Git
- Truy cập Shell (Bash, Zsh hoặc PowerShell)
- Quyền quản trị (để cài đặt gói)

### Bắt đầu nhanh

1. Sao chép kho lưu trữ:

```bash
git clone https://github.com/kieth1205/dev-global-setup.git
cd dev-global-setup
```

2. Tạo quyền thực thi cho script:

```bash
chmod +x global_setup_dev.sh
```

3. Chạy script thiết lập:

```bash
./global_setup_dev.sh
```

## Thiết lập theo Hệ điều hành

Để quá trình thiết lập đơn giản hơn, bạn có thể sử dụng các script dành riêng cho từng hệ điều hành:

### macOS

```bash
curl -s https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/macos_setup.sh | bash
```

### Linux

```bash
curl -s https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/linux_setup.sh | bash
```

### Windows

```bash
curl -s https://raw.githubusercontent.com/kieth1205/dev-global-setup/main/windows_setup.sh | bash
```

## Cách sử dụng

Script sẽ hướng dẫn bạn qua các bước sau:

1. Chọn ngôn ngữ (Tiếng Anh/Tiếng Việt)
2. Chọn hệ điều hành
3. Chọn loại phát triển
4. Chọn ngôn ngữ lập trình
5. Chọn công cụ

Mỗi bước đều có hướng dẫn chi tiết và chỉ báo tiến trình.

## Khắc phục sự cố

### Các vấn đề thường gặp

1. **Lỗi Quyền truy cập bị từ chối**

   - Giải pháp: Chạy script với sudo hoặc đảm bảo quyền truy cập file phù hợp

   ```bash
   sudo chmod +x global_setup_dev.sh
   ```

2. **Vấn đề cài đặt Node.js**

   - macOS: Sử dụng Homebrew để cài đặt Node.js
   - Linux: Sử dụng kho lưu trữ NodeSource chính thức
   - Windows: Sử dụng Chocolatey hoặc trình cài đặt chính thức

3. **Biến môi trường Java**

   - Đảm bảo JAVA_HOME được thiết lập đúng
   - Thêm thư mục bin của Java vào PATH
   - Khởi động lại terminal sau khi cài đặt

4. **Xung đột Trình quản lý gói**
   - Sử dụng trình quản lý gói được khuyến nghị cho hệ điều hành của bạn
   - Tránh trộn lẫn các trình quản lý gói khi có thể
   - Xóa bộ nhớ cache của trình quản lý gói nếu cần

### Hỗ trợ

- Kiểm tra [FAQ](docs/FAQ.md) cho các câu hỏi thường gặp
- Tham gia [cộng đồng Discord](https://discord.gg/your-community) của chúng tôi
- Tìm kiếm các vấn đề hiện có trước khi tạo mới

## Đóng góp

1. Fork kho lưu trữ
2. Tạo nhánh tính năng của bạn (`git checkout -b feature/TínhNăngTuyệtVời`)
3. Commit các thay đổi của bạn (`git commit -m 'Thêm một Tính năng Tuyệt vời'`)
4. Đẩy lên nhánh (`git push origin feature/TínhNăngTuyệtVời`)
5. Mở một Pull Request

Xem [CONTRIBUTING.md](CONTRIBUTING.md) để biết hướng dẫn chi tiết.

## Báo cáo lỗi

Vui lòng sử dụng [mẫu báo cáo lỗi](.github/ISSUE_TEMPLATE/bug_report.md) khi báo cáo vấn đề.

## Giấy phép

Dự án này được cấp phép theo Giấy phép MIT - xem tệp [LICENSE](LICENSE) để biết chi tiết.

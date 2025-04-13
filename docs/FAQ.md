# Frequently Asked Questions

## English

### General Questions

**Q: What operating systems are supported?**
A: The script supports macOS, Linux, and Windows operating systems.

**Q: Do I need administrative privileges to run the script?**
A: Yes, some installations require administrative privileges. On Windows, run PowerShell as Administrator. On Linux/macOS, you may need to use `sudo` for certain commands.

**Q: Can I customize the installation?**
A: Yes, the script provides interactive menus to select specific tools and configurations based on your needs.

### Installation Issues

**Q: The script fails with "Permission Denied" error.**
A: Make the script executable with `chmod +x global_setup_dev.sh`

**Q: Node.js installation fails.**
A:

- Windows: Run PowerShell as Administrator
- Linux: Use `sudo apt-get update` before installation
- macOS: Ensure Homebrew is properly installed

**Q: Java environment variables are not set correctly.**
A:

1. Check JAVA_HOME is set correctly
2. Verify PATH includes Java bin directory
3. Restart your terminal
4. Run `java -version` to verify

### Tool-Specific Questions

**Q: How do I update installed tools?**
A: Use the respective package managers:

- npm: `npm update -g`
- pnpm: `pnpm update -g`
- Homebrew: `brew update && brew upgrade`
- Chocolatey: `choco upgrade all`

**Q: Can I use multiple package managers?**
A: Yes, but it's recommended to stick to one primary package manager to avoid conflicts.

## Tiếng Việt

### Câu hỏi chung

**H: Hệ điều hành nào được hỗ trợ?**
Đ: Script hỗ trợ các hệ điều hành macOS, Linux và Windows.

**H: Tôi có cần quyền quản trị để chạy script không?**
Đ: Có, một số cài đặt yêu cầu quyền quản trị. Trên Windows, chạy PowerShell với quyền Administrator. Trên Linux/macOS, bạn có thể cần sử dụng `sudo` cho một số lệnh.

**H: Tôi có thể tùy chỉnh cài đặt không?**
Đ: Có, script cung cấp menu tương tác để chọn các công cụ và cấu hình cụ thể dựa trên nhu cầu của bạn.

### Vấn đề cài đặt

**H: Script báo lỗi "Permission Denied".**
Đ: Cấp quyền thực thi cho script bằng lệnh `chmod +x global_setup_dev.sh`

**H: Cài đặt Node.js thất bại.**
Đ:

- Windows: Chạy PowerShell với quyền Administrator
- Linux: Sử dụng `sudo apt-get update` trước khi cài đặt
- macOS: Đảm bảo Homebrew đã được cài đặt đúng cách

**H: Biến môi trường Java không được cấu hình đúng.**
Đ:

1. Kiểm tra JAVA_HOME được cấu hình đúng
2. Xác nhận PATH bao gồm thư mục bin của Java
3. Khởi động lại terminal
4. Chạy `java -version` để kiểm tra

### Câu hỏi về công cụ

**H: Làm thế nào để cập nhật các công cụ đã cài đặt?**
Đ: Sử dụng trình quản lý gói tương ứng:

- npm: `npm update -g`
- pnpm: `pnpm update -g`
- Homebrew: `brew update && brew upgrade`
- Chocolatey: `choco upgrade all`

**H: Tôi có thể sử dụng nhiều trình quản lý gói không?**
Đ: Có, nhưng nên sử dụng một trình quản lý gói chính để tránh xung đột.

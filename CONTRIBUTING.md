# Contributing Guide

## Tiếng Việt

Cảm ơn bạn đã quan tâm đến việc đóng góp cho dự án này! Tài liệu này cung cấp hướng dẫn và các bước để đóng góp.

### Quy tắc ứng xử

Vui lòng đọc và tuân theo [Quy tắc ứng xử](CODE_OF_CONDUCT.md) của chúng tôi.

### Cách đóng góp

1. **Fork Repository**

   - Nhấp vào nút "Fork" ở góc trên bên phải của trang repository
   - Clone fork của bạn: `git clone https://github.com/kieth1205/dev-global-setup.git`

2. **Tạo nhánh**

   - Tạo nhánh mới: `git checkout -b feature/tên-tính-năng-của-bạn`
   - Đối với sửa lỗi: `git checkout -b fix/tên-sửa-lỗi-của-bạn`

3. **Thực hiện thay đổi**

   - Tuân theo phong cách và quy ước viết code
   - Thêm kiểm thử cho tính năng mới
   - Cập nhật tài liệu khi cần thiết

4. **Commit thay đổi**

   - Viết thông báo commit rõ ràng
   - Tham chiếu issues trong thông báo commit: `git commit -m "Thêm tính năng X (đóng #123)"`

5. **Push thay đổi**

   - Push lên fork của bạn: `git push origin feature/tên-tính-năng-của-bạn`

6. **Tạo Pull Request**
   - Truy cập repository gốc
   - Nhấp "New Pull Request"
   - Chọn nhánh của bạn
   - Điền vào mẫu PR
   - Gửi PR

### Thiết lập môi trường phát triển

1. Cài đặt các phụ thuộc:

   ```bash
   ./global_setup_dev.sh
   ```

2. Chạy kiểm thử:
   ```bash
   # Thêm lệnh kiểm thử ở đây
   ```

### Quy trình Pull Request

1. Cập nhật README.md với chi tiết thay đổi
2. Cập nhật CHANGELOG.md
3. PR phải vượt qua tất cả các kiểm thử
4. PR phải được xem xét bởi ít nhất một người bảo trì

### Báo cáo lỗi

Vui lòng sử dụng [mẫu báo cáo lỗi](.github/ISSUE_TEMPLATE/bug_report.md).

### Yêu cầu tính năng

Vui lòng sử dụng [mẫu yêu cầu tính năng](.github/ISSUE_TEMPLATE/feature_request.md).

## English

Thank you for your interest in contributing to this project! This document provides guidelines and steps for contributing.

### Code of Conduct

Please read and follow our [Code of Conduct](CODE_OF_CONDUCT.md).

### How to Contribute

1. **Fork the Repository**

   - Click the "Fork" button on the top right of the repository page
   - Clone your fork: `git clone https://github.com/kieth1205/dev-global-setup.git`

2. **Create a Branch**

   - Create a new branch: `git checkout -b feature/your-feature-name`
   - For bug fixes: `git checkout -b fix/your-bug-fix`

3. **Make Changes**

   - Follow the coding style and conventions
   - Add tests for new features
   - Update documentation as needed

4. **Commit Changes**

   - Write clear commit messages
   - Reference issues in commit messages: `git commit -m "Add feature X (closes #123)"`

5. **Push Changes**

   - Push to your fork: `git push origin feature/your-feature-name`

6. **Create Pull Request**
   - Go to the original repository
   - Click "New Pull Request"
   - Select your branch
   - Fill in the PR template
   - Submit the PR

### Development Setup

1. Install dependencies:

   ```bash
   ./global_setup_dev.sh
   ```

2. Run tests:
   ```bash
   # Add test commands here
   ```

### Pull Request Process

1. Update the README.md with details of changes
2. Update the CHANGELOG.md
3. The PR must pass all tests
4. The PR must be reviewed by at least one maintainer

### Reporting Bugs

Please use the [bug report template](.github/ISSUE_TEMPLATE/bug_report.md).

### Requesting Features

Please use the [feature request template](.github/ISSUE_TEMPLATE/feature_request.md).

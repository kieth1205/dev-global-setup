# Chính Sách Bảo Mật / Security Policy

## Các Phiên Bản Được Hỗ Trợ / Supported Versions

| Phiên Bản / Version | Hỗ Trợ / Supported |
| ------------------- | ------------------ |
| 1.x.x               | :white_check_mark: |
| < 1.0               | :x:                |

## Báo Cáo Lỗ Hổng Bảo Mật / Reporting a Vulnerability

Chúng tôi rất coi trọng vấn đề bảo mật phần mềm. Nếu bạn phát hiện lỗ hổng bảo mật, vui lòng làm theo các bước sau:

1. **Không** công bố lỗ hổng công khai cho đến khi đội ngũ của chúng tôi xử lý xong.
   **Do not** disclose the vulnerability publicly until it has been addressed by our team.

2. Gửi báo cáo đến đội ngũ bảo mật của chúng tôi qua email: security@kieth1205.dev
   Submit your findings to our security team by emailing: security@kieth1205.dev

3. Bao gồm các thông tin sau trong báo cáo:
   Include the following information in your report:
   - Mô tả lỗ hổng / Description of the vulnerability
   - Các bước để tái tạo lỗi / Steps to reproduce
   - Tác động tiềm ẩn / Potential impact
   - Các biện pháp khắc phục đề xuất (nếu có) / Any suggested fixes (if available)

### Điều Gì Sẽ Xảy Ra / What to Expect

- Chúng tôi sẽ xác nhận đã nhận được báo cáo trong vòng 48 giờ
  We will acknowledge receipt of your vulnerability report within 48 hours

- Chúng tôi sẽ phản hồi chi tiết trong vòng 7 ngày về các bước tiếp theo
  We will provide a more detailed response within 7 days indicating the next steps

- Chúng tôi sẽ cập nhật thông tin về tiến độ xử lý vấn đề
  We will keep you informed about our progress in addressing the issue

- Chúng tôi sẽ công khai ghi nhận đóng góp của bạn (nếu bạn muốn)
  We will publicly acknowledge your responsible disclosure (if you wish)

## Biện Pháp Bảo Mật / Security Measures

### Bảo Mật Mã Nguồn / Code Security

- Tất cả thay đổi mã nguồn đều được xem xét thông qua pull requests
  All code changes are reviewed through pull requests

- Quét bảo mật tự động được thực hiện trên tất cả thay đổi mã nguồn
  Automated security scanning is performed on all code changes

- Các phụ thuộc được cập nhật và giám sát thường xuyên để phát hiện lỗ hổng
  Dependencies are regularly updated and monitored for vulnerabilities

### Bảo Mật Dữ Liệu / Data Security

- Không lưu trữ dữ liệu nhạy cảm trong mã nguồn
  No sensitive data is stored in the codebase

- Tất cả file cấu hình được loại trừ khỏi hệ thống quản lý phiên bản
  All configuration files are excluded from version control

- Sử dụng biến môi trường cho thông tin nhạy cảm
  Environment variables are used for sensitive information

### Kiểm Soát Truy Cập / Access Control

- Yêu cầu xác thực hai yếu tố cho tất cả người đóng góp
  Two-factor authentication is required for all contributors

- Giới hạn quyền truy cập repository cho nhân viên được ủy quyền
  Access to the repository is restricted to authorized personnel

- Thực hiện đánh giá quyền truy cập định kỳ
  Regular access reviews are conducted

## Cập Nhật Bảo Mật / Security Updates

Các bản cập nhật bảo mật được phát hành dưới dạng bản vá cho phiên bản mới nhất. Chúng tôi khuyến nghị luôn chạy phiên bản mới nhất của phần mềm.

Security updates are released as patches to the latest version. We recommend always running the latest version of the software.

## Tiết Lộ Có Trách Nhiệm / Responsible Disclosure

Chúng tôi tuân theo chính sách tiết lộ có trách nhiệm:
We follow a responsible disclosure policy:

- Chúng tôi sẽ không có hành động pháp lý đối với các nhà nghiên cứu bảo mật báo cáo lỗ hổng theo chính sách này
  We will not take legal action against security researchers who report vulnerabilities according to this policy

- Chúng tôi sẽ làm việc với bạn để hiểu và giải quyết vấn đề nhanh chóng
  We will work with you to understand and resolve the issue quickly

- Chúng tôi sẽ ghi nhận đóng góp của bạn nếu bạn là người đầu tiên báo cáo lỗ hổng
  We will recognize your contribution if you are the first to report a vulnerability

## Liên Hệ / Contact

Đối với các vấn đề liên quan đến bảo mật, vui lòng liên hệ:
For security-related issues, please contact:

- Email: security@kieth1205.dev
- PGP Key: [Your PGP Key Fingerprint]

## Cảm Ơn Về Bảo Mật / Security Acknowledgments

Chúng tôi xin cảm ơn các cá nhân và tổ chức sau đây vì những đóng góp cho bảo mật của chúng tôi:
We would like to thank the following individuals and organizations for their contributions to our security:

[List any security contributors here]

## Giấy Phép / License

Chính sách bảo mật này được cấp phép theo Giấy phép MIT.
This security policy is licensed under the MIT License.

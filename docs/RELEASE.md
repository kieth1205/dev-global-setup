# Hướng dẫn Tạo Tags và Releases trên Git

## Tags

### Tạo tag mới

1. **Tạo tag đơn giản**:

```bash
# Tạo tag cho commit hiện tại
git tag v1.0.0

# Tạo tag với message
git tag -a v1.0.0 -m "Release version 1.0.0"
```

2. **Tạo tag cho commit cụ thể**:

```bash
# Tạo tag cho commit có hash abc123
git tag -a v1.0.0 abc123 -m "Release version 1.0.0"
```

3. **Đẩy tag lên remote**:

```bash
# Đẩy một tag cụ thể
git push origin v1.0.0

# Đẩy tất cả tags
git push origin --tags
```

### Quản lý tags

1. **Xem danh sách tags**:

```bash
# Xem tất cả tags
git tag

# Xem tags với message
git tag -n
```

2. **Xóa tag**:

```bash
# Xóa tag local
git tag -d v1.0.0

# Xóa tag trên remote
git push origin :refs/tags/v1.0.0
```

## Releases

### Tạo release trên GitHub

1. **Từ GitHub UI**:

   - Vào trang Releases trong repository
   - Click "Create a new release"
   - Chọn tag (hoặc tạo tag mới)
   - Đặt tên release
   - Thêm mô tả
   - Upload assets (nếu có)
   - Click "Publish release"

2. **Từ GitHub CLI**:

```bash
# Tạo release
gh release create v1.0.0 --title "Release v1.0.0" --notes "Release notes here"

# Tạo release với assets
gh release create v1.0.0 --title "Release v1.0.0" --notes "Release notes here" ./path/to/asset.zip
```

### Quản lý releases

1. **Xem danh sách releases**:

```bash
# Sử dụng GitHub CLI
gh release list
```

2. **Xóa release**:

```bash
# Sử dụng GitHub CLI
gh release delete v1.0.0
```

## Quy ước đặt tên

### Tags

- Sử dụng [Semantic Versioning](https://semver.org/):
  - `v1.0.0` - Major release
  - `v1.1.0` - Minor release
  - `v1.1.1` - Patch release
- Tiền tố `v` cho version
- Không sử dụng khoảng trắng

### Releases

- Tên release nên mô tả rõ ràng
- Bao gồm version number
- Có thể thêm mô tả ngắn

## Best Practices

1. **Trước khi tạo release**:

   - Kiểm tra CHANGELOG.md
   - Chạy tests
   - Kiểm tra dependencies
   - Đảm bảo code đã được review

2. **Khi tạo release**:

   - Tạo tag trước
   - Thêm release notes chi tiết
   - Upload đầy đủ assets
   - Kiểm tra lại thông tin

3. **Sau khi tạo release**:
   - Thông báo cho team
   - Cập nhật documentation
   - Theo dõi feedback

## Ví dụ Workflow

1. **Chuẩn bị release**:

```bash
# Cập nhật CHANGELOG.md
# Chạy tests
npm test
# Tạo tag
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

2. **Tạo release**:

```bash
# Sử dụng GitHub CLI
gh release create v1.0.0 \
  --title "Release v1.0.0" \
  --notes "$(cat CHANGELOG.md)" \
  ./dist/*.zip
```

3. **Thông báo**:

```bash
# Gửi thông báo qua Slack/Discord
curl -X POST -H 'Content-type: application/json' \
  --data '{"text":"New release v1.0.0 is available!"}' \
  $SLACK_WEBHOOK_URL
```

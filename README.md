# ui_giftshop

Ứng dụng mua bán quà tặng trực tuyến.

Lưu ý đây chỉ là mockup UI

# Quy định commit

```
/‾‾‾‾‾‾‾‾
😼  <  Meow! Hãy sử dụng commit message có nghĩa
    \________

feat: sign in page

<Loại commit>: <mô tả ngắn gọn>
    │           │
    │           └─> Mô tả bằng thì hiện tại đơn. Không viết hoa.
    │               Không có dấu chấm cuối câu. Không có kí tự đặc biệt.
    │
    └─> Các loại commit: feat, fix, refactor, style, docs.
```

### Giải thích các loại commit:

- feat: Thêm tính năng mới cho ứng dụng
- fix: Sửa bug gây lỗi ứng dụng
- refactor: Chỉnh lại code (format, đặt tên, tách file, lớp, hàm...)
- style: Chỉnh lại UI (font chữ, kích thước, khoảng cách...)
- docs: Chỉnh sửa tài liệu (README...)

### Khi nào nên commit:

Nên commit khi đã hoàn thành xong một công việc bất kì (không nhất thiết công việc đó phải lớn)

### Nguồn tham khảo:

- https://www.conventionalcommits.org/
- https://seesparkbox.com/foundry/semantic_commit_messages
- http://karma-runner.github.io/1.0/dev/git-commit-msg.html

# Quy định tạo branch

- Tạo branch theo cú pháp features/<tên tính năng> và thực hiện coding trên branch đó
- Sau khi hoàn thành tính năng đó tiến hành tạo PR (Pull Request) để merge vào branch tổng
- Mỗi feature tương ứng với 1 màn hình hoặc 1 nhóm các màn hình có liên quan với nhau
- Trong quá trình code nếu như có 1 nhánh khác được merge vào nhánh tổng, thì khi hoàn tất code
  và merge vào nhánh tổng sẽ phải tiến hành rebase

# Quy định coding

- Đặt tên theo hướng dẫn này: https://dart.dev/guides/language/effective-dart/style
- Tổ chức source code theo cấu trúc như sau (ví dụ cho màn hình login):

```
src
├── presentation
│   ├── login
│   │   ├── view
│   │   └── widgets

```

> Trong đó thư mục view chứa màn hình chính của tính năng đó
> và thư mục widgets chứa những widgets con tạo nên màn hình đó

- Mỗi method không được quá 50 dòng, nếu dài quá phải cắt widget hoặc method (Extract)
- Mỗi file chỉ nên chứa 1 class duy nhất
- Cố gắng viết các widget sao cho có thể tái sử dụng
- Nếu widget có thể được tái sử dụng, hãy đặt tên chung chung (nhưng phải có nghĩa).
  Nếu không, đặt tên để có thể phân biệt các widgets của các màn hình khác nhau

  > Ví dụ cho việc đặt tên widget có thể tái sử dụng:
  > `MainActionButton`

  > Ví dụ cho việc đặt tên widget không tái sử dụng để phân biệt màn hình:
  > `SignInScaffoldBody`

- Hình ảnh được lưu trong assets/images và phải phân chia thư mục theo tính năng để dễ quản lý
- Nên để TODO cho những công việc sẽ làm trong các branch khác hoặc commit khác (Navigate...)
- Trước khi commit phải đảm bảo code không có error, warning (trừ TODOs), và phải được format

## Các plugin VSCode nên có:
- [Flutter](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter)
- [Awesome Flutter Snippets](https://marketplace.visualstudio.com/items?itemName=Nash.awesome-flutter-snippets)
- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
- [GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [Better Comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)
- [Error Lens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)

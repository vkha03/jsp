<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="vi">
  <head>

    <meta charset="UTF-8" />

    <!-- Tiêu đề trang -->
    <title>AI Data System | Login & Register</title>

    <style>
      /* Reset CSS cơ bản */
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family:
          Segoe UI,
          Tahoma,
          sans-serif;
      }

      /* Căn giữa toàn bộ giao diện */
      body {
        height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        background: linear-gradient(
          135deg,
          #020617,
          #0f172a
        ); /* nền công nghệ */
        color: #fff;
      }

      /* Khung chứa form */
      .container {
        width: 400px;
        background: #020617;
        padding: 30px;
        border-radius: 14px;
        box-shadow: 0 0 30px rgba(59, 130, 246, 0.35);
      }

      /* Tiêu đề hệ thống AI */
      .title {
        text-align: center;
        font-size: 13px;
        color: #38bdf8;
        margin-bottom: 10px;
      }

      /* Tiêu đề form */
      h2 {
        text-align: center;
        margin-bottom: 8px;
      }

      /* Mô tả ngắn dưới tiêu đề */
      .desc {
        text-align: center;
        font-size: 14px;
        color: #94a3b8;
        margin-bottom: 20px;
      }

      /* Input dùng chung */
      input {
        width: 100%;
        padding: 12px;
        margin-bottom: 14px;
        border: none;
        border-radius: 8px;
        background: #0f172a;
        color: #fff;
        outline: none;
      }

      /* Placeholder */
      input::placeholder {
        color: #64748b;
      }

      /* Nút bấm */
      button {
        width: 100%;
        padding: 12px;
        border: none;
        border-radius: 8px;
        background: #2563eb;
        color: #fff;
        font-weight: bold;
        cursor: pointer;
      }

      /* Hiệu ứng hover nút */
      button:hover {
        background: #1d4ed8;
      }

      /* Khu vực chuyển login / register */
      .switch {
        margin-top: 15px;
        text-align: center;
        font-size: 14px;
      }

      /* Link chuyển form */
      .switch span {
        color: #38bdf8;
        cursor: pointer;
      }

      /* Mặc định ẩn tất cả form */
      .form {
        display: none;
      }
         /* Thêm vào cuối phần <style> */
      /*
Khi radio #login được chọn
→ hiển thị form đăng nhập

Khi radio #register được chọn
→ hiển thị form đăng ký
*/
      #login:checked ~ .login-form,
      #register:checked ~ .register-form {
        display: block;
      }

      /* Ẩn radio button (chỉ dùng logic, không hiển thị) */
      .toggle {
        display: none;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <!--
    Radio button dùng để điều khiển trạng thái
    checked = form đó được hiển thị
    -->
      <input type="radio" name="tab" id="login" class="toggle" checked />
      <input type="radio" name="tab" id="register" class="toggle" />

      <!-- ===== FORM ĐĂNG NHẬP ===== -->
      <!--Thêm form action để chạy đăng nhập-->
      <div class="form login-form">
        <form action="dangnhap.jsp" method="post">
            
        <div class="title">AI DATA MANAGEMENT SYSTEM</div>
        <h2>Đăng nhập</h2>
        <p class="desc">Truy cập hệ thống quản trị dữ liệu AI</p>
        <!-- Email -->
        <input type="email" name="email" placeholder="Email"  />

        <!-- Mật khẩu -->
        <input type="password" name="password" placeholder="Mật khẩu"  />

        <!-- Nút đăng nhập -->
        <button>Đăng nhập</button>

        <!-- Chuyển sang form đăng ký -->
        <div class="switch">
          Chưa có tài khoản?
          <label for="register"><span>Đăng ký</span></label>
        </form>
        </div>
      </div>

      <!-- ===== FORM ĐĂNG KÝ ===== -->
      <div class="form register-form">
        <!--Thêm form action để chạy đăng kí-->
        <form action="dangki.jsp" method="post">
          <div class="title">AI DATA MANAGEMENT SYSTEM</div>
          <h2>Đăng ký</h2>
          <p class="desc">Tạo tài khoản mới cho hệ thống AI</p>

          <!-- Email -->
          <input type="email" name="email" placeholder="Email" required />

          <!-- Mật khẩu -->
          <input type="password" name="password" placeholder="Mật khẩu"  />

          <!-- Nhập lại mật khẩu -->
          <input type="password" name="repassword" placeholder="Nhập lại mật khẩu"  />

          <!-- Nút đăng ký -->
          <button>Đăng ký</button>

          <!-- Quay lại form đăng nhập -->
          <div class="switch">
            Đã có tài khoản?
            <label for="login"><span>Đăng nhập</span></label>
          </div>
        </form>
      </div>
    </div>
  </body>
</html>

<%@ page import="java.sql.*" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    // Lấy dữ liệu từ form
    String email = request.getParameter("email");
    String pass = request.getParameter("password");
    String rePass = request.getParameter("repassword");

    String message = "";
    String alertClass = "";

    // 1. Kiểm tra mật khẩu nhập lại
    if (!pass.equals(rePass)) {
        message = "Mật khẩu nhập lại không khớp!";
        alertClass = "alert-danger";
    } else {
        try {
            // 2️. Kết nối database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/my_system",
                "root",
                ""
            );

            // 3️. Kiểm tra email đã tồn tại chưa
            String sqlCheck = "SELECT id FROM users WHERE email = ?";
            PreparedStatement psCheck = con.prepareStatement(sqlCheck);
            psCheck.setString(1, email);
            ResultSet rs = psCheck.executeQuery();

            if (rs.next()) {
                message = "Email này đã được đăng ký!";
                alertClass = "alert-warning";
            } else {
                // 4️. Mã hóa mật khẩu bằng BCrypt (Cấp độ 10 = chuẩn , 12 = rất mạnh)
                String passwordHash = BCrypt.hashpw(pass, BCrypt.gensalt(10));

                // 5️. Thêm user mới
                String sqlInsert =
                    "INSERT INTO users(email, password_hash, role, created_at, updated_at) " +
                    "VALUES (?, ?, 'user', NOW(), NOW())";

                PreparedStatement ps = con.prepareStatement(sqlInsert);
                ps.setString(1, email);
                ps.setString(2, passwordHash);

                int kq = ps.executeUpdate();
                if (kq > 0) {
                    message = "Đăng ký thành công! Bạn có thể đăng nhập.";
                    alertClass = "alert-success";
                }
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            message = "Lỗi hệ thống!";
            alertClass = "alert-danger";
        }
    }
%>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Đăng ký</title>
    <style>
        body {
            background:#020617;
            color:white;
            font-family:Segoe UI;
            display:flex;
            justify-content:center;
            align-items:center;
            height:100vh;
        }
        .box {
            background:#020617;
            padding:30px;
            border-radius:12px;
            box-shadow:0 0 20px rgba(59,130,246,.4);
            width:400px;
            text-align:center;
        }
        .alert-success { color:#22c55e; }
        .alert-danger { color:#ef4444; }
        .alert-warning { color:#facc15; }
        a { color:#38bdf8; text-decoration:none; }
    </style>
</head>
<body>
    <div class="box">
        <h2>Kết quả đăng ký</h2>
        <p class="<%= alertClass %>"><%= message %></p>
        <br>
        <a href="ai_admin.jsp">← Quay lại đăng nhập</a>
    </div>
</body>
</html>

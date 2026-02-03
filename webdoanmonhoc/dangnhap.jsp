<%@ page import="java.sql.*" %>
<%@ page import="org.mindrot.jbcrypt.BCrypt" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<%
    String email = request.getParameter("email");
    String pass = request.getParameter("password");

    String message = "";
    String alertClass = "";

    if (email == null || pass == null || email.isEmpty() || pass.isEmpty()) {
        message = "Vui lòng nhập đầy đủ email và mật khẩu!";
        alertClass = "alert-warning";
    } else {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection( "jdbc:mysql://localhost:3306/my_system","root", ""     );

            String sql = "SELECT password_hash, role FROM users WHERE email = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            // mỗi ? đại diện cho 1 số vd email = ? == 1; user = ? == 2
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            
            //rs lấy dữ liêu từ db nếu có sẽ tiếp tục không thì sẽ hiện email ko tồn tại
            if (!rs.next()) {
                message = "Email không tồn tại!";
                alertClass = "alert-danger";
            } else {
                String passwordHash = rs.getString("password_hash");
                String role = rs.getString("role");

                if (BCrypt.checkpw(pass, passwordHash)) {
                    // Lưu đăng nhập khi chuyển trang
                    session.setAttribute("email", email);
                    session.setAttribute("role", role);

                    if ("admin".equals(role)) {
                        response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
                    } else {
                        response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
                        return;
                    }
                    return;
                } else {
                    message = "Sai mật khẩu!";
                    alertClass = "alert-danger";
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
    <title>Đăng nhập</title>
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
        <h2>Kết quả đăng nhập</h2>
        <p class="<%= alertClass %>"><%= message %></p>
        <br>
        <a href="ai_admin.jsp">← Quay lại đăng nhập</a>
    </div>
</body>
</html>

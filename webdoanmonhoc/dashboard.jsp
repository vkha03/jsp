<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
    // ===== 1. CHECK LOGIN =====
    String email = (String) session.getAttribute("email");
    String role  = (String) session.getAttribute("role"); // "admin" hoặc "user"

    // Nếu chưa đăng nhập -> Đuổi về trang login
    if (email == null || role == null) {
        response.sendRedirect("ai_admin.jsp"); 
        return;
    }

    // Ở đây KHÔNG check role nữa, vì cả admin và user đều được vào Dashboard
%>

<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>AI Data Management Dashboard</title>

<style>
    /* --- CSS CƠ BẢN --- */
    *{ margin:0; padding:0; box-sizing:border-box; font-family:"Segoe UI", Roboto, Arial, sans-serif; }
    body{ background:#020617; color:#e5e7eb; display:flex; height:100vh; overflow: hidden; }
    
    /* ===== SIDEBAR ===== */
    .sidebar{ width:260px; background:#020617; border-right:1px solid #1e293b; padding:20px; z-index: 1000; }
    .logo{ font-size:18px; font-weight:bold; color:#38bdf8; margin-bottom:30px; }
    
    .menu a, .menu-item-content {
        display:block; padding:12px 14px; margin-bottom:8px; border-radius:8px;
        color:#cbd5f5; text-decoration:none; cursor: pointer;
        position: relative;
    }
    .menu a:hover, .menu-item-content:hover { background:#1e293b; color:#38bdf8; }

    /* ===== MAIN CONTENT ===== */
    .main{ flex:1; padding:25px; }
    .header{ display:flex; align-items:center; margin-bottom:25px; }
    .logout{ margin-left:auto; background:#ef4444; border:none; color:white; padding:8px 14px; border-radius:8px; cursor:pointer; }
    .logout:hover{ background:#dc2626; }
    
    .ai-box{ background:#020617; border:1px solid #1e293b; border-radius:14px; padding:20px; }
    textarea{ width:100%; height:120px; border-radius:10px; border:none; padding:12px; background:#0f172a; color:white; resize: none; }
    .ai-box button{ margin-top:12px; background:#2563eb; border:none; color:white; padding:10px 18px; border-radius:8px; cursor:pointer; }
    .result{ margin-top:15px; background:#0f172a; padding:14px; border-radius:10px; color:#a5f3fc; }

    /* ========================================= */
    /* ===== CSS CHO MENU ADMIN (Flyout) ===== */
    /* ========================================= */
    
    .menu-wrapper { position: relative; }

    /* Cầu nối tàng hình để không bị mất hover */
    .menu-wrapper::after {
        content: ""; position: absolute; top: 0; right: -20px;
        width: 20px; height: 100%;
    }

    .menu-item-content { display: flex; justify-content: space-between; align-items: center; }

    /* SUBMENU */
    .submenu {
        visibility: hidden; opacity: 0;
        position: absolute; left: 100%; top: 0;
        width: 200px;
        background: #0f172a; border: 1px solid #1e293b; border-radius: 8px;
        box-shadow: 10px 10px 30px rgba(0,0,0,0.5);
        padding: 8px; margin-left: 5px;
        
        /* Hiệu ứng delay khi tắt */
        transition: visibility 0s linear 0.3s, opacity 0.3s ease-in-out;
    }

    /* Hover vào là hiện */
    .menu-wrapper:hover .submenu {
        visibility: visible; opacity: 1;
        transition-delay: 0s;
    }

    .submenu a { display: block; padding: 10px 12px; color: #cbd5e1; font-size: 14px; margin-bottom: 2px; }
    .submenu a:hover { background: #2563eb; color: white; }
    .arrow { font-size: 10px; opacity: 0.5; }

</style>
</head>

<body>

<div class="sidebar">
    <div class="logo">AI DATA SYSTEM</div>
    <div class="menu">
        <a href="#">📊 Dashboard</a>
        <a href="#">🗄️ Quản lý CSDL</a>
        
        <% 
           // Nếu role là "admin" thì mới in đoạn HTML này ra
           if (role != null && role.equals("admin")) { 
        %>
            <div class="menu-wrapper">
                <div class="menu-item-content">
                    <span>👤 Người dùng</span>
                    <span class="arrow">▶</span>
                </div>

                <div class="submenu">
                    <a href="add_user.jsp">➕ Thêm người dùng</a>
                    <a href="edit_user.jsp">✏️ Sửa thông tin</a>
                    <a href="delete_user.jsp">❌ Xóa tài khoản</a>
                </div>
            </div>
        <% 
           } // Kết thúc if admin
        %>
        <a href="#">🤖 Truy vấn AI</a>
        <a href="#">📈 Phân tích dữ liệu</a>
        <a href="#">⚙️ Cài đặt</a>
    </div>
</div>

<div class="main">
    <div class="header">
        <div>Xin chào: <b style="color: #38bdf8"><%= email %></b> 
             (<span style="text-transform: capitalize; color: <%= role.equals("admin") ? "#ef4444" : "#22c55e" %>"><%= role %></span>)
        </div>
        <button class="logout" onclick="logout()">Đăng xuất</button>
    </div>

    <div class="ai-box">
        <h2>🤖 Truy vấn dữ liệu bằng ngôn ngữ tự nhiên</h2>
        <textarea placeholder="Ví dụ: Lấy danh sách người dùng được tạo hôm nay"></textarea>
        <button onclick="queryAI()">Gửi truy vấn</button>

        <div class="result" id="result">
            Kết quả AI sẽ hiển thị tại đây...
        </div>
    </div>
</div>

<script>
    function logout(){
        window.location.href = "ai_admin.jsp"; 
    }

    function queryAI(){
        document.getElementById("result").innerText = "Đang xử lý...";
    }
</script>

</body>
</html>
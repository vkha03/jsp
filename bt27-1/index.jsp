<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    // 1. Kết nối Database
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlysinhvien", "root", "");
    Statement stmt = conn.createStatement();

    // 2. Lấy masv từ URL để hiển thị dữ liệu cũ (Dùng cho SELECT)
    String maSV_Param = request.getParameter("masv"); 
    ResultSet rs = null;
    if (maSV_Param != null) {
        String sqlQuery = "SELECT * FROM sinhvien WHERE MaSV = '" + maSV_Param + "'";
        rs = stmt.executeQuery(sqlQuery);
        rs.next(); // Đưa con trỏ đến dòng dữ liệu để lấy giá trị
    }

    // 3. Xử lý Cập nhật khi nhấn nút (Dùng cho UPDATE)
    String btn = request.getParameter("btn");
    if (btn != null) {
        String maSV = request.getParameter("txtMaSV");
        String hoten = request.getParameter("txtHoTen");
        String phai = request.getParameter("txtPhai");
        String ngaysinh = request.getParameter("txtNgaySinh");
        String noisinh = request.getParameter("txtNoiSinh");
        String dantoc = request.getParameter("txtDanToc");
        String tongiao = request.getParameter("txtTonGiao");
        String malop = request.getParameter("txtLop");
        String quequan = request.getParameter("txtQueQuan");
        String hocbong = request.getParameter("txtHocBong");

        // Dùng Statement nối chuỗi trực tiếp, không dùng PreparedStatement
        String sqlUpdate = "UPDATE sinhvien SET " +
            "Hoten = '" + hoten + "', " +
            "Gioitinh = '" + phai + "', " +
            "Ngaysinh = '" + ngaysinh + "', " +
            "Noisinh = '" + noisinh + "', " +
            "Dantoc = '" + dantoc + "', " +
            "Tongiao = '" + tongiao + "', " +
            "Malop = '" + malop + "', " +
            "Hocbong = " + hocbong + ", " + 
            "Quequan = '" + quequan + "' " +
            "WHERE MaSV = '" + maSV + "'";
        
        int k = stmt.executeUpdate(sqlUpdate);
        if(k > 0) {
            response.sendRedirect("index.jsp"); // Thành công quay về trang chủ
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa thông tin HSSV</title>
    <style>
        body { font-family: "Times New Roman", Times, serif; display: flex; justify-content: center; padding: 20px; }
        .form-container { width: 500px; border: 1px solid #00ffff; }
        .header { background-color: #ff99ff; padding: 10px; text-align: center; font-weight: bold; font-size: 20px; }
        table { width: 100%; border-collapse: collapse; background-color: #99ffff; }
        td { padding: 10px; border: 1px solid #fff; }
        .label { font-weight: bold; width: 30%; }
        input[type="text"] { width: 95%; padding: 5px; border: 1px solid #ccc; }
        .button-group { text-align: center; background-color: white; padding: 15px; }
        button { padding: 5px 15px; margin: 0 10px; cursor: pointer; }
    </style>
</head>
<body>

<div class="form-container">
    <div class="header">CHỈNH SỬA THÔNG TIN HSSV</div>
    
    <form method="POST">
        <table>
            <% if(rs != null) { %>
            <tr>
                <td class="label">Mã số SV:</td>
                <td><input type="text" name="txtMaSV" value="<%= rs.getString("MaSV") %>" readonly style="background-color: #eee;"></td>
            </tr>
            <tr>
                <td class="label">Họ và tên:</td>
                <td><input type="text" name="txtHoTen" value="<%= rs.getString("Hoten") %>"></td>
            </tr>
            <tr>
                <td class="label">Phái:</td>
                <td><input type="text" name="txtPhai" value="<%= rs.getString("Gioitinh") %>"></td>
            </tr>
            <tr>
                <td class="label">Ngày sinh:</td>
                <td><input type="text" name="txtNgaySinh" value="<%= rs.getString("Ngaysinh") %>"></td>
            </tr>
            <tr>
                <td class="label">Nơi sinh:</td>
                <td><input type="text" name="txtNoiSinh" value="<%= rs.getString("Noisinh") %>"></td>
            </tr>
            <tr>
                <td class="label">Dân tộc:</td>
                <td><input type="text" name="txtDanToc" value="<%= rs.getString("Dantoc") %>"></td>
            </tr>
            <tr>
                <td class="label">Tôn giáo:</td>
                <td><input type="text" name="txtTonGiao" value="<%= rs.getString("Tongiao") %>"></td>
            </tr>
            <tr>
                <td class="label">Lớp:</td>
                <td><input type="text" name="txtLop" value="<%= rs.getString("Malop") %>"></td>
            </tr>
            <tr>
                <td class="label">Học bổng:</td>
                <td><input type="text" name="txtHocBong" value="<%= rs.getString("Hocbong") %>"></td>
            </tr>
            <tr>
                <td class="label">Quê quán:</td>
                <td><input type="text" name="txtQueQuan" value="<%= rs.getString("Quequan") %>"></td>
            </tr>
            <% } %>
        </table>
        
        <div class="button-group">
            <button type="submit" name="btn" value="update">Cập nhật TT</button>
            <button type="reset">Làm lại</button>
        </div>
    </form>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    Class.forName("com.mysql.cj.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlysinhvien", "root", "");

    String idSua = request.getParameter("id"); 
    ResultSet rs = null;
 Statement stmt = conn.createStatement();
    if (idSua != null) {
        String sqlQuery = "SELECT * FROM sinhvien WHERE MaSV = 'idSua'";
        rs = stmt.executeQuery();
        if(rs.next()) {
        }
    }

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

        String sqlUpdate = "UPDATE sinhvien SET Hoten=?, Gioitinh=?, Ngaysinh=?, Noisinh=?, Dantoc=?, Tongiao=?, Malop=?, Hocbong=?, Quequan=? WHERE MaSV=?";
        PreparedStatement pstmtUp = conn.prepareStatement(sqlUpdate);
        pstmtUp.setString(1, hoten);
        pstmtUp.setString(2, phai);
        pstmtUp.setString(3, ngaysinh);
        pstmtUp.setString(4, noisinh);
        pstmtUp.setString(5, dantoc);
        pstmtUp.setString(6, tongiao);
        pstmtUp.setString(7, malop);
        pstmtUp.setString(8, hocbong);
        pstmtUp.setString(9, quequan);
        pstmtUp.setString(10, maSV);
        
        int k = pstmtUp.executeUpdate();
        if(k > 0) {
            response.sendRedirect("index.jsp");        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa thông tin HSSV</title>
    <style>
        body { font-family: Arial, sans-serif; display: flex; justify-content: center; padding: 20px; }
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
            <%-- Kiểm tra nếu rs có dữ liệu mới hiển thị --%>
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
            <button type="button" onclick="window.location.href='index.jsp'">Quay lại</button>
        </div>
    </form>
</div>

</body>
</html>
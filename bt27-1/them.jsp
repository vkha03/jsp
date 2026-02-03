<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.sql.*" %>

<%
Class.forName("com.mysql.cj.jdbc.Driver"); 
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quanlysinhvien", "root", "");

String masv = request.getParameter("masv");
Statement stmt = conn.createStatement(); 

ResultSet sv = stmt.excuteQuery("select * from sinhvien where MaSV = 'masv'");

String btn = request.getParameter("btn");
ResultSet rs = null;

String maSV = request.getParameter("txtMaSV");
    String hoten = request.getParameter("txtHoTen");
    String phai = request.getParameter("txtPhai");
    String ngaysinh = request.getParameter("txtNgaySinh");
    String noisinh = request.getParameter("txtNoiSinh");
    String dantoc = request.getParameter("txtDanToc");
    String tongiao = request.getParameter("txtTonGiao");
    String malop = request.getParameter("txtLop");
    String quequan = request.getParameter("txtQueQuan");

if(btn != null){
	String sql = "SELECT * FROM sinhvien sv join lop l on l.Malop = sv.Malop where sv.Malop = '" + malop + "'";
	rs = stmtsv.executeQuery(sql); 
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
        
        .header { 
            background-color: #ff99ff; 
            padding: 10px; 
            text-align: center; 
            font-weight: bold; 
            font-size: 20px;
            color: black;
        }

        table { width: 100%; border-collapse: collapse; background-color: #99ffff; }
        td { padding: 10px; border: 1px solid #fff; }
        
        .label { font-weight: bold; width: 30%; }
        
        input[type="text"], select { 
            width: 95%; 
            padding: 5px; 
            border: 1px solid #ccc; 
        }

        .button-group { text-align: center; background-color: white; padding: 15px; border: none; }
        button { padding: 5px 15px; margin: 0 10px; cursor: pointer; }
    </style>
</head>
<body>

<div class="form-container">
    <div class="header">CHỈNH SỬA THÔNG TIN HSSV</div>
    
    <form method="POST">
        <table>
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
                <td><input type="text" name="txtLop" value="<%= rs.getInt("Malop") %>"></td>
            </tr>
            <tr>
                <td class="label">Học bổng:</td>
                <td><input type="text" name="txtHocBong" value="<%= rs.getString("Hocbong") %>"></td>
            </tr>
            <tr>
                <td class="label">Quê quán:</td>
                <td><input type="text" name="txtQueQuan" value="<%= rs.getString("Quequan") %>"></td>
            </tr>
        </table>
        
        <div class="button-group">
            <button type="submit" name="btn">Cập nhật TT</button>
            <button type="reset">Làm lại</button>
        </div>
    </form>
</div>

</body>
</html>
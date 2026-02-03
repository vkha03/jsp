<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.sql.*" %>
<% 
    // 1. Kết nối DB
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qlsach", "root", ""); 
    
    // 2. Lấy danh sách loại sách cho dropdown
    Statement stmt = conn.createStatement(); 
    ResultSet rsLoai = stmt.executeQuery("SELECT * FROM tblloaisach"); 

    // 3. Khai báo biến xử lý tìm kiếm
    ResultSet rstensach = null; 
    String btn = request.getParameter("xuanmai");
    String tenSach = request.getParameter("tensach");
    String maLoai = request.getParameter("loaisach");

    if(btn != null) {
        String sql = "SELECT * FROM tblsach WHERE 1=1";
        
        if (tenSach != null && !tenSach.trim().isEmpty()) {
            sql += " AND TenS LIKE '%" + tenSach + "%'";
        }
        if (maLoai != null && !maLoai.isEmpty()) {
            sql += " AND Maloai = '" + maLoai + "'";
        }
        
        Statement stmtSearch = conn.createStatement();
        rstensach = stmtSearch.executeQuery(sql);
    }
    // ĐÃ XÓA DẤU } DƯ THỪA Ở ĐÂY
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tra cứu danh mục sách</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding-top: 30px;
            background-color: #fff;
        }
        .search-area {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
            margin-bottom: 30px;
            width: 100%;
        }
        .search-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }
        .search-item label {
            font-weight: bold;
            font-size: 14px;
        }
        input[type="text"], select {
            padding: 2px 5px;
            border: 1px solid #767676;
        }
        button {
            padding: 2px 10px;
            cursor: pointer;
            text-transform: uppercase;
            font-size: 12px;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            border: 1px solid #000;
        }
        table th {
            background-color: #ff69b4;
            color: #000;
            padding: 8px;
            border: 1px solid #000;
            font-weight: bold;
        }
        table td {
            padding: 8px;
            border: 1px solid #000;
            text-align: center;
            font-size: 14px;
        }
        table tr:hover {
            background-color: #f9f9f9;
        }
    </style>
</head>

<body>
    <div class="search-area">
        <form action="" method="GET" style="display: flex; gap: 20px; align-items: center;">
            <div class="search-item">
                <label>Nhập tên sách cần tìm:</label>
                <input type="text" name="tensach" value="<%= (tenSach != null) ? tenSach : "" %>">
            </div>

            <div class="search-item">
                <label>Chọn loại sách:</label>
                <select name="loaisach">
                    <option value="">....Chọn loại sách....</option>
                    <% while(rsLoai.next()){ %>
                        <option value="<%= rsLoai.getString("Maloai") %>" <%= (rsLoai.getString("Maloai").equals(maLoai)) ? "selected" : "" %>>
                            <%= rsLoai.getString("Tenloai") %>
                        </option>
                    <% } %>
                </select>
            </div>
            
            <button type="submit" name="xuanmai" value="clicked">Tìm kiếm</button>
        </form>
    </div>

    <table>
        <thead>
            <tr>
                <th>Tên Sách</th>
                <th>Tác giả</th>
                <th>Giá</th>
                <th>Nhà xuất bản</th>
                <th>Năm xuất bản</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Sửa lỗi logic: Kiểm tra rstensach khác null trước khi lặp
                if(rstensach != null) {
                    while(rstensach.next()) {
            %>
            <tr>
                <td><%= rstensach.getString("TenS") %></td>
                <td><%= rstensach.getString("Tacgia") %></td>
                <td><%= rstensach.getInt("Gia") %></td>
                <td><%= rstensach.getString("Nxb") %></td>
                <td><%= rstensach.getInt("Namxb") %></td>
            </tr>
            <% 
                    } 
                } else { 
            %>
            <tr>
                <td colspan="5">Vui lòng nhập thông tin để tìm kiếm sách.</td>
            </tr>
            <% } %>
        </tbody>
    </table>
</body>
</html>
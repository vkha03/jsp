<%@ page import="java.sql.*, java.util.*, java.math.*" contentType="text/html;charset=UTF-8" language="java" %>
            <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/qlnv", "root", "");
             Statement stmt=conn.createStatement();
              String sql="SELECT * FROM nhanvien" ;
               ResultSet rs=stmt.executeQuery(sql);
                %>

                <!DOCTYPE html>
                <html>

                <head>
                    <meta charset="UTF-8">
                    <title>Danh sách lương tháng 4/2016</title>
                    <style>
                        * {
                            margin: 0;
                            padding: 0;
                            box-sizing: border-box;
                        }

                        body {
                            font-family: Arial, sans-serif;
                            background-color: #f5f5f5;
                            padding: 20px;
                        }

                        .container {
                            max-width: 1200px;
                            margin: 0 auto;
                            background-color: white;
                            padding: 30px;
                            border-radius: 8px;
                            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                        }

                        h1 {
                            text-align: center;
                            color: #333;
                            margin-bottom: 30px;
                            font-size: 28px;
                            text-transform: uppercase;
                        }

                        .table-wrapper {
                            overflow-x: auto;
                        }

                        table {
                            width: 100%;
                            border-collapse: collapse;
                            margin: 0 auto;
                        }

                        thead {
                            background-color: #ff69b4;
                            color: white;
                        }

                        th {
                            padding: 15px;
                            text-align: center;
                            font-weight: bold;
                            border: 1px solid #e91e63;
                            font-size: 14px;
                        }

                        td {
                            padding: 12px 15px;
                            text-align: center;
                            border: 1px solid #e91e63;
                            font-size: 14px;
                        }

                        tbody tr:nth-child(odd) {
                            background-color: #fff5fa;
                        }

                        tbody tr:nth-child(even) {
                            background-color: #ffffff;
                        }

                        tbody tr:hover {
                            background-color: #ffe4f0;
                        }

                        .align-left {
                            text-align: left;
                        }

                        .align-right {
                            text-align: right;
                        }

                        .number {
                            font-family: 'Courier New', monospace;
                            font-weight: 500;
                        }
                    </style>
                </head>

                <body>
                    <div class="container">
                        <h1>Danh sách lương tháng 4/2016</h1>

                        <div class="table-wrapper">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Mã nhân viên</th>
                                        <th>Họ và tên</th>
                                        <th>Nữ</th>
                                        <th>Ngày sinh</th>
                                        <th>Hệ số lương</th>
                                        <th>Lương</th>
                                        <th>Thực làm</th>
                                        <th>Ghi chú</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% BigDecimal luong=new BigDecimal("2340000");
                                     while (rs.next()){
                                            BigDecimal thucnhan=rs.getBigDecimal("hesoluong").multiply(luong); %>
                                        <tr>
                                            <td>
                                                <%= rs.getInt("manv") %>
                                            </td>
                                            <td class="align-left">
                                                <%= rs.getString("hoten") %>
                                            </td>
                                            <td>
                                                <%= "Nữ".equals(rs.getString("gioitinh")) ? "x" : "" %>
                                            </td>
                                            <td>
                                                <%= rs.getDate("ngaysinh") %>
                                            </td>
                                            <td class="number">
                                                <%= rs.getBigDecimal("hesoluong") %>
                                            </td>
                                            <td class="number align-right">
                                                <%= luong %>
                                            </td>
                                            <td class="number align-right">
                                                <%= thucnhan %>
                                            </td>
                                            <td></td>
                                        </tr>
                                        <% } rs.close(); stmt.close(); conn.close(); %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </body>

                </html>
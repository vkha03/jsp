<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Modern Dashboard</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <style>
            :root {
                --primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                --glass-bg: rgba(255, 255, 255, 0.95);
                --glass-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
                --text-color: #2d3748;
                --input-bg: #f7fafc;
            }

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
                background-size: 400% 400%;
                animation: gradientBG 15s ease infinite;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 40px 20px;
                color: var(--text-color);
            }

            .container {
                width: 100%;
                max-width: 1200px;
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
                gap: 30px;
            }

            .card {
                background: var(--glass-bg);
                backdrop-filter: blur(8px);
                border-radius: 20px;
                padding: 30px;
                box-shadow: var(--glass-shadow);
                border: 1px solid rgba(255, 255, 255, 0.18);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                animation: fadeInUp 0.8s cubic-bezier(0.2, 0.8, 0.2, 1);
                animation-fill-mode: both;
            }

            .card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
            }

            .card:nth-child(1) {
                animation-delay: 0.1s;
            }

            .card:nth-child(2) {
                animation-delay: 0.2s;
            }

            .card:nth-child(3) {
                animation-delay: 0.3s;
            }

            .card:nth-child(4) {
                animation-delay: 0.4s;
            }

            h2 {
                font-size: 1.5rem;
                margin-bottom: 20px;
                background: var(--primary-gradient);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                text-align: center;
                font-weight: 700;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: 500;
                font-size: 0.9rem;
                color: #4a5568;
            }

            input[type="text"],
            input[type="password"] {
                width: 100%;
                padding: 12px 15px;
                border-radius: 10px;
                border: 2px solid transparent;
                background: var(--input-bg);
                font-size: 14px;
                transition: all 0.3s ease;
                font-family: inherit;
            }

            input[type="text"]:focus,
            input[type="password"]:focus {
                outline: none;
                background: #fff;
                border-color: #764ba2;
                box-shadow: 0 0 0 3px rgba(118, 75, 162, 0.1);
            }

            .radio-group {
                display: flex;
                gap: 20px;
                padding: 10px 0;
            }

            .radio-group label {
                display: flex;
                align-items: center;
                gap: 5px;
                cursor: pointer;
                margin: 0;
            }

            .btn {
                width: 100%;
                padding: 12px;
                border: none;
                border-radius: 50px;
                background: var(--primary-gradient);
                color: white;
                font-weight: 600;
                font-size: 1rem;
                cursor: pointer;
                transition: all 0.3s ease;
                text-transform: uppercase;
                letter-spacing: 1px;
                margin-top: 10px;
                box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            }

            .btn:hover {
                transform: scale(1.02);
                box-shadow: 0 6px 20px rgba(118, 75, 162, 0.4);
            }

            .result {
                margin-top: 20px;
                padding: 15px;
                border-radius: 10px;
                background: rgba(102, 126, 234, 0.1);
                border-left: 4px solid #764ba2;
                color: #2d3748;
                font-size: 0.95rem;
                line-height: 1.6;
                animation: fadeIn 0.5s ease;
            }

            @keyframes gradientBG {
                0% {
                    background-position: 0% 50%;
                }

                50% {
                    background-position: 100% 50%;
                }

                100% {
                    background-position: 0% 50%;
                }
            }

            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translate3d(0, 40px, 0);
                }

                to {
                    opacity: 1;
                    transform: translate3d(0, 0, 0);
                }
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                }

                to {
                    opacity: 1;
                }
            }

            @media (max-width: 768px) {
                .container {
                    grid-template-columns: 1fr;
                }
            }
        </style>
        <script>
            function valBai1() {
                var f = document.forms["f1"];
                if (f["email"].value == "" || f["hoTen"].value == "" || f["matKhau"].value == "") {
                    alert("Vui lòng nhập đủ thông tin"); return false;
                }
                if (f["matKhau"].value != f["xacNhanMK"].value) {
                    alert("Mật khẩu không khớp"); return false;
                }
                return true;
            }
            function valBai2() {
                var r = document.forms["f2"]["r"].value;
                if (r == "" || isNaN(r) || parseFloat(r) <= 0) {
                    alert("Bán kính phải là số dương"); return false;
                }
                return true;
            }
            function valBai3() {
                var a = document.forms["f3"]["num1"].value;
                var b = document.forms["f3"]["num2"].value;
                if (a == "" || isNaN(a) || b == "" || isNaN(b)) {
                    alert("Phải nhập số hợp lệ"); return false;
                }
                return true;
            }
            function valBai4() {
                var t = document.forms["f4"]["toan"].value;
                var l = document.forms["f4"]["ly"].value;
                var h = document.forms["f4"]["hoa"].value;
                if (t == "" || l == "" || h == "" || isNaN(t) || isNaN(l) || isNaN(h)) {
                    alert("Điểm phải là số"); return false;
                }
                if (t < 0 || t > 10 || l < 0 || l > 10 || h < 0 || h > 10) {
                    alert("Điểm phải từ 0 đến 10"); return false;
                }
                return true;
            }
        </script>
    </head>

    <body>
        <% request.setCharacterEncoding("UTF-8"); String action=request.getParameter("action"); String res1="" , res2=""
            , res3="" , res4="" ; if (action !=null) { if (action.equals("bai1")) { String
            e=request.getParameter("email"); String n=request.getParameter("hoTen"); String
            d=request.getParameter("ngaySinh"); String g=request.getParameter("gioitinh");
            res1="<strong>Họ tên:</strong> " + n + "<br/>" + "<strong>Email:</strong> " + e + "<br/>"
            + "<strong>Ngày sinh:</strong> " + d + "<br/>" + "<strong>Giới tính:</strong> " + (g !=null ? g : "" ); }
            else if (action.equals("bai2")) { try { double r=Double.parseDouble(request.getParameter("r"));
            res2="<strong>Chu vi:</strong> " + String.format("%.2f", 2 * Math.PI * r) + "<br/>"
            + "<strong>Diện tích:</strong> " + String.format("%.2f", Math.PI * r * r); } catch(Exception e){} } else if
            (action.equals("bai3")) { try { double a=Double.parseDouble(request.getParameter("num1")); double
            b=Double.parseDouble(request.getParameter("num2")); res3="<strong>Tổng:</strong> " + (a + b) + "<br/>"
            + "<strong>Tích:</strong> " + (a * b); } catch(Exception e){} } else if (action.equals("bai4")) { try {
            double t=Double.parseDouble(request.getParameter("toan")); double
            l=Double.parseDouble(request.getParameter("ly")); double h=Double.parseDouble(request.getParameter("hoa"));
            double dtb=(t + l + h) / 3; String duoi5="" ; if(t < 5) duoi5 +="Toán, " ; if(l < 5) duoi5 +="Lý, " ; if(h <
            5) duoi5 +="Hóa, " ; if(duoi5.length()> 0) duoi5 = duoi5.substring(0, duoi5.length() - 2);

            res4 = "<strong>Điểm TB:</strong> " + String.format("%.2f", dtb) + "<br />";
            if(!duoi5.isEmpty()) res4 += "<span style='color:red'>Môn < 5: " + duoi5 + " </span>";
                    else res4 += "<span style='color:green'>Không có môn dưới 5</span>";
                    } catch(Exception e){}
                    }
                    }
                    %>

                    <div class="container">
                        <div class="card">
                            <h2>Đăng Ký</h2>
                            <form name="f1" action="" method="POST" onsubmit="return valBai1()">
                                <input type="hidden" name="action" value="bai1">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="text" name="email" placeholder="example@gmail.com">
                                </div>
                                <div class="form-group">
                                    <label>Họ tên</label>
                                    <input type="text" name="hoTen" placeholder="Nguyễn Văn A">
                                </div>
                                <div class="form-group">
                                    <label>Ngày sinh</label>
                                    <input type="text" name="ngaySinh" placeholder="dd/mm/yyyy">
                                </div>
                                <div class="form-group">
                                    <label>Giới tính</label>
                                    <div class="radio-group">
                                        <label><input type="radio" name="gioitinh" value="Nam" checked> Nam</label>
                                        <label><input type="radio" name="gioitinh" value="Nữ"> Nữ</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label>Mật khẩu</label>
                                    <input type="password" name="matKhau">
                                </div>
                                <div class="form-group">
                                    <label>Xác nhận MK</label>
                                    <input type="password" name="xacNhanMK">
                                </div>
                                <button type="submit" class="btn">Đăng Ký Ngay</button>
                            </form>
                            <% if(!res1.isEmpty()) { %>
                                <div class="result">
                                    <%= res1 %>
                                </div>
                                <% } %>
                        </div>

                        <div class="card">
                            <h2>Hình Tròn</h2>
                            <form name="f2" action="" method="POST" onsubmit="return valBai2()">
                                <input type="hidden" name="action" value="bai2">
                                <div class="form-group">
                                    <label>Bán kính (r)</label>
                                    <input type="text" name="r" placeholder="Nhập bán kính...">
                                </div>
                                <button type="submit" class="btn">Tính Toán</button>
                            </form>
                            <% if(!res2.isEmpty()) { %>
                                <div class="result">
                                    <%= res2 %>
                                </div>
                                <% } %>
                        </div>

                        <div class="card">
                            <h2>Tổng & Tích</h2>
                            <form name="f3" action="" method="POST" onsubmit="return valBai3()">
                                <input type="hidden" name="action" value="bai3">
                                <div class="form-group">
                                    <label>Số thứ nhất</label>
                                    <input type="text" name="num1" placeholder="Nhập số A...">
                                </div>
                                <div class="form-group">
                                    <label>Số thứ hai</label>
                                    <input type="text" name="num2" placeholder="Nhập số B...">
                                </div>
                                <button type="submit" class="btn">Kết Quả</button>
                            </form>
                            <% if(!res3.isEmpty()) { %>
                                <div class="result">
                                    <%= res3 %>
                                </div>
                                <% } %>
                        </div>

                        <div class="card">
                            <h2>Điểm Trung Bình</h2>
                            <form name="f4" action="" method="POST" onsubmit="return valBai4()">
                                <input type="hidden" name="action" value="bai4">
                                <div class="form-group">
                                    <label>Điểm Toán</label>
                                    <input type="text" name="toan" placeholder="0 - 10">
                                </div>
                                <div class="form-group">
                                    <label>Điểm Lý</label>
                                    <input type="text" name="ly" placeholder="0 - 10">
                                </div>
                                <div class="form-group">
                                    <label>Điểm Hóa</label>
                                    <input type="text" name="hoa" placeholder="0 - 10">
                                </div>
                                <button type="submit" class="btn">Xem Xếp Hạng</button>
                            </form>
                            <% if(!res4.isEmpty()) { %>
                                <div class="result">
                                    <%= res4 %>
                                </div>
                                <% } %>
                        </div>
                    </div>
    </body>

    </html>
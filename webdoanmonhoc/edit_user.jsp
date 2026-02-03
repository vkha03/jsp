<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<title>Sửa người dùng</title>

<style>
body{
    background:#020617;
    font-family:"Segoe UI", Arial;
    color:#e5e7eb;
}

.box{
    width:420px;
    margin:80px auto;
    background:#020617;
    border:1px solid #1e293b;
    border-radius:14px;
    padding:25px;
}

h2{
    text-align:center;
    color:#facc15;
    margin-bottom:20px;
}

input, select{
    width:100%;
    padding:12px;
    margin-top:12px;
    border-radius:10px;
    border:none;
    background:#0f172a;
    color:white;
}

button{
    width:100%;
    margin-top:18px;
    padding:12px;
    border:none;
    border-radius:10px;
    background:#eab308;
    color:black;
    cursor:pointer;
}

a{
    display:block;
    margin-top:16px;
    text-align:center;
    color:#38bdf8;
    text-decoration:none;
}
</style>
</head>

<body>

<div class="box">
    <h2>✏️ Sửa người dùng</h2>

    <input type="text" placeholder="ID người dùng">
    <input type="text" placeholder="Tên mới">
    <input type="email" placeholder="Email mới">

    <select>
        <option>user</option>
        <option>admin</option>
    </select>

    <button>Cập nhật</button>

    <a href="dashboard.jsp">⬅ Quay lại Dashboard</a>
</div>

</body>
</html>

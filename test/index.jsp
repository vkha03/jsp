<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>JSP Exercises</title>
        <style>
            .question-title {
                font-size: 1.17em;
                font-weight: bold;
                margin-top: 20px;
                margin-bottom: 10px;
            }
        </style>
    </head>

    <body>

        <div class="question-title">1. In dãy số ngược từ 100 – 5</div>
        <div>
            <% for(int i=100; i>= 5; i--) { out.print(i + " "); } %>
        </div>

        <div class="question-title">2. In các số chẵn từ 0 – 100</div>
        <div>
            <% for(int i=0; i <=100; i +=2) { out.print(i + " " ); } %>
        </div>

        <div class="question-title">3. In ra các số chia hết cho 3 từ số 1 – 100</div>
        <div>
            <% for(int i=1; i <=100; i++) { if(i % 3==0) out.print(i + " " ); } %>
        </div>

        <div class="question-title">4. In ra các số chia hết cho 2 và 5 từ số 100 – 200</div>
        <div>
            <% for(int i=100; i <=200; i++) { if(i % 10==0) out.print(i + " " ); } %>

        </div>

        <div class="question-title">5. Tính tổng từ 20 – 50</div>
        <div>
            <% int sum=0; for(int i=20; i <=50; i++) { sum +=i; } out.print(sum); %>
        </div>

        <div class="question-title">6. Liệt kê tất cả các ước số của 20</div>
        <div>
            <% int val=20; for(int i=1; i <=val; i++) { if(val % i==0) out.print(i + " " ); } %>
        </div>

        <div class="question-title">7. Tìm UCLN của 10 và 20</div>
        <div>
            <%! int ucln(int a, int b) { while (b !=0) { int temp=b; b=a % b; a=temp; } return a; } %>
                <% out.print(ucln(10, 20)); %>
        </div>

        <div class="question-title">8. In 10 dòng Lập trình JSP (Chẵn nền xanh)</div>
        <table>
            <thead>
                <tr>
                    <th style="border: 1px solid black;">STT</th>
                    <th style="border: 1px solid black;">Nội dung</th>
                </tr>
            </thead>
            <tbody>
                <% int n=10; String text="Lập trình JSP" ; for(int i=1; i <=n; i++) { String bgColor=(i % 2==0)
                    ? "green" : "" ; %>
                    <tr style=" background-color: <%=bgColor %>">
                        <td style="border: 1px solid black;">
                            <%= i %>
                        </td>
                        <td style="border: 1px solid black;">
                            <%= text %>
                                <% } %>
                        </td>
                    </tr>
            </tbody>
        </table>
    </body>

    </html>
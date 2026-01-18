<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="Login.aspx.vb"
    Inherits="Authentication_Login" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Login | Lecture Reminder System</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #f2f5ff, #eef2f7);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .wrapper {
            width: 100%;
            padding: 20px;
            display: flex;
            justify-content: center;
            perspective: 1200px;
        }

        /* FLIP CARD */
        .flip-card {
            width: 100%;
            max-width: 900px;
        }

        .flip-inner {
            position: relative;
            width: 100%;
            transition: transform 0.8s ease;
            transform-style: preserve-3d;
        }

        .flip-inner.flip {
            transform: rotateY(180deg);
        }

        .card {
            background: #ffffff;
            padding: 40px 50px;
            border-radius: 18px;
            box-shadow: 0 20px 45px rgba(0,0,0,0.15);
            backface-visibility: hidden;
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 28px;
            color: #1f2a44;
        }

        .form-container {
            max-width: 520px;
            margin: 0 auto;
            display: flex;
            flex-direction: column;
            gap: 22px;
        }

        label {
            font-size: 14px;
            margin-bottom: 6px;
            color: #555;
            font-weight: 500;
        }

        input {
            width: 100%;
            padding: 13px 14px;
            font-size: 15px;
            border-radius: 10px;
            border: 1px solid #d4dbea;
            background: #f8faff;
        }

        input:focus {
            outline: none;
            border-color: #5b7cff;
            background: #ffffff;
        }

        .btn-login {
            margin-top: 10px;
            padding: 14px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #5b7cff, #6a88ff);
            color: white;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
        }

        .btn-login:hover {
            background: linear-gradient(135deg, #4a6cff, #5b7cff);
        }

        .link {
            margin-top: 18px;
            text-align: center;
            font-size: 14px;
            color: #666;
        }

        .link a {
            color: #5b7cff;
            font-weight: 500;
            text-decoration: none;
            cursor: pointer;
        }

        .link a:hover {
            text-decoration: underline;
        }

        /* BACK SIDE */
        .card-back {
            position: absolute;
            inset: 0;
            transform: rotateY(180deg);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 22px;
            font-weight: 600;
            color: #5b7cff;
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .card {
                padding: 30px 24px;
            }

            h2 {
                font-size: 24px;
            }
        }
    </style>

    <script>
        function goToRegister() {
            document.getElementById("flipInner").classList.add("flip");

            setTimeout(function () {
                window.location.href = "Register.aspx";
            }, 800); // match CSS animation
        }
    </script>
</head>

<body>
<form id="form1" runat="server">

    <div class="wrapper">
        <div class="flip-card">
            <div class="flip-inner" id="flipInner">

                <!-- FRONT: LOGIN -->
                <div class="card">
                    <h2>Login</h2>

                    <div class="form-container">

                        <div>
                            <label>Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" />
                        </div>

                        <div>
                            <label>Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                        </div>

                        <asp:Button ID="btnLogin"
                                    runat="server"
                                    Text="Login"
                                    CssClass="btn-login" />

                        <div class="link">
                            New user?
                            <a onclick="goToRegister()">Register here</a>
                        </div>

                    </div>
                </div>

                <!-- BACK -->
                <div class="card card-back">
                    Redirecting to Register...
                </div>

            </div>
        </div>
    </div>

</form>
</body>
</html>

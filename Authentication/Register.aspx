<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="Register.aspx.vb"
    Inherits="Authentication_Register" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Register | Lecture Reminder System</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #f2f5ff, #eef2f7);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .register-wrapper {
            width: 100%;
            padding: 20px;
            display: flex;
            justify-content: center;
            perspective: 1200px;
        }

        .flip-card {
            width: 100%;
            max-width: 1000px;
        }

        .flip-inner {
            position: relative;
            width: 100%;
            min-height: 520px;
            transition: transform 0.8s ease;
            transform-style: preserve-3d;
        }

        .flip-inner.flip {
            transform: rotateY(180deg);
        }

        .card {
            background: #ffffff;
            padding: 36px 50px;
            border-radius: 18px;
            box-shadow: 0 20px 45px rgba(0,0,0,0.15);
            backface-visibility: hidden;
        }

        .card h2 {
            text-align: center;
            margin-bottom: 28px;
            font-size: 28px;
            color: #1f2a44;
        }

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

        /* 🔹 FORM GRID */
        .form-container {
            max-width: 700px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group label {
            font-size: 14px;
            margin-bottom: 6px;
            color: #555;
            font-weight: 500;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 13px 14px;
            font-size: 15px;
            border-radius: 10px;
            border: 1px solid #d4dbea;
            background: #f8faff;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #5b7cff;
            background: #ffffff;
        }

        .btn-register {
            padding: 14px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, #5b7cff, #6a88ff);
            color: white;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
        }

        .btn-register:hover {
            background: linear-gradient(135deg, #4a6cff, #5b7cff);
        }

        .login-link {
            margin-top: 18px;
            font-size: 14px;
            color: #666;
        }

        .login-link a {
            color: #5b7cff;
            font-weight: 500;
            text-decoration: none;
            cursor: pointer;
        }

        /* 🔹 FULL WIDTH UTILITY */
        .full-width {
            grid-column: span 2;
            text-align: center;
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .form-container {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: span 1;
            }

            .card {
                padding: 28px 26px;
            }
        }
    </style>

    <script>
        function flipAndGoLogin() {
            document.getElementById("flipInner").classList.add("flip");
            setTimeout(function () {
                window.location.href = "Login.aspx";
            }, 800);
        }
    </script>
</head>

<body>
<form id="form1" runat="server">

    <div class="register-wrapper">
        <div class="flip-card">
            <div class="flip-inner" id="flipInner">

                <!-- FRONT -->
                <div class="card">
                    <h2>User Registration</h2>

                    <div class="form-container">

                        <div class="form-group">
                            <label>Name</label>
                            <asp:TextBox ID="txtName" runat="server" />
                        </div>

                        <div class="form-group">
                            <label>Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" />
                        </div>

                        <div class="form-group">
                            <label>Username</label>
                            <asp:TextBox ID="txtUsername" runat="server" />
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                        </div>

                        <div class="form-group full-width">
                            <label>Role</label>
                            <asp:DropDownList ID="ddlRole" runat="server">
                                <asp:ListItem>Student</asp:ListItem>
                                <asp:ListItem>Teacher</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <asp:Button ID="btnRegister"
                            runat="server"
                            Text="Register"
                            CssClass="btn-register full-width"
                            OnClientClick="flipAndGoLogin(); return false;" />

                        <div class="login-link full-width">
                            Already have an account?
                            <a href="javascript:void(0);" onclick="flipAndGoLogin()">Login here</a>
                        </div>

                    </div>
                </div>

                <!-- BACK -->
                <div class="card card-back">
                    Redirecting to Login...
                </div>

            </div>
        </div>
    </div>

</form>
</body>
</html>

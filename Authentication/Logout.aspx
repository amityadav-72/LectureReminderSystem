<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="Logout.aspx.vb"
    Inherits="Authentication_Logout" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Logout | Confirmation</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #e9efff, #f6f9ff);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        /* CARD */
        .logout-card {
            background: white;
            width: 100%;
            max-width: 420px;
            padding: 32px 30px 36px;
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.18);
            position: relative;
            text-align: center;
        }

        /* CLOSE (CROSS) */
        .close-btn {
            position: absolute;
            top: 14px;
            right: 16px;
            text-decoration: none;
            font-size: 22px;
            color: #999;
            font-weight: bold;
        }

        .close-btn:hover {
            color: #333;
        }

        .logout-card h2 {
            margin-top: 10px;
            font-size: 24px;
            color: #1f2a44;
        }

        .logout-card p {
            margin: 14px 0 28px;
            font-size: 15px;
            color: #555;
        }

        /* BUTTONS */
        .btn-group {
            display: flex;
            gap: 14px;
        }

        .btn {
            flex: 1;
            padding: 12px;
            border: none;
            border-radius: 20px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
        }

        .btn-logout {
            background: #ffebee;
            color: #c62828;
        }

        .btn-logout:hover {
            background: #ffcdd2;
        }

        .btn-cancel {
            background: #e8f5e9;
            color: #2e7d32;
        }

        .btn-cancel:hover {
            background: #c8e6c9;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="logout-card">

        <!-- CROSS BUTTON (CANCEL) -->
        <a href="TeacherDashboard.aspx" class="close-btn" title="Cancel">&times;</a>

        <h2>Confirm Logout</h2>
        <p>Are you sure you want to logout from your account?</p>

        <div class="btn-group">
            <asp:Button
                ID="btnYes"
                runat="server"
                Text="Logout"
                CssClass="btn btn-logout" />

            <asp:Button
                ID="btnNo"
                runat="server"
                Text="Cancel"
                CssClass="btn btn-cancel" />
        </div>

    </div>

</form>
</body>
</html>

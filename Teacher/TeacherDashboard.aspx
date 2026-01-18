<%@ Page Language="VB"
    AutoEventWireup="false"
    CodeFile="TeacherDashboard.aspx.vb"
    Inherits="Teacher_TeacherDashboard"
    ResponseEncoding="utf-8"
    ContentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Teacher Dashboard</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #f2f5ff, #eef2f7);
        }

        /* TOP BAR */
        .topbar {
            background: #ffffff;
            padding: 16px 32px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
        }

        .topbar h1 {
            margin: 0;
            font-size: 22px;
            color: #1f2a44;
        }

        .logout-btn {
            padding: 10px 18px;
            background: #ff5a5a;
            color: #ffffff;
            text-decoration: none;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 500;
        }

        .logout-btn:hover {
            background: #e64949;
        }

        /* MAIN CONTENT */
        .container {
            padding: 40px 60px;
        }

        .welcome {
            font-size: 18px;
            color: #333;
            margin-bottom: 30px;
        }

        /* DASHBOARD CARDS */
        .card-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
        }

        .card {
            background: #ffffff;
            padding: 30px;
            border-radius: 18px;
            box-shadow: 0 18px 40px rgba(0,0,0,0.12);
            text-align: center;
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-6px);
        }

        .card h3 {
            margin-bottom: 12px;
            color: #1f2a44;
            font-size: 20px;
        }

        .card p {
            color: #666;
            font-size: 14px;
            margin-bottom: 20px;
        }

        .card a {
            display: inline-block;
            padding: 12px 24px;
            background: #5b7cff;
            color: #ffffff;
            text-decoration: none;
            border-radius: 12px;
            font-size: 14px;
            font-weight: 500;
        }

        .card a:hover {
            background: #4a6cff;
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .container {
                padding: 30px 20px;
            }

            .topbar {
                padding: 14px 20px;
            }

            .topbar h1 {
                font-size: 18px;
            }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- TOP BAR -->
    <div class="topbar">
        <h1>Teacher Dashboard</h1>

        <asp:HyperLink runat="server"
            NavigateUrl="~/Authentication/Logout.aspx"
            CssClass="logout-btn">
            Logout
        </asp:HyperLink>
    </div>

    <!-- MAIN CONTENT -->
    <div class="container">

        <div class="welcome">
            Welcome,
            <asp:Label ID="lblWelcome" runat="server" Font-Bold="true"></asp:Label>
        </div>

        <div class="card-grid">

            <!-- ADD LECTURE -->
            <div class="card">
                <h3>Add Lecture</h3>
                <p>Create and schedule new lectures for students.</p>
                <asp:HyperLink runat="server" NavigateUrl="AddLecture.aspx">
                    Go
                </asp:HyperLink>
            </div>

            <!-- MANAGE LECTURES -->
            <div class="card">
                <h3>Manage Lectures</h3>
                <p>View, edit, or delete your scheduled lectures.</p>
                <asp:HyperLink runat="server" NavigateUrl="ManageLectures.aspx">
                    Go
                </asp:HyperLink>
            </div>

            <!-- SEND REMINDER -->
            <div class="card">
                <h3>Send Reminder</h3>
                <p>Notify students about upcoming lectures.</p>
                <asp:HyperLink runat="server" NavigateUrl="SendReminder.aspx">
                    Go
                </asp:HyperLink>
            </div>

        </div>
    </div>

</form>
</body>
</html>

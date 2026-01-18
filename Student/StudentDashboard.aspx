<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="StudentDashboard.aspx.vb"
    Inherits="Student_StudentDashboard"
    ResponseEncoding="utf-8"
    ContentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <title>Student Dashboard</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #e9efff, #f6f9ff);
        }

        /* ================= TOP BAR ================= */
        .topbar {
            background: linear-gradient(135deg, #5b7cff, #6a88ff);
            color: white;
            padding: 18px 32px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .topbar h1 {
            margin: 0;
            font-size: 22px;
        }

        .logout-btn {
            display: flex;
            align-items: center;
            gap: 6px;
            color: white;
            text-decoration: none;
            background: rgba(255,255,255,0.25);
            padding: 8px 14px;
            border-radius: 8px;
            font-size: 14px;
        }

        /* ================= CONTAINER ================= */
        .container {
            padding: 40px 32px;
            max-width: 1100px;
            margin: auto;
        }

        /* ================= WELCOME CARD ================= */
        .welcome-card {
            background: white;
            border-radius: 18px;
            padding: 26px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.12);
            margin-bottom: 30px;
        }

        .welcome-card h2 {
            margin: 0 0 6px;
            color: #1f2a44;
        }

        .welcome-card p {
            margin: 0;
            color: #555;
            font-size: 15px;
        }

        /* ================= DASHBOARD GRID ================= */
        .dash-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 24px;
        }

        .dash-card {
            background: white;
            border-radius: 18px;
            padding: 26px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.12);
            text-decoration: none;
            color: #1f2a44;
            transition: transform .2s, box-shadow .2s;
        }

        .dash-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 25px 60px rgba(0,0,0,0.18);
        }

        .dash-card h3 {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 0 0 8px;
            font-size: 18px;
        }

        .dash-left {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .dash-card p {
            margin: 0;
            font-size: 14px;
            color: #555;
        }

        /* ================= ICON ================= */
        .icon {
            width: 22px;
            height: 22px;
            fill: #5b7cff;
        }

        /* ================= BADGE ================= */
        .badge {
            background: #5b7cff;
            color: white;
            padding: 2px 8px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- ================= TOP BAR ================= -->
    <div class="topbar">
        <h1>Student Dashboard</h1>

        <!-- ✅ FIXED LOGOUT PATH -->
        <a href="../Authentication/Logout.aspx" class="logout-btn">
            <svg class="icon" viewBox="0 0 24 24">
                <path d="M16 17v-1a4 4 0 0 0-4-4H5v-2h7a6 6 0 0 1 6 6v1zM12 2a5 5 0 1 1 0 10 5 5 0 0 1 0-10z"/>
            </svg>
            Logout
        </a>
    </div>

    <!-- ================= CONTENT ================= -->
    <div class="container">

        <!-- WELCOME -->
        <div class="welcome-card">
            <h2>Welcome</h2>
            <p>
                <asp:Label ID="lblWelcome" runat="server" Font-Bold="true"></asp:Label>
            </p>
        </div>

        <!-- DASHBOARD ACTIONS -->
        <div class="dash-grid">

            <!-- VIEW LECTURES -->
            <a href="ViewLectures.aspx" class="dash-card">
                <h3>
                    <span class="dash-left">
                        <svg class="icon" viewBox="0 0 24 24">
                            <path d="M3 4h18v16H3V4zm2 2v12h14V6H5z"/>
                        </svg>
                        View Lectures
                    </span>
                </h3>
                <p>Check upcoming and past lectures</p>
            </a>

            <!-- NOTIFICATIONS -->
            <a href="Notifications.aspx" class="dash-card">
                <h3>
                    <span class="dash-left">
                        <svg class="icon" viewBox="0 0 24 24">
                            <path d="M12 22a2 2 0 0 0 2-2h-4a2 2 0 0 0 2 2zm6-6V11a6 6 0 0 0-5-5.91V4a1 1 0 1 0-2 0v1.09A6 6 0 0 0 6 11v5l-2 2v1h16v-1l-2-2z"/>
                        </svg>
                        Notifications
                    </span>

                    <!-- 🔔 NOTIFICATION COUNT -->
                    <asp:Label ID="lblNotifCount"
                        runat="server"
                        Text="2"
                        CssClass="badge"
                        Visible="true" />
                </h3>

                <p>View lecture reminders and updates</p>
            </a>

        </div>

    </div>

</form>
</body>
</html>

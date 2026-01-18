<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="Notifications.aspx.vb"
    Inherits="Student_Notifications"
    ResponseEncoding="utf-8"
    ContentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Notifications</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #e9efff, #f6f9ff);
        }

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

        .back-btn {
            color: white;
            text-decoration: none;
            background: rgba(255,255,255,0.25);
            padding: 8px 14px;
            border-radius: 8px;
            font-size: 14px;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            padding: 0 24px;
        }

        h2 {
            color: #1f2a44;
        }

        .badge {
            background: #5b7cff;
            color: white;
            padding: 4px 10px;
            border-radius: 14px;
            font-size: 13px;
            font-weight: 600;
        }

        .notif-card {
            background: white;
            padding: 18px;
            border-radius: 16px;
            box-shadow: 0 12px 35px rgba(0,0,0,0.12);
            margin-bottom: 14px;
            border-left: 5px solid #5b7cff;
        }

        .notif-title {
            font-weight: 600;
            color: #1f2a44;
        }

        .notif-msg {
            font-size: 14px;
            color: #555;
            margin: 6px 0;
        }

        .notif-time {
            font-size: 12px;
            color: #888;
            text-align: right;
        }

        .btn-read {
            margin-top: 10px;
            background: #e8f5e9;
            color: #2e7d32;
            border: none;
            padding: 6px 14px;
            border-radius: 14px;
            cursor: pointer;
            font-size: 13px;
        }

        .read-card {
            opacity: 0.6;
            border-left-color: #ccc;
        }
    </style>
</head>

<body>
<form runat="server">

    <!-- TOP BAR -->
    <div class="topbar">
        <h1>Notifications</h1>
        <a href="StudentDashboard.aspx" class="back-btn">Back to Dashboard</a>
    </div>

    <div class="container">

        <!-- UNREAD -->
        <h2>
            Unread Notifications
            <asp:Label ID="lblUnreadCount" runat="server" CssClass="badge" />
        </h2>

        <asp:Repeater ID="rptUnread" runat="server" OnItemCommand="MarkAsRead">
            <ItemTemplate>
                <div class="notif-card">
                    <div class="notif-title"><%# Eval("Title") %></div>
                    <div class="notif-msg"><%# Eval("Message") %></div>
                    <div class="notif-time"><%# Eval("CreatedAt") %></div>

                    <asp:Button
                        runat="server"
                        Text="Mark as Read"
                        CssClass="btn-read"
                        CommandName="Read"
                        CommandArgument='<%# Eval("Key") %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <br />

        <!-- READ -->
        <h2>Read Notifications</h2>

        <asp:Repeater ID="rptRead" runat="server">
            <ItemTemplate>
                <div class="notif-card read-card">
                    <div class="notif-title"><%# Eval("Title") %></div>
                    <div class="notif-msg"><%# Eval("Message") %></div>
                    <div class="notif-time"><%# Eval("CreatedAt") %></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>

</form>
</body>
</html>

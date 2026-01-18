<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="SendReminder.aspx.vb"
    Inherits="Teacher_SendReminder" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Send Reminder | Teacher</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #e9efff, #f6f9ff);
        }

        /* TOP BAR (SAME AS MANAGE LECTURES) */
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

        .topbar a {
            color: white;
            text-decoration: none;
            background: rgba(255,255,255,0.25);
            padding: 8px 14px;
            border-radius: 8px;
            font-size: 14px;
        }

        /* CONTAINER */
        .container {
            padding: 35px;
            max-width: 1200px;
            margin: auto;
        }

        .page-title {
            text-align: center;
            font-size: 26px;
            color: #1f2a44;
            margin-bottom: 6px;
        }

        .page-sub {
            text-align: center;
            color: #666;
            margin-bottom: 30px;
        }

        /* FLEX GRID */
        .card-flex {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
        }

        /* CARD (SAME STYLE) */
        .lecture-card {
            background: white;
            border-radius: 18px;
            padding: 22px;
            box-shadow: 0 15px 40px rgba(0,0,0,0.12);
            position: relative;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .lecture-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 25px 60px rgba(0,0,0,0.18);
        }

        .lecture-card h3 {
            margin: 0 0 10px;
            font-size: 18px;
            color: #1f2a44;
        }

        .lecture-card p {
            margin: 6px 0;
            font-size: 14px;
            color: #555;
        }

        .lecture-card strong {
            color: #333;
        }

        /* CHECKBOX */
        .select-box {
            position: absolute;
            top: 18px;
            right: 18px;
            transform: scale(1.3);
        }

        /* SEND BUTTON */
        .send-btn {
            margin: 40px auto 0;
            display: block;
            padding: 14px 40px;
            border: none;
            border-radius: 20px;
            background: linear-gradient(135deg, #5b7cff, #6a88ff);
            color: white;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
        }

        .send-btn:hover {
            opacity: 0.9;
        }

        /* EMPTY */
        .no-data {
            text-align: center;
            color: #777;
            margin-top: 50px;
            font-size: 16px;
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- TOP BAR -->
    <div class="topbar">
        <h1>Send Lecture Reminder</h1>
        <a href="TeacherDashboard.aspx">Back to Dashboard</a>
    </div>

    <div class="container">

        <div class="page-title">Send Lecture Reminder</div>
        <div class="page-sub">Select lectures and notify all students</div>

        <!-- CARD GRID -->
        <div class="card-flex">
            <asp:Repeater ID="rptLectures" runat="server">
                <ItemTemplate>
                    <div class="lecture-card">

                        <asp:CheckBox ID="chkSelect"
                            runat="server"
                            CssClass="select-box"
                            Value='<%# Eval("LectureID") %>' />

                        <h3><%# Eval("SubjectName") %></h3>

                        <p><strong>Course:</strong> <%# Eval("CourseName") %></p>

                        <p><strong>Date:</strong>
                            <%# Convert.ToDateTime(Eval("LectureDate")).ToString("dd MMM yyyy") %>
                        </p>

                        <p><strong>Time:</strong> <%# Eval("LectureTime") %></p>

                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <asp:Label ID="lblEmpty"
            runat="server"
            CssClass="no-data"
            Visible="false"
            Text="No lectures available." />

        <asp:Button ID="btnSend"
            runat="server"
            Text="Send Reminder to Selected Lectures"
            CssClass="send-btn"
            OnClick="btnSend_Click" />

    </div>

</form>
</body>
</html>

<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="ManageLectures.aspx.vb"
    Inherits="Teacher_ManageLectures" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Lectures</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial;
            background: linear-gradient(135deg, #e9efff, #f6f9ff);
        }

        /* ===== TOP BAR ===== */
        .topbar {
            background: linear-gradient(135deg, #5b7cff, #6a88ff);
            color: white;
            padding: 18px 32px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .topbar h2 {
            margin: 0;
            font-size: 22px;
            font-weight: 600;
        }

        .topbar a {
            color: white;
            text-decoration: none;
            background: rgba(255,255,255,0.25);
            padding: 8px 14px;
            border-radius: 8px;
            font-size: 14px;
        }

        /* ===== CONTAINER ===== */
        .container {
            padding: 35px;
            max-width: 1300px;
            margin: auto;
        }

        /* ===== GRID ===== */
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 24px;
        }

        /* ===== CARD ===== */
        .card {
            background: white;
            padding: 22px 24px;
            border-radius: 18px;
            box-shadow: 0 18px 45px rgba(0,0,0,0.12);
            transition: transform .2s ease, box-shadow .2s ease;
        }

        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 28px 60px rgba(0,0,0,0.18);
        }

        .course {
            font-size: 18px;
            font-weight: 600;
            color: #1f2a44;
            margin-bottom: 8px;
        }

        .info {
            font-size: 14px;
            color: #555;
            margin: 6px 0;
        }

        .info span {
            font-weight: 600;
            color: #333;
        }

        /* ===== ACTIONS ===== */
        .actions {
            margin-top: 16px;
            display: flex;
            gap: 12px;
        }

        .btn {
            flex: 1;
            padding: 9px 0;
            border-radius: 20px;
            border: none;
            cursor: pointer;
            font-size: 13px;
            font-weight: 500;
        }

        .edit {
            background: #e8f5e9;
            color: #2e7d32;
        }

        .delete {
            background: #ffebee;
            color: #c62828;
        }

        /* ===== RESPONSIVE ===== */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
            }
        }
    </style>
</head>

<body>
<form runat="server">

    <!-- TOP BAR -->
    <div class="topbar">
        <h2>Manage Lectures</h2>
        <a href="TeacherDashboard.aspx">Back to Dashboard</a>
    </div>

    <!-- CONTENT -->
    <div class="container">

        <div class="grid">

            <asp:Repeater
                ID="rptLectures"
                runat="server"
                OnItemCommand="rptLectures_ItemCommand">

                <ItemTemplate>

                    <div class="card">

                        <div class="course">
                            <%# Eval("CourseName") %>
                        </div>

                        <div class="info">
                            <span>Subject:</span> <%# Eval("SubjectName") %>
                        </div>

                        <div class="info">
                            <span>Date:</span>
                            <%# Eval("LectureDate", "{0:dd MMM yyyy}") %>
                        </div>

                        <div class="info">
                            <span>Time:</span> <%# Eval("LectureTime") %>
                        </div>

                        <div class="info">
                            <span>Faculty:</span> <%# Eval("FacultyName") %>
                        </div>

                        <div class="actions">

                            <asp:Button
                                runat="server"
                                Text="Edit"
                                CssClass="btn edit"
                                PostBackUrl='<%# "EditLecture.aspx?id=" & Eval("LectureID") %>' />

                            <asp:Button
                                runat="server"
                                Text="Delete"
                                CssClass="btn delete"
                                CommandName="Delete"
                                CommandArgument='<%# Eval("LectureID") %>'
                                OnClientClick="return confirm('Delete this lecture?');" />

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>

    </div>

</form>
</body>
</html>

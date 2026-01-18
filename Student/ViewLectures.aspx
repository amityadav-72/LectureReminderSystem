<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="ViewLectures.aspx.vb"
    Inherits="Student_ViewLectures"
    ResponseEncoding="utf-8"
    ContentType="text/html; charset=utf-8" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Available Lectures</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #f0f4ff, #f9fbff);
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
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 24px;
        }

        /* ===== CARD ===== */
        .lecture-card {
            background: #ffffff;
            border-radius: 18px;
            padding: 22px 24px;
            box-shadow: 0 18px 45px rgba(0,0,0,0.12);
            transition: transform 0.25s ease, box-shadow 0.25s ease;
            border-top: 5px solid #5b7cff;
        }

        .lecture-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 28px 60px rgba(0,0,0,0.18);
        }

        .title {
            font-size: 18px;
            font-weight: 600;
            color: #1f2a44;
            margin-bottom: 12px;
        }

        .info {
            font-size: 14px;
            color: #555;
            margin-bottom: 6px;
            line-height: 1.5;
        }

        .label {
            font-weight: 600;
            color: #333;
        }

        /* ===== WATCH BUTTON ===== */
        .watch-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
            margin-top: 16px;
            padding: 11px;
            background: linear-gradient(135deg, #5b7cff, #6a88ff);
            color: white;
            text-decoration: none;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 500;
            transition: background 0.2s ease, transform 0.2s ease;
        }

        .watch-btn:hover {
            background: linear-gradient(135deg, #4a6cff, #5b7cff);
            transform: translateY(-2px);
        }

        /* ===== EMPTY STATE ===== */
        .empty {
            text-align: center;
            color: #777;
            font-size: 16px;
            margin-top: 60px;
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
<form id="form1" runat="server">

    <!-- TOP BAR -->
    <div class="topbar">
        <h2>Available Lectures</h2>
        <a href="StudentDashboard.aspx">Back to Dashboard</a>
    </div>

    <!-- CONTENT -->
    <div class="container">

        <div class="card-container">

            <asp:Repeater ID="rptLectures" runat="server">
                <ItemTemplate>

                    <div class="lecture-card">

                        <div class="title">
                            <%# Eval("CourseName") %>
                        </div>

                        <div class="info">
                            <span class="label">Subject:</span>
                            <%# Eval("SubjectName") %>
                        </div>

                        <div class="info">
                            <span class="label">Faculty:</span>
                            <%# Eval("FacultyName") %>
                        </div>

                        <div class="info">
                            <span class="label">Date:</span>
                            <%# Eval("LectureDate", "{0:dd MMM yyyy}") %>
                        </div>

                        <div class="info">
                            <span class="label">Time:</span>
                            <%# Eval("LectureTime") %>
                        </div>

                        <!-- WATCH BUTTON WITH SVG ICON -->
                        <a class="watch-btn"
                           href='<%# Eval("VideoURL") %>'
                           target="_blank">

                            <svg xmlns="http://www.w3.org/2000/svg"
                                 width="16" height="16"
                                 viewBox="0 0 24 24"
                                 fill="white">
                                <path d="M8 5v14l11-7z"/>
                            </svg>

                            Watch Video
                        </a>

                    </div>

                </ItemTemplate>
            </asp:Repeater>

        </div>

        <!-- EMPTY STATE -->
        <asp:Label ID="lblEmpty"
            runat="server"
            CssClass="empty"
            Visible="false"
            Text="No lectures available at the moment." />

    </div>

</form>
</body>
</html>

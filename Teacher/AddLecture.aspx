<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="AddLecture.aspx.vb"
    Inherits="Teacher_AddLecture" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Add Lecture | Teacher</title>

    <style>
        * { box-sizing: border-box; }

        body {
            margin: 0;
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #e9efff, #f6f9ff);
        }

        /* TOP BAR (SAME THEME) */
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

        /* WRAPPER */
        .page-wrapper {
            padding: 40px 20px;
            display: flex;
            justify-content: center;
        }

        /* CARD */
        .card {
            background: white;
            width: 100%;
            max-width: 850px;
            padding: 40px 48px;
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0,0,0,0.15);
        }

        .card h2 {
            text-align: center;
            font-size: 26px;
            margin-bottom: 30px;
            color: #1f2a44;
        }

        /* FORM */
        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 22px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .form-group.full {
            grid-column: span 2;
        }

        label {
            font-size: 14px;
            margin-bottom: 6px;
            color: #555;
            font-weight: 500;
        }

        input {
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

        small {
            margin-top: 4px;
            font-size: 12px;
            color: #777;
        }

        /* SAVE BUTTON */
        .btn-save {
            margin-top: 30px;
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 20px;
            background: linear-gradient(135deg, #5b7cff, #6a88ff);
            color: white;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
        }

        .btn-save:hover {
            opacity: 0.9;
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .form-grid {
                grid-template-columns: 1fr;
            }

            .form-group.full {
                grid-column: span 1;
            }

            .card {
                padding: 30px 24px;
            }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <!-- TOP BAR -->
    <div class="topbar">
        <h1>Add Lecture</h1>
        <a href="TeacherDashboard.aspx">Back to Dashboard</a>
    </div>

    <!-- MAIN CARD -->
    <div class="page-wrapper">
        <div class="card">

            <h2>Add Lecture</h2>

            <div class="form-grid">

                <div class="form-group">
                    <label>Course Name</label>
                    <asp:TextBox ID="txtCourse" runat="server" />
                </div>

                <div class="form-group">
                    <label>Subject Name</label>
                    <asp:TextBox ID="txtSubject" runat="server" />
                </div>

                <div class="form-group">
                    <label>Faculty Name</label>
                    <asp:TextBox ID="txtFaculty" runat="server" ReadOnly="true" />
                    <small>Auto-filled from login</small>
                </div>

                <div class="form-group">
                    <label>Lecture Date</label>
                    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" />
                </div>

                <div class="form-group">
                    <label>Lecture Time</label>
                    <asp:TextBox ID="txtTime" runat="server" TextMode="Time" />
                </div>

                <div class="form-group full">
                    <label>Video URL</label>
                    <asp:TextBox ID="txtVideo" runat="server" />
                    <small>YouTube / Google Meet / Drive link</small>
                </div>

            </div>

            <asp:Button ID="btnSave"
                runat="server"
                Text="Save Lecture"
                CssClass="btn-save"
                OnClick="btnSave_Click" />

        </div>
    </div>

</form>
</body>
</html>

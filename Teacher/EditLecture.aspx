<%@ Page Language="VB" AutoEventWireup="false"
    CodeFile="EditLecture.aspx.vb"
    Inherits="Teacher_EditLecture" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Edit Lecture</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Arial;
            background: linear-gradient(135deg, #e9efff, #f6f9ff);
        }

        .card {
            max-width: 700px;
            margin: 60px auto;
            background: white;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 20px 50px rgba(0,0,0,0.15);
        }

        h2 { margin-bottom: 20px; }

        label {
            font-weight: 600;
            display: block;
            margin-top: 12px;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .btn-save {
            margin-top: 25px;
            width: 100%;
            padding: 12px;
            background: #5b7cff;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            cursor: pointer;
        }
    </style>
</head>

<body>
<form runat="server">

<div class="card">
    <h2>Edit Lecture</h2>

    <asp:HiddenField ID="hfLectureID" runat="server" />

    <label>Course Name</label>
    <asp:TextBox ID="txtCourse" runat="server" />

    <label>Subject Name</label>
    <asp:TextBox ID="txtSubject" runat="server" />

    <label>Lecture Date</label>
    <asp:TextBox ID="txtDate" runat="server" TextMode="Date" />

    <label>Lecture Time</label>
    <asp:TextBox ID="txtTime" runat="server" TextMode="Time" />

    <label>Video URL</label>
    <asp:TextBox ID="txtVideo" runat="server" />

    <asp:Button
        Text="Update Lecture"
        runat="server"
        CssClass="btn-save"
        OnClick="btnUpdate_Click" />
</div>

</form>
</body>
</html>

Partial Class Authentication_Logout
    Inherits System.Web.UI.Page

    Protected Sub btnYes_Click(sender As Object, e As EventArgs) Handles btnYes.Click
        ' Clear session
        SessionManager.Logout()

        ' Redirect to login
        Response.Redirect("~/Authentication/Login.aspx")
    End Sub

    Protected Sub btnNo_Click(sender As Object, e As EventArgs) Handles btnNo.Click
        ' Redirect based on role
        If SessionManager.Role = "Teacher" Then
            Response.Redirect("~/Teacher/TeacherDashboard.aspx")
        Else
            Response.Redirect("~/Student/StudentDashboard.aspx")
        End If
    End Sub

End Class

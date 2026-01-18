Partial Class Student_StudentDashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        RoleManager.AllowOnly("Student")
        lblWelcome.Text = "Welcome, " & SessionManager.Name
    End Sub

End Class

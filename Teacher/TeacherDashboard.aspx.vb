Partial Class Teacher_TeacherDashboard
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Session("TeacherName") IsNot Nothing Then
                lblWelcome.Text = "" & Session("TeacherName").ToString()
            Else
                lblWelcome.Text = "Teacher"
            End If

        End If
    End Sub
End Class

Partial Class MasterPages_Site
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        ' Prevent unauthorized access
        If SessionManager.UserID = 0 AndAlso
           Not Request.Url.AbsolutePath.Contains("Login.aspx") AndAlso
           Not Request.Url.AbsolutePath.Contains("Register.aspx") Then

            Response.Redirect("~/Authentication/Login.aspx")
        End If
    End Sub

End Class

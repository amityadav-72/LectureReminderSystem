Imports System.Web

Public Class RoleManager

    Public Shared Sub AllowOnly(role As String)
        If SessionManager.Role <> role Then
            HttpContext.Current.Response.Redirect("~/Authentication/Login.aspx")
        End If
    End Sub

End Class

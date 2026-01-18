Imports System.Data.SqlClient

Partial Class Authentication_Login
    Inherits System.Web.UI.Page

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click

        Using con As SqlConnection = DBConnection.GetConnection()
            con.Open()

            Dim sql As String =
                "SELECT UserID, Name, Role FROM Users WHERE Username=@u AND Password=@p"

            Using cmd As New SqlCommand(sql, con)
                ' 🔥 FIXED IDs (MATCH ASPX)
                cmd.Parameters.AddWithValue("@u", txtUsername.Text.Trim())
                cmd.Parameters.AddWithValue("@p", txtPassword.Text.Trim())

                Using dr As SqlDataReader = cmd.ExecuteReader()
                    If dr.Read() Then
                        Session("UserID") = dr("UserID")
                        Session("Name") = dr("Name")
                        Session("Role") = dr("Role")

                        If dr("Role").ToString() = "Teacher" Then
                            Response.Redirect("~/Teacher/TeacherDashboard.aspx")
                        Else
                            Response.Redirect("~/Student/StudentDashboard.aspx")
                        End If
                    Else
                        Response.Write("<script>alert('Invalid Username or Password');</script>")
                    End If
                End Using
            End Using
        End Using

    End Sub

End Class

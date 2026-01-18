Imports System.Data
Imports System.Data.SqlClient

Partial Class Authentication_Register
    Inherits System.Web.UI.Page

    Protected Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click

        Using con As SqlConnection = DBConnection.GetConnection()

            con.Open()   ' ✅ OPEN CONNECTION HERE

            Dim sql As String = _
                "INSERT INTO Users (Name, Email, Username, Password, Role) " & _
                "VALUES (@n,@e,@u,@p,@r)"

            Dim cmd As New SqlCommand(sql, con)

            cmd.Parameters.AddWithValue("@n", txtName.Text)
            cmd.Parameters.AddWithValue("@e", txtEmail.Text)
            cmd.Parameters.AddWithValue("@u", txtUsername.Text)
            cmd.Parameters.AddWithValue("@p", txtPassword.Text)
            cmd.Parameters.AddWithValue("@r", ddlRole.SelectedValue)

            cmd.ExecuteNonQuery()

        End Using

        Response.Write("<script>alert('Registration Successful');</script>")
        Response.Redirect("Login.aspx")

    End Sub

End Class

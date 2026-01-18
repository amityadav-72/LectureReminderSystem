Imports System.Data.SqlClient

Partial Class Teacher_ManageLectures
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        RoleManager.AllowOnly("Teacher")

        If Not IsPostBack Then
            BindLectures()
        End If

    End Sub

    Private Sub BindLectures()

        Using con As SqlConnection = DBConnection.GetConnection()

            Dim sql As String =
                "SELECT LectureID, CourseName, SubjectName, LectureDate, LectureTime, FacultyName FROM Lectures"

            Dim cmd As New SqlCommand(sql, con)
            con.Open()

            Dim dr As SqlDataReader = cmd.ExecuteReader()
            rptLectures.DataSource = dr
            rptLectures.DataBind()

        End Using

    End Sub

    Protected Sub rptLectures_ItemCommand(
        source As Object,
        e As RepeaterCommandEventArgs)

        If e.CommandName = "Delete" Then

            Dim id As Integer
            If Not Integer.TryParse(e.CommandArgument.ToString(), id) Then Exit Sub

            Using con As SqlConnection = DBConnection.GetConnection()

                Dim cmd As New SqlCommand(
                    "DELETE FROM Lectures WHERE LectureID=@id", con)

                cmd.Parameters.AddWithValue("@id", id)
                con.Open()
                cmd.ExecuteNonQuery()

            End Using

            ' Refresh UI
            BindLectures()

        End If

    End Sub

End Class

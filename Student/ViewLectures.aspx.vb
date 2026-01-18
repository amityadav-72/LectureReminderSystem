Imports System.Data
Imports System.Data.SqlClient

Partial Class Student_ViewLectures
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadLectures()
        End If
    End Sub

    Private Sub LoadLectures()

        Using con As SqlConnection = DBConnection.GetConnection()

            Dim sql As String =
                "SELECT CourseName, SubjectName, FacultyName, " &
                "LectureDate, LectureTime, VideoURL FROM Lectures"

            Using da As New SqlDataAdapter(sql, con)
                Dim dt As New DataTable()
                da.Fill(dt)

                rptLectures.DataSource = dt
                rptLectures.DataBind()
            End Using

        End Using

    End Sub

End Class

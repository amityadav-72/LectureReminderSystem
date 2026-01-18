Imports System.Data
Imports System.Data.SqlClient

Partial Class Teacher_AddLecture
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs)
        If Not IsPostBack Then
            ' Optional role check
            ' RoleManager.AllowOnly("Teacher")
        End If
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs)

        Using con As SqlConnection = DBConnection.GetConnection()

            Dim sql As String =
                "INSERT INTO Lectures " &
                "(CourseName, SubjectName, FacultyName, LectureDate, LectureTime, VideoURL, TeacherID) " &
                "VALUES (@c,@s,@f,@d,@t,@v,@tid)"

            Using cmd As New SqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@c", txtCourse.Text.Trim())
                cmd.Parameters.AddWithValue("@s", txtSubject.Text.Trim())
                cmd.Parameters.AddWithValue("@f", txtFaculty.Text.Trim())
                cmd.Parameters.AddWithValue("@d", Convert.ToDateTime(txtDate.Text))
                cmd.Parameters.AddWithValue("@t", txtTime.Text)
                cmd.Parameters.AddWithValue("@v", txtVideo.Text.Trim())
                cmd.Parameters.AddWithValue("@tid", Convert.ToInt32(Session("UserID")))

                con.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using

        Response.Write("<script>alert('Lecture Added Successfully');</script>")

        txtCourse.Text = ""
        txtSubject.Text = ""
        txtFaculty.Text = ""
        txtDate.Text = ""
        txtTime.Text = ""
        txtVideo.Text = ""

    End Sub

End Class

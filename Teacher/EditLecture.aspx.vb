Imports System.Data.SqlClient

Partial Class Teacher_EditLecture
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim id As String = Request.QueryString("id")
            hfLectureID.Value = id

            Using con = DBConnection.GetConnection()

                Dim sql As String =
                    "SELECT CourseName, SubjectName, LectureDate, LectureTime, VideoURL FROM Lectures WHERE LectureID=@id"

                Dim cmd As New SqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@id", id)

                con.Open()
                Dim r As SqlDataReader = cmd.ExecuteReader()

                If r.Read() Then
                    txtCourse.Text = r("CourseName").ToString()
                    txtSubject.Text = r("SubjectName").ToString()
                    txtDate.Text = Convert.ToDateTime(r("LectureDate")).ToString("yyyy-MM-dd")
                    txtTime.Text = r("LectureTime").ToString()
                    txtVideo.Text = r("VideoURL").ToString()
                End If

            End Using

        End If

    End Sub

    ' ✅ NO Handles HERE
    Protected Sub btnUpdate_Click(sender As Object, e As EventArgs)

        Using con = DBConnection.GetConnection()

            Dim sql As String =
                "UPDATE Lectures SET CourseName=@c, SubjectName=@s, LectureDate=@d, LectureTime=@t, VideoURL=@v WHERE LectureID=@id"

            Dim cmd As New SqlCommand(sql, con)

            cmd.Parameters.AddWithValue("@c", txtCourse.Text.Trim())
            cmd.Parameters.AddWithValue("@s", txtSubject.Text.Trim())
            cmd.Parameters.AddWithValue("@d", txtDate.Text)
            cmd.Parameters.AddWithValue("@t", txtTime.Text)
            cmd.Parameters.AddWithValue("@v", txtVideo.Text.Trim())
            cmd.Parameters.AddWithValue("@id", hfLectureID.Value)

            con.Open()
            cmd.ExecuteNonQuery()

        End Using

        Response.Redirect("ManageLectures.aspx")

    End Sub

End Class

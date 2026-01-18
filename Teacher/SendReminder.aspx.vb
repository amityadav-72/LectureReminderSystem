Imports System.Data
Imports System.Data.SqlClient

Partial Class Teacher_SendReminder
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadLectures()
        End If
    End Sub

    Private Sub LoadLectures()
        Using con As SqlConnection = DBConnection.GetConnection()

            Dim sql As String =
                "SELECT LectureID, CourseName, SubjectName, LectureDate, LectureTime " &
                "FROM Lectures WHERE TeacherID = @tid"

            Using cmd As New SqlCommand(sql, con)
                cmd.Parameters.AddWithValue("@tid", Convert.ToInt32(Session("UserID")))

                Using da As New SqlDataAdapter(cmd)
                    Dim dt As New DataTable()
                    da.Fill(dt)

                    If dt.Rows.Count > 0 Then
                        rptLectures.DataSource = dt
                        rptLectures.DataBind()
                        lblEmpty.Visible = False
                    Else
                        lblEmpty.Visible = True
                    End If
                End Using
            End Using
        End Using
    End Sub

    Protected Sub btnSend_Click(sender As Object, e As EventArgs)

        Using con As SqlConnection = DBConnection.GetConnection()
            con.Open()

            For Each item As RepeaterItem In rptLectures.Items

                Dim chk As CheckBox = CType(item.FindControl("chkSelect"), CheckBox)

                If chk IsNot Nothing AndAlso chk.Checked Then

                    Dim lectureId As Integer = Convert.ToInt32(chk.Attributes("value"))

                    Dim sql As String =
                        "INSERT INTO Reminders (LectureID, StudentID, ReminderStatus) " &
                        "SELECT @lid, UserID, 1 FROM Users WHERE Role='Student'"

                    Using cmd As New SqlCommand(sql, con)
                        cmd.Parameters.AddWithValue("@lid", lectureId)
                        cmd.ExecuteNonQuery()
                    End Using

                End If
            Next
        End Using

        Response.Write("<script>alert('Reminder sent successfully');</script>")

    End Sub

End Class

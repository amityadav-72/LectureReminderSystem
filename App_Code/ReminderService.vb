Imports System.Data
Imports System.Data.SqlClient

Public Class ReminderService

    Public Shared Function GetUpcomingReminders(studentId As Integer) As DataTable
        Dim dt As New DataTable()

        Using con As SqlConnection = DBConnection.GetConnection()

            Dim sql As String = _
                "SELECT L.SubjectName, L.LectureDate, L.LectureTime " & _
                "FROM Lectures L " & _
                "JOIN Reminders R ON L.LectureID = R.LectureID " & _
                "WHERE R.StudentID=@sid AND R.ReminderStatus=1"

            Dim cmd As New SqlCommand(sql, con)
            cmd.Parameters.AddWithValue("@sid", studentId)

            Dim da As New SqlDataAdapter(cmd)
            da.Fill(dt)

        End Using

        Return dt
    End Function

End Class

Imports System.Data

Partial Class Student_Notifications
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Session("ReadKeys") Is Nothing _
           OrElse Not TypeOf Session("ReadKeys") Is List(Of String) Then
            Session("ReadKeys") = New List(Of String)
        End If

        If Not IsPostBack Then
            LoadNotifications()
        End If

    End Sub

    Private Sub LoadNotifications()

        Dim source As DataTable =
            ReminderService.GetUpcomingReminders(SessionManager.UserID)

        ' Final table structure for UI
        Dim table As New DataTable()
        table.Columns.Add("Title", GetType(String))
        table.Columns.Add("Message", GetType(String))
        table.Columns.Add("CreatedAt", GetType(String))
        table.Columns.Add("Key", GetType(String))

        Dim unread As DataTable = table.Clone()
        Dim read As DataTable = table.Clone()

        Dim readKeys = CType(Session("ReadKeys"), List(Of String))

        For Each r As DataRow In source.Rows

            ' 🔑 UNIQUE KEY
            Dim key As String =
                r("SubjectName").ToString() & "|" &
                Convert.ToDateTime(r("LectureDate")).ToString("yyyy-MM-dd") & "|" &
                r("LectureTime").ToString()

            Dim title As String = "Lecture Reminder"

            Dim message As String =
                "Your lecture " & r("SubjectName").ToString() &
                " is scheduled on " &
                Convert.ToDateTime(r("LectureDate")).ToString("dd MMM yyyy") &
                " at " & r("LectureTime").ToString()

            Dim createdAt As String =
                Convert.ToDateTime(r("LectureDate")).ToString("dd MMM yyyy")

            ' ✅ CREATE NEW ROW (IMPORTANT)
            Dim newRow As DataRow

            If readKeys.Contains(key) Then
                newRow = read.NewRow()
            Else
                newRow = unread.NewRow()
            End If

            newRow("Title") = title
            newRow("Message") = message
            newRow("CreatedAt") = createdAt
            newRow("Key") = key

            If readKeys.Contains(key) Then
                read.Rows.Add(newRow)
            Else
                unread.Rows.Add(newRow)
            End If

        Next

        rptUnread.DataSource = unread
        rptUnread.DataBind()

        rptRead.DataSource = read
        rptRead.DataBind()

        lblUnreadCount.Text = unread.Rows.Count.ToString()

    End Sub

    Protected Sub MarkAsRead(sender As Object, e As RepeaterCommandEventArgs)

        If e.CommandName = "Read" Then

            Dim key As String = e.CommandArgument.ToString()
            Dim readKeys = CType(Session("ReadKeys"), List(Of String))

            If Not readKeys.Contains(key) Then
                readKeys.Add(key)
            End If

            LoadNotifications()
        End If

    End Sub

End Class

Imports System.Data.SqlClient
Imports System.Configuration

Public Class DBConnection
    Public Shared Function GetConnection() As SqlConnection
        Return New SqlConnection(
            ConfigurationManager.ConnectionStrings("LectureDBConnection").ConnectionString)
    End Function
End Class

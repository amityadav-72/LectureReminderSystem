Imports System.Web

Public Class SessionManager

    Public Shared Property UserID As Integer
        Get
            If HttpContext.Current.Session("UserID") IsNot Nothing Then
                Return CInt(HttpContext.Current.Session("UserID"))
            End If
            Return 0
        End Get
        Set(value As Integer)
            HttpContext.Current.Session("UserID") = value
        End Set
    End Property

    Public Shared Property Name As String
        Get
            Return If(HttpContext.Current.Session("Name"), "")
        End Get
        Set(value As String)
            HttpContext.Current.Session("Name") = value
        End Set
    End Property

    Public Shared Property Role As String
        Get
            Return If(HttpContext.Current.Session("Role"), "")
        End Get
        Set(value As String)
            HttpContext.Current.Session("Role") = value
        End Set
    End Property

    Public Shared Sub Logout()
        HttpContext.Current.Session.Clear()
        HttpContext.Current.Session.Abandon()
    End Sub

End Class

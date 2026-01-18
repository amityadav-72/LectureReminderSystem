Public Class Validation

    Public Shared Function IsEmpty(value As String) As Boolean
        Return String.IsNullOrWhiteSpace(value)
    End Function

    Public Shared Function IsValidEmail(email As String) As Boolean
        Return email.Contains("@") AndAlso email.Contains(".")
    End Function

    Public Shared Function IsStrongPassword(password As String) As Boolean
        Return password.Length >= 6
    End Function

End Class

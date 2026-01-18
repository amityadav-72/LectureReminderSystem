# 📚 Lecture Reminder System  
### Beginner-Friendly Setup Guide (ASP.NET WebForms)

This is a **web application** built using **ASP.NET WebForms (VB.NET)**.  
It allows **teachers to manage lectures** and **students to view lectures, receive reminders, and watch recorded videos**.

This guide is written so that **even a beginner** can run the project successfully.

---

## 🧠 What does this project do?

### 👨‍🏫 Teacher
- Login securely
- Add lectures
- Edit lectures
- Delete lectures
- Send reminders to students

### 👨‍🎓 Student
- Login securely
- View available lectures
- Receive notifications
- Watch lecture videos

---

## 💻 What do you need before starting?

⚠️ **This project runs ONLY on Windows**

### Required Software (Install First)

1. **Windows 10 / 11**
2. **Visual Studio 2019 or 2022 or later**
   - Download: https://visualstudio.microsoft.com/
   - During installation select:
     - ✔ ASP.NET and web development
3. **.NET Framework 4.8**
4. **SQL Server Express / LocalDB**
5. **IIS (Internet Information Services)**

---

## ⚙️ Step 1: Enable IIS (Very Important)

1. Press **Windows + R**
2. Type:
   ```
   optionalfeatures
   ```
3. Enable:
   - Internet Information Services
   - Web Management Tools
   - World Wide Web Services
   - ASP.NET 4.8
4. Restart PC

---

## 📥 Step 2: Download the Project

```bash
git clone https://github.com/amityadav-72/LectureReminderSystem.git
```

OR download ZIP and extract.

---

## 📂 Step 3: Open the Project

1. Open Visual Studio  
2. Open `LectureReminderSystem.sln`

---

## 🗄️ Step 4: Setup Database

1. Open SQL Server Management Studio  
2. Connect to:
   ```
   (localdb)\MSSQLLocalDB
   ```
3. Open `App_Data/Database.sql`
4. Execute the script

---

## 🔌 Step 5: Check Database Connection

In `Web.config`:

```xml
<connectionStrings>
  <add name="DBConnection"
       connectionString="Data Source=(localdb)\MSSQLLocalDB;
                         Initial Catalog=LectureReminderSystem;
                         Integrated Security=True;" />
</connectionStrings>
```

---

## ▶️ Step 6: Run the Project

Press **Ctrl + F5**  
Browser opens at `http://localhost`

🎉 Project is running!


---

## 👤 Author

**Amit Kumar Yadav**  
GitHub: https://github.com/amityadav-72  
LinkedIn: https://www.linkedin.com/in/amityadav72  

---

## 🎓 Final Note

If lectures load in browser, you have successfully run the project.

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <header class="header">
        <div class="container">
            <h1 class="logo">🎓 Xashy Tech University</h1>
            <nav class="nav">
                <a href="${pageContext.request.contextPath}/" class="nav-link">Home</a>
                <a href="${pageContext.request.contextPath}/students" class="nav-link active">Students</a>
                <a href="${pageContext.request.contextPath}/about" class="nav-link">About</a>
            </nav>
        </div>
    </header>

    <main class="main">
        <div class="container">
            <div class="breadcrumb">
                <a href="${pageContext.request.contextPath}/students">← Back to Students</a>
            </div>

            <div class="page-header">
                <h2>👤 Student Details</h2>
            </div>

            <div class="student-detail">
                <div class="student-card">
                    <div class="student-avatar">
                        <div class="avatar-placeholder">
                            ${fn:substring(student.name, 0, 1)}
                        </div>
                    </div>
                    
                    <div class="student-info">
                        <h3><c:out value="${student.name}"/></h3>
                        
                        <div class="info-grid">
                            <div class="info-item">
                                <label>Student ID:</label>
                                <span>${student.id}</span>
                            </div>
                            
                            <div class="info-item">
                                <label>Email Address:</label>
                                <span><c:out value="${student.email}"/></span>
                            </div>
                            
                            <div class="info-item">
                                <label>Major:</label>
                                <span class="major-badge"><c:out value="${student.major}"/></span>
                            </div>
                            
                            <div class="info-item">
                                <label>Enrollment Date:</label>
                                <span>${student.enrollmentDate}</span>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="student-actions">
                    <h4>🔧 Student Actions</h4>
                    <div class="actions-grid">
                        <button class="btn btn-primary" onclick="alert('Edit functionality would be implemented here')">
                            ✏️ Edit Student
                        </button>
                        <button class="btn btn-secondary" onclick="sendEmail('${student.email}')">
                            📧 Send Email
                        </button>
                        <button class="btn btn-outline" onclick="printStudent()">
                            🖨️ Print Details
                        </button>
                    </div>
                </div>

                <div class="academic-info">
                    <h4>📚 Academic Information</h4>
                    <div class="academic-card">
                        <div class="academic-item">
                            <span class="academic-label">Current Status:</span>
                            <span class="status-active">Active</span>
                        </div>
                        <div class="academic-item">
                            <span class="academic-label">Academic Year:</span>
                            <span><%= java.time.Year.now() %></span>
                        </div>
                        <div class="academic-item">
                            <span class="academic-label">Department:</span>
                            <span>School of Technology</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <footer class="footer">
        <div class="container">
            <p>&copy; <%= java.time.Year.now() %> Xashy Tech University. Built for educational purposes.</p>
        </div>
    </footer>

    <script>
        function sendEmail(email) {
            window.location.href = 'mailto:' + email + '?subject=From Xashy Tech University';
        }
        
        function printStudent() {
            window.print();
        }
    </script>
</body>
</html>

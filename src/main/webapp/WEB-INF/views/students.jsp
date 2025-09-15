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
            <div class="page-header">
                <h2>👥 Student Directory</h2>
                <p>Manage and view all enrolled students</p>
            </div>

            <!-- Success/Error Messages -->
            <c:if test="${param.message != null}">
                <div class="alert alert-success">
                    <c:out value="${param.message}"/>
                </div>
            </c:if>
            
            <c:if test="${error != null}">
                <div class="alert alert-error">
                    <c:out value="${error}"/>
                </div>
            </c:if>

            <!-- Add Student Form -->
            <section class="add-student-section">
                <h3>➕ Add New Student</h3>
                <form action="${pageContext.request.contextPath}/students" method="post" class="student-form">
                    <input type="hidden" name="action" value="add">
                    
                    <div class="form-group">
                        <label for="name">Full Name:</label>
                        <input type="text" id="name" name="name" required placeholder="Enter student's full name">
                    </div>
                    
                    <div class="form-group">
                        <label for="email">Email Address:</label>
                        <input type="email" id="email" name="email" required placeholder="student@xashytech.edu">
                    </div>
                    
                    <div class="form-group">
                        <label for="major">Major:</label>
                        <select id="major" name="major" required>
                            <option value="">Select a major</option>
                            <option value="Computer Science">Computer Science</option>
                            <option value="Information Technology">Information Technology</option>
                            <option value="Software Engineering">Software Engineering</option>
                            <option value="Data Science">Data Science</option>
                            <option value="Cybersecurity">Cybersecurity</option>
                        </select>
                    </div>
                    
                    <button type="submit" class="btn btn-primary">Add Student</button>
                </form>
            </section>

            <!-- Students List -->
            <section class="students-list">
                <h3>📋 Current Students</h3>
                
                <c:choose>
                    <c:when test="${empty students}">
                        <div class="empty-state">
                            <p>No students found. Add some students to get started!</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="students-count">
                            <p>Total Students: <strong>${students.size()}</strong></p>
                        </div>
                        
                        <div class="students-table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Major</th>
                                        <th>Enrollment Date</th>
                                        <th>Actions</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="student" items="${students}">
                                        <tr>
                                            <td>${student.id}</td>
                                            <td><c:out value="${student.name}"/></td>
                                            <td><c:out value="${student.email}"/></td>
                                            <td><c:out value="${student.major}"/></td>
                                            <td>${student.enrollmentDate}</td>
                                            <td class="actions">
                                                <a href="${pageContext.request.contextPath}/students?action=view&id=${student.id}" 
                                                   class="btn btn-small btn-secondary">View</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:otherwise>
                </c:choose>
            </section>
        </div>
    </main>

    <footer class="footer">
        <div class="container">
            <p>&copy; <%= java.time.Year.now() %> Xashy Tech University. Built for educational purposes.</p>
        </div>
    </footer>
</body>
</html>

package com.xashytech.university.servlet;

import com.xashytech.university.model.Student;
import com.xashytech.university.service.StudentService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * Servlet for handling student-related requests
 * Demonstrates basic servlet functionality for teaching purposes
 */
public class StudentServlet extends HttpServlet {
    
    private StudentService studentService;
    
    @Override
    public void init() throws ServletException {
        super.init();
        studentService = new StudentService();
        System.out.println("StudentServlet initialized successfully");
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if (action == null || action.equals("list")) {
            listStudents(request, response);
        } else if (action.equals("view")) {
            viewStudent(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String action = request.getParameter("action");
        
        if ("add".equals(action)) {
            addStudent(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid action");
        }
    }
    
    private void listStudents(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        List<Student> students = studentService.getAllStudents();
        request.setAttribute("students", students);
        request.setAttribute("pageTitle", "Student List - Xashy Tech University");
        
        request.getRequestDispatcher("/WEB-INF/views/students.jsp")
               .forward(request, response);
    }
    
    private void viewStudent(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Student ID is required");
            return;
        }
        
        try {
            Long studentId = Long.parseLong(idParam);
            Student student = studentService.getStudentById(studentId);
            
            if (student == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found");
                return;
            }
            
            request.setAttribute("student", student);
            request.setAttribute("pageTitle", "Student Details - " + student.getName());
            
            request.getRequestDispatcher("/WEB-INF/views/student-detail.jsp")
                   .forward(request, response);
                   
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid student ID format");
        }
    }
    
    private void addStudent(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String majorParam = request.getParameter("major");
        
        if (name == null || email == null || majorParam == null || 
            name.trim().isEmpty() || email.trim().isEmpty() || majorParam.trim().isEmpty()) {
            
            request.setAttribute("error", "All fields are required");
            listStudents(request, response);
            return;
        }
        
        Student newStudent = new Student();
        newStudent.setName(name.trim());
        newStudent.setEmail(email.trim());
        newStudent.setMajor(majorParam.trim());
        
        studentService.addStudent(newStudent);
        
        response.sendRedirect(request.getContextPath() + "/students?message=Student added successfully");
    }
    
    @Override
    public void destroy() {
        System.out.println("StudentServlet destroyed");
        super.destroy();
    }
}

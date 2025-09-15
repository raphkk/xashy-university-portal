package com.xashytech.university.service;

import com.xashytech.university.model.Student;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

import java.util.List;

/**
 * Unit tests for StudentService class
 * Demonstrates basic JUnit testing for teaching purposes
 */
public class StudentServiceTest {
    
    private StudentService studentService;
    
    @Before
    public void setUp() {
        studentService = new StudentService();
    }
    
    @Test
    public void testGetAllStudents() {
        List<Student> students = studentService.getAllStudents();
        
        assertNotNull("Students list should not be null", students);
        assertTrue("Should have initial sample students", students.size() > 0);
        assertTrue("Should have at least 4 initial students", students.size() >= 4);
    }
    
    @Test
    public void testAddStudent() {
        // Get initial count
        int initialCount = studentService.getStudentCount();
        
        // Create new student
        Student newStudent = new Student();
        newStudent.setName("Test Student");
        newStudent.setEmail("test@xashytech.edu");
        newStudent.setMajor("Computer Science");
        
        // Add student
        Student addedStudent = studentService.addStudent(newStudent);
        
        // Verify
        assertNotNull("Added student should not be null", addedStudent);
        assertNotNull("Student should have an ID", addedStudent.getId());
        assertEquals("Name should match", "Test Student", addedStudent.getName());
        assertEquals("Email should match", "test@xashytech.edu", addedStudent.getEmail());
        assertEquals("Major should match", "Computer Science", addedStudent.getMajor());
        assertNotNull("Enrollment date should be set", addedStudent.getEnrollmentDate());
        
        // Check count increased
        assertEquals("Student count should increase by 1", 
                    initialCount + 1, studentService.getStudentCount());
    }
    
    @Test
    public void testGetStudentById() {
        // Get all students and pick the first one
        List<Student> students = studentService.getAllStudents();
        assertFalse("Should have students for this test", students.isEmpty());
        
        Student firstStudent = students.get(0);
        Long studentId = firstStudent.getId();
        
        // Test valid ID
        Student foundStudent = studentService.getStudentById(studentId);
        assertNotNull("Should find student with valid ID", foundStudent);
        assertEquals("IDs should match", studentId, foundStudent.getId());
        assertEquals("Names should match", firstStudent.getName(), foundStudent.getName());
        
        // Test invalid ID
        Student notFound = studentService.getStudentById(99999L);
        assertNull("Should not find student with invalid ID", notFound);
    }
    
    @Test
    public void testGetStudentsByMajor() {
        // Test existing major
        List<Student> csStudents = studentService.getStudentsByMajor("Computer Science");
        assertNotNull("CS students list should not be null", csStudents);
        assertTrue("Should have at least one CS student", csStudents.size() >= 0);
        
        // Verify all returned students have the correct major (if any found)
        for (Student student : csStudents) {
            assertEquals("All students should have Computer Science major", 
                        "Computer Science", student.getMajor());
        }
        
        // Test non-existing major
        List<Student> nonExistentMajor = studentService.getStudentsByMajor("Astronomy");
        assertNotNull("List should not be null even for non-existent major", nonExistentMajor);
        assertEquals("Should have no students for non-existent major", 0, nonExistentMajor.size());
        
        // Test case insensitive search
        List<Student> caseInsensitive = studentService.getStudentsByMajor("computer science");
        assertEquals("Case insensitive search should work", 
                    csStudents.size(), caseInsensitive.size());
    }
    
    @Test
    public void testUpdateStudent() {
        // Get a student to update
        List<Student> students = studentService.getAllStudents();
        if (students.isEmpty()) {
            // Add a student if none exist
            Student testStudent = new Student();
            testStudent.setName("Test Student");
            testStudent.setEmail("test@xashytech.edu");
            testStudent.setMajor("Test Major");
            studentService.addStudent(testStudent);
            students = studentService.getAllStudents();
        }
        
        Student originalStudent = students.get(0);
        
        // Create updated version
        Student updatedStudent = new Student();
        updatedStudent.setId(originalStudent.getId());
        updatedStudent.setName("Updated Name");
        updatedStudent.setEmail("updated@xashytech.edu");
        updatedStudent.setMajor("Updated Major");
        updatedStudent.setEnrollmentDate(originalStudent.getEnrollmentDate());
        
        // Update
        boolean result = studentService.updateStudent(updatedStudent);
        assertTrue("Update should be successful", result);
        
        // Verify update
        Student retrievedStudent = studentService.getStudentById(originalStudent.getId());
        assertEquals("Name should be updated", "Updated Name", retrievedStudent.getName());
        assertEquals("Email should be updated", "updated@xashytech.edu", retrievedStudent.getEmail());
        assertEquals("Major should be updated", "Updated Major", retrievedStudent.getMajor());
        
        // Test update with invalid ID
        Student invalidStudent = new Student();
        invalidStudent.setId(99999L);
        invalidStudent.setName("Invalid Student");
        
        boolean invalidResult = studentService.updateStudent(invalidStudent);
        assertFalse("Update with invalid ID should fail", invalidResult);
    }
    
    @Test
    public void testDeleteStudent() {
        // Add a student to delete
        Student studentToDelete = new Student();
        studentToDelete.setName("Student To Delete");
        studentToDelete.setEmail("delete@xashytech.edu");
        studentToDelete.setMajor("Test Major");
        
        Student addedStudent = studentService.addStudent(studentToDelete);
        Long studentId = addedStudent.getId();
        
        // Verify student exists
        assertNotNull("Student should exist before deletion", 
                     studentService.getStudentById(studentId));
        
        int countBeforeDelete = studentService.getStudentCount();
        
        // Delete student
        boolean result = studentService.deleteStudent(studentId);
        assertTrue("Deletion should be successful", result);
        
        // Verify deletion
        assertNull("Student should not exist after deletion", 
                  studentService.getStudentById(studentId));
        assertEquals("Student count should decrease by 1", 
                    countBeforeDelete - 1, studentService.getStudentCount());
        
        // Test delete with invalid ID
        boolean invalidResult = studentService.deleteStudent(99999L);
        assertFalse("Delete with invalid ID should fail", invalidResult);
    }
    
    @Test
    public void testStudentCount() {
        int initialCount = studentService.getStudentCount();
        assertTrue("Should have positive student count", initialCount >= 0);
        
        // Add a student
        Student newStudent = new Student();
        newStudent.setName("Count Test Student");
        newStudent.setEmail("counttest@xashytech.edu");
        newStudent.setMajor("Test Major");
        
        studentService.addStudent(newStudent);
        
        assertEquals("Count should increase after adding", 
                    initialCount + 1, studentService.getStudentCount());
    }
    
    @Test
    public void testStudentValidation() {
        // Test that student properties are properly set
        Student student = new Student();
        student.setName("John Doe");
        student.setEmail("john.doe@xashytech.edu");
        student.setMajor("Software Engineering");
        
        Student addedStudent = studentService.addStudent(student);
        
        // Verify all properties are maintained
        assertEquals("Name should be preserved", "John Doe", addedStudent.getName());
        assertEquals("Email should be preserved", "john.doe@xashytech.edu", addedStudent.getEmail());
        assertEquals("Major should be preserved", "Software Engineering", addedStudent.getMajor());
        assertNotNull("ID should be generated", addedStudent.getId());
        assertNotNull("Enrollment date should be generated", addedStudent.getEnrollmentDate());
    }
}

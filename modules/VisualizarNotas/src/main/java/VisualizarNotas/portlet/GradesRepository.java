package VisualizarNotas.portlet;

import VisualizarNotas.portlet.StudentData;
import java.util.ArrayList;
import java.util.List;

public class GradesRepository {
    private static List<StudentData> grades = new ArrayList<>();

    public static void addGrade(StudentData grade) {
        grades.add(grade);
    }

    public static List<StudentData> getGradesByStudentId(int studentId) {
        List<StudentData> studentGrades = new ArrayList<>();
        for (StudentData grade : grades) {
            if (grade.getStudentId() == studentId) {
                studentGrades.add(grade);
            }
        }
        return studentGrades;
    }
}
package VisualizarNotas.portlet;

import java.io.Serializable;

public class StudentData implements Serializable {
    private int studentId;
    private String subject;
    private double parcial1;
    private double parcial2;
    private double practicas;
    private double examenFinal;
    private double puntuacionFinal;

    // Getters y setters

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public double getParcial1() {
        return parcial1;
    }

    public void setParcial1(double parcial1) {
        this.parcial1 = parcial1;
    }

    public double getParcial2() {
        return parcial2;
    }

    public void setParcial2(double parcial2) {
        this.parcial2 = parcial2;
    }

    public double getPracticas() {
        return practicas;
    }

    public void setPracticas(double practicas) {
        this.practicas = practicas;
    }

    public double getExamenFinal() {
        return examenFinal;
    }

    public void setExamenFinal(double examenFinal) {
        this.examenFinal = examenFinal;
    }

    public double getPuntuacionFinal() {
        return puntuacionFinal;
    }

    public void setPuntuacionFinal(double puntuacionFinal) {
        this.puntuacionFinal = puntuacionFinal;
    }
}

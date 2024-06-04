package VisualizarNotas.portlet;

import com.google.gson.Gson;
import VisualizarNotas.portlet.StudentData;
import VisualizarNotas.portlet.GradesRepository;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.stream.Collectors;

@WebServlet("/save-grades")
public class SaveGradesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtener datos del request
            String studentDataJson = request.getReader().lines().collect(Collectors.joining());
            Gson gson = new Gson();
            StudentData studentData = gson.fromJson(studentDataJson, StudentData.class);

            // Guardar datos en el repositorio en memoria
            GradesRepository.addGrade(studentData);

            // Enviar respuesta
            response.setContentType("application/json");
            response.getWriter().write("{\"success\": true}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("application/json");
            response.getWriter().write("{\"success\": false}");
        }
    }
}
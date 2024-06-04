<%@ page import="java.util.List" %>
<%@ page import="VisualizarNotas.portlet.StudentData" %>

<%@ include file="/init.jsp" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<portlet:defineObjects />

<!-- Agregar los recursos de Handsontable -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/handsontable/dist/handsontable.full.min.css">
<script src="https://cdn.jsdelivr.net/npm/handsontable/dist/handsontable.full.min.js"></script>

<!-- Agregar tu script después de Handsontable -->
<script src="${request.contextPath}/o/VisualizarNotas/js/saveGrades.js"></script>

<div id="hot" style="margin-top: 20px;"></div>

<!-- Agregar un espacio -->
<div style="margin-bottom: 20px;"></div>

<button id="saveGradesButton">Guardar Notas</button>
<button onclick="calculateTotal()">Calcular Total</button>

<h2>Mis Notas</h2>
<table>
    <thead>
        <tr>
            <th>Asignatura</th>
            <th>Parcial 1</th>
            <th>Parcial 2</th>
            <th>Prácticas</th>
            <th>Examen Final</th>
            <th>Puntuación Final</th>
        </tr>
    </thead>
    <tbody>
        <%
        List<StudentData> grades = (List<StudentData>) request.getAttribute("grades");
        if (grades != null && !grades.isEmpty()) {
            for (StudentData grade : grades) {
        %>
        <tr>
            <td><%= grade.getSubject() %></td>
            <td><%= grade.getParcial1() %></td>
            <td><%= grade.getParcial2() %></td>
            <td><%= grade.getPracticas() %></td>
            <td><%= grade.getExamenFinal() %></td>
            <td><%= grade.getPuntuacionFinal() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="6">No hay notas disponibles.</td>
        </tr>
        <%
        }
        %>
    </tbody>
</table>

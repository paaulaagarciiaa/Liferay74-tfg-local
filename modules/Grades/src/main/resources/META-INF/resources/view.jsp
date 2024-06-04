<%@ include file="/init.jsp" %>
<%@ page import="com.liferay.portal.kernel.util.ParamUtil" %>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<portlet:defineObjects />

<!-- Agregar los recursos de Handsontable -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/handsontable/dist/handsontable.full.min.css">
<link rel="stylesheet" type="text/css" href="${request.contextPath}/css/main.scss">
<script src="https://cdn.jsdelivr.net/npm/handsontable/dist/handsontable.full.min.js"></script>

<div id="hot"></div>

<!-- Agregar un espacio -->
<div style="margin-bottom: 20px;"></div>

<button onclick="calculateTotal()">Calcular Total</button>
<script>
document.addEventListener('DOMContentLoaded', function() {
    const container = document.getElementById('hot');
    const initialData = [
        ['Estudiante', 'x', 'x', 'x', 'x', 'Puntuacion Final'],
        ['Porcentajes', 0, 0, 0, 0, 100],
        ['Puntuacion', 0, 0, 0, 0, '']
    ];

    const hot = new Handsontable(container, {
        data: initialData,
        rowHeaders: true,
        colHeaders: true,
        formulas: true,
        contextMenu: true,
        licenseKey: 'non-commercial-and-evaluation'
    });

    hot.addHook('afterInit', function() {
        hot.updateSettings({
            cells: function (row, col) {
                var cellProperties = {};
                if (row === 1 || row === 2) {
                    cellProperties.type = 'numeric';
                    cellProperties.format = '0.00';
                }
                if (row === 2 && col === hot.countCols() - 1) {
                    cellProperties.readOnly = true; // La celda de puntuación final es de solo lectura
                }
                return cellProperties;
            }
        });
    });

    window.calculateTotal = function() {
        const data = hot.getData();
        const porcentaje = data[1].slice(1, -1).map(Number); // Omitir última columna
        const puntuacion = data[2].slice(1, -1).map(Number); // Omitir última columna
        let total = 0;

        for (let i = 0; i < porcentaje.length; i++) {
            total += puntuacion[i] * (porcentaje[i] / 100);
        }

        total = Math.round(total * 100) / 100; // Redondear a dos decimales
        hot.setDataAtCell(2, hot.countCols() - 1, total); // Última columna
    }
});
</script>

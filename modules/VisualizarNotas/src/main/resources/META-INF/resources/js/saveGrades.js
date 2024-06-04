document.addEventListener('DOMContentLoaded', function() {
    const container = document.getElementById('hot');
    const hot = new Handsontable(container, {
        data: [
            ['Estudiante', 'Parcial 1', 'Parcial 2', 'Prácticas', 'Examen final', 'Puntuación Final'],
            ['Porcentajes', 20, 20, 30, 30, 100],
            ['Puntuación', 0, 0, 0, 0, '']
        ],
        rowHeaders: true,
        colHeaders: true,
        contextMenu: true,
        formulas: true,
        cells: function (row, col) {
            var cellProperties = {};
            if (row === 1 || row === 2) {
                cellProperties.type = 'numeric';
                cellProperties.format = '0.00';
            }
            if (row === 2 && col === 5) {
                cellProperties.readOnly = true; // La celda de puntuación final es de solo lectura
            }
            return cellProperties;
        },
        licenseKey: 'non-commercial-and-evaluation'
    });

    window.calculateTotal = function() {
        const data = hot.getData();
        const porcentaje = data[1].slice(1, 5).map(Number);
        const puntuacion = data[2].slice(1, 5).map(Number);
        let total = 0;

        for (let i = 0; i < porcentaje.length; i++) {
            total += puntuacion[i] * (porcentaje[i] / 100);
        }

        total = Math.round(total * 100) / 100; // Redondear a dos decimales
        hot.setDataAtCell(2, 5, total);
    }

    const saveButton = document.getElementById('saveGradesButton');
    saveButton.addEventListener('click', function() {
        const data = hot.getData();

        // Crear el objeto con los datos necesarios
        const studentData = {
            studentId: 1,  // Esto debería ser dinámico, tal vez basado en la entrada del usuario
            subject: 'Asignatura Ejemplo', // Asegúrate de proporcionar un valor de asignatura válido
            parcial1: data[2][1],
            parcial2: data[2][2],
            practicas: data[2][3],
            examenFinal: data[2][4],
            puntuacionFinal: data[2][5]
        };

        // Convertir a JSON
        const studentDataJson = JSON.stringify(studentData);

        // Enviar datos al servidor
        fetch(${'request.contextPath}/o/VisualizarNotas/save-grades', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: studentDataJson
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                alert('Notas guardadas exitosamente');
            } else {
                alert('Error al guardar las notas');
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert('Error al guardar las notas');
        });
    });
});

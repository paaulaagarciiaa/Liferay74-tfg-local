<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<portlet:defineObjects />
<link rel="stylesheet" type="text/css" href="${request.contextPath}/css/main.scss">

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Ecualizador</title>
    <style>
        #audioContainer {
            display: none;
        }
    </style>
</head>
<body>
    <h2>Ecualizador</h2>

    <label for="audioURL">Inserta la URL del audio:  </label>
    <input type="text" id="audioURL" placeholder="http://example.com/audio.mp3">
    <br>
    <br>
    <button onclick="updateAudioSource()">Cargar Audio</button>

    <div id="audioContainer">
        <br>
        <audio id="audioPlayer" controls>
            <source id="audioSource" src="" type="audio/mpeg">
            Tu navegador no soporta el elemento de audio.
        </audio>

        <p>Modifica las frecuencias:</p>

        <div>
            <label for="Bajas">Bajas:</label>
            <input type="range" id="Bajas" value="0" min="-40" max="40" step="1" onchange="changeEQ(this.value, 'Bajas')">

            <label for="Medias">Medias:</label>
            <input type="range" id="Medias" value="0" min="-40" max="40" step="1" onchange="changeEQ(this.value, 'Medias')">

            <label for="Altas">Altas:</label>
            <input type="range" id="Altas" value="0" min="-40" max="40" step="1" onchange="changeEQ(this.value, 'Altas')">
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var audioCtx = new (window.AudioContext || window.webkitAudioContext)();
            var audioElement = document.getElementById('audioPlayer');
            var audioSrc = audioCtx.createMediaElementSource(audioElement);
            var bassEQ = audioCtx.createBiquadFilter();
            bassEQ.type = 'lowshelf';
            bassEQ.frequency.value = 100;

            var midEQ = audioCtx.createBiquadFilter();
            midEQ.type = 'peaking';
            midEQ.Q.value = 1;
            midEQ.frequency.value = 1000;

            var trebleEQ = audioCtx.createBiquadFilter();
            trebleEQ.type = 'highshelf';
            trebleEQ.frequency.value = 3000;

            // Connect everything
            audioSrc.connect(bassEQ);
            bassEQ.connect(midEQ);
            midEQ.connect(trebleEQ);
            trebleEQ.connect(audioCtx.destination);

            window.changeEQ = function (value, filter) {
                if (filter === 'Bajas') {
                    bassEQ.gain.value = parseFloat(value);
                } else if (filter === 'Medias') {
                    midEQ.gain.value = parseFloat(value);
                } else if (filter === 'Altas') {
                    trebleEQ.gain.value = parseFloat(value);
                }
            };
        });

        function updateAudioSource() {
            var audioURL = document.getElementById('audioURL').value;
            var audioSource = document.getElementById('audioSource');
            audioSource.src = audioURL;
            var audioPlayer = document.getElementById('audioPlayer');
            audioPlayer.load();
            document.getElementById('audioContainer').style.display = 'block';
        }
    </script>
</body>
</html>

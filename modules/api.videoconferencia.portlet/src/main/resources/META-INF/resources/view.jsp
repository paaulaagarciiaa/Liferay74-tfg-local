<%@ include file="/init.jsp" %>

<div id="jitsi-container" style="width:800px; height:600px;"></div>
<script src="https://meet.jit.si/external_api.js"></script>
<script>
    const domain = "meet.jit.si";
    const options = {
        roomName: "URJC a distancia",
        width: 800,
        height: 600,
        parentNode: document.querySelector('#jitsi-container'),
        userInfo: {
            email: 'user@example.com',
            displayName: 'User'
        }
    };
    const api = new JitsiMeetExternalAPI(domain, options);
</script>
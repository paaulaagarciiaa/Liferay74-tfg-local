<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<portlet:defineObjects />

<link rel="stylesheet" type="text/css" href="${request.contextPath}/css/main.scss">

<form action="https://www.gutenberg.org/ebooks/search/" method="get" target="_blank">
    <h2>Buscar Libros</h2>
    <input type="text" name="query" placeholder="Ingrese titulo..." required>
    <input type="submit" value="Buscar">
</form>

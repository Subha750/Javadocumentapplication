<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="ISO-8859-1">
<title>File Uploading Form..</title>
</head>

<body>
<h3>Please upload your Image(jpg)/File</h3>
Select a file to upload: <br />
<form action="fileupload" method="post" enctype="multipart/form-data">
<input type="file" name="File" size="50"/>
<br />
<input type="submit" value="Upload File"/>

</form>

</body>
</html>
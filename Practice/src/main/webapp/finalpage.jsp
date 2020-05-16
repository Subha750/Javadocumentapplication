<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
                                                          <a href="logout">Logout</a>
<p>
How to check a specific duplicate 2nd ocurance to replace anather character? <br>
<code>
class Test {
	public static void main(String[] args) {
		String a = "amitad vdansa nkadna";
		String[] a1 = a.split(" ");
		char[] strs = null;
		for (String a3 : a1)
		{
			strs = a3.toCharArray();
		for (int i = 0; i < strs.length; i++) {
			for (int j = i + 1; j < strs.length; j++) {
				if (strs[i] == strs[j]) {
					if ((strs[j] == 'a')) {

						strs[j] = 'k';
					}
				}
			}
			System.out.print(strs[i]);
		}
		

	}}
}
</code>
</p>


</body>
</html>
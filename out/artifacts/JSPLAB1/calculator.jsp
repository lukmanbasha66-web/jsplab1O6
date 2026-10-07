<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>JSP Calculator</title>
</head>

<body>

<h2>Simple JSP Calculator</h2>

<form method="post" action="calculator.jsp">

    Number 1:
    <input type="number" name="num1" required>

    <br><br>

    Number 2:
    <input type="number" name="num2" required>

    <br><br>

    Operation:
    <select name="operation">
        <option value="add">Addition</option>
        <option value="sub">Subtraction</option>
        <option value="mul">Multiplication</option>
        <option value="div">Division</option>
    </select>

    <br><br>

    <input type="submit" value="Calculate">

</form>

<%
    String n1 = request.getParameter("num1");
    String n2 = request.getParameter("num2");
    String operation = request.getParameter("operation");

    if (n1 != null && n2 != null && operation != null) {

        double num1 = Double.parseDouble(n1);
        double num2 = Double.parseDouble(n2);
        double result = 0;

        if (operation.equals("add")) {
            result = num1 + num2;
        }
        else if (operation.equals("sub")) {
            result = num1 - num2;
        }
        else if (operation.equals("mul")) {
            result = num1 * num2;
        }
        else if (operation.equals("div")) {

            if (num2 == 0) {
                out.println("<h3>Cannot divide by zero</h3>");
            } else {
                result = num1 / num2;
                out.println("<h3>Result = " + result + "</h3>");
            }
        }

        if (!operation.equals("div") || num2 != 0) {
            out.println("<h3>Result = " + result + "</h3>");
        }
    }
%>

</body>
</html>
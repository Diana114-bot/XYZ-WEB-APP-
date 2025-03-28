<%-- 
    Document   : outcome
    Created on : Mar 27, 2025, 12:17:07 PM
    Author     : zwivhuya sagida
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Outcome page</title>
    </head>
    <body>
        <h1>Welcome to XYZ premises</h1>

        <%
            String name = request.getParameter("name");

            Random ram = new Random();
            int temperature = ram.nextInt(50 - 15 + 1) + 15;
            boolean hasMask = ram.nextBoolean();
            boolean sanitise = ram.nextBoolean();

            String outcome = classifyAccess(temperature, hasMask, sanitise);
        %>
        <p>
        <h3>Hello <%=name%></h3><br>
            Your Temperature is: <%=temperature%> degrees.<br>
            Does he/She has Mask? <%=hasMask%><br>
            Does he/She is willing to sanitise? <%=sanitise%><br>
            <%=outcome%><br>
            Click<a href="index.html"> here</a> to go back to main page.
        </p>

        <%!
            public static String classifyAccess(int temp, boolean hasMask, boolean sanitise) {

                String message = "";
                if (temp < 38 ) {
                    if(hasMask == true){
                        if(sanitise == true){
                             message = "You are welcome at XYZ premises!!";
                        }else{
                            message = "Your Access is denied because you did not sanitize even though you are wearing your mask";
                        }
                    }else{
                        if(sanitise == true){
                            message = "Your Access is denied because you did not wear your mask";
                        }else
                            message = "Your Access is denied because you did not wear your mask and not sanitized";
                        
                    }
                } else {
                    if(sanitise == true && hasMask == true){
                            message = "Your Access is denied because your temperature is "+temp+"(which is high)";
                        }else if(sanitise == true && hasMask == false){
                            message = "Your Access is denied because your temperature is "+temp+"(which is high) and you are not wearing ur mask";
                        }else if(sanitise == false && hasMask == true){
                             message = "Your Access is denied because your temperature is "+temp+"(which is high) and you did not sanitize";
                        }else
                             message = "Your Access is denied because your temperature is "+temp+"(which is high),you did not sanitize and you are not wearing ur mask";
                            
                    
                }
                return message;
            }

        %>
    </body>
</html>

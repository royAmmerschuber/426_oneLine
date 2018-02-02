package Control;

import javax.servlet.RequestDispatcher;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

@javax.servlet.annotation.WebServlet(name = "Register")
public class Register extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        BufferedReader r=request.getReader();
        String l=r.readLine();
        String[] x=l.split("&");
        HashMap<String,String> values=new HashMap<>();
        for (String y:x) {
            String[] pair=y.split("=");
            values.put(pair[0],pair[1]);
        }

        //name=test&firstName=test&userName=test&password1=test&password2=test&email=test%40test.cj&phone=test&country=test&city=test&street=test&plz=test
        if(values.get("password1").equals(values.get("password2"))){

            if(Login.addUser(
                    values.get("userName"),
                    values.get("password1"),
                    values.get("firstName"),
                    values.get("name"),
                    values.get("country"),
                    values.get("city"),
                    values.get("plz"),
                    values.get("street"),
                    values.get("email"),
                    values.get("phone")
            )){
                response.sendRedirect("/Auth/Login");
                return;
            }else{
                request.getRequestDispatcher("/Register.jsp").forward(request,response);

            }


        }else{
            request.getRequestDispatcher("/Register.jsp").forward(request,response);

        }
        request.getRequestDispatcher("/Register.jsp").forward(request,response);

    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        /*response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        try(PrintWriter w=response.getWriter()){
            w.println("<h1>hello</h1> ");
        }*/
        request.getRequestDispatcher("/Register.jsp").forward(request,response);
    }
}

package Control;

import javax.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;

@javax.servlet.annotation.WebServlet(name = "Register")
public class Register extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        if(request.getParameter("password1")==request.getParameter("password2")){
            if(Login.addUser(
                    request.getParameter("userName"),
                    request.getParameter("password1"),
                    request.getParameter("firstName"),
                    request.getParameter("name"),
                    request.getParameter("country"),
                    request.getParameter("city"),
                    request.getParameter("plz"),
                    request.getParameter("street"),
                    request.getParameter("email"),
                    request.getParameter("phone")
            )){
                request
            }else{
                RequestDispatcher rd= request.getRequestDispatcher("/Register.jsp");
                rd.include(request,response);
            }
        }
        request.getParameter("");
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

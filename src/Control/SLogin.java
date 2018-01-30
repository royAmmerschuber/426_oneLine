package Control;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "SLogin")
public class SLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HashMap<String,String> values=new HashMap<>();
        for (String x:request.getReader().readLine().split("&")) {
            String[] pair=x.split("=");
            values.put(pair[0],pair[1]);
        }
        //---------------------------------------------------------------
        if(Login.check(values.get("username"),values.get("pass"))){

            HttpSession s=request.getSession();
            s.setAttribute("name",values.get("username"));
            response.sendRedirect("/Shop/Main");
        }else{
            request.getRequestDispatcher("/login.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request,response);
    }
}

package Control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SKart")
public class SKart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("id")==null){
            response.sendRedirect("/Auth/Login");
            return;
        }
        if(request.getParameter("id")!=null){

            if(Verkauf.toKart(Integer.parseInt(request.getParameter("id")),Integer.parseInt(request.getParameter("amount")),(int)request.getSession().getAttribute("id"))){
                request.getRequestDispatcher("/kart.jsp").forward(request,response);
            }else{
                request.getRequestDispatcher("/Shop/Details").include(request,response);
            }
        }else{
            request.getRequestDispatcher("/kart.jsp").forward(request,response);
        }

    }
}

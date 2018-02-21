package Control;

import Persistence.Database;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;

@WebServlet(name = "SBuy")
public class SBuy extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("id")==null){
            response.sendRedirect("/Auth/Login");
            return;
        }
        if(Verkauf.buy((int)request.getSession().getAttribute("id"))){
            request.getRequestDispatcher("/OrderComplete.jsp").forward(request,response);
        }else{
            response.sendRedirect("/Shop/Kart");
        }

    }
}

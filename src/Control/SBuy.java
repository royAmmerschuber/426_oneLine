package Control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SBuy")
public class SBuy extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("id")==null){
            response.sendRedirect("/Auth/Login");
            return;
        }
        Verkauf.buy(Integer.parseInt(request.getParameter("id")),Integer.parseInt(request.getParameter("amount")));
        request.getRequestDispatcher("/OrderComplete.jsp").forward(request,response);
    }
}

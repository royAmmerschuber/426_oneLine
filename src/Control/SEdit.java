package Control;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "SEdit")
public class SEdit extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("id")==null){
            response.sendRedirect("/Auth/Login");
            return;
        }
        if(request.getParameter("id")!=null){
            String action=request.getParameter("act");
            int id=Integer.parseInt(request.getParameter("id"));
            switch (action){
                case "del":{
                    Verkauf.dropProduct(id);
                }break;
                case "setDisc":{
                    double price=Double.parseDouble(request.getParameter("price"));
                    Verkauf.setDiscount(id,price);
                }break;
                case "delDisc":{
                    Verkauf.dropDiscount(id);
                }break;
            }
        }
        response.sendRedirect("/Shop/MyProd");
    }
}

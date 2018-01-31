package Control;

import Persistence.Database;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.util.HashMap;

@WebServlet(name = "SSell")
@MultipartConfig
public class SSell extends HttpServlet {
    private final String IMAGE_PATH = "C:\\images";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*HashMap<String,String> values=new HashMap<>();
        BufferedReader r=request.getReader();
        for (String x:r.readLine().split("&")) {

            String[] pair=x.split("=");
            //values.put(pair[0],pair[1]);
        }
        r.close();*/
        //---------------------------------------------------------------
        Part file=request.getPart("image");
        Double rand=Math.random()*10000;
        String filename=Integer.toString(rand.intValue())+getFileName(file);

        OutputStream out=null;
        InputStream in=null;
        try{
            out=new FileOutputStream(new File(IMAGE_PATH+File.separator+filename));
            in=file.getInputStream();
            int read;
            byte[] b=new byte[1024];
            while((read=in.read(b))!=-1){
                out.write(b,0,read);
            }

        }catch (FileNotFoundException e){
            e.printStackTrace();
        }
        if(out!=null){
            out.close();
        }
        if(in!=null){
            in.close();
        }
        Verkauf.addProduct(
                request.getParameter("name"),
                Integer.parseInt(request.getParameter("amount")),
                request.getParameter("descr"),
                Float.parseFloat(request.getParameter("price")),
                (int)request.getSession().getAttribute("id"),
                "Fish",
                filename);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("id")==null){
            response.sendRedirect("/Auth/Login");
        }else {
            request.getRequestDispatcher("/Verkauf.jsp").forward(request, response);
        }
    }
    private String getFileName(final Part part) {
        //final String partHeader = part.getHeader("content-disposition");
        //LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}

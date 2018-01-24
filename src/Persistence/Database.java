package Persistence;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;

import java.util.Properties;

public class Database {
    private static Connection con;
    public static Connection getConnection  (){
        if(con ==null){
            try {
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/426","root","");

            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return con;
    }
}

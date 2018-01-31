package Control;

import Persistence.Database;

import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Verkauf {
    public static boolean addProduct( String name, int amount,String description, int price){

        try {
            PreparedStatement p;/*=Database.getConnection().prepareStatement("select count(*) from User WHERE userName=?");
            p.setString(1,name);
            ResultSet rs=p.executeQuery();
            rs.next();
            if(rs.getInt(1)!=0){
                return false;
            }*/
            p= Database.getConnection().prepareStatement(
                    "INSERT INTO product ( name,amount,description, price) VALUES (?,?,?,?);");

            p.setString(1,name);
            p.setInt(2,amount);
            p.setString(3,description);
            p.setInt(4,price);


            p.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }


}

package Control;

import Persistence.Database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Verkauf {
    public static int addProduct( String name, int amount,String description, float price, int userId,String category,String image){

        try {
            PreparedStatement p= Database.getConnection().prepareStatement(
                    "INSERT INTO product ( name,amount,description, price,sellerFK,categoryFK) VALUES " +
                            "(?,?,?,?,?,(SELECT  id from Category where name=?));");
            p.setString(1,name);
            p.setInt(2,amount);
            p.setString(3,description);
            p.setFloat(4,price);
            p.setInt(5,userId);
            p.setString(6,category);
            p.execute();
            p=Database.getConnection().prepareStatement(
                    "INSERT INTO image (productFK,image) VALUES " +
                            "((select id FROM product where name=? and description=? and sellerFK=? ORDER BY id DESC LIMIT 1),?)");
            p.setString(1,name);
            p.setString(2,description);
            p.setInt(3,userId);
            p.setString(4,image);
            p.execute();
            p=Database.getConnection().prepareStatement(
                    "SELECT id from product where name=? AND description=? and sellerFK=? ORDER BY id DESC LIMIT 1");
            p.setString(1,name);
            p.setString(2,description);
            p.setInt(3,userId);
            ResultSet rs=p.executeQuery();
            rs.next();
            return rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }
    public static boolean buy(int id,int amount){

        try {
            PreparedStatement p = Database.getConnection().prepareStatement(
                    "SELECT amount FROM product WHERE id=?;"
            );
            p.setInt(1,id);
            ResultSet rs= p.executeQuery();
            rs.next();
            if(rs.getInt(1)==amount){
                p=Database.getConnection().prepareStatement(
                        "DELETE FROM product where id=?"
                );
                p.setInt(1,id);
                p.execute();
                return true;
            }else if(rs.getInt(1)>amount){
                p=Database.getConnection().prepareStatement(
                        "UPDATE product set amount=amount-? where id=?"
                );
                p.setInt(1,amount);
                p.setInt(2,id);
                p.execute();
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}

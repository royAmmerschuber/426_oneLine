package Control;

import Persistence.Database;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Verkauf {
    public static boolean checkOwner(int pId, int uId){
        try{
            PreparedStatement p=Database.getConnection().prepareStatement(
                    "Select sellerFK from product where id=?"
            );
            ResultSet rs=p.executeQuery();
            rs.next();
            if(rs.getInt(1)==uId){
                return true;
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //Verkauf
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
    public static boolean dropProduct(int pId){
        try{
            PreparedStatement p=Database.getConnection().prepareStatement(
                    "delete from product where id=?"
            );
            p.setInt(1,pId);
            return  p.execute();
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public static boolean setDiscount(int pId, double price){
        try {
            PreparedStatement p=Database.getConnection().prepareStatement(
                    "update product set discPrice=? where id=?"
            );
            p.setInt(2,pId);
            p.setDouble(1,price);
            return p.execute();
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public static boolean dropDiscount(int pId){
        try {
            PreparedStatement p=Database.getConnection().prepareStatement(
                        "UPDATE product set discPrice=null where id=?"
            );
            p.setInt(1,pId);
            return p.execute();
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //Kauf
    public static boolean buy(int uId){
        try {
            PreparedStatement p = Database.getConnection().prepareStatement(
                    "update kart as k " +
                            "left join product as p on p.id=k.productfk " +
                            "set p.amount=p.amount-k.amount " +
                            "where userFK=?"
            );
            p.setInt(1,uId);
            p.execute();
            p = Database.getConnection().prepareStatement(
                    "delete from kart where userFK=?"
            );
            p.setInt(1,uId);
            p.execute();
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public static boolean toKart(int pId, int amount, int uId) {
        try {
            PreparedStatement p=Database.getConnection().prepareStatement(
                    "SELECT amount>=? from product where id=?"
            );
            p.setInt(1,amount);
            p.setInt(2,pId);
            ResultSet rs=p.executeQuery();
            rs.next();
            if(!rs.getBoolean(1)){
                return false;
            }

            p = Database.getConnection().prepareStatement(
                    "DELETE from kart where userFK=? and productFK=?"
            );
            p.setInt(1,uId);
            p.setInt(2,pId);
            p.execute();
            if(amount==0){
                return true;
            }
            p=Database.getConnection().prepareStatement(
                    "Insert into kart (userFK,productFK,amount) VALUES (?,?,?)"
            );
            p.setInt(1,uId);
            p.setInt(2,pId);
            p.setInt(3,amount);
            p.execute();
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
}

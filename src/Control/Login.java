package Control;

import Persistence.Database;
import com.mysql.jdbc.Connection;


import javax.crypto.EncryptedPrivateKeyInfo;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;




public class Login {

    private static String getHash(String passwordToHash, String   salt){
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-512");
            md.update(salt.getBytes(StandardCharsets.UTF_8));
            byte[] bytes = md.digest(passwordToHash.getBytes(StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            for(int i=0; i< bytes.length ;i++){
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        }
        catch (NoSuchAlgorithmException e){
            e.printStackTrace();
        }
        return generatedPassword;
    }

    public static boolean check(String name,String password){
        java.sql.Connection c= Database.getConnection();
        try {

            PreparedStatement p=c.prepareStatement("SELECT password,salt from User where userName=?");
            p.setString(1,name);
            ResultSet rs=p.executeQuery();
            if(rs.next()){
                if(getHash(password, rs.getString(2)).equals(rs.getString(1))){
                    return true;
                }

            }else{
                return false;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;

        }
        return false;
    }

    public static boolean addUser(String name, String password,String firstName,String lastName,
                               String country,String city,String plz,String street,String email,String phone){

        try {
            PreparedStatement p;
            p=Database.getConnection().prepareStatement("select count(*) from User WHERE userName=?");
            p.setString(1,name);
            ResultSet rs=p.executeQuery();
            rs.next();
            if(rs.getInt(1)!=0){
                return false;
            }
            p=Database.getConnection().prepareStatement(
                    "INSERT INTO User (userName,password,salt) VALUES (?,?,?);");
            String salt="";
            for(int i=0;i<64;i++){
                salt+=(char)Math.round(48+Math.random()*(122-48));

            }

            p.setString(1,name);
            p.setString(2, getHash(password,salt));
            p.setString(3,salt);
            p.execute();
            p=Database.getConnection().prepareStatement(
                    "Insert INTO Address(userFK, firstName, lastName, country, city, plz, street,email,phone) VALUES ((select id FROM User where userName=?),?,?,?,?,?,?,?,?)");
            p.setString(1,name);
            p.setString(2,firstName);
            p.setString(3,lastName);
            p.setString(4,country);
            p.setString(5,city);
            p.setString(6,plz);
            p.setString(7,street);
            p.setString(8,email);
            p.setString(9,phone);
            p.execute();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }


}

package Control;

import Persistence.Database;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.JOptionPane;





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

    public static int check(String name,String password){
        java.sql.Connection c= Database.getConnection();
        try {

            PreparedStatement p=c.prepareStatement("SELECT password,salt, id from User where userName=?");
            p.setString(1,name);
            ResultSet rs=p.executeQuery();
            if(rs.next()){
                if(getHash(password, rs.getString(2)).equals(rs.getString(1))){
                    return rs.getInt(3);
                }

            }else{
                return -1;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return -1;

        }
        return -1;
    }


    public static boolean CheckUsernameExists(String username)
    {
        boolean usernameExists = false;

        try
        {

            java.sql.Connection c= Database.getConnection();

            PreparedStatement st = c.prepareStatement("select userName from user order by username desc");
            ResultSet r1=st.executeQuery();
            String usernameCounter;
            if(r1.next())
            {
                usernameCounter =  r1.getString("userName");
                if(usernameCounter == username) //this part does not happen even if it should
                {

                    System.out.println("It already exists");
                    String str = "Username is already taken!";
                    JOptionPane.showMessageDialog(null, str);

                   // c.prepareStatement("delete * from user where userName = );
                    usernameExists = true;
                }
            }


        }

        catch (Exception e)
        {
            //System.out.println("SQL Exception: "+ e.toString())
            e.printStackTrace();
        }


        return usernameExists;
    }

    public static boolean addUser(String name, String password,String firstName,String lastName,
                               String country,String city,String plz,String street,String email,String phone) {

        try {


            PreparedStatement p;/*=Database.getConnection().prepareStatement("select count(*) from User WHERE userName=?");
            p.setString(1,name);
            ResultSet rs=p.executeQuery();
            rs.next();
            if(rs.getInt(1)!=0){
                return false;
            }*/
            p = Database.getConnection().prepareStatement(
                    "INSERT INTO User (userName,password,salt) VALUES (?,?,?);");
            String salt = "";
            for (int i = 0; i < 64; i++) {
                salt += (char) Math.round(48 + Math.random() * (122 - 48));

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
            return false;
        }
        return true;
    }


}

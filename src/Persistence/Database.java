package Persistence;

import Control.Login;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;
import java.util.Properties;

public class Database {
    private static Connection con;
    public static Connection getConnection  (){
        if(con ==null){
            try {
                Properties p= new Properties();
                p.load(new FileInputStream("src/config/database.prop"));
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection(p.getProperty("url"),p.getProperty("user"),p.getProperty("password"));

            }catch (Exception e){
                e.printStackTrace();
            }
        }
        return con;
    }

    public static void seed(){
        Connection con=Database.getConnection();
        try {
            con.createStatement().executeUpdate(
                    "drop TABLE IF EXISTS User;");
            con.createStatement().executeUpdate(
                    "drop TABLE IF EXISTS Address;");
            con.createStatement().executeUpdate(
                    "drop TABLE IF EXISTS Product;");
            con.createStatement().executeUpdate(
                    "drop TABLE IF EXISTS Image;");
            con.createStatement().executeUpdate(
                    "drop TABLE IF EXISTS Category;");
            con.createStatement().executeUpdate(
                    "drop TABLE IF EXISTS Kart;");
            con.createStatement().executeUpdate(
                    "create table User(\n" +
                    "  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,\n" +
                    "  userName VARCHAR(64) NOT NULL ,\n" +
                    "  password VARCHAR(128) NOT NULL ,\n" +
                    "  salt VARCHAR(128) NOT NULL ,"+
                    "  image VARCHAR(128)\n" +
                    ");");
            con.createStatement().executeUpdate(
                    "CREATE TABLE Address(\n" +
                    "  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,\n" +
                    "  userFK INT NOT NULL ,\n" +
                    "  firstName varchar(64) NOT NULL ,\n" +
                    "  lastName varchar(64) NOT NULL ,\n" +
                    "  country varchar(64) NOT NULL ,\n" +
                    "  city varchar(64) NOT NULL ,\n" +
                    "  plz VARCHAR(8) NOT NULL ,\n" +
                    "  street varchar(64) NOT NULL,\n" +
                    "  email varchar(64) NOT NULL," +
                    "  phone VARCHAR(64) NOT NULL " +
                    ");");
            con.createStatement().executeUpdate(
                    "CREATE TABLE Product(\n" +
                    "  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,\n" +
                    "  sellerFK int NOT NULL ,\n" +
                    "  categoryFK int NOT NULL ,\n" +
                    "  name varchar(64) NOT NULL ,\n" +
                    "  amount int NOT NULL ,\n" +
                    "  description VARCHAR(2048) NOT NULL ,\n" +
                    "  price DECIMAL(10,2) NOT NULL\n" +
                    ");");
            con.createStatement().executeUpdate(
                    "CREATE TABLE Image(\n" +
                    "  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,\n" +
                    "  productFK int NOT NULL ,\n" +
                    "  image VARCHAR(128) NOT NULL\n" +
                    ");");
            con.createStatement().executeUpdate(
                    "CREATE TABLE Category(\n" +
                    "  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,\n" +
                    "  name varchar(64) NOT NULL\n" +
                    ");");
            con.createStatement().executeUpdate(
                    "CREATE TABLE Kart(\n" +
                    "  id int PRIMARY KEY NOT NULL AUTO_INCREMENT,\n" +
                    "  userFK int NOT NULL ,\n" +
                    "  productFK int NOT NULL ,\n" +
                    "  amount int NOT NULL\n" +
                    ");");
            /*con.createStatement().executeUpdate(
                    "insert INTO User (userName,salt, password) VALUES\n" +
                    "  ('numberOne','jiodsagfnav','^fjdkahfahklghqhagjahgd');");
            con.createStatement().executeUpdate(
                    "INSERT INTO Address (userFK, firstName, lastName, country, cuty, plz, street,email,phone) VALUEs\n" +
                    "  ((select id from User WHERE userName='numberOne'),'max','muster','Switzerland','Bern','1234','holzweg 12c','mail@mail.web.cim','12345689');");
            */
            Login.addUser("numberOne", "gibbiX12345","max","muster","switzerland","bern","1234","holzweg 12c","mail@mail.com","64387164598");
            con.createStatement().executeUpdate(
                    "Insert INTO Category (name) VALUES " +
                    "('Table'),('Fish'),('Book'),('Car');");
            con.createStatement().executeUpdate(
                    "INSERT INTO Product (sellerFK, categoryFK, name, amount, description, price) VALUEs\n" +
                    "  ((select id from User WHERE userName='numberOne'),1,'Holztisch',3,'ein eleganter holztisch mit elegantem Design',5.49),\n" +
                    "  ((select id from User WHERE userName='numberOne'),2,'Ammerhai',29,'ein Barscher hai',19.9),\n" +
                    "  ((select id from User WHERE userName='numberOne'),3,'harald Töpfer',3,'...',2.39),\n" +
                    "  ((select id from User WHERE userName='numberOne'),4,'neziri-mobil',1,'',582173.66),\n" +
                    "  ((select id from User WHERE userName='numberOne'),4,'Why Man?',3,'Ein epischer roman mit epischen fragen',29.45);");
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}

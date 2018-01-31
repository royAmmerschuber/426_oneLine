package Persistence;

import Control.Login;
import Control.Verkauf;

public class Test {
    public static void main(String[] args){
        Database.seed();
        System.out.println(Login.check("numberOne","gibbiX12345"));
        System.out.println(Login.check("nuberOne","gibbiX12345"));
        System.out.println(Login.check("numberOne","gibeiX12345"));
        System.out.println(Login.check("numberOne","gibbi345"));
        //System.out.println(Verkauf.addProduct("GummiDildo",122, "blablabladeepthroatblablabla", 4));
    }
}

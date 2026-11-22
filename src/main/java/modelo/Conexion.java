/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    private static final String URL = "jdbc:mysql://localhost:3306/harina_db?useUnicode=true&characterEncoding=UTF-8&serverTimezone=America/Bogota";
    private static final String USER = "root";
    private static final String PASS = "sebastian6710";

    public static Connection conectar() {
        Connection con = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(URL, USER, PASS);
            System.out.println("Conexión exitosa");
        } catch (Exception e) {
            System.out.println("Conexión fallida: " + e.getMessage());
        }
        return con;
    }
}

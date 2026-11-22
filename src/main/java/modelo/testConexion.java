/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Connection;

public class testConexion {
    public static void main(String[] args) {
        Connection con = Conexion.conectar();
        if (con != null) {
            System.out.println("Conectado");
        } else {
            System.out.println("No se pudo conectar");
        }
    }
}

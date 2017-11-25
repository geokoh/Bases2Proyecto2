/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyectobases2;

import Controller.Controller;
import Model.Text;
import java.io.IOException;
import org.json.simple.parser.ParseException;

/**
 *
 * @author geovanny
 */
public class ProyectoBases2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws IOException, ParseException {
        // TODO code application logic here
        Controller cont = new Controller();
        cont.JsonRead("newfile12.json");
        for (int i= 0; i<20; i++){
           Text a = (Text) cont.getData().get(i);
           a.print();
        }
    }
    
}

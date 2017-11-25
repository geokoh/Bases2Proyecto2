/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import Model.Text;
import Model.Website;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import org.json.simple.*;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;


/**
 *
 * @author geovanny
 */
public class Controller {
    private ArrayList websites;

    public ArrayList getWebsites() {
        return websites;
    }

    public void setWebsites(ArrayList websites) {
        this.websites = websites;
    }

    public Controller() {
        this.websites = new ArrayList<Website>();
    }
    
    public void JsonRead(String filename) throws IOException, ParseException{
        JSONParser parser = new JSONParser();
        int i = 0;
        JSONArray sites = (JSONArray) parser.parse(new FileReader(filename));
        
        for (Object o : sites){
            i += 1;
            if(i== 78){
                System.out.println("a");
            }
            String otemp = (String) o;
            String object = otemp.replaceAll(",$", "");
            try {
                JSONObject site = (JSONObject) parser.parse(object);
                String title = (String) site.get("Title");
                String url = (String) site.get("URL");
                JSONArray textarray = (JSONArray) site.get("Content");
                ArrayList texts = new ArrayList<Text>();
                for (Object t : textarray) {
                    JSONObject textobject = (JSONObject) t;
                    String tag = (String) textobject.get("Tag");
                    String text = (String) textobject.get("Text");
                    texts.add(new Text(tag, text, url, title));
                }
                websites.add(new Website(title, url, texts));
            }
            catch(Exception e) {
                System.out.println("Informacion Invalida");
            }
        }
    }
    
    
    
}

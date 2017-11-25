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
    private ArrayList data;

    public ArrayList getData() {
        return data;
    }

    public void setData(ArrayList data) {
        this.data = data;
    }

    
    public Controller() {
        this.data = new ArrayList<Text>();
    }
    
    public void JsonRead(String filename) throws IOException, ParseException{
        JSONParser parser = new JSONParser();
        JSONArray sites = (JSONArray) parser.parse(new FileReader(filename));
        
        for (Object o : sites){
            String otemp = (String) o;
            String object = otemp.replaceAll(",$", "");
            try {
                JSONObject site = (JSONObject) parser.parse(object);
                String title = (String) site.get("Title");
                String url = (String) site.get("URL");
                JSONArray textarray = (JSONArray) site.get("Content");
                for (Object t : textarray) {
                    JSONObject textobject = (JSONObject) t;
                    String tag = (String) textobject.get("Tag");
                    String text = (String) textobject.get("Text");
                    String[] words = text.split(" ");
                    for(int i = 0; i < words.length; i ++) {
                        String word = words[i];
                        data.add(new Text(tag, word, url, title));
                    }
                    
                }
            }
            catch(Exception e) {
                
            }
        }
    }
    
    
    
}

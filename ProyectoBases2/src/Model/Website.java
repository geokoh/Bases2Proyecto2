/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.util.ArrayList;

/**
 *
 * @author geovanny
 */
public class Website {
    private String title;
    private String URL;
    private ArrayList text;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getURL() {
        return URL;
    }

    public void setURL(String URL) {
        this.URL = URL;
    }

    public ArrayList getText() {
        return text;
    }

    public void setText(ArrayList text) {
        this.text = text;
    }

    public Website(String title, String URL, ArrayList text) {
        this.title = title;
        this.URL = URL;
        this.text = text;
    }

    

    
    
    
}

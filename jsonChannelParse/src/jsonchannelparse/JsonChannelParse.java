/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonchannelparse;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Map;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author PC
 */
public class JsonChannelParse {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {  
            BufferedReader br;
            br = new BufferedReader(new FileReader(".\\country_codes.json"));
            JsonElement wholeJson = new JsonParser().parse(br);
            
            Set<Map.Entry<String, JsonElement>> entrySet = wholeJson.getAsJsonObject().entrySet();
            
            
            
           // JsonArray countriesJson = wholeJson.getAsJsonArray();
            ArrayList<country> countries = new ArrayList();
            country czech=null;
            for(Map.Entry<String, JsonElement> el : entrySet){
                countries.add(new country(el.getValue().getAsJsonObject()));
                if(el.getKey().equals("CZ")) czech=countries.get(countries.size()-1);
            }
            for(country cnt:countries) {
                ArrayList diff = czech.diff(cnt);
                System.out.println(diff.size()+" "+cnt.toString());
                System.out.println("cz: "+czech.c5all);
                System.out.println("out:"+diff.toString());
            }
            
        } catch (FileNotFoundException ex) {
            Logger.getLogger(JsonChannelParse.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}

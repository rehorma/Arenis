/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonchannelparse;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.util.ArrayList;
import java.util.HashSet;

/**
 *
 * @author PC
 */
public class country {
    public country() {
        
    }
    public country(JsonObject countryJson) {
        c5all=new ArrayList();
        c5dfs=new ArrayList();
        c5cln=new ArrayList();
        load(countryJson);
    }
    public ArrayList diff(country other) {
        ArrayList<Integer> ret=new ArrayList();
        for(Integer ch:c5cln) {
            if(other.c5all.contains(ch)) ret.add(ch);
        }
        return ret;
    }
    @Override
    public String toString() {
        return key+"\nall:"+c5all.toString()+"\ncln:"+c5cln.toString();
    }
    public void load( JsonObject countryJson ) {
        
        c5all.clear();
        c5dfs.clear();
        c5cln.clear();
        
    name = countryJson.get("name").toString();
    key = countryJson.get("key").toString();
    code = countryJson.get("code").getAsInt();
    JsonArray channels = countryJson.getAsJsonArray("channels_na");
    
    for(JsonElement ch : channels) {
        c5all.add(Integer.parseInt(ch.getAsString()));
    }
    
    channels = countryJson.getAsJsonArray("channels_na_dfs");
    
    for(JsonElement ch : channels) {
        c5dfs.add(Integer.parseInt(ch.getAsString()));
    }        
        c5cln.addAll(c5all);
        c5cln.removeAll(c5dfs);
    }
    private String name;
    private String key;
    private int code;
    public ArrayList<Integer> c5all;
    private ArrayList<Integer> c5dfs;
    private ArrayList<Integer> c5cln;
}

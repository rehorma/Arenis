/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package jsonchannelparse;

import com.google.gson.Gson;
import java.util.HashSet;

/**
 *
 * @author PC
 */
public class country {
    public country() {
        c5all=new HashSet();
        c5dfs=new HashSet();
        c5cln=new HashSet();
    }
    public void refresh() {
        c5cln.clear();
        c5cln.addAll(c5all);
        c5cln.removeAll(c5dfs);
        
    }
    public void load( /*json class*/ ) {
        c5all.addAll(null);
        c5dfs.addAll(null);
        refresh();
    }
    private HashSet c5all;
    private HashSet c5dfs;
    private HashSet c5cln;
}

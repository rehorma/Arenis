/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tikroute;

import java.util.ArrayList;
import javafx.util.Pair;

/**
 *
 * @author PC
 */
public class TikResult {
    private String identity;
    private String serial;
    private ArrayList<ArrayList<String>> neighbours; //ip,identity, mac
    private ArrayList<Pair<String,String>> routes; //target,gw
}

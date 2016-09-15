/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tikroute;

import java.util.ArrayList;

/**
 *
 * @author PC
 */
public class TikWork {
    private ArrayList<TikDevice> work;
    private boolean flag=true;
    public synchronized void getWork(TikDevice dev){
        if(flag) {
            flag=false;
            dev=work.remove(work.size()-1);
        }
        flag=true;
    }
}

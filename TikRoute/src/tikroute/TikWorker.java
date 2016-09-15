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
public class TikWorker implements Runnable {
    private Thread t;
    private TikDevice dev=new TikDevice();
    
    @Override
    public void run() {
      
   }
    public void start(TikWork work)
    {
        work.getWork(dev);
      if (t == null)
      {
         t = new Thread (this, "TikWorkerThread");
         t.start ();
      }
   }
    
    
}

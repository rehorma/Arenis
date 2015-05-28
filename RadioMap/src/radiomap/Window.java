/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package radiomap;

import java.awt.EventQueue;
import javax.swing.JFrame;

/**
 *
 * @author PC
 */
public class Window extends JFrame {
    public Window() {
        initUI();
    }
    
    private void initUI() {
        add(new RadioMap());
        
        setTitle("test");
        setSize(400,300);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
    }
    
    public static void main(String[] args) {
         EventQueue.invokeLater(new Runnable() {

            @Override
            public void run() {
                Window ex = new Window();
                ex.setVisible(true);
            }
        });
    }
}

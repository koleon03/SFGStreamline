import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SFGStreamline extends PApplet {

//Global vars
Panel panel;

public void setup() {
    
    panel = new Panel();


}

public void draw() {
    background(0);
    panel.drawPanel();
}
class Panel{

    public Panel(){
        drawPanel();
    }

    public void drawPanel(){
        int cX = mouseX - 150;
        int cY = height - 30;
        rect(cX,cY,300,30);
    } 

}
  public void settings() {  fullScreen(P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SFGStreamline" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

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
Snowflake sf;

public void setup() {
    
    panel = new Panel();
    sf = new Snowflake(width/2, 0, 20, 3);

}

public void draw() {
    background(0);
    panel.drawPanel();
    sf.drawSnowflake();
    
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
class Snowflake{

    int posX;
    int posY;
    int offset;
    int speed;
    boolean firstDraw = true;

    public Snowflake(int posX, int posY, int offset, int speed){
        this.posX = posX;
        this.posY = posY;
        this.offset = offset;
        this.speed = speed;
    }

    public void drawSnowflake(){
        if(firstDraw == true){
            createSFShape(posX,posY,offset);
            firstDraw = false;
        }
        else{
            int rPosY;
            if(posY >= height){
                rPosY = 0;
                posY = rPosY;
            }
            else{
                rPosY = posY + speed;
                posY = rPosY;
            }
            createSFShape(posX,rPosY,offset);
        }
    }

    public void createSFShape(int x, int y, int offset){
        stroke(255);
        line(x, y - offset, x, y + offset);
        line(x - offset, y, x + offset, y);
        line(x - offset, y - offset, x + offset, y + offset);
        line(x + offset, y - offset, x - offset, y + offset);
        
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

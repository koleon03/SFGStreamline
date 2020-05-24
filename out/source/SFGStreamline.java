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
Snowflake[] flakes;
int score = 0;
public void setup() {
    //fullScreen(P2D);
    
    panel = new Panel();
    flakes = new Snowflake[5];
    int fHeight = 0;
    for(int i = 0;i < flakes.length; i++){
        flakes[i] = new Snowflake(PApplet.parseInt(random(20, width - 20)), fHeight, 20, 3);
        flakes[i].drawSnowflake();
        fHeight = fHeight - 200;
    }

}

public void draw() {
    background(0);
    textSize(32);
    text("Score: " + score, 10,30);
    panel.drawPanel();
    for(Snowflake sf:flakes){
        int v = sf.drawSnowflake();
        if(v == 1){
            score++;
        }

        else if (v == 2){
            score = 0;
        }
    }
 }
    
class Panel{

    int lx;
    int rx;

    public Panel(){
        drawPanel();
    }

    public void drawPanel(){
        int cX = mouseX - 50;
        int cY = height - 30;
        rect(cX,cY,100,30);
        lx = cX;
        rx = cX + 100;
    } 

    public int getLX(){
        return lx;
    }

    public int getRX(){
        return rx;
    }

}
class Snowflake{

    int posX;
    int posY;
    int offset;
    int speed;
    int returnX;
    int returnY;
    boolean firstDraw = true;

    public Snowflake(int posX, int posY, int offset, int speed){
        this.posX = posX;
        this.posY = posY;
        this.offset = offset;
        this.speed = speed;
    }

    public int drawSnowflake(){
        int returnV;
        if(firstDraw == true){
            createSFShape(posX,posY,offset);
            firstDraw = false;
            returnV = 0;
        }
        else{
            int rPosY;
            if(posY >= height - 30){
                if(posX >= mouseX - 50 && posX <= mouseX + 50){
                    returnV = 1;
                }
                else{
                    returnV = 2;
                }
                rPosY = 0;
                posY = rPosY;
                posX = PApplet.parseInt(random(offset, width));
                
            }

            else{
                rPosY = posY + speed;
                posY = rPosY;
                returnV = 0;
            }
            createSFShape(posX,rPosY,offset);
        }
        return returnV;
    }

    public void createSFShape(int x, int y, int offset){
        stroke(255);
        line(x, y - offset, x, y + offset);
        line(x - offset, y, x + offset, y);
        line(x - offset, y - offset, x + offset, y + offset);
        line(x + offset, y - offset, x - offset, y + offset);
        returnX = x;
        returnY = y;
    }

    public int getX(){
        return returnX;
    }

    public int getY(){
        return returnY;
    }
}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SFGStreamline" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}

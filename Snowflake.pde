class Snowflake{

    float posX;
    float posY;
    float offset;
    float speed;
    float returnX;
    float returnY;
    int colorR;
    int colorG;
    int colorB;
    boolean firstDraw = true;

    public Snowflake(float posX, float posY, float offset, float speed, int colorR, int colorG, int colorB){
        this.posX = posX;
        this.posY = posY;
        this.offset = offset;
        this.speed = speed;
        this.colorR = colorR;
        this.colorG = colorG;
        this colorB = colorB;
    }

    public int drawSnowflake(){
        int returnV;
        if(firstDraw == true){
            createSFShape(posX,posY,offset, colorR, colorG, colorB);
            firstDraw = false;
            returnV = 0;
        }
        else{
            float rPosY;
            if(posY >= height - 30){
                if(posX >= mouseX - 150 && posX <= mouseX + 150){
                    returnV = 1;
                }
                else{
                    returnV = 2;
                }
                rPosY = 0;
                posY = rPosY;
                posX = int(random(offset, width));
                
            }

            else{
                rPosY = posY + speed;
                posY = rPosY;
                returnV = 0;
            }
            createSFShape(posX,rPosY,offset, colorR, colorG, colorB);
        }
        return returnV;
    }

    public void createSFShape(float x, float y, float offset, int colorR, int colorG, int colorB){
        stroke(255);
        line(x, y - offset, x, y + offset);
        line(x - offset, y, x + offset, y);
        line(x - offset, y - offset, x + offset, y + offset);
        line(x + offset, y - offset, x - offset, y + offset);
        returnX = x;
        returnY = y;
    }

    public float getX(){
        return returnX;
    }

    public float getY(){
        return returnY;
    }

    public void setSpeed(float speed){
        this.speed = speed;
    }

    public void setColor(int colorR, int colorG, int colorB){
        this.colorR = colorR;
        this.colorG = colorG;
        this.colorB = colorB;
    }
}
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
                posX = int(random(offset, width));
                
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
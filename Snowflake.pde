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
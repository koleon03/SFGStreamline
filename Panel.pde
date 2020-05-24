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
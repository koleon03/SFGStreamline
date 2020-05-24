class Panel{

    int lx;
    int rx;

    public Panel(){
        drawPanel();
    }

    public void drawPanel(){
        int cX = mouseX - 150;
        int cY = height - 30;
        rect(cX,cY,300,30);
        lx = cX;
        rx = cX + 300;
    } 

    public int getLX(){
        return lx;
    }

    public int getRX(){
        return rx;
    }

}
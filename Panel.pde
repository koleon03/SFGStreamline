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
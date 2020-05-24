//Global vars
Panel panel;
Snowflake sf;

void setup() {
    fullScreen(P2D);
    panel = new Panel();
    sf = new Snowflake(width/2, 0, 20, 3);

}

void draw() {
    background(0);
    panel.drawPanel();
    sf.drawSnowflake();
    
}

//Global vars
Panel panel;

void setup() {
    fullScreen(P2D);
    panel = new Panel();


}

void draw() {
    background(0);
    panel.drawPanel();
}

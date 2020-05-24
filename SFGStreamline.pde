//Global vars
Panel panel;
Snowflake[] flakes;
int score = 0;
void setup() {
    fullScreen(P2D);
    panel = new Panel();
    flakes = new Snowflake[5];
    int fHeight = 0;
    for(int i = 0;i < flakes.length; i++){
        flakes[i] = new Snowflake(int(random(20, width - 20)), fHeight, 20, 3);
        flakes[i].drawSnowflake();
        fHeight = fHeight - 200;
    }

}

void draw() {
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
    

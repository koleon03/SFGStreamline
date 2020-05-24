//Global vars
Panel panel;
Snowflake[] flakes;
int score = 0;
int highscore;
int speed = 5;
void setup() {
    fullScreen(P2D);
    panel = new Panel();
    flakes = new Snowflake[5];
    int fHeight = 0;
    for(int i = 0;i < flakes.length; i++){
        flakes[i] = new Snowflake(int(random(20, width - 20)), fHeight, 20, speed);
        flakes[i].drawSnowflake();
        fHeight = fHeight - 200;
    }


}

void draw() {
    background(0);
    textSize(32);
    text("Score: " + score, 10,30);
    text("Highscore: " + highscore, 10, 60);
    panel.drawPanel();
    for(Snowflake sf:flakes){
        int v = sf.drawSnowflake();
        if(v == 1){
            score++;
            if(score > highscore) highscore = score;
            if(score % 10 == 0){
                speed++;
                for(Snowflake sf1:flakes){
                    sf1.setSpeed(speed);
                }
            }
        }

        else if (v == 2){
            if(score > highscore) highscore = score;
            score = 0;
            speed = 3;
            for(Snowflake sf1:flakes){
                    sf1.setSpeed(speed);
             }
        }
    }
 }
    

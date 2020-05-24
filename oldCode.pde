int anz = 3;
int x[];
int y[];
int pz;
int hs;
int d = 0;

void setup() {
  background(0);
  stroke(255);
  fullScreen(P2D);
  textSize(30);
  y = new int[anz];
  x = new int[anz];
  for (int i = 0; i<x.length; i++) {
    x[i]= (int)random(width);
  }
  for (int i = 0; i<y.length; i++) {
    y[i] = d;
    d = d - 200;
  }
}
void draw() {
  background(0);
  panel();
  for (int i = 0; i<x.length; i++) {
    flocke(x[i], y[i]);
    y[i] = y[i] + 10;
    check(x[i],y[i]);
    if (y[i]>=height) {
      y[i] = 0;
      x[i] = (int)random(width);
    }
  }
  if (pz >= hs) {
    hs = pz;
  }


  text("Punktzahl:" + pz, 10, 30);
  text("Highscore:" + hs, 10, 70);
}

void flocke(int xPos, int yPos) {
  line(xPos, yPos +5, xPos, yPos-5);
  line(xPos -5, yPos, xPos+5, yPos);
  line(xPos -15, yPos +15, xPos +15, yPos -15);
  line(xPos -15, yPos -15, xPos +15, yPos +15);
}
void panel() {
  if (pz >= 10) {
    anz = 2;
  }
  if (pz >= 30) {
    anz = 3;
  }
  if (pz >= 50) {
    anz = 4;
  }
  if (pz >= 80) {
    anz = 5;
  }
  if (pz>= 100) {
    anz = 6;
  }
  rect(mouseX -80, height -20, 160, 40);
}

void check(int x1, int y1) {
  if (y1 == height -30) {
    if (x1 <= mouseX +80) {
      if (x1 >= mouseX -80) {
        pz++;
      } else {
        pz = 0;
      }
    } else {
      pz = 0;
    }
  }
}

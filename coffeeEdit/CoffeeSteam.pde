// Class for the coffee steam seen in the main menu
// Code taken from the Processing example Additive Wave by Daniel Shiffman and modified slightly to look differently


class CoffeeSteam {
  int xspacing = 1;   // How far apart should each horizontal location be spaced
  int w;              // Width of entire wave
  int maxwaves = 4;   // total # of waves to add together
  float theta = 0.0;
  float[] amplitude = new float[maxwaves];   // Height of wave
  float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
  float[] yvalues;                           // Using an array to store height values for the wave (not entirely necessary)
  int startX, endX;                           
  int midline;


  // Constructor for class
  CoffeeSteam(int startX_, int endX_, int mid) {
    w = width + 16;
    for (int i = 0; i < maxwaves; i++) {
      amplitude[i] = random(8, 12);
      float period = random(100, 300); // How many pixels before the wave repeats
      dx[i] = (TWO_PI / period) * xspacing;
    }
    yvalues = new float[w/xspacing];
    startX = startX_;
    endX = endX_;
    midline = mid;
  }


  // Display the wave. calls the function to render and calculate the values
  void display() {
    calcWave();
    renderWave();
    fill(255);
    rect(0, startX, width, height);
    rect(0, 0, width, endX);
  }


  // Function for calculating the values of the wave
  void calcWave() {
    // Increment theta 
    theta += 0.02;
    // Set all height values to zero
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = 0;
    }
    // Accumulate wave height values
    for (int j = 0; j < maxwaves; j++) {
      float x = theta;
      for (int i = 0; i < yvalues.length; i++) {
        // Every other wave is cosine instead of sine
        if (j % 2 == 0)  yvalues[i] += sin(x)*amplitude[j];
        else yvalues[i] += cos(x)*amplitude[j];
        x+=dx[j];
      }
    }
  }


  // Displays the wave (Small circles at specific values) 
  void renderWave() {
    noStroke();
    ellipseMode(CENTER);
    for (int x = 0; x < yvalues.length; x++) {
      // for far away it has traveled from the start. creates fade effect with transparency
      float alpha = dist(0, x*xspacing, 0, endX);
      // setting fill based on transparency and draw ellipse at its coordinates
      fill(139, 69, 19, alpha);
      ellipse(midline+yvalues[x], x*xspacing, 4, 4);
    }
  }
}
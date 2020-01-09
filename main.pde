PImage img;
PImage img2;
PImage img3;
PImage sorted;
int index = 0;

void setup() {
  size(800, 400);

  img = loadImage("cube.jpg");
  img2 = createImage(img.width, img.height, RGB);
    img3 = createImage(img.width, img.height, RGB);
  sorted = createImage(img.width, img.height, RGB);
  sorted = img.get();
}

void draw() {
 

  sorted.loadPixels();
  img2.loadPixels();
  img3.loadPixels();

  // Selection sort!
  for (int n = 0; n < 10; n++) {
    float record = -1;
    int selectedPixel = index;
    for (int j = index; j < sorted.pixels.length; j++) {
      color pix = sorted.pixels[j];
      float b = hue(pix);
      if (b > record) {
        selectedPixel = j;
        record = b;
      }
    }

    // Swap selectedPixel with i
    color temp = sorted.pixels[index];
    sorted.pixels[index] = sorted.pixels[selectedPixel];
    sorted.pixels[selectedPixel] = temp;
    img2.pixels[selectedPixel] = sorted.pixels[index];
     img3.pixels[index] = sorted.pixels[selectedPixel];

    if (index < sorted.pixels.length -1) {
      index++;
    }
  }


  sorted.updatePixels();
  img2.updatePixels();
  img3.updatePixels();

  background(255);
  image(img, 0, 0);
  image(sorted, 400, 0);
  image(img2,400,200);
  image(img3,0,200);
}

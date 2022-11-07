import java.io.File;           
import java.util.Collections;    



String filename = "landscape.jpeg";
boolean saveIt = true;


void setup() {
  
  // load image, basic setup
  String fileSize = getFileSize(filename);
  println("Loading image (" + fileSize + ")...");
  PImage img = loadImage(filename);
  size(504,340);
  image(img, 0, 0);

  
  color c;                                                
  float r, g, b;                                          
  ArrayList<Integer> rColor = new ArrayList<Integer>();   
  ArrayList<Integer>rPos = new ArrayList<Integer>();      
  ArrayList<Integer> gColor = new ArrayList<Integer>();   
  ArrayList<Integer>gPos = new ArrayList<Integer>();
  ArrayList<Integer> bColor = new ArrayList<Integer>();   
  ArrayList<Integer>bPos = new ArrayList<Integer>();

  loadPixels();
  for (int i=0; i<pixels.length; i++) {

    
    c = pixels[i];
    r = c >> 16 & 0xFF;
    g = c >> 8 & 0xFF;
    b = c & 0xFF;
    
    // get the highest value in the color
    int greatest = highestColor(r, g, b);

    // put into appropriate arrays
    switch (greatest) {
    case 1:
      rColor.add(c);
      rPos.add(i);
      break;
    case 2:
      gColor.add(c);
      gPos.add(i);
      break;
    case 3:
      bColor.add(c);
      bPos.add(i);
      break;
    }
    
    if (i > 0 && i % (pixels.length/10) == 0) {
      println("  " + nfc(i) + "\t/ " + nfc(pixels.length));
    }
  }
  
  Collections.sort(rColor);
  Collections.sort(gColor);
  Collections.sort(bColor);

  for (int i=0; i<rPos.size(); i++) {
    pixels[rPos.get(i)] = (color)rColor.get(i);
  }
  for (int i=0; i<gPos.size(); i++) {
    pixels[gPos.get(i)] = (color)gColor.get(i);
  }
  for (int i=0; i<bPos.size(); i++) {
    pixels[bPos.get(i)] = (color)bColor.get(i);
  }
  updatePixels();
  
}

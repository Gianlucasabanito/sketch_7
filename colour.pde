
int highestColor(float r, float g, float b) {

  int greatestColor = 0;
  float minVal = -1;          
  if (r > minVal) {
    greatestColor = 1;
    minVal = r;
  }
  if (g > minVal) {
    greatestColor = 2;
    minVal = g;
  }
  if (b > minVal) {
    greatestColor = 3;
    minVal = b;
  }

  return greatestColor;
}

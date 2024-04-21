PShape spehereShape;

class Sphere{
  void createSphere(){
    fill(0, 0, 100);
    noStroke();
    spehereShape = createShape(SPHERE, 100);
  }
  
  void showSphere(){
    shape(spehereShape);
  }

  void showMatrix() {
        stroke(0, 0, 100);
        spehereShape.disableStyle();
        shape(spehereShape);
    }
}

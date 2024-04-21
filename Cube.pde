PShape cubeShape;

class Cube {
    void createCube() {
        fill(0, 0, 100);
        noStroke();
        cubeShape = createShape(BOX, 500);
    }
    
    void showCube() {
        shape(cubeShape);
    }
    
    void showMatrix() {
        stroke(0, 0, 100);
        cubeShape.disableStyle();
        shape(cubeShape);
    }
}

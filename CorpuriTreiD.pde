import peasy.*;

Cube cube = new Cube();
Cylinder cylinder = new Cylinder();
Sphere sphere = new Sphere();
Cone cone = new Cone();
Donut donut = new Donut();

PeasyCam cam;

void setup() {
    size(852, 480, P3D);
    cam = new PeasyCam(this, 2000);
    cube.createCube();
    sphere.createSphere();
}

boolean showMatrixOnly = false;

void draw() {
    background(255);
    ambientLight(255, 255, 255);
    rotateY(frameCount * 0.02);
    pushMatrix();
    rotateX(radians(25));
    rotateY(radians(frameCount * 0.1));
    
    if (!showMatrixOnly) {
        cube.showCube();
    } else {
        cube.showMatrix();
    }
    
    translate(1200, 0, 0);
    rotateX(radians(45));
    rotateY(radians(frameCount));
    cone.showCone();
    popMatrix();
    pushMatrix();
    translate(1000,0,0);
    rotate(radians(180));
    rotate(radians(frameCount * 1.09));
    cylinder.showCylinder();
    popMatrix();
    //donut
    translate(800, 200);
    rotateX(PI * 0.75);
    rotate(frameCount * 0.01);
    noFill();
    stroke(0, 0, 100);
    strokeWeight(1.0);
    if (!showMatrixOnly) {
        donut.showDonut();
    } else {
        donut.showMatrix();
    }
    pushMatrix();
    translate(600,0,0);
    rotateX(radians(90));
    rotateY(radians(frameCount * 1.2));
    
    if (!showMatrixOnly) {
        sphere.showSphere();
    } else {
        sphere.showMatrix();
    }
    popMatrix();  
}

void mousePressed() {
    if (mouseButton == LEFT) {
        showMatrixOnly = !showMatrixOnly;
    }
    if (mouseButton == RIGHT) {
        showMatrixOnly = false;
    }
}
PShape coneShape;

class Cone {
    void showCone() {
        translate(width / 2, height / 2, 0);  
        stroke(0, 0, 100);
        fill(0, 0, 100);
        rotateX(PI / 2);
        rotateZ( -PI / 6);
        
        beginShape();
        vertex( -100, -100, -100);
        vertex(100, -100, -100);
        vertex(0,    0,  100);
        
        vertex(100, -100, -100);
        vertex(100,  100, -100);
        vertex(0,    0,  100);
        
        vertex(100, 100, -100);
        vertex( -100, 100, -100);
        vertex(0,   0,  100);
        
        vertex( -100,  100, -100);
        vertex( -100, -100, -100);
        vertex(0,    0,  100);
        endShape();
    }
    
    void showMatrix() {
        translate(width / 2, height / 2, 0);  
        stroke(0, 0, 100);
        rotateX(PI / 2);
        rotateZ( -PI / 6);
        
        beginShape();
        vertex( -100, -100, -100);
        vertex(100, -100, -100);
        vertex(0,    0,  100);
        
        vertex(100, -100, -100);
        vertex(100,  100, -100);
        vertex(0,    0,  100);
        
        vertex(100, 100, -100);
        vertex( -100, 100, -100);
        vertex(0,   0,  100);
        
        vertex( -100,  100, -100);
        vertex( -100, -100, -100);
        vertex(0,    0,  100);
        endShape();
    }
}
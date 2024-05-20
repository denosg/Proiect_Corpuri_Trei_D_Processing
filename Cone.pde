PShape coneShape;

class Cone {
    void showCone() {
        translate(width / 2, height / 2, 0);  
        noStroke(); // No stroke for filled shape
        fill(0, 0, 100); // Fill color
        
        float radius = 100;
        float height = 200;
        
        // Draw the sides of the cone
        beginShape(TRIANGLE_FAN);
        vertex(0, 0, height / 2); // Apex of the cone
        for (int angle = 0; angle <= 360; angle += 10) {
            float x = cos(radians(angle)) * radius;
            float y = sin(radians(angle)) * radius;
            vertex(x, y, -height / 2); // Base of the cone
        }
        endShape(CLOSE);
        
        // Draw the base of the cone
        beginShape(TRIANGLE_FAN);
        for (int angle = 0; angle <= 360; angle += 10) {
            float x = cos(radians(angle)) * radius;
            float y = sin(radians(angle)) * radius;
            vertex(x, y, -height / 2); // Base of the cone
        }
        endShape(CLOSE);
    }
    
    void showMatrix() {
        translate(width / 2, height / 2, 0);  
        stroke(0, 0, 100);
        
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
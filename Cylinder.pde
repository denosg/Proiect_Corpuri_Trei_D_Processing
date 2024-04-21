PShape cylinderShape;

class Cylinder {
    void showCylinder()
    {
        int sides = 60;
        float r1 = 80;
        float r2 = 80;
        float h = 320;
        float angle = 360 / sides;
        float halfHeight = h / 2;
        // top
        rotateX(PI / 2);
        rotateZ( -PI / 6);
        beginShape();
        for (int i = 0; i < sides; i++) {
            float x = cos(radians(i * angle)) * r1;
            float y = sin(radians(i * angle)) * r1;
            vertex(x, y, -halfHeight);
        }
        endShape(CLOSE);
        // bottom
        beginShape();
        for (int i = 0; i < sides; i++) {
            float x = cos(radians(i * angle)) * r2;
            float y = sin(radians(i * angle)) * r2;
            vertex(x, y, halfHeight);
        }
        endShape(CLOSE);
        // draw body
        beginShape(TRIANGLE_STRIP);
        for (int i = 0; i < sides + 1; i++) {
            float x1 = cos(radians(i * angle)) * r1;
            float y1 = sin(radians(i * angle)) * r1;
            float x2 = cos(radians(i * angle)) * r2;
            float y2 = sin(radians(i * angle)) * r2;
            vertex(x1, y1, -halfHeight);
            vertex(x2, y2, halfHeight);
        }
        endShape(CLOSE);
    }
}

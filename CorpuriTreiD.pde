import peasy.*;

Cube cube = new Cube();
Cylinder cylinder = new Cylinder();
Sphere sphere = new Sphere();
Cone cone = new Cone();
Donut donut = new Donut();
int time;
int currentChoice = -1;
int localKeyPressed = 0;

PeasyCam cam;

void setup() {
    size(852, 480, P3D);
    cam = new PeasyCam(this, 2000);
    cube.createCube();
    sphere.createSphere();
    time = millis();
}

boolean showMatrixOnly = false;

void draw() {
    background(255);
    drawText();
    // Draw 3D scene with PeasyCam
    drawScene();
    // Draw menu overlay
    drawMenu();
}
void drawScene() {
    ambientLight(255, 255, 255);
    rotateY(frameCount * 0.02);
    // Draw the current choice
    if (currentChoice != -1) {
        drawObject(currentChoice);
    }
    
    // Call drawObject based on user input
    if (localKeyPressed == 1 && currentChoice != -1) {
        drawObject(currentChoice);
    }
}

void keyPressed() {
    localKeyPressed = 1;
    int choice = int(key) - 48; // Convert ASCII to integer
    if (choice >= 1 && choice <= 5) {
        currentChoice = choice;
    }
}

void drawText() {
    cam.beginHUD();
    if (millis() < time + 5000) { // Change 4500 to 5000
        fill(0); // Set text color to black
        rectMode(CORNER); // Set rectangle mode to CORNER
        fill(200); // Set background color to grey
        rect( -850, 760, 3000, 120); // Draw a grey rectangle behind the text
        fill(0); // Set text color to black
        textSize(22);
        text("Click to see wireframe. Hold mouse to rotate. Scroll to change size. ", 20, 450);
    }
    cam.endHUD();
}

void drawObject(int type) {
    pushMatrix();
    translate(600, 0, 0);
    rotateX(radians(90));
    rotateY(radians(frameCount * 1.2));
    
    switch(type) {
        case 1:
            if (!showMatrixOnly) {
                cube.showCube();
            } else {
                cube.showMatrix();
            }
            break;
        case 2:
            if (!showMatrixOnly) {
                cylinder.showCylinder();
            } else {
                cylinder.showMatrix();
            }
            break;
        case 3:
            if (!showMatrixOnly) {
                sphere.showSphere();
            } else {
                sphere.showMatrix();
            }
            break;
        case 4:
            if (!showMatrixOnly) {
                cone.showCone();
            } else {
                cone.showMatrix();
            }
            break;
        case 5:
            if (!showMatrixOnly) {
                donut.showDonut();
            } else {
                donut.showMatrix();
            }
            break;
        default:
        println("Invalid choice");
        break;
    }
    popMatrix();
}


void drawMenu() {
    // Draw menu in 2D space
    cam.beginHUD();
    textSize(30);
    fill(0);
    text("Choose an object to draw:", 20, 50); // Move menu to top left corner
    text("1. Cube", 20, 100); // Adjust position
    text("2. Cylinder", 20, 150); // Adjust position
    text("3. Sphere", 20, 200); // Adjust position
    text("4. Cone", 20, 250); // Adjust position
    text("5. Donut", 20, 300); // Adjust position
    cam.endHUD();
}

void mousePressed() {
    if (mouseButton == LEFT) {
        showMatrixOnly = !showMatrixOnly;
        print(showMatrixOnly);
    }
    if (mouseButton == RIGHT) {
        showMatrixOnly = false;
    }
}
interface RectType {
  void drawRect(PVector aPos, PVector bPos, PVector cPos, PVector dPos);
}

class Donut {
  void showDonut() {
    showDonutType(new RectFill());
  }

  void showMatrix() {
    showDonutType(new RectStroke());
  }

  void showDonutType(RectType rectType) {
    int nB = 6, nS = 8, iRad = 150, jRad = 100;
    float radB = TWO_PI / nB;
    float radS = TWO_PI / nS;

    float frameNum = frameCount * 0.005;

    for (float i = 0; i < TWO_PI; i += radB) {
      PVector iPos = new PVector(sin(i + frameNum), 0, cos(i + frameNum));
      PVector NiPos = new PVector(sin(i + radB + frameNum), 0, cos(i + radB + frameNum));

      for (float j = 0; j < TWO_PI; j += radS) {
        PVector jPos = new PVector(sin(j + frameNum), cos(j + frameNum), sin(j + frameNum));
        PVector NjPos = new PVector(sin(j + radS + frameNum), cos(j + radS + frameNum), sin(j + radS + frameNum));

        PVector posA = new PVector(iRad * iPos.x + jRad * iPos.x * jPos.x,
                                   iRad * iPos.y + jRad * jPos.y,
                                   iRad * iPos.z + jRad * iPos.z * jPos.z);

        PVector posB = new PVector(iRad * iPos.x + jRad * iPos.x * NjPos.x,
                                   iRad * iPos.y + jRad * NjPos.y,
                                   iRad * iPos.z + jRad * iPos.z * NjPos.z);

        PVector posC = new PVector(iRad * NiPos.x + jRad * NiPos.x * NjPos.x,
                                   iRad * NiPos.y + jRad * NjPos.y - noise(j),
                                   iRad * NiPos.z + jRad * NiPos.z * NjPos.z);

        PVector posD = new PVector(iRad * NiPos.x + jRad * NiPos.x * jPos.x,
                                   iRad * NiPos.y + jRad * jPos.y - noise(j),
                                   iRad * NiPos.z + jRad * NiPos.z * jPos.z);

        rectType.drawRect(posA, posB, posC, posD);
      }
    }
  }
}

class RectFill implements RectType {
  void drawRect(PVector aPos, PVector bPos, PVector cPos, PVector dPos) {
    fill(0, 0, 100);
    beginShape();
    vertex(aPos.x, aPos.y, aPos.z);
    vertex(bPos.x, bPos.y, bPos.z);
    vertex(cPos.x, cPos.y, cPos.z);
    vertex(dPos.x, dPos.y, dPos.z);
    endShape(CLOSE);
  }
}

class RectStroke implements RectType {
  void drawRect(PVector aPos, PVector bPos, PVector cPos, PVector dPos) {
    beginShape();
    vertex(aPos.x, aPos.y, aPos.z);
    vertex(bPos.x, bPos.y, bPos.z);
    vertex(cPos.x, cPos.y, cPos.z);
    vertex(dPos.x, dPos.y, dPos.z);
    endShape(CLOSE);
  }
}

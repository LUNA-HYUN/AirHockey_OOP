// --- Mallet 클래스 ---

class Mallet {
  float x; // x 위치 (고정)
  float y; // y 위치 (가변)
  float radius;
  String side; // "left" or "right"
  
  float vy; // y방향 속도
  float moveSpeed = 8; // 말렛 이동 속도

  Mallet(float x, float y, float r, String side) {
    this.x = x;
    this.y = y;
    this.radius = r;
    this.side = side;
    this.vy = 0;
  }

  // 위로 이동 시작
  void moveUp() {
    vy = -moveSpeed;
  }

  // 아래로 이동 시작
  void moveDown() {
    vy = moveSpeed;
  }
  
  // 이동 멈춤
  void stop() {
    vy = 0;
  }

  // 말렛 위치 업데이트 (y축 이동)
  void update() {
    y += vy;
    checkBoundary();
  }

  // 화면 밖으로 나가지 않도록 경계 검사
  void checkBoundary() {
    y = constrain(y, radius, height - radius);
  }
  
  //말렛 위치 초기화
  void reset() {
    y = height / 2; // 처음 y 위치로 되돌리기
    vy = 0;       // 움직임 멈추기
  }

  // 말렛 그리기
  void show() {
    if (side.equals("left")) {
      fill(255, 100, 100); // P1 (왼쪽) 빨간색
    } else {
      fill(100, 100, 255); // P2 (오른쪽) 파란색
    }
    stroke(255);
    strokeWeight(2);
    ellipse(x, y, radius * 2, radius * 2);
  }
}

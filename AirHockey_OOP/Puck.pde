// --- Puck 클래스 ---

class Puck {
  float x, y;
  float vx, vy;
  float radius;
  float speed = 8; // 퍽의 속도

  Puck() {
    this.radius = 18;
    reset();
  }

  // 퍽 위치 및 속도 초기화
  void reset() {
    x = width / 2;
    y = height / 2;
    
    // 랜덤한 각도로 발사
    float angle = random(TWO_PI);
    // 너무 수직으로 가지 않도록 각도 조절
    while (abs(cos(angle)) < 0.2) {
      angle = random(TWO_PI);
    }
    
    vx = speed * cos(angle);
    vy = speed * sin(angle);
    
    // 50% 확률로 반대 방향
    if (random(1) > 0.5) {
      vx *= -1;
    }
  }

  // 퍽 이동
  void move() {
    x += vx;
    y += vy;
  }

  // 퍽과 말렛 충돌 확인
  void checkMallet(Mallet m) {
    float d = dist(x, y, m.x, m.y);
    
    // 퍽과 말렛이 충돌했다면
    if (d < radius + m.radius) {
      // 퍽의 x속도 방향 반전
      vx *= -1;
      
      // 퍽이 말렛에 끼지 않도록 바깥으로 밀어내기
      if (m.side.equals("left")) {
        x = m.x + m.radius + radius;
      } else {
        x = m.x - m.radius - radius;
      }
    }
  }

  // 위, 아래쪽 벽 충돌 확인
  void checkWalls() {
    if (y < radius) { // 위쪽 벽
      y = radius;
      vy *= -1;
    } else if (y > height - radius) { // 아래쪽 벽
      y = height - radius;
      vy *= -1;
    }
  }

  // 왼쪽, 오른쪽 골대(벽) 확인
  void checkGoal() {
    if (x < 0 - radius) { // 왼쪽 벽 (P2 득점)
      gameManager.pointScored("leftGoal");
    } else if (x > width + radius) { // 오른쪽 벽 (P1 득점)
      gameManager.pointScored("rightGoal");
    }
  }

  // 퍽 그리기
  void show() {
    fill(255, 255, 100); // 노란색 퍽
    noStroke();
    ellipse(x, y, radius * 2, radius * 2);
  }
}

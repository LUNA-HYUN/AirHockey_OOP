// --- Score 클래스 ---

class Score {
  int leftScore;
  int rightScore;
  int winScore = 5;

  Score() {
    reset();
  }

  // 점수 초기화
  void reset() {
    leftScore = 0;
    rightScore = 0;
  }

  // P1 득점
  void updateLeft() {
    leftScore++;
  }

  // P2 득점
  void updateRight() {
    rightScore++;
  }

  // 승리 확인
  boolean checkWin() {
    return (leftScore >= winScore || rightScore >= winScore);
  }

  // 점수판 그리기
  void show() {
    // 중앙선
    stroke(255, 100); // 반투명 흰색
    strokeWeight(4);
    line(width / 2, 0, width / 2, height);
    
    // 점수 텍스트
    fill(255);
    noStroke();
    textSize(60);
    textAlign(CENTER, TOP);
    text(leftScore, width / 2 - 60, 10);
    text(rightScore, width / 2 + 60, 10);
  }
}

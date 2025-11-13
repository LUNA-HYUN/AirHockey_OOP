// --- GameManager 클래스 ---

class GameManager {
  int phase; // 0: 대기, 1: 진행, 2: 게임오버

  GameManager() {
    phase = 0; // 시작 시 대기 상태
  }

  // 점수 획득 시 호출됨
  void pointScored(String side) {
    phase = 0; // 득점 후 대기 상태로 변경
    puck.reset(); // 퍽 위치 초기화
    
    // 양쪽 말렛 위치 초기화
    malletLeft.reset();
    malletRight.reset();
    
    if (side.equals("leftGoal")) { // P2 득점
      score.updateRight();
    } else if (side.equals("rightGoal")) { // P1 득점
      score.updateLeft();
    }
    
    // 승리 조건 확인
    if (score.checkWin()) {
      phase = 2; // 게임 오버 상태로 변경
    }
  }

  // 게임 완전 재시작 (게임 오버 후)
  void restartGame() {
    score.reset();
    puck.reset();
    malletLeft.reset();
    malletRight.reset();
    phase = 0; // 다시 대기 상태로
  }

  // 대기 화면 텍스트
  void showWaitScreen() {
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(30);
    text("Press SPACE to Start", width / 2, height / 2);
  }

  // 게임 오버 화면 텍스트
  void showGameOverScreen() {
    textAlign(CENTER, CENTER);
    fill(255);
    textSize(40);
    String winner = (score.leftScore >= score.winScore) ? "Player 1 Wins!" : "Player 2 Wins!";
    text("GAME OVER", width / 2, height / 2 - 40);
    text(winner, width / 2, height / 2 + 10);
    textSize(20);
    text("Press SPACE to Restart", width / 2, height / 2 + 60);
  }
}

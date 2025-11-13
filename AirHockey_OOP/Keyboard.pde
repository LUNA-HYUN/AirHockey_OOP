// 키보드 눌렸을 때
void keyPressed() {
  // P1 (왼쪽)
  if (key == 'w' || key == 'W') {
    malletLeft.moveUp();
  } else if (key == 's' || key == 'S') {
    malletLeft.moveDown();
  }
  
  // P2 (오른쪽)
  if (keyCode == UP) {
    malletRight.moveUp();
  } else if (keyCode == DOWN) {
    malletRight.moveDown();
  }
  
  // 게임 시작 / 재시작
  if (key == ' ') {
    if (gameManager.phase == 0) { // 대기 상태일 때
      gameManager.phase = 1; // 게임 시작
    } else if (gameManager.phase == 2) { // 게임 오버 상태일 때
      gameManager.restartGame(); // 점수 리셋하고 새로 시작
    }
  }
}

// 키보드 뗐을 때
void keyReleased() {
  // P1 (왼쪽)
  if (key == 'w' || key == 'W' || key == 's' || key == 'S') {
    malletLeft.stop();
  }
  
  // P2 (오른쪽)
  if (keyCode == UP || keyCode == DOWN) {
    malletRight.stop();
  }
}

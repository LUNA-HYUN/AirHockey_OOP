void draw() {
  background(50, 50, 50); // 배경색
  
  // --- 게임 로직 업데이트 ---
  // 페이즈 1: 게임 진행 중일 때만 객체들을 움직입니다.
  if (gameManager.phase == 1) {
    // 말렛 위치 업데이트
    malletLeft.update();
    malletRight.update();
    
    // 퍽 위치 업데이트 및 충돌 검사
    puck.move();
    puck.checkWalls();
    puck.checkMallet(malletLeft);
    puck.checkMallet(malletRight);
    puck.checkGoal(); // 골인 검사
  }
  
  // --- 화면 그리기 ---
  score.show(); // 점수판 항상 표시
  malletLeft.show(); // 왼쪽 말렛 표시
  malletRight.show(); // 오른쪽 말렛 표시
  puck.show(); // 퍽 표시
  
  // --- 페이즈별 화면 오버레이 ---
  if (gameManager.phase == 0) {
    // 페이즈 0: 대기 중
    gameManager.showWaitScreen();
  } else if (gameManager.phase == 2) {
    // 페이즈 2: 게임 오버
    gameManager.showGameOverScreen();
  }
}

GameManager gameManager;
Puck puck;
Score score;
Mallet malletLeft;
Mallet malletRight;

void setup() {
  size(800, 400); // 화면 크기
  
  // 객체 인스턴스 생성
  gameManager = new GameManager();
  score = new Score();
  puck = new Puck(); // Puck은 내부에서 gameManager와 score를 참조합니다.
  
  // Mallet 생성 (x위치, y위치, 반지름, "사이드")
  float malletRadius = 30;
  malletLeft = new Mallet(30, height / 2, malletRadius, "left");
  malletRight = new Mallet(width - 30, height / 2, malletRadius, "right");
}

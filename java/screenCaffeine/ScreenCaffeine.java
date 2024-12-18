import java.awt.AWTException;
import java.awt.MouseInfo;
import java.awt.Point;
import java.awt.Robot;
import java.util.Random;

public class ScreenCaffeine {
   private static final int SECOND = 1000;          // 1초 = 1000ms
   private static final int MINUTE = 60 * SECOND;   // 1분 = 60초
   
   public ScreenCaffeine() {
   }

   public static void main(String[] args) {
      try {
         Robot robot = new Robot();
         Random random = new Random();
         System.out.println("Screen Caffine started. Press Ctrl+C to stop.");

         while (true) {
            // 기존 마우스 위치 가져오기
            Point mousePoint = MouseInfo.getPointerInfo().getLocation();
            int pointX = (int) mousePoint.getX();
            int pointY = (int) mousePoint.getY();

            // 마우스 위치를 이동
            robot.mouseMove(pointX - 1, pointY - 1);
            robot.mouseMove(pointX, pointY);

            // 실제로 업데이트된 마우스 위치 가져오기
            Point mouseLocation = MouseInfo.getPointerInfo().getLocation();
            int mouseLocationX = (int) mouseLocation.getX();
            int mouseLocationY = (int) mouseLocation.getY();

            // 키보드 입력 시뮬레이션
            robot.keyPress(16); // Shift 키 누르기
            robot.keyRelease(16); // Shift 키 떼기

            // 랜덤 시간 설정: 1분 ~ 10분
            int minSleepTime = 1 * MINUTE;  // 1분
            int maxSleepTime = 10 * MINUTE; // 10분
            int sleepTime = minSleepTime + random.nextInt(maxSleepTime - minSleepTime + 1);
            // 1분으로 강제 설정
            sleepTime = 1 * MINUTE;

            // 수정된 좌표와 대기 시간 출력
            System.out.println("Sleeping for: " + (sleepTime / MINUTE) + " minutes");
            System.out.println("Mouse Position: (X: " + mouseLocationX + ", Y: " + mouseLocationY + ")");
            
            // 스레드 대기
            Thread.sleep(sleepTime);
         }
      } catch (AWTException errAWT) {
         System.err.println("Error: Unable to create Robot instance.");
         errAWT.printStackTrace();
      } catch (InterruptedException errInt) {
         System.err.println("Error: Thread interrupted.");
         errInt.printStackTrace();
      }
   }
}

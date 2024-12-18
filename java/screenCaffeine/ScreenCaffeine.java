import java.awt.AWTException;
import java.awt.MouseInfo;
import java.awt.Point;
import java.awt.Robot;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class ScreenCaffeine {
   private static final int SECOND = 1000;          // 1초 = 1000ms
   private static final int MINUTE = 60 * SECOND;   // 1분 = 60초

   private static PrintWriter logWriter;

   public ScreenCaffeine() {
   }

   public static void main(String[] args) {
      try {
         // HOME 디렉토리 가져오기
         String homeDir = System.getenv("HOME");
         if (homeDir == null || homeDir.isEmpty()) {
            throw new IOException("HOME environment variable is not set.");
         }

         // 초기 설정 파일 경로: $HOME/ScreenCaffeine.conf
         Path initialConfigPath = Paths.get(homeDir, "utils/ScreenCaffeine.conf");
         Map<String, String> initialConfig = readConfig(initialConfigPath.toString());

         // 로그 파일 경로 설정
         String logFilename = initialConfig.get("FILENAME");
         String logFilepath = initialConfig.get("FILEPATH");
         if (logFilename == null || logFilepath == null) {
            throw new IOException("Invalid final configuration file. Missing FILENAME or FILEPATH.");
         }
         Path logFilePath = Paths.get(homeDir, logFilepath, logFilename + ".log");

         // 로그 파일 디렉토리 생성
         File logDir = logFilePath.getParent().toFile();
         if (!logDir.exists() && !logDir.mkdirs()) {
            throw new IOException("Failed to create directory: " + logDir.getAbsolutePath());
         }

         // 로그 파일 초기화 (새로 쓰기 모드)
         logWriter = new PrintWriter(new FileWriter(logFilePath.toString(), false), true); // append 모드를 false로 설정
         log("Screen Caffeine started. Press Ctrl+C to stop. Log file: " + logFilePath);

         Robot robot = new Robot();
         Random random = new Random();

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

            // 수정된 좌표와 대기 시간 출력 및 로그 기록
            String logMessage = "Sleeping for: " + (sleepTime / MINUTE) + " minutes\n" +
                                "Mouse Position: (X: " + mouseLocationX + ", Y: " + mouseLocationY + ")";
            log(logMessage);

            // 스레드 대기
            Thread.sleep(sleepTime);
         }
      } catch (AWTException errAWT) {
         String errorMessage = "Error: Unable to create Robot instance.";
         log(errorMessage);
         errAWT.printStackTrace(logWriter);
      } catch (InterruptedException errInt) {
         String errorMessage = "Error: Thread interrupted.";
         log(errorMessage);
         errInt.printStackTrace(logWriter);
      } catch (IOException errIO) {
         System.err.println("Error: Unable to read configuration or write to log file.");
         errIO.printStackTrace();
      } finally {
         if (logWriter != null) {
            logWriter.close();
         }
      }
   }

   // 로그 기록 메서드
   private static void log(String message) {
      System.out.println(message);
      logWriter.println(message);
   }

   // 설정 파일 읽기
   private static Map<String, String> readConfig(String configFilePath) throws IOException {
      Map<String, String> config = new HashMap<>();
      try (BufferedReader reader = new BufferedReader(new FileReader(configFilePath))) {
         String line;
         while ((line = reader.readLine()) != null) {
            line = line.trim();
            if (line.isEmpty() || line.startsWith("#")) {
               continue; // 빈 줄이나 주석 무시
            }
            String[] parts = line.split("=", 2); // "KEY=VALUE" 형태 분리
            if (parts.length == 2) {
               config.put(parts[0].trim(), parts[1].trim());
            }
         }
      }
      return config;
   }
}

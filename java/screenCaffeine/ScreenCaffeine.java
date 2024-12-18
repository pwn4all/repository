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
    private static final int SECOND = 1000;
    private static final int MINUTE = 60 * SECOND;
    private static final int MIN_SLEEP_TIME = 1 * MINUTE;
    private static final int MAX_SLEEP_TIME = 10 * MINUTE;

    private static PrintWriter logWriter;

    public static void main(String[] args) {
        try {
            Path configPath = getConfigPath();
            Map<String, String> config = readConfig(configPath.toString());
            Path logFilePath = getLogFilePath(config);
            initializeLogFile(logFilePath);

            log("Screen Caffeine started. Press Ctrl+C to stop. Log file: " + logFilePath);

            Robot robot = new Robot();
            Random random = new Random();

            while (true) {
                simulateMouseMovement(robot);
                simulateKeyPress(robot);

                int sleepTime = MIN_SLEEP_TIME + random.nextInt(MAX_SLEEP_TIME - MIN_SLEEP_TIME + 1);
                sleepTime = MIN_SLEEP_TIME; // Override for consistent sleep
                log("Sleeping for: " + (sleepTime / MINUTE) + " minutes");
                Thread.sleep(sleepTime);
            }
        } catch (Exception e) {
            handleException(e);
        } finally {
            closeLogWriter();
        }
    }

    private static Path getConfigPath() throws IOException {
        String homeDir = System.getenv("HOME");
        if (homeDir == null || homeDir.isEmpty()) {
            throw new IOException("HOME environment variable is not set.");
        }
        return Paths.get(homeDir, "utils/ScreenCaffeine.conf");
    }

    private static Path getLogFilePath(Map<String, String> config) throws IOException {
        String logFilename = config.get("FILENAME");
        String logFilepath = config.get("FILEPATH");
        if (logFilename == null || logFilepath == null) {
            throw new IOException("Invalid configuration file. Missing FILENAME or FILEPATH.");
        }

        Path logFilePath = Paths.get(System.getenv("HOME"), logFilepath, logFilename + ".log");
        File logDir = logFilePath.getParent().toFile();
        if (!logDir.exists() && !logDir.mkdirs()) {
            throw new IOException("Failed to create directory: " + logDir.getAbsolutePath());
        }
        return logFilePath;
    }

    private static void initializeLogFile(Path logFilePath) throws IOException {
        logWriter = new PrintWriter(new FileWriter(logFilePath.toString(), false), true);
    }

    private static void simulateMouseMovement(Robot robot) {
        Point mousePoint = MouseInfo.getPointerInfo().getLocation();
        robot.mouseMove(mousePoint.x - 1, mousePoint.y - 1);
        robot.mouseMove(mousePoint.x, mousePoint.y);

        Point updatedPoint = MouseInfo.getPointerInfo().getLocation();
        log("Mouse Position: (X: " + updatedPoint.x + ", Y: " + updatedPoint.y + ")");
    }

    private static void simulateKeyPress(Robot robot) {
        robot.keyPress(16); // Shift key
        robot.keyRelease(16);
    }

    private static Map<String, String> readConfig(String configFilePath) throws IOException {
        Map<String, String> config = new HashMap<>();
        try (BufferedReader reader = new BufferedReader(new FileReader(configFilePath))) {
            String line;
            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if (!line.isEmpty() && !line.startsWith("#")) {
                    String[] parts = line.split("=", 2);
                    if (parts.length == 2) {
                        config.put(parts[0].trim(), parts[1].trim());
                    }
                }
            }
        }
        return config;
    }

    private static void handleException(Exception e) {
        String errorMessage = "Error: " + e.getMessage();
        System.err.println(errorMessage);
        if (logWriter != null) {
            logWriter.println(errorMessage);
            e.printStackTrace(logWriter);
        } else {
            e.printStackTrace();
        }
    }

    private static void closeLogWriter() {
        if (logWriter != null) {
            logWriter.close();
        }
    }

    private static void log(String message) {
        System.out.println(message);
        if (logWriter != null) {
            logWriter.println(message);
        }
    }
}

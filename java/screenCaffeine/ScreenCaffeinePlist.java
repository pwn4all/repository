import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Paths;

public class ScreenCaffeinePlist{

    public static void main(String[] args) {
        // Get the current user's home directory
        String userHome = System.getProperty("user.home");
        String javaPath = findJavaExecutablePath();
        
        if (javaPath == null) {
            System.err.println("Java executable not found. Please ensure Java is installed.");
            return;
        }

        // Path to the ScreenCaffeine.jar file (inside the user's utils directory)
        String jarPath = Paths.get(userHome, "utils", "ScreenCaffeine.jar").toString();

        // Path for the log file
        String logPath = Paths.get(userHome, "utils", "ScreenCaffeine.log").toString();

        // Generate the plist content
        String plistContent = generatePlistContent(javaPath, jarPath, logPath);

        // Output path for the plist file
        String plistPath = Paths.get(userHome, "Library", "LaunchAgents", "com.user.screencaffeine.plist").toString();

        // Write the plist content to a file
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(plistPath))) {
            writer.write(plistContent);
            System.out.println("Plist file created successfully at: " + plistPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static String findJavaExecutablePath() {
        // Attempt to find the Java executable using the `which` command
        try {
            Process process = Runtime.getRuntime().exec("which java");
            process.waitFor();
            byte[] output = process.getInputStream().readAllBytes();
            String javaPath = new String(output).trim();
            if (!javaPath.isEmpty()) {
                return javaPath;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private static String generatePlistContent(String javaPath, String jarPath, String logPath) {
        return String.format(
            "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n" +
            "<!DOCTYPE plist PUBLIC \"-//Apple//DTD PLIST 1.0//EN\" \"http://www.apple.com/DTDs/PropertyList-1.0.dtd\">\n" +
            "<plist version=\"1.0\">\n" +
            "<dict>\n" +
            "    <key>Label</key>\n" +
            "    <string>com.user.screencaffeine</string>\n" +
            "\n" +
            "    <key>ProgramArguments</key>\n" +
            "    <array>\n" +
            "        <string>%s</string>\n" +
            "        <string>-jar</string>\n" +
            "        <string>%s</string>\n" +
            "    </array>\n" +
            "\n" +
            "    <key>RunAtLoad</key>\n" +
            "    <true/>\n" +
            "    <key>KeepAlive</key>\n" +
            "    <false/>\n" +
            "\n" +
            "    <key>StandardOutPath</key>\n" +
            "    <string>%s</string>\n" +
            "\n" +
            "    <key>StandardErrorPath</key>\n" +
            "    <string>%s</string>\n" +
            "</dict>\n" +
            "</plist>",
            javaPath, jarPath, logPath, logPath
        );
    }
}

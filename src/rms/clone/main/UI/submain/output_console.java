/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.main.UI.submain;

/**
 *
 * @author ian
 */
import javax.swing.*;
import java.awt.*;
import java.io.OutputStream;
import java.io.PrintStream;

public class output_console extends JFrame {

    private JTextArea textArea;

    public output_console() {
        setTitle("Console Output - RMS");
        setSize(600, 400);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);

        textArea = new JTextArea();
        textArea.setEditable(false);  // Users can't type here
        textArea.setFont(new Font("Monospaced", Font.PLAIN, 12));
        JScrollPane scrollPane = new JScrollPane(textArea);

        getContentPane().add(scrollPane, BorderLayout.CENTER);

        // Redirect System.out
        PrintStream printStream = new PrintStream(new OutputStream() {
            @Override
            public void write(int b) {
                // Append single characters
                textArea.append(String.valueOf((char) b));
                textArea.setCaretPosition(textArea.getDocument().getLength());
            }

            @Override
            public void write(byte[] b, int off, int len) {
                textArea.append(new String(b, off, len));
                textArea.setCaretPosition(textArea.getDocument().getLength());
            }
        }, true);

        System.setOut(printStream);
        System.setErr(printStream);  // Optionally redirect System.err as well
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            output_console window = new output_console();
            window.setVisible(true);

            // Test output
            System.out.println("Hello, this is a test!");
            System.out.println("All System.out.println calls will appear here.");
            for (int i = 1; i <= 10; i++) {
                System.out.println("Line " + i);
            }
        });
    }
}
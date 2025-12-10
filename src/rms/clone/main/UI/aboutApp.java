/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.main.UI;

/**
 *
 * @author ianschrauth
 */
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.datatransfer.StringSelection;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.net.URI;
import java.util.LinkedHashMap;
import java.util.Map;


import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.datatransfer.StringSelection;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URI;
import java.util.LinkedHashMap;
import java.util.Map;
import javax.imageio.ImageIO;

public class aboutApp extends JFrame {

    private static final String DEFAULT_CIRCLE_TEXT = "RMS";

    public aboutApp(String appName,
                       String versionNumber,
                       String buildNumber,
                       boolean isInBeta,
                       int betaNumber,
                       Map<String, String> developers,
                       String iconPath) {

        setUndecorated(true);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setBackground(new Color(0,0,0,0));
        initUI(appName, versionNumber, buildNumber, isInBeta, betaNumber, developers, iconPath);
        pack();
        setLocationRelativeTo(null);
    }

    private void initUI(String appName,
                        String versionNumber,
                        String buildNumber,
                        boolean isInBeta,
                        int betaNumber,
                        Map<String, String> developers,
                        String iconPath) {

        JPanel root = new JPanel(new BorderLayout());
        root.setBorder(new EmptyBorder(16, 16, 16, 16));
        root.setBackground(Color.WHITE);

        if (isInBeta) {
            JLabel betaLabel = new JLabel("BETA " + betaNumber, SwingConstants.CENTER);
            betaLabel.setOpaque(true);
            betaLabel.setBackground(new Color(0xd32f2f));
            betaLabel.setForeground(Color.WHITE);
            betaLabel.setFont(betaLabel.getFont().deriveFont(Font.BOLD, 16f));
            betaLabel.setBorder(new EmptyBorder(8, 12, 8, 12));
            root.add(betaLabel, BorderLayout.NORTH);
        }

        JPanel center = new JPanel();
        center.setBackground(Color.WHITE);
        center.setLayout(new BoxLayout(center, BoxLayout.X_AXIS));
        center.setBorder(new EmptyBorder(16, 8, 8, 8));

        JPanel iconPanel = createIconPanel(appName, iconPath);
        iconPanel.setPreferredSize(new Dimension(96, 96));
        iconPanel.setMaximumSize(new Dimension(96, 96));

        center.add(iconPanel);
        center.add(Box.createRigidArea(new Dimension(18, 0)));

        JPanel info = new JPanel();
        info.setBackground(Color.WHITE);
        info.setLayout(new BoxLayout(info, BoxLayout.Y_AXIS));

        JLabel appLabel = new JLabel(appName);
        appLabel.setFont(appLabel.getFont().deriveFont(Font.BOLD, 28f));
        appLabel.setAlignmentX(Component.LEFT_ALIGNMENT);

        JLabel versionLabel = new JLabel(
                String.format("Version %s (Build %s)", versionNumber, buildNumber)
        );
        versionLabel.setFont(versionLabel.getFont().deriveFont(Font.PLAIN, 14f));
        versionLabel.setForeground(new Color(0x555555));
        versionLabel.setBorder(new EmptyBorder(6, 0, 0, 0));
        versionLabel.setAlignmentX(Component.LEFT_ALIGNMENT);

        info.add(appLabel);
        info.add(versionLabel);

        info.add(Box.createRigidArea(new Dimension(0, 12)));
        JSeparator sep = new JSeparator(SwingConstants.HORIZONTAL);
        sep.setMaximumSize(new Dimension(Integer.MAX_VALUE, 1));
        info.add(sep);
        info.add(Box.createRigidArea(new Dimension(0, 12)));

        JLabel devTitle = new JLabel("Developed by");
        devTitle.setFont(devTitle.getFont().deriveFont(Font.BOLD, 13f));
        devTitle.setAlignmentX(Component.LEFT_ALIGNMENT);
        info.add(devTitle);
        info.add(Box.createRigidArea(new Dimension(0, 8)));

        JPanel devList = new JPanel();
        devList.setBackground(Color.WHITE);
        devList.setLayout(new BoxLayout(devList, BoxLayout.Y_AXIS));

        if (developers == null || developers.isEmpty()) {
            JLabel none = new JLabel("No developer information provided.");
            none.setForeground(new Color(0x777777));
            devList.add(none);
        } else {
            for (Map.Entry<String, String> entry : developers.entrySet()) {
                JPanel row = new JPanel(new BorderLayout());
                row.setBackground(Color.WHITE);

                JLabel name = new JLabel(entry.getKey());
                name.setFont(name.getFont().deriveFont(Font.PLAIN, 13f));

                JLabel email = new JLabel("<html><u>" + entry.getValue() + "</u></html>");
                email.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
                email.setToolTipText("Click to email " + entry.getKey());
                email.addMouseListener(new EmailClickListener(entry.getValue()));

                row.add(name, BorderLayout.WEST);
                row.add(email, BorderLayout.EAST);
                devList.add(row);
                devList.add(Box.createRigidArea(new Dimension(0, 6)));
            }
        }

        info.add(devList);
        info.add(Box.createRigidArea(new Dimension(0, 12)));

        JButton close = new JButton("Close");
        close.addActionListener(e -> dispose());
        close.setAlignmentX(Component.LEFT_ALIGNMENT);
        info.add(close);

        center.add(info);

        root.setBorder(BorderFactory.createCompoundBorder(
                BorderFactory.createLineBorder(new Color(0xDDDDDD)),
                new EmptyBorder(12, 12, 12, 12)
        ));

        root.add(center, BorderLayout.CENTER);

        setContentPane(root);
        root.registerKeyboardAction(e -> dispose(),
                KeyStroke.getKeyStroke("ESCAPE"),
                JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
    }

    private JPanel createIconPanel(String appName, String iconPath) {

    if (iconPath != null && !iconPath.trim().isEmpty()) {
        try {
            BufferedImage img;

            // Load from URL if http(s)
            if (iconPath.startsWith("http://") || iconPath.startsWith("https://")) {
                img = ImageIO.read(new java.net.URL(iconPath));
            } 
            // Otherwise treat as local file
            else {
                img = ImageIO.read(new File(iconPath));
            }

            if (img != null) {
                Image scaled = img.getScaledInstance(96, 96, Image.SCALE_SMOOTH);
                JLabel label = new JLabel(new ImageIcon(scaled));
                JPanel panel = new JPanel(new BorderLayout());
                panel.setBackground(Color.WHITE);
                panel.add(label, BorderLayout.CENTER);
                return panel;
            }

        } catch (Exception ignored) {
            // If URL or file fails → fallback to RMS circle
        }
    }

    // Default RMS circle icon
    return new JPanel() {
        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            int size = Math.min(getWidth(), getHeight());
            Graphics2D g2 = (Graphics2D) g;
            g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

            g2.setColor(new Color(0x2E86AB));
            g2.fillOval(0, 0, size, size);

            g2.setColor(Color.WHITE);
            g2.setFont(getFont().deriveFont(Font.BOLD, size * 0.30f));
            FontMetrics fm = g2.getFontMetrics();
            int w = fm.stringWidth(DEFAULT_CIRCLE_TEXT);
            int h = fm.getAscent();
            g2.drawString(DEFAULT_CIRCLE_TEXT, (size - w) / 2, (size + h) / 2 - 4);
        }
    };
}

    private static class EmailClickListener extends MouseAdapter {
        private final String email;
        EmailClickListener(String email) { this.email = email; }
        @Override
        public void mouseClicked(MouseEvent e) {
            try {
                Desktop.getDesktop().mail(new URI("mailto:" + email));
            } catch (Exception ex) {
                Toolkit.getDefaultToolkit().getSystemClipboard().setContents(
                        new StringSelection(email), null
                );
                JOptionPane.showMessageDialog(null,
                        "Email copied to clipboard:\n" + email);
            }
        }
    }

   
}

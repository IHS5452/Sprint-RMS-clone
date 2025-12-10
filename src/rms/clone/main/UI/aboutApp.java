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
import rms.clone.vars.*;


import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.border.EmptyBorder;
import java.awt.*;
import java.awt.datatransfer.StringSelection;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.net.URI;
import java.net.URL;
import java.util.LinkedHashMap;
import java.util.Map;
import rms.clone.vars.*;

public class aboutApp extends JDialog {

    private static final int ICON_SIZE = 160; // large centered icon
    private static final String DEFAULT_CIRCLE_TEXT = "RMS";
    private String iconPath = "https://icon-library.com/images/retail-store-icon/retail-store-icon-27.jpg";
    private  String moreInfoUrl = "https://github.com/IHS5452/Sprint-RMS-clone";
    public aboutApp(Frame owner,
                         String appName,
                         String versionNumber,
                         String buildNumber,
                         boolean isInBeta,
                         int betaNumber,
                         Map<String, String> developers,
                         Map<String, String> infoEntries) {
        super(owner, true);
        setUndecorated(true);
        setBackground(new Color(0,0,0,0));
        initUI(appName, versionNumber, buildNumber, isInBeta, betaNumber, developers, infoEntries, iconPath);
        pack();
        setLocationRelativeTo(owner);
    }

    private void initUI(String appName,
                        String versionNumber,
                        String buildNumber,
                        boolean isInBeta,
                        int betaNumber,
                        Map<String, String> developers,
                        Map<String, String> infoEntries,
                        String iconPath) {

        // Outer container for drop shadow and padding
        JPanel outer = new JPanel(new BorderLayout()) {
            @Override
            protected void paintComponent(Graphics g) {
                // transparent background
                super.paintComponent(g);
            }
        };
        outer.setOpaque(false);
        outer.setBorder(new EmptyBorder(18, 18, 18, 18));

        // Main rounded panel (light mode)
        JPanel main = new JPanel();
        main.setOpaque(false);
        main.setLayout(new BorderLayout());
        main.setBorder(new EmptyBorder(0,0,0,0));

        // Content panel with rounded background
        JPanel content = new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                int w = getWidth();
                int h = getHeight();
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

                // light subtle gradient background
                Color top = new Color(0xF7F7F8);
                Color bottom = new Color(0xEFEFF1);
                java.awt.GradientPaint gp = new java.awt.GradientPaint(0,0,top,0,h,bottom);
                g2.setPaint(gp);

                // rounded rect
                g2.fill(new RoundRectangle2D.Double(0, 0, w, h, 18, 18));

                // subtle border
                g2.setColor(new Color(0xDADAE0));
                g2.setStroke(new BasicStroke(1f));
                g2.draw(new RoundRectangle2D.Double(0.5, 0.5, w-1, h-1, 18, 18));

                g2.dispose();
            }
        };
        content.setOpaque(false);
        content.setLayout(new BorderLayout());
        content.setBorder(new EmptyBorder(18, 22, 14, 22));

        // --- Top: beta banner if needed ---
        if (isInBeta) {
            JLabel beta = new JLabel("BETA " + betaNumber, SwingConstants.CENTER);
            beta.setOpaque(true);
            beta.setBackground(new Color(0xD32F2F)); // red
            beta.setForeground(Color.WHITE);
            beta.setFont(beta.getFont().deriveFont(Font.BOLD, 14f));
            beta.setBorder(new EmptyBorder(6, 12, 6, 12));
            JPanel betaWrap = new JPanel(new BorderLayout());
            betaWrap.setOpaque(false);
            betaWrap.add(beta, BorderLayout.NORTH);
            content.add(betaWrap, BorderLayout.NORTH);
        }

        // --- Center: icon, title, version/build ---
        Box centerBox = Box.createVerticalBox();
        centerBox.setOpaque(false);
        centerBox.setBorder(new EmptyBorder(12, 12, 12, 12));

        JPanel iconPanel = createIconPanel(iconPath);
        iconPanel.setAlignmentX(Component.CENTER_ALIGNMENT);
        iconPanel.setPreferredSize(new Dimension(ICON_SIZE, ICON_SIZE));
        iconPanel.setMaximumSize(new Dimension(ICON_SIZE, ICON_SIZE));
        centerBox.add(iconPanel);
        centerBox.add(Box.createVerticalStrut(12));

        JLabel titleLabel = new JLabel(appName);
        titleLabel.setFont(titleLabel.getFont().deriveFont(Font.BOLD, 22f));
        titleLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
        centerBox.add(titleLabel);

//        JLabel subLabel = new JLabel(String.format("Version %s (Build %s)", versionNumber, buildNumber));
//        subLabel.setFont(subLabel.getFont().deriveFont(Font.PLAIN, 12f));
//        subLabel.setForeground(new Color(0x444444));
//        subLabel.setAlignmentX(Component.CENTER_ALIGNMENT);
//        centerBox.add(Box.createVerticalStrut(6));
//        centerBox.add(subLabel);

        centerBox.add(Box.createVerticalStrut(14));

        // Separator
        JSeparator sep = new JSeparator(SwingConstants.HORIZONTAL);
        sep.setMaximumSize(new Dimension(800, 1));
        centerBox.add(sep);
        centerBox.add(Box.createVerticalStrut(12));

        // --- Info grid: two-column (labels left bold, values right) ---
        JPanel infoGrid = new JPanel(new GridBagLayout());
        infoGrid.setOpaque(false);
        infoGrid.setAlignmentX(Component.CENTER_ALIGNMENT);

        GridBagConstraints gbc = new GridBagConstraints();
        gbc.anchor = GridBagConstraints.NORTHWEST;
        gbc.insets = new Insets(6, 0, 6, 12);
        gbc.gridx = 0;
        gbc.gridy = 0;
        gbc.weightx = 0.0;

        GridBagConstraints gbcVal = new GridBagConstraints();
        gbcVal.anchor = GridBagConstraints.NORTHWEST;
        gbcVal.insets = new Insets(6, 0, 6, 0);
        gbcVal.gridx = 1;
        gbcVal.gridy = 0;
        gbcVal.weightx = 1.0;
        gbcVal.fill = GridBagConstraints.HORIZONTAL;

        if (infoEntries != null && !infoEntries.isEmpty()) {
            for (Map.Entry<String, String> e : infoEntries.entrySet()) {
                JLabel left = new JLabel(e.getKey() + ":");
                left.setFont(left.getFont().deriveFont(Font.BOLD, 12f));
                left.setForeground(new Color(0x333333));

                JLabel right = new JLabel(e.getValue());
                right.setFont(right.getFont().deriveFont(Font.PLAIN, 12f));
                right.setForeground(new Color(0x222222));

                infoGrid.add(left, gbc);
                infoGrid.add(right, gbcVal);

                gbc.gridy++;
                gbcVal.gridy++;
            }
        } else {
            JLabel none = new JLabel("No system information available.");
            none.setFont(none.getFont().deriveFont(Font.PLAIN, 12f));
            infoGrid.add(none, gbc);
            gbc.gridy++;
        }

        centerBox.add(infoGrid);
        centerBox.add(Box.createVerticalStrut(14));

       JButton moreBtn = new JButton("More Info...");
        moreBtn.setAlignmentX(Component.CENTER_ALIGNMENT);
        moreBtn.addActionListener(a -> {
            if (moreInfoUrl != null && !moreInfoUrl.trim().isEmpty()) {
                try {
                    Desktop.getDesktop().browse(new URI(moreInfoUrl));
                } catch (Exception ex) {
                    // fallback to the message dialog if opening URL fails
                    JOptionPane.showMessageDialog(this,
                            appName + " — More Info clicked.\n(Unable to open URL, opening fallback dialog.)",
                            "More Info", JOptionPane.INFORMATION_MESSAGE);
                }
            } else {
                JOptionPane.showMessageDialog(this,
                        appName + " — More Info clicked.\nYou can hook this to open a detailed inspector.",
                        "More Info", JOptionPane.INFORMATION_MESSAGE);
            }
        });
        centerBox.add(moreBtn);


        // Footer area: developers & small gray text
        centerBox.add(Box.createVerticalStrut(12));

        JPanel footer = new JPanel();
        footer.setOpaque(false);
        footer.setLayout(new BoxLayout(footer, BoxLayout.Y_AXIS));
        footer.setAlignmentX(Component.CENTER_ALIGNMENT);

        // Developers (show names and clickable emails) - UPDATED to vertical list
        if (developers != null && !developers.isEmpty()) {
            // vertical panel to hold each developer on its own line
            JPanel devPanel = new JPanel();
            devPanel.setOpaque(false);
            devPanel.setLayout(new BoxLayout(devPanel, BoxLayout.Y_AXIS));
            devPanel.setAlignmentX(Component.CENTER_ALIGNMENT);

            for (Map.Entry<String, String> d : developers.entrySet()) {
                String name = d.getKey();
                String email = d.getValue();

                // Each developer row: "Name | email" with email clickable
                JPanel single = new JPanel(new FlowLayout(FlowLayout.CENTER, 6, 2));
                single.setOpaque(false);

                JLabel nameLabel = new JLabel(name + "  |  ");
                nameLabel.setFont(nameLabel.getFont().deriveFont(Font.PLAIN, 11f));
                nameLabel.setForeground(new Color(0x333333));

                JLabel emailLabel = new JLabel("<html><u>" + email + "</u></html>");
                emailLabel.setFont(emailLabel.getFont().deriveFont(Font.PLAIN, 11f));
                emailLabel.setForeground(new Color(0x0066CC));
                emailLabel.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
                emailLabel.addMouseListener(new EmailClickListener(email));

                single.add(nameLabel);
                single.add(emailLabel);

                devPanel.add(single);
            }

            footer.add(devPanel);
            footer.add(Box.createVerticalStrut(8));
        }

        JLabel small = new JLabel("© All Rights Reserved.");
        small.setFont(small.getFont().deriveFont(Font.PLAIN, 11f));
        small.setForeground(new Color(0x666666));
        small.setAlignmentX(Component.CENTER_ALIGNMENT);
        footer.add(small);

        centerBox.add(footer);

        // put centerBox into content center
        content.add(centerBox, BorderLayout.CENTER);

        // Wrap content into main and outer to create a drop shadow effect
        main.add(content, BorderLayout.CENTER);

        // Add outer drop-shadow panel (simple implementation: an extra panel behind with translucent border)
        JPanel shadowWrap = new JPanel(new BorderLayout()) {
            @Override
            protected void paintComponent(Graphics g) {
                // draw a subtle outer shadow rectangle
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
                int w = getWidth();
                int h = getHeight();
                // subtle shadow
                g2.setColor(new Color(0,0,0,20));
                g2.fillRoundRect(6, 6, w-12, h-12, 20, 20);
                g2.dispose();
            }
        };
        shadowWrap.setOpaque(false);
        shadowWrap.add(main, BorderLayout.CENTER);
        outer.add(shadowWrap, BorderLayout.CENTER);
        outer.add(content, BorderLayout.CENTER);

        setContentPane(outer);

        // Close on ESC
        outer.registerKeyboardAction(e -> dispose(),
                KeyStroke.getKeyStroke("ESCAPE"),
                JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

        // Allow clicking outside title area to drag? Not implemented — keep simple.
    }

    private JPanel createIconPanel(String iconPath) {
        // Attempt to load image from URL or file
        if (iconPath != null && !iconPath.trim().isEmpty()) {
            try {
                BufferedImage img;
                if (iconPath.startsWith("http://") || iconPath.startsWith("https://")) {
                    img = ImageIO.read(new URL(iconPath));
                } else {
                    File f = new File(iconPath);
                    img = ImageIO.read(f);
                }
                if (img != null) {
                    // center-crop to square then scale
                    int s = Math.min(img.getWidth(), img.getHeight());
                    BufferedImage crop = img.getSubimage((img.getWidth()-s)/2, (img.getHeight()-s)/2, s, s);
                    Image scaled = crop.getScaledInstance(ICON_SIZE, ICON_SIZE, Image.SCALE_SMOOTH);
                    JLabel pic = new JLabel(new ImageIcon(scaled));
                    pic.setBorder(new EmptyBorder(4,4,4,4));
                    JPanel p = new JPanel(new GridBagLayout());
                    p.setOpaque(false);
                    p.add(pic);
                    return p;
                }
            } catch (Exception ex) {
                // loading failed -> fallback to circle
            }
        }

        // Fallback: light circular icon with initials DEFAULT_CIRCLE_TEXT
        return new JPanel() {
            @Override
            protected void paintComponent(Graphics g) {
                super.paintComponent(g);
                int size = Math.min(getWidth(), getHeight());
                if (size <= 0) size = ICON_SIZE;
                Graphics2D g2 = (Graphics2D) g.create();
                g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

                // light rounded circle with subtle border
                g2.setColor(new Color(0xE6EEF6)); // pale blue
                g2.fillOval(0,0,size,size);

                g2.setColor(new Color(0x2E86AB)); // darker blue border
                g2.setStroke(new BasicStroke(3f));
                g2.drawOval(1,1,size-2,size-2);

                // Text
                g2.setColor(new Color(0x1B3A57));
                g2.setFont(getFont().deriveFont(Font.BOLD, size * 0.28f));
                FontMetrics fm = g2.getFontMetrics();
                int w = fm.stringWidth(DEFAULT_CIRCLE_TEXT);
                int h = fm.getAscent();
                g2.drawString(DEFAULT_CIRCLE_TEXT, (size - w)/2, (size + h)/2 - 4);

                g2.dispose();
            }
            @Override
            public Dimension getPreferredSize() {
                return new Dimension(ICON_SIZE, ICON_SIZE);
            }
        };
    }

    // Email click: try to open mail client, otherwise copy to clipboard and show dialog
    private static class EmailClickListener extends MouseAdapter {
        private final String email;
        EmailClickListener(String email) { this.email = email; }
        @Override
        public void mouseClicked(MouseEvent e) {
            try {
                if (!Desktop.isDesktopSupported()) throw new UnsupportedOperationException();
                Desktop d = Desktop.getDesktop();
                if (!d.isSupported(Desktop.Action.MAIL)) throw new UnsupportedOperationException();
                d.mail(new URI("mailto:" + email));
            } catch (Throwable ex) {
                Toolkit.getDefaultToolkit().getSystemClipboard()
                        .setContents(new StringSelection(email), null);
                JOptionPane.showMessageDialog(null,
                        "Unable to open mail client. Email copied to clipboard:\n" + email,
                        "Mail Not Available",
                        JOptionPane.INFORMATION_MESSAGE);
            }
        }
    }

    // Example demo
    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> {
            Map<String,String> devs = new LinkedHashMap<>();
            devs.put("Ian Schrauth", "contact@ianschrauth.com");

            Map<String,String> info = new LinkedHashMap<>();
            info.put("App Name", version.APPLICATION_NAME);
            info.put("App Version", "V" + version.VERSION_NUMBER);
            info.put("App Build Number", version.VERISON_BUILD_NUMBER);
            info.put("Last Build Date", version.DATE_OF_LAST_BUILD);
            // add loggged in user data here


            aboutApp dlg = new aboutApp(null,
                    "",
                   "",    // (subtitle is represented inside info map above)
                    "",
                    version.IS_IN_BETA,
                    version.BETA_NUMBER,
                    devs,
                    info
                    );
            dlg.setVisible(true);
        });
    }
}

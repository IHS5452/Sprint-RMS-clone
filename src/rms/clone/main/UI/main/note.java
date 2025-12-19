/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.main.UI.main;

/**
 *
 * @author ischrauth
 */
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import rms.clone.main.business.vars;

public class note extends JFrame {
    
    public note(String noteContent, int noteId, String noteTitle) {
        setTitle(noteTitle);
        setSize(400, 200);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setLayout(new BorderLayout(10, 10));
        
        JTextArea textArea = new JTextArea(noteContent);
        textArea.setWrapStyleWord(true);
        textArea.setLineWrap(true);
        textArea.setEditable(false);
        textArea.setFocusable(false);
        textArea.setOpaque(false);
        textArea.setFont(new Font("Arial", Font.PLAIN, 14));
        
        JScrollPane scrollPane = new JScrollPane(textArea);
        add(scrollPane, BorderLayout.CENTER);
        
        JPanel buttonPanel = new JPanel();
        JButton closeButton = new JButton("Close");
        JButton readButton = new JButton("Read");
        
        buttonPanel.add(readButton);
        buttonPanel.add(closeButton);
        
        add(buttonPanel, BorderLayout.SOUTH);
        
        // Close button action
        closeButton.addActionListener(e -> dispose());
        
        // Read button action
        readButton.addActionListener(e -> {
            markNoteAsRead(noteId); // Run the SQL command
            dispose();
        });
        
        setVisible(true);
    }
    
    private void markNoteAsRead(int noteId) {
        try {
            PreparedStatement stmt = vars.conn.prepareStatement(
                "UPDATE customer_alerts SET is_active = false WHERE alert_id = ?"
            );
            stmt.setInt(1, noteId);
            stmt.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Failed to mark note as read.", "Error", JOptionPane.ERROR_MESSAGE);
        }
    }
}

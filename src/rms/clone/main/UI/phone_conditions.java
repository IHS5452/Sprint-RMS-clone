/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.main.UI;

/**
 *
 * @author ianschrauth
 */
// ConditionQuestionnaireFrame.java
import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import classes.ConditionStore;


public class phone_conditions extends JFrame {

    // Screen condition
    private JRadioButton screenPerfect;
    private JRadioButton screenMinor;
    private JRadioButton screenCracked;

    // Body condition
    private JRadioButton bodyPerfect;
    private JRadioButton bodyMinor;
    private JRadioButton bodyHeavy;

    // Battery
    private JRadioButton batteryStrong;
    private JRadioButton batteryAverage;
    private JRadioButton batteryWeak;

    // Water damage
    private JRadioButton waterNo;
    private JRadioButton waterUnknown;
    private JRadioButton waterYes;

    // Functionality
    private JCheckBox allButtonsWork;
    private JCheckBox cameraWorks;
    private JCheckBox speakersWork;
    private JCheckBox chargingPortWorks;

    private JButton submitButton;
    private JButton cancelButton;

    public phone_conditions() {
        setTitle("Used Phone Condition Questionnaire");
        setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);
        setSize(500, 500);
        setLocationRelativeTo(null);

        initComponents();
    }

    private void initComponents() {
        JPanel mainPanel = new JPanel();
        mainPanel.setLayout(new BoxLayout(mainPanel, BoxLayout.Y_AXIS));
        mainPanel.setBorder(BorderFactory.createEmptyBorder(10, 10, 10, 10));

        // SCREEN CONDITION
        mainPanel.add(new JLabel("1. Screen condition:"));
        screenPerfect = new JRadioButton("No scratches or cracks");
        screenMinor = new JRadioButton("Light scratches, no cracks");
        screenCracked = new JRadioButton("Cracked or heavy damage");

        ButtonGroup screenGroup = new ButtonGroup();
        screenGroup.add(screenPerfect);
        screenGroup.add(screenMinor);
        screenGroup.add(screenCracked);
        screenPerfect.setSelected(true);

        mainPanel.add(screenPerfect);
        mainPanel.add(screenMinor);
        mainPanel.add(screenCracked);
        mainPanel.add(Box.createVerticalStrut(10));

        // BODY CONDITION
        mainPanel.add(new JLabel("2. Body/frame condition:"));
        bodyPerfect = new JRadioButton("No dents, minimal wear");
        bodyMinor = new JRadioButton("Small dents or noticeable scratches");
        bodyHeavy = new JRadioButton("Major dents or heavy wear");

        ButtonGroup bodyGroup = new ButtonGroup();
        bodyGroup.add(bodyPerfect);
        bodyGroup.add(bodyMinor);
        bodyGroup.add(bodyHeavy);
        bodyPerfect.setSelected(true);

        mainPanel.add(bodyPerfect);
        mainPanel.add(bodyMinor);
        mainPanel.add(bodyHeavy);
        mainPanel.add(Box.createVerticalStrut(10));

        // BATTERY CONDITION
        mainPanel.add(new JLabel("3. Battery performance:"));
        batteryStrong = new JRadioButton("Lasts all day under normal use");
        batteryAverage = new JRadioButton("Needs one extra charge during the day");
        batteryWeak = new JRadioButton("Drains quickly / needs multiple charges");

        ButtonGroup batteryGroup = new ButtonGroup();
        batteryGroup.add(batteryStrong);
        batteryGroup.add(batteryAverage);
        batteryGroup.add(batteryWeak);
        batteryStrong.setSelected(true);

        mainPanel.add(batteryStrong);
        mainPanel.add(batteryAverage);
        mainPanel.add(batteryWeak);
        mainPanel.add(Box.createVerticalStrut(10));

        // WATER DAMAGE
        mainPanel.add(new JLabel("4. Water damage:"));
        waterNo = new JRadioButton("No known water damage");
        waterUnknown = new JRadioButton("Not sure / unknown");
        waterYes = new JRadioButton("Has been exposed to water");

        ButtonGroup waterGroup = new ButtonGroup();
        waterGroup.add(waterNo);
        waterGroup.add(waterUnknown);
        waterGroup.add(waterYes);
        waterNo.setSelected(true);

        mainPanel.add(waterNo);
        mainPanel.add(waterUnknown);
        mainPanel.add(waterYes);
        mainPanel.add(Box.createVerticalStrut(10));

        // FUNCTIONALITY
        mainPanel.add(new JLabel("5. Functionality (check all that work):"));
        allButtonsWork = new JCheckBox("All buttons work");
        cameraWorks = new JCheckBox("Front and rear cameras work");
        speakersWork = new JCheckBox("Speakers and microphone work");
        chargingPortWorks = new JCheckBox("Charging port works reliably");

        allButtonsWork.setSelected(true);
        cameraWorks.setSelected(true);
        speakersWork.setSelected(true);
        chargingPortWorks.setSelected(true);

        mainPanel.add(allButtonsWork);
        mainPanel.add(cameraWorks);
        mainPanel.add(speakersWork);
        mainPanel.add(chargingPortWorks);
        mainPanel.add(Box.createVerticalStrut(20));

        // BUTTONS
        JPanel buttonPanel = new JPanel(new FlowLayout(FlowLayout.RIGHT));
        submitButton = new JButton("Submit");
        cancelButton = new JButton("Cancel");

        buttonPanel.add(cancelButton);
        buttonPanel.add(submitButton);

        mainPanel.add(buttonPanel);

        setContentPane(mainPanel);

        // Listeners
        submitButton.addActionListener(new SubmitListener());
        cancelButton.addActionListener(e -> dispose());
    }

    private class SubmitListener implements ActionListener {
        @Override
        public void actionPerformed(ActionEvent e) {
            String condition = evaluateCondition();
            ConditionStore.setPhoneCondition(condition);
            recycle_device.condition_txt.setText(condition);

            JOptionPane.showMessageDialog(
                    phone_conditions.this,
                    "Detected condition: " + condition,
                    "Condition Evaluated",
                    JOptionPane.INFORMATION_MESSAGE
            );

            dispose(); // close the questionnaire window
        }
    }

    /**
     * Basic scoring logic based on answers
     * You can tweak this however you like.
     */
    private String evaluateCondition() {
        int score = 0;

        // Screen
        if (screenPerfect.isSelected()) {
            score += 3;
        } else if (screenMinor.isSelected()) {
            score += 2;
        } else if (screenCracked.isSelected()) {
            score += 0;
        }

        // Body
        if (bodyPerfect.isSelected()) {
            score += 3;
        } else if (bodyMinor.isSelected()) {
            score += 2;
        } else if (bodyHeavy.isSelected()) {
            score += 0;
        }

        // Battery
        if (batteryStrong.isSelected()) {
            score += 3;
        } else if (batteryAverage.isSelected()) {
            score += 2;
        } else if (batteryWeak.isSelected()) {
            score += 0;
        }

        // Water damage
        if (waterNo.isSelected()) {
            score += 3;
        } else if (waterUnknown.isSelected()) {
            score += 1;
        } else if (waterYes.isSelected()) {
            score += 0;
        }

        // Functionality checkboxes
        if (allButtonsWork.isSelected()) score += 1;
        if (cameraWorks.isSelected()) score += 1;
        if (speakersWork.isSelected()) score += 1;
        if (chargingPortWorks.isSelected()) score += 1;

        // Max score = 3+3+3+3+4 = 16
        if (score >= 14) {
            return "Like New";
        } else if (score >= 10) {
            return "Good";
        } else if (score >= 6) {
            return "Fair";
        } else {
            return "Poor";
        }
    }
}

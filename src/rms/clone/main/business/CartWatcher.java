/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.main.business;

import javax.swing.Timer;
import javax.swing.event.TableModelEvent;
import javax.swing.table.TableModel;
import java.sql.*;
import java.util.HashSet;
import java.util.Set;
import rms.clone.main.UI.main.RMS_Clone_CSR;

/**
 * author: ian schrauth
 */
public class CartWatcher {

    private final Set<String> insertedKeys = new HashSet<>();
    private final Set<Integer> pendingRows = new HashSet<>();
    private Timer debounceTimer;

    public CartWatcher() {
        System.out.println("[CartWatcher] Monitoring started...");
        setupListener();
    }

    /**
     * Attaches the listener to the current model. 
     * Call this again if you ever execute cart_table.setModel().
     */
    public void rebind() {
        setupListener();
    }

    private void setupListener() {
        // 300ms delay to ensure the UI has finished updating before DB work starts
        debounceTimer = new Timer(300, e -> processPendingRows());
        debounceTimer.setRepeats(false);

        RMS_Clone_CSR.cart_table.getModel().addTableModelListener(e -> {
            // We only care about NEW rows being added
            if (e.getType() == TableModelEvent.INSERT) {
                for (int i = e.getFirstRow(); i <= e.getLastRow(); i++) {
                    pendingRows.add(i);
                }
                debounceTimer.restart();
            }
        });
    }

    private void processPendingRows() {
        TableModel model = RMS_Clone_CSR.cart_table.getModel();

        for (int row : pendingRows) {
            if (row >= model.getRowCount()) continue; // Safety check

            if (isRowValid(model, row)) {
                String orderNumber = RMS_Clone_CSR.orderNumber_txt.getText();
                String itemName = String.valueOf(model.getValueAt(row, 1));
                String uniqueKey = orderNumber + "|" + itemName;

                if (!insertedKeys.contains(uniqueKey)) {
                    insertRow(model, row, orderNumber);
                    insertedKeys.add(uniqueKey);
                }
            }
        }
        pendingRows.clear();
    }

    private boolean isRowValid(TableModel model, int row) {
        try {
            // Check columns 1 through 4 (Item, Price, Qty, Activation)
            for (int i = 1; i <= 4; i++) {
                Object val = model.getValueAt(row, i);
                if (val == null || val.toString().trim().isEmpty()) return false;
            }
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    private void insertRow(TableModel model, int row, String orderNumber) {
        String sql = "INSERT INTO transactions_pending " +
                     "(ptid, order_number, item_name, item_price, quantity, is_activation, for_account_number, handeling_agent_pid, status) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            // Safely parse data
            String itemName = model.getValueAt(row, 1).toString();
            double itemPrice = Double.parseDouble(model.getValueAt(row, 2).toString());
            int quantity = Integer.parseInt(model.getValueAt(row, 3).toString());
            boolean isActivation = Boolean.parseBoolean(model.getValueAt(row, 4).toString());
            
            // Assuming vars class handles connection and session data
            String accountNumber = vars.selectedCx.getAccountNumber();
            int agentPid = vars.selectedCx.getId();
            String ptid = generatePTID(orderNumber);

            try (PreparedStatement ps = vars.conn.prepareStatement(sql)) {
                ps.setString(1, ptid);
                ps.setString(2, orderNumber);
                ps.setString(3, itemName);
                ps.setDouble(4, itemPrice);
                ps.setInt(5, quantity);
                ps.setBoolean(6, isActivation);
                ps.setString(7, accountNumber);
                ps.setInt(8, agentPid);
                ps.setString(9, "PENDING");

                ps.executeUpdate();
                System.out.println("[DB] Successfully inserted: " + ptid);
            }
        } catch (SQLException e) {
            System.err.println("[DB Error] SQL State: " + e.getSQLState() + " - " + e.getMessage());
        } catch (Exception e) {
            System.err.println("[System Error] " + e.getMessage());
        }
    }

    private String generatePTID(String orderNumber) {
        String query = "SELECT ptid FROM transactions_pending WHERE order_number = ? ORDER BY ptid DESC LIMIT 1";
        
        try (PreparedStatement ps = vars.conn.prepareStatement(query)) {
            ps.setString(1, orderNumber);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String last = rs.getString("ptid");
                    // Handles PTID format: ORD123-1
                    String[] parts = last.split("-");
                    int num = Integer.parseInt(parts[parts.length - 1]);
                    return orderNumber + "-" + (num + 1);
                }
            }
        } catch (Exception e) {
            System.err.println("[PTID Error] Falling back to default: " + e.getMessage());
        }
        return orderNumber + "-1";
    }
}
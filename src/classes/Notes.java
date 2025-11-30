/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package classes;

import java.sql.Timestamp;
/**
 *
 * @author ischrauth
 */
public class Notes {
    
    public static int noteID;
        public static int createdByPID;
    public static String assigned_to_groupo_id;
    public static String note_content;
    public static Timestamp time_created;

    public Notes() {
    }

    
    
    
    
    
    
    
  
    public static int getNoteID() {
        return noteID;
    }

    public static void setNoteID(int noteID) {
        Notes.noteID = noteID;
    }

    public static int getCreatedByPID() {
        return createdByPID;
    }

    public static void setCreatedByPID(int createdByPID) {
        Notes.createdByPID = createdByPID;
    }

    public static String getAssigned_to_groupo_id() {
        return assigned_to_groupo_id;
    }

    public static void setAssigned_to_groupo_id(String assigned_to_groupo_id) {
        Notes.assigned_to_groupo_id = assigned_to_groupo_id;
    }

    public static String getNote_content() {
        return note_content;
    }

    public static void setNote_content(String note_content) {
        Notes.note_content = note_content;
    }

    public static Timestamp getTime_created() {
        return time_created;
    }

    public static void setTime_created(Timestamp time_created) {
        Notes.time_created = time_created;
    }
    
    
    
    

    
    
    
}

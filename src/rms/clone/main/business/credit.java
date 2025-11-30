/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package rms.clone.main.business;

/**
 *
 * @author ianschrauth
 */



 //credit classes for indavidual:
    // 715 - 800 score: U
    // 600 - 714 score: M
    // 300 - 599: L
    // prepaid: P
    


// credit class for business:
    // 745 - 800 score: U
    // 630 - 744 score: M
    // 300 - 629: L
    // prepaid: P




public class credit {
    
    public static char checkCredit(String typeOfAccount, int creditScore) {
        if (typeOfAccount == "prepaid") {
            parseCreditScoreToApprovedLines_indavidual(100);
        } else if (typeOfAccount == "postpaid_p") {
                return parseCreditScoreToApprovedLines_indavidual(creditScore);

        } else if (typeOfAccount == "postpaid_b") {
                return parseCreditScoreToApprovedLines_business(creditScore);
        } else if (typeOfAccount == "employee"){
                  return parseCreditScoreToApprovedLines_business(9999);

        } else {
                  return parseCreditScoreToApprovedLines_indavidual(0);
            
        }
        return parseCreditScoreToApprovedLines_indavidual(-1);

    }
    
    
   
   
    private static char parseCreditScoreToApprovedLines_business(int creditScore) {
        
        if (creditScore == 9999) {
            
        System.out.println("This is a new Employee Account.\n\n Approved Lines: 10\nDevice Down Payment: false\nDevice Percentage Down Payment: 0\nCredit Class: E");
        return 'E';
        
    } else if (creditScore >= 300 || (creditScore <= 629)) {
                System.out.println("Business has a lower than average credit score.\n\n Approved Lines: 1\nDevice Down Payment: true\nDevice Percentage Down Payment: 80\nCredit Class: L");
        return 'L';

    }else if (creditScore >= 630 || (creditScore <= 744)) {
                System.out.println("Business has a average credit score.\n\n Approved Lines: 3\nDevice Down Payment: true\nDevice Percentage Down Payment: 50\nCredit Class: M");
        return 'M';

    } else if (creditScore <= 745) {
          System.out.println("Business has an above average credit score.\n\n Approved Lines: 7\nDevice Down Payment: false\nDevice Percentage Down Payment: 0\nCredit Class: U");
        return 'U';

    } else {
    return 'X';
        
    }

        
}
   
    private static char parseCreditScoreToApprovedLines_indavidual(int creditScore) {
        
        if (creditScore == 100) {
            
        System.out.println("This is a prepaid Account.\n\n Approved Lines: 2\nDevice Down Payment: true\nDevice Percentage Down Payment: 100\nCredit Class: P");
        return 'P';
        
    } else if (creditScore >= 300 || (creditScore <= 599)) {
                System.out.println("Indavigual has a lower than average credit score.\n\n Approved Lines: 1\nDevice Down Payment: true\nDevice Percentage Down Payment: 80\nCredit Class: L");
        return 'L';

    }else if (creditScore >= 600 || (creditScore <= 714)) {
                System.out.println("Indavigual has a average credit score.\n\n Approved Lines: 3\nDevice Down Payment: true\nDevice Percentage Down Payment: 50\nCredit Class: M");
        return 'M';

    } else if (creditScore <= 715) {
          System.out.println("Indavigual has an above average credit score.\n\n Approved Lines: 7\nDevice Down Payment: false\nDevice Percentage Down Payment: 0\nCredit Class: U");
        return 'U';

    } else {
    
    return 'X';
        
    }

        
}
}

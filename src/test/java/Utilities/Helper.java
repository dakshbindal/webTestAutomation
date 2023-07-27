package Utilities;

import java.io.File;
import java.util.*;

public class Helper {
    public boolean checkDownloaded() throws InterruptedException{
        String downloadPath = "/Users/dakshbindal/Downloads";
        Boolean flag = true;
        Thread.sleep(20000);

        String filePath = "/Users/dakshbindal/Downloads/WinZO.apk";
        File file = new File(filePath);

        if (file.exists()) {
            System.out.println("File located in the download folder, now deleting it");
            flag = true;
        }

        if (flag) {


            if (file.exists()) {
                file.delete();
                System.out.println("File deleted");
            } else {
                System.out.println("File doesn't exists so can't delete");
            }
        } else {
            System.out.println("File doesn't exists so can't delete");
        }
        return flag;
    }
}

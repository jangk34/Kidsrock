package com.chuudok.opencsv_read;
 
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.wildpup.opencsv_read.CSVRead;
 
public class App {
 
    public static void main(String[] args) {
 
        List<String[]> data = new ArrayList<String[]>();
 
        CSVRead read = new CSVRead();
        data = read.readCsv();
 
        Iterator<String[]> it = data.iterator();
        while (it.hasNext()) {
            String[] array = (String[]) it.next();
            for (String s : array) {
                System.out.print(s + " ");
            }
            System.out.print("\n");
        }
    }
}
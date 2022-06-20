package com.doongdoongpanda2.domain.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class Main {
	public static void main(String[] args) {
		
	
	Calendar calendar = Calendar.getInstance();
	System.out.println(calendar.get(Calendar.YEAR));
	System.out.println(calendar.get(Calendar.MONTH)+1);
	System.out.println(calendar.get(Calendar.DAY_OF_MONTH));
	
	
	//10일 후
	calendar.add(Calendar.DAY_OF_MONTH, 10);
	Date date = calendar.getTime();
	SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss a");
	
	System.out.println(date);
	
	calendar.set(2023,12,19);
	
	}
}

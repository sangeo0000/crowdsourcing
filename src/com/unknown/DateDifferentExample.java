/** Designed and developed by Swapnil Kumawat
 * 
 */
package com.unknown;

/**
 * @author Master
 *
 */
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateDifferentExample {

	
	public static Long getHourDifference(String endDate){
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();            
        String startDate=dateFormat.format(date);
       
		
		//String dateStart = "03/15/2016 13:10:58";
		//String dateStop = "03/15/2016 10:31:48";

		//HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date d1 = null;
		Date d2 = null;
		long diffMinutes=0;
		long diffHours=0;

		try {
			d1 = format.parse(endDate);
			d2 = format.parse(startDate);

			//in milliseconds
			long diff = d2.getTime() - d1.getTime();

			long diffSeconds = diff / 1000 % 60;
			diffMinutes = diff / (60 * 1000) % 60;
			diffHours = diff / (60 * 60 * 1000) % 24;
			long diffDays = diff / (24 * 60 * 60 * 1000);

			System.out.print(diffDays + " days, ");
			System.out.print(diffHours + " hours, ");
			System.out.print(diffMinutes + " minutes, ");
			System.out.print(diffSeconds + " seconds.");
			//TimeDiff = diffHours+" Hour "+diffMinutes+" minutes "+diffSeconds+" Seconds Ago";

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return diffHours;
	}
	
	
	public static String getDateDifference(String endDate){
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date();            
        String startDate=dateFormat.format(date);
       
		
		//String dateStart = "03/15/2016 13:10:58";
		//String dateStop = "03/15/2016 10:31:48";

		//HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		Date d1 = null;
		Date d2 = null;
		String TimeDiff="";

		try {
			d1 = format.parse(endDate);
			d2 = format.parse(startDate);

			//in milliseconds
			long diff = d2.getTime() - d1.getTime();

			long diffSeconds = diff / 1000 % 60;
			long diffMinutes = diff / (60 * 1000) % 60;
			long diffHours = diff / (60 * 60 * 1000) % 24;
			long diffDays = diff / (24 * 60 * 60 * 1000);

			System.out.print(diffDays + " days, ");
			System.out.print(diffHours + " hours, ");
			System.out.print(diffMinutes + " minutes, ");
			System.out.print(diffSeconds + " seconds.");
			TimeDiff = diffDays+" Days "+diffHours+" Hour "+diffMinutes+" minutes "+diffSeconds+" Seconds Ago";

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return TimeDiff;
	}
	
	
	
	
	
	
	public static void main(String[] args) {

		
		
		
		
		String endDate = "2015-04-19 13:12:16";
		//String dateStop = "03/15/2016 10:31:48";
		
		
		String diff = getDateDifference(endDate);

	}

}
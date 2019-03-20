package com.unknown;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import javax.servlet.ServletException;



public class Stopwords {

	
	public  Stopwords() 
	{
     
	}
	
    DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    Date date = new Date();            
    String Addeddate=dateFormat.format(date);
    
    Statement st = null;
    PreparedStatement pstmt = null;
    PreparedStatement pstmt1 = null;
    PreparedStatement pstmt2 = null;
    ResultSet rs = null;
    
    public static String removeStopWords(String content) throws IOException 
    {
    	 String stop = null;
		String[] stopWrds = { "without", "see", "unless", "due", "also",
				"must", "might", "like", "]", "[", "}", "{", "<", ">", "?",
				"\"", "\\", "/", ")", "(", "will", "may", "can", "much",
				"every", "the", "in", "other", "this", "the", "many", "any",
				"an", "or", "for", "in", "an", "an ", "is", "a", "about",
				"above", "after", "again", "against", "all", "am", "an", "and",
				"any", "are", "aren’t", "as", "at", "be", "because", "been",
				"before", "being", "below", "between", "both", "but", "by",
				"can’t", "cannot", "could", "couldn’t", "did", "didn’t", "do",
				"does", "doesn’t", "doing", "don’t", "down", "during", "each",
				"few", "for", "from", "further", "had", "hadn’t", "has",
				"hasn’t", "have", "haven’t", "having", "he", "he’d", "he’ll",
				"he’s", "her", "here", "here’s", "hers", "herself", "him",
				"himself", "his", "how", "how’s", "i ", " i", "i’d", "i’ll",
				"i", "i’m", "i’ve", "if", "in", "into", "is", "isn’t", "it",
				"it’s", "its", "itself", "let’s", "me", "more", "most",
				"mustn’t", "my", "myself", "no", "nor", "not", "of", "off",
				"on", "once", "only", "ought", "our", "ours", "ourselves",
				"out", "over", "own", "same", "shan’t", "she", "she’d",
				"she’ll", "she’s", "should", "shouldn’t", "so", "some", "such",
				"than", "that", "that’s", "their", "theirs", "them",
				"themselves", "then", "there", "there’s", "these", "they",
				"they’d", "they’ll", "they’re", "they’ve", "this", "those",
				"through", "to", "too", "under", "until", "up", "very", "was",
				"wasn’t", "we", "we’d", "we’ll", "we’re", "we’ve", "were",
				"weren’t", "what", "what’s", "when", "when’s", "where",
				"where’s", "which", "while", "who", "who’s", "whom", "why",
				"why’s", "with", "won’t", "would", "wouldn’t", "you", "you’d",
				"you’ll", "you’re", "you’ve", "your", "yours", "yourself",
				"yourselves", "Without", "See", "Unless", "Due", "Also",
				"Must", "Might", "Like", "Will", "May", "Can", "Much", "Every",
				"The", "In", "Other", "This", "The", "Many", "Any", "An", "Or",
				"For", "In", "An", "An ", "Is", "A", "About", "Above", "After",
				"Again", "Against", "All", "Am", "An", "And", "Any", "Are",
				"Aren’t", "As", "At", "Be", "Because", "Been", "Before",
				"Being", "Below", "Between", "Both", "But", "By", "Can’t",
				"Cannot", "Could", "Couldn’t", "Did", "Didn’t", "Do", "Does",
				"Doesn’t", "Doing", "Don’t", "Down", "During", "Each", "Few",
				"For", "From", "Further", "Had", "Hadn’t", "Has", "Hasn’t",
				"Have", "Haven’t", "Having", "He", "He’d", "He’ll", "He’s",
				"Her", "Here", "Here’s", "Hers", "Herself", "Him", "Himself",
				"His", "How", "How’s", "I ", " I", "I’d", "I’ll", "I’m",
				"I’ve", "If", "In", "Into", "Is", "Isn’t", "It", "It’s", "Its",
				"Itself", "Let’s", "Me", "More", "Most", "Mustn’t", "My",
				"Myself", "No", "Nor", "Not", "Of", "Off", "On", "Once",
				"Only", "Ought", "Our", "Ours", "Ourselves", "Out", "Over",
				"Own", "Same", "Shan’t", "She", "She’d", "She’ll", "She’s",
				"Should", "Shouldn’t", "So", "Some", "Such", "Than", "That",
				"That’s", "Their", "Theirs", "Them", "Themselves", "Then",
				"There", "There’s", "These", "They", "They’d", "They’ll",
				"They’re", "They’ve", "This", "Those", "Through", "To", "Too",
				"Under", "Until", "Up", "Very", "Was", "Wasn’t", "We", "We’d",
				"We’ll", "We’re", "We’ve", "Were", "Weren’t", "What", "What’s",
				"When", "When’s", "Where", "Where’s", "Which", "While", "Who",
				"Who’s", "Whom", "Why", "Why’s", "With", "Won’t", "Would",
				"Wouldn’t", "You", "You’d", "You’ll", "You’re", "You've",
				"Your", "Yours", "Yourself", "Yourselves", "specifically",
				"designed", "implementation", "dependencies", "possible",
				"intended", "let", "write", "once", "anywhere", "meaning",
				"compiled", "support", "need", "recompilation", "typically",
				"regardless", "one", "popular", "use", "particularly",
				"reported", "originally", "which", "since", "acquired",
				"corporation", "released", "component", "derives", "fewer",
				"facilities", "either", "them", "original", "libraries",
				"originally", "proprietary", "community", "typical", "special",
				"depends", "depend", "cover", "out", "meet", "someone", "hang",
				"fell", "specific", "particular", "be", "under" };

    	  //String content = request.getParameter("content");
    	  //PrintWriter out = response.getWriter();
    	  try {
    	   Scanner fip1 = new Scanner(content);
    	   StringBuffer sb = new StringBuffer();
    	   String All = "";
    	   while (fip1.hasNext()) {
    	    int flag = 1;
    	    String s1 = fip1.next();
    	    s1 = s1.toLowerCase();
    	    for (int i = 0; i < stopWrds.length; i++) {
    	     if (s1.equals(stopWrds[i].toLowerCase())) {
    	      flag = 0;
    	     }
    	    }
    	    if (flag != 0) {
    	     //System.out.print(s1 + " ");
    	     All = All + s1 + " ";     
    	     stop=All;
    	    }
    	   }
    	  }catch (Exception e) {
    		e.printStackTrace();
    	}
    	return stop;
    	
    }
   
}

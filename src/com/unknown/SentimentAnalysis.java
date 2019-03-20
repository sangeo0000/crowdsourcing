package com.unknown;

public class SentimentAnalysis {
	
	public String naturalDisaster(String tweet)
	{
		String temp = "";
		String str=tweet;
		
		String sentence[]=str.split(" ");
		
		String inputSearch[] = { "fire", "flood", "earthquake"};

		int flag=0;
		
		for(int i=0;i<inputSearch.length;i++)
		{
			
			for(int j=0;j<sentence.length;j++)
			{
				
				sentence[j]=sentence[j].replaceAll("[-+.^:,!]","").toLowerCase();
				
				if(sentence[j].equals(inputSearch[i]) || sentence[j].contains(inputSearch[i]))
				{
					
					temp = inputSearch[i];
					break;
					
				}
				
				
				
			}
		}
		return temp;
		
	}
	
	
	
	public String places(String tweet)
	{
		String temp = "";
		String str=tweet;
		
		String sentence[]=str.split(" ");
		
		String inputSearch[] = { "pune", "mumbai", "kolhapur"};

		int flag=0;
		
		for(int i=0;i<inputSearch.length;i++)
		{
			
			for(int j=0;j<sentence.length;j++)
			{
				
				sentence[j]=sentence[j].replaceAll("[-+.^:,!]","").toLowerCase();
				
				if(sentence[j].equals(inputSearch[i]) || sentence[j].contains(inputSearch[i]))
				{
					
					temp = inputSearch[i];
					break;
					
				}
				
				
				
			}
		}
		return temp;
		
	}

}

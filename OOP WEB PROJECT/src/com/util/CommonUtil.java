package com.util;

import java.util.ArrayList;

/**
 * Class implementation common util class
 * @author IT19362854 - S.L Abeygunawardana
 */

public class CommonUtil {
	
	//Auto generate item id
		public static String generateItemId(ArrayList<String> list)
		{
		
		//set constant prefix for item id
			String prefix = "ITM100";
			String itemID;
			int nextId;
		
		//get array size(get no of items in database)
			nextId = list.size();
			nextId ++;
			
			itemID = prefix + nextId;
			
		//if id is available 
			if(list.contains(itemID))
			{
				nextId ++;
				itemID = prefix + nextId;
			}
			
			return itemID;
		}
		
}

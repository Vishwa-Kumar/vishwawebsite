package com.vishwa.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Solution {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Solution obj = new Solution();
		String[] email = new String[] { "test.email+alex@leetcode.com", "test.email@leetcode.com" };

		// ["test.email+alex@leetcode.com", "test.email@leetcode.com"]
		System.out.println(obj.numUniqueEmails(email));

	}

	// my solution leetcode
	public int numUniqueEmails(String[] emails) {
		String nonDomain = "";
		String domain = "";
		String uniqueEmail;
		HashSet<String> hs = new HashSet<String>();
		for (String s : emails) {
			int nonDomainLastindex=(s.contains("+")?s.indexOf("+"):s.indexOf("@"));
			nonDomain = s.substring(0, nonDomainLastindex); 
			System.out.println("nonDomain   "+nonDomain);
			nonDomain = nonDomain.replace(".", "");
			domain = s.substring(s.indexOf("@"));
			uniqueEmail = nonDomain + domain;
			hs.add(uniqueEmail);
		}
		return hs.size();
	}

}

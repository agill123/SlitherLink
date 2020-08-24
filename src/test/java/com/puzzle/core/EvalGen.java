package com.puzzle.core;

import java.util.ArrayList;

public class EvalGen {

	public static void main(String[] args) {
		//create arraylists
		ArrayList<Double> easyTimes =new ArrayList();
		ArrayList<Double> mediumTimes =new ArrayList();
		ArrayList<Double> diffTimes =new ArrayList();
		ArrayList<String> diffs =new ArrayList();
		diffs.add("easy");
		diffs.add("medium");
		diffs.add("difficult");
		
		for(int j =0;j<diffs.size();j++) {
			for( int i = 0;i<=10;i++) {
				System.out.println("J IS "+j);
				System.out.println("I IS "+i);
				SLGen slg = new SLGen(10,diffs.get(j));
				slg.rules();
				int[][] answer = slg.countSolve();
				long start = System.currentTimeMillis();
				SLSolve sl = new SLSolve(5,answer);
				sl.rules();
				sl.solve();
				double time =((System.currentTimeMillis() - start)) / 1000.0;
			    if(diffs.get(j).equals("easy"))
				easyTimes.add(time);
			    if(diffs.get(j).equals("medium"))
					mediumTimes.add(time);
			    if(diffs.get(j).equals("difficult"))
					diffTimes.add(time);
			}
	
	
		}
		
		for(int j =0;j<diffs.size();j++) {
		double average = 0.0;
		if(diffs.get(j).equals("easy")) {
		for(Double d:easyTimes) {
			//System.out.println(d);
			average+=d;
		}
		average = average/(Double.valueOf(easyTimes.size()));
		System.out.println("The easy average is "+average);
		}
		if(diffs.get(j).equals("medium")) {
			for(Double d:mediumTimes) {
				//System.out.println(d);
				average+=d;
			}
			average = average/(Double.valueOf(easyTimes.size()));
			System.out.println("The medium average is "+average);
			}
		if(diffs.get(j).equals("difficult")) {
			for(Double d:diffTimes) {
				//System.out.println(d);
				average+=d;
			}
			average = average/(Double.valueOf(easyTimes.size()));
			System.out.println("The difficult average is "+average);
			}
		
		}
		
		


	}
   
}

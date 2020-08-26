package com.puzzle.core;

import java.util.ArrayList;

public class EvalGen {

	public static void main(String[] args) {
		//create arraylists
		ArrayList<Double> easyTimes =new ArrayList();
		ArrayList<Integer> easyTours =new ArrayList();
		
		ArrayList<Double> mediumTimes =new ArrayList();
		ArrayList<Integer> mediumTours =new ArrayList();

		ArrayList<Double> diffTimes =new ArrayList();
		ArrayList<Integer> diffTours =new ArrayList();

		ArrayList<String> diffs =new ArrayList();
		diffs.add("easy");
		diffs.add("medium");
		diffs.add("difficult");
		
		for(int j =0;j<diffs.size();j++) {
			for( int i = 0;i<=105;i++) {
				System.out.println("J IS "+j);
				System.out.println("I IS "+i);
				SLGen slg = new SLGen(6,diffs.get(j));
				slg.rules();
				int[][] answer = slg.countSolve();
			
				long start = System.currentTimeMillis();
				SLSolve sl = new SLSolve(6,answer);
				sl.rules();
				sl.solve();
				double time =((System.currentTimeMillis() - start)) / 1000.0;
				
			    if(diffs.get(j).equals("easy")&&i>5) {
			    	
				easyTimes.add(time);
			    easyTours.add(new SLSolve(6,answer).genSolutions(3)[1]);}
			    if(diffs.get(j).equals("medium")&&i>5) {
					mediumTimes.add(time);
			  mediumTours.add(new SLSolve(6,answer).genSolutions(3)[1]);}
			    if(diffs.get(j).equals("difficult")&&i>5) {
					diffTimes.add(time);
			    diffTours.add(new SLSolve(6,answer).genSolutions(3)[1]);}
			    
			}
	
	
		}
		
		for(int j =0;j<diffs.size();j++) {
		double average = 0.0;
		if(diffs.get(j).equals("easy")) {
		for(Double d:easyTimes) {
			System.out.print(d+" ");
			average+=d;
		}
		System.out.println("Easy Tours");
		for(Integer t:easyTours) {
			System.out.print(t+" ");
			
		}
		System.out.println("\n---------------------------------------");
		average = average/(Double.valueOf(easyTimes.size()));
		System.out.println("The easy average is "+average);
		}
		if(diffs.get(j).equals("medium")) {
			for(Double d:mediumTimes) {
				System.out.print(d+" ");
				average+=d;
			}
			System.out.println("Medium Tours");
			for(Integer t:mediumTours) {
				System.out.print(t+" ");
				
			}
			System.out.println("\n---------------------------------------");
			average = average/(Double.valueOf(easyTimes.size()));
			System.out.println("The medium average is "+average);
			}
		if(diffs.get(j).equals("difficult")) {
			for(Double d:diffTimes) {
				System.out.print(d+" ");
				average+=d;
			}
			System.out.println("Difficult Tours");
			for(Integer t:diffTours) {
				System.out.print(t+" ");
				
			}
			System.out.println("\n---------------------------------------");
			average = average/(Double.valueOf(easyTimes.size()));
			System.out.println("The difficult average is "+average);
			}
		
		}
		
		


	}
   
}

package com.puzzle.resources;

import java.util.Scanner;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import org.json.simple.JSONObject;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.puzzle.core.SLGen;
import com.puzzle.core.SLSolve;

@Path("/sl")
@Produces(MediaType.APPLICATION_JSON) // This resource returns JSON content
@Consumes(MediaType.APPLICATION_JSON) // This resource can take JSON content as input
public class SlitherLinkAPI {

	ObjectWriter oWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();
	
	
	
	
	@Path("/gen")
	@GET
	public String genPuzzle(@QueryParam("puzzledim") int puzzledim) {
		String pairsString="";
		String countString="";
		SLGen slGen = new SLGen(puzzledim);
		int[][] countArr = slGen.countSolve();
		SLSolve sl = new SLSolve(puzzledim,countArr);
		   if(sl.solve()){
			   int[][] pairs=new int[sl.getSolution().length][2];
			   
            
	            for(int i=0;i<sl.getSolution().length;i++){
	            	pairs[i][0]=i;
	            	System.out.print(pairs[i][0]+" ");
	            pairs[i][1]=sl.getSolution()[i];
	            System.out.print(pairs[i][1]+" ");
	            System.out.println();
	            }
	           
	            try {
					pairsString=oWriter.writeValueAsString(pairs);
					countString=oWriter.writeValueAsString(countArr);
					
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
		   
		   JSONObject data = new JSONObject();
			   data.put("count", countString);
			   data.put("pairs",pairsString);
			   return data.toJSONString();
		   }
		   return "Did not generate";
	
	}
	
	   @Path("/solve")
	    @GET
	    public String solvePuzzle(@QueryParam("puzzledim") int puzzledim,@QueryParam("countvals") String countvals,@QueryParam("stats") boolean stats) {
		   String pairsString="";
		   int[][] countArr=new int [puzzledim-1][puzzledim-1];
		   Scanner s = new Scanner(countvals);
		   while(s.hasNextInt()) {
			   for(int i=0;i<puzzledim-1;i++) {
				   for(int j =0;j<puzzledim-1;j++) {
					   countArr[i][j]=s.nextInt();
					   System.out.print(countArr[i][j]+" ");
					  
				   }
				   System.out.println();
			   }
		   
		   }
		 
			
			   SLSolve sl = new SLSolve(puzzledim,countArr);
			   if(sl.solve()){
				   int[][] pairs=new int[sl.getSolution().length][2];
				   
	               
		            for(int i=0;i<sl.getSolution().length;i++){
		            	pairs[i][0]=i;
		            	System.out.print(pairs[i][0]+" ");
		            pairs[i][1]=sl.getSolution()[i];
		            System.out.print(pairs[i][1]+" ");
		            System.out.println();
		            }
		           
		            	System.out.println("No stats wanted");
		            try {
						pairsString=oWriter.writeValueAsString(pairs);
					} catch (JsonProcessingException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
		            if(stats) {
		            	SLSolve sl2 = new SLSolve(puzzledim,countArr);
		 			   System.out.println("Stats ARE wanted");
		 			   JSONObject data = new JSONObject();
		 			   data.put("solveTime", sl.solveTime());
		 			   data.put("numSolutions",sl2.findNumSolutions());
		 			   data.put("pairs",pairsString);
		 			   return data.toJSONString();
		 			   
		 		   }
		 		   if(!stats) {
		 			   return pairsString;
		 			   
		 		   }
	        return pairsString;
	    }
           return "Did not solve";
}
}
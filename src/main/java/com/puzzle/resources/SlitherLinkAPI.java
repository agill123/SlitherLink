package com.puzzle.resources;

import java.util.Scanner;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.puzzle.core.SLSolve;

@Path("/sl")
@Produces(MediaType.APPLICATION_JSON) // This resource returns JSON content
@Consumes(MediaType.APPLICATION_JSON) // This resource can take JSON content as input
public class SlitherLinkAPI {
	
	
	
	ObjectWriter oWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();
	
	
	
	
	   @Path("/solve")
	    @GET
	    public String getNamedGreeting(@QueryParam("puzzledim") int puzzledim,@QueryParam("countvals") String countvals) {
		   System.out.println(puzzledim);
		   System.out.println(countvals);
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
	            
	            try {
					pairsString=oWriter.writeValueAsString(pairs);
				} catch (JsonProcessingException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	        }
		   
		 
		   
	        return pairsString;
	    }

}

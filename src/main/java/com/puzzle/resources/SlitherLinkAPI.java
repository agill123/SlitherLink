package com.puzzle.resources;

import java.util.Scanner;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.puzzle.core.SLSolve;

@Path("/sl")
@Produces(MediaType.APPLICATION_JSON) // This resource returns JSON content
@Consumes(MediaType.APPLICATION_JSON) // This resource can take JSON content as input
public class SlitherLinkAPI {
	
	
	
	
	
	
	
	
	   @Path("/solve")
	    @GET
	    public int getNamedGreeting(@QueryParam("puzzledim") int puzzledim,@QueryParam("countvals") String countvals) {
		   System.out.println(puzzledim);
		   System.out.println(countvals);
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
	            System.out.println("Solution");

	            for(int i=0;i<sl.getSolution().length;i++){
	                System.out.println(i+ " -> "+sl.getSolution()[i]+" ");
	            }
	        }
	        return puzzledim;
	    }

}

package com.puzzle.core;

import java.util.ArrayList;
import java.util.List;

import org.chocosolver.solver.Model;
import org.chocosolver.solver.Solution;
import org.chocosolver.solver.Solver;
import org.chocosolver.solver.search.strategy.Search;
import org.chocosolver.solver.variables.IntVar;
import org.chocosolver.util.tools.ArrayUtils;

public class SLSolve {
	  private int n;  //puzzle dimension
	    private int m;  //sub-tour ubound
	    private int l; //sub-tour lbound


	    private Model model;
	    private Solver solver;

	    private int[][] count;  //edge reqs
	    private IntVar[][] a;   //adjacency matrix
	    private IntVar[][] v;   //vertex matrix
	    private IntVar[] tour;  //sub-tour array
	    private IntVar tourLength;
	    
	    public SLSolve(int n,int[][]count){
	        model = new Model("SL Solver");
	        solver = model.getSolver();
	        this.n = n;
	        this.count=count;
	        m=n*n;
	        l=0;
	        a = new IntVar[n*n][n*n];
	        v = new IntVar[n][n];

	        //create node grid
	        //define domains
	        for(int i=0;i<n;i++){
	            for(int j=0;j<n;j++){
	                ArrayList<Integer> dom = new ArrayList<>();
	                if(i > 0) dom.add((i - 1) * n + j); //above
	                if(j > 0) dom.add(i * n + j - 1);   //left
	                dom.add(i * n + j);                 //itself
	                if(j < n-1 ) dom.add(i * n + j + 1);//right
	                if(i < n-1) dom.add((i + 1) * n + j);//below

	                int[] domain = new int[dom.size()];
	                int k = 0;
	                for(int x : dom){
	                    domain[k++]=x;
	                }
	                v[i][j] = model.intVar("v["+i+"]"+"["+j+"]",domain);
	            }


	        }
	     for (int i=0;i<n;i++){
	            for (int j=0;j<n;j++)
	                System.out.print(v[i][j] +" ");
	            System.out.println();
	        }
	        //subtour constraint
	        tourLength = model.intVar("tour length",l,m);
	        tour = ArrayUtils.flatten(v);

	        model.subCircuit(tour,0,tourLength).post();

	        //Link tour with adjacency matrix
	        for (int i=0;i<n*n;i++){
	            int ub = tour[i].getUB();
	            for (int j = tour[i].getLB();j<=ub;j=tour[i].nextValue(j))
	                if (i != j){
	                    a[i][j] = model.intVar("A["+ i +"]["+ j +"]",0,1);
	                    model.ifOnlyIf(model.arithm(a[i][j],"=",1),model.arithm(tour[i],"=",j));
	                    //efficient search
	                    model.ifThen(model.arithm(tour[i],"=",j),model.arithm(tour[j],"!=",i));
	                }
	        }
	        //constrain square edges

	        for(int i = 0;i < n-1 ; i++){
	            for(int j = 0;j < n-1; j++){
	                if(count[i][j] > -1){
	                IntVar[] e = new IntVar[]{
	                        a[(i*n)+j][(i*n)+j+1], //top clockwise
	                        a[(i*n)+j+1][(i*n)+j], //top anti-clockwise

	                        a[(i*n)+j+n][(i*n)+j+n+1], //bottom clockwise
	                        a[(i*n)+j+n+1][(i*n)+j+n], //bottom anti-clockwise

	                        a[(i*n)+j][(i*n)+j+n],     //left clockwise
	                        a[(i*n)+j+n][(i*n)+j],     //left anti-clockwise

	                        a[(i*n)+j+1][(i*n)+j+n+1],  //right clockwise
	                        a[(i*n)+j+n+1][(i*n)+j+1]  //right anti-clockwise
	                };
	                    model.sum(e,"=",count[i][j]).post();
	                }
	            }
	        }

	    }
	    public boolean solve(){
	        solver.setSearch(Search.minDomLBSearch(tour)); // fail-first
	        return solver.solve();
	    }

	    public int[] getSolution(){

	        int[] solution=new int[tour.length];
	        for(int i=0;i<n*n;i++){
	            solution[i]=tour[i].getValue();
	        }
	        return solution;
	    }
	    public void stats(){
	        solver.printShortStatistics();
	    }
	    public int findNumSolutions(){
	        solver.setSearch(Search.minDomLBSearch(tour)); // fail-first
	        List<Solution> solutions=solver.findAllSolutions();
	        System.out.println("The # of solutions for this problem is "+solutions.size());
	        for(Solution s:solutions){
	            System.out.println(s);
	        }
	        return solutions.size();

	    }
	    public boolean mulSolutions(){
	        solver.limitSolution(4);
	        while(solver.solve()){
	            System.out.println(solver.getSolutionCount());
	        }
	        return solver.getSolutionCount()>2;
	    }

	    public void minimumTour() {
	        int shortest;
	        while (solver.solve()) {
	            shortest = tourLength.getValue();
	            System.out.println(shortest);
	            model.arithm(tourLength, "<", shortest).post();
	        }
	    }

	    public void maximumTour(){
	        int longest;
	        while (solver.solve()) {
	            longest = tourLength.getValue();
	            System.out.println(longest);
	            model.arithm(tourLength, ">", longest).post();
	        }
	    }
	    //test main remove at end
	    public static void main(String[] args){
	        SLSolve sl = new SLSolve(5,new int[][]{{-1,3,-1,3},{-1,3,-1,-1},{3,-1,-1,-1},{-1,1,-1,3}});
	        //sl.findNumSolutions();
	        //sl.mulSolutions();
	        if(sl.solve()){
	            System.out.println("Solution");

	            for(int i=0;i<sl.getSolution().length;i++){
	                System.out.println(i+ " -> "+sl.getSolution()[i]+" ");
	            }
	        }
	       // sl.minimumTour();



	    }
}

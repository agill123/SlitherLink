package com.puzzle.core;

import org.chocosolver.solver.Model;
import org.chocosolver.solver.Solver;
import org.chocosolver.solver.exception.ContradictionException;
import org.chocosolver.solver.search.strategy.Search;
import org.chocosolver.solver.variables.IntVar;
import org.chocosolver.util.tools.ArrayUtils;

import java.time.Instant;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Random;


/**
 * Generates a minimal SL puzzle of a given dimension
 */
public class SLGen{

    private int n;  //puzzle dimension
    private int m;  //sub-tour ubound
    private int l; //sub-tour lbound


    private Random rand; //random number generator
    private long seed;   //gen specific puzzle

    private Model model;
    private Solver solver;

    private int[][] count;  //edge reqs
    private IntVar[][] a;   //adjacency matrix
    private IntVar[][] v;   //vertex matrix
    private IntVar[] tour;  //sub-tour array

    public SLGen(int n, long seed){

    }

    public SLGen(int n){
        model = new Model("SL Solver");
        solver = model.getSolver();
        this.n = n;
        m=n*n;
        l=m/2;
        a = new IntVar[n*n][n*n];
        v = new IntVar[n][n];
        count= new int[n-1][n-1];
        rand= new Random();

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

        //subtour constraint
        IntVar tourLength = model.intVar("tour length",l,m);
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

        //fill count matrix
        for(int i = 0;i < n-1 ; i++){
            for(int j = 0;j < n-1; j++){
                count[i][j]=-1;
            }
        }








    }
    private void setCount(int[][] count){
     this.count=count;
        //constrain square edges
        for(int i = 0;i < n-1 ; i++){
            for(int j = 0;j < n-1; j++){
                if(count[i][j] > -1){
                    IntVar[] e = new IntVar[]{
                            a[(i*n)+j][(i*n)+j+1], //top
                            a[(i*n)+j+1][(i*n)+j], //top

                            a[(i*n)+j+n][(i*n)+j+n+1], //bottom
                            a[(i*n)+j+n+1][(i*n)+j+n], //bottom

                            a[(i*n)+j][(i*n)+j+n],     //left
                            a[(i*n)+j+n][(i*n)+j],     //left

                            a[(i*n)+j+1][(i*n)+j+n+1],  //right
                            a[(i*n)+j+n+1][(i*n)+j+1]  //right
                    };
                    model.sum(e,"=",count[i][j]).post();
                }
            }
        }
    }
    public int[][] countSolve()  {
        int solNum=3;
        int[][] randCount=new int [n-1][n-1];
        for(int i = 0;i < n-1 ; i++){
            for(int j = 0;j < n-1; j++){
                randCount[i][j]=-1;
            }
        }




        while(solNum!=2){
            int[][] prevCount = new int[n-1][n-1];
            for(int i = 0;i < n-1 ; i++){
                for(int j = 0;j < n-1; j++){
                    prevCount[i][j]=randCount[i][j];
                }
            }
            randCount[rand.nextInt(n-1)][rand.nextInt(n-1)]=rand.nextInt(4);




            SLGen newGen = new SLGen(n);
            newGen.setCount(randCount);
            solNum=newGen.solve();
            if(solNum==0){
             randCount=prevCount;
             System.out.println("Restore rand count");
                for(int i = 0;i < n-1 ; i++){
                    for(int j = 0;j < n-1; j++){

                        System.out.print(randCount[i][j]+ " ");
                    }
                    System.out.println();
                }

            }
            System.out.print("\n---------------------------\n"+"The number of solutions is "+solNum+"\n---------------------------\n");
            for(int i = 0;i < n-1 ; i++){
                for(int j = 0;j < n-1; j++){

                    System.out.print(randCount[i][j]+ " ");
                }
                System.out.println();
            }
            System.out.print("\n---------------------------------------------------------------------------------------------\n");


        }
       return randCount;
    }
    private int solve(){
        solver.setSearch(Search.minDomLBSearch(tour)); // fail-first
        //solver.limitTime("0.1s");
        solver.limitSolution(3);


        int numSol=0;

        while(solver.solve()){
            numSol++;
            for(int i=0;i<n*n;i++){
               System.out.print(tour[i].getValue()+" ");
            }
            System.out.println();
        }
        solver.printShortStatistics();
        System.out.println(solver.getTimeCount());
        System.out.println(solver.isStopCriterionMet());
        //if(!solver.isStopCriterionMet())
        return numSol;
       //return 1;



    }





    public static void main(String[] args) {
        int n=5;
        SLGen sl = new SLGen(n);
        int[][] answer=sl.countSolve();
        System.out.println("The count matrix going into the solver is");
        for(int i = 0;i < n-1 ; i++){
            for(int j = 0;j < n-1; j++){

                System.out.print(answer[i][j]+ " ");
            }
            System.out.println();
        }
        SLSolve sl2=new SLSolve(n,answer);
        sl2.findNumSolutions();
        sl2.stats();




    }




}

package com.rgraphics.railroot.railroute;
import java.util.*;
import java.lang.*;
import java.io.*;

public class GraphAlgorithm {


    int V ;
    int graph[][] ;
    public GraphAlgorithm()
    {
        V = 0 ;
    }
    public GraphAlgorithm(int[][] array , int n)
    {
        V = n ;
        graph = new int[V][V] ;
        for(int i = 0 ; i < V ; i++ )
        {
            for(int j = 0 ; j< n ; j++)
            {
                graph[i][j] = array[i][j];
            }
        }
    }
    int minDistance(int dist[], Boolean sptSet[])
    {
        // Initialize min value
        int min = Integer.MAX_VALUE, min_index=-1;

        for (int v = 0; v < V; v++)
            if (sptSet[v] == false && dist[v] <= min)
            {
                min = dist[v];
                min_index = v;
            }

        return min_index;
    }



    // Funtion that implements Dijkstra's single source shortest path
    // algorithm for a graph represented using adjacency matrix
    // representation
    ArrayList<String> dijkstra(int src , int dest)
    {
        ArrayList<String> ret = new ArrayList<String>() ;

        // using parent lists.
        int parent[] = new int[V];
        for(int i = 0 ; i < V ; i++)
            parent[i] = -1;


        int dist[] = new int[V]; // The output array. dist[i] will hold
        // the shortest distance from src to i

        // sptSet[i] will true if vertex i is included in shortest
        // path tree or shortest distance from src to i is finalized
        Boolean sptSet[] = new Boolean[V];

        // Initialize all distances as INFINITE and stpSet[] as false
        for (int i = 0; i < V; i++)
        {
            dist[i] = Integer.MAX_VALUE;
            sptSet[i] = false;
        }

        // Distance of source vertex from itself is always 0
        dist[src] = 0;

        // Find shortest path for all vertices
        for (int count = 0; count < V-1; count++)
        {
            // Pick the minimum distance vertex from the set of vertices
            // not yet processed. u is always equal to src in first
            // iteration.
            int u = minDistance(dist, sptSet);

            // Mark the picked vertex as processed
            sptSet[u] = true;

            // Update dist value of the adjacent vertices of the
            // picked vertex.
            for (int v = 0; v < V; v++)

            {
                // Update dist[v] only if is not in sptSet, there is an

                // edge from u to v, and total weight of path from src to
                // v through u is smaller than current value of dist[v]
                if (!sptSet[v] && graph[u][v]!=0 &&
                        dist[u] != Integer.MAX_VALUE &&
                        dist[u]+graph[u][v] < dist[v])
                {
                    dist[v] = dist[u] + graph[u][v];
                    parent[v] = u ;
                }
            }

        }
        // If distance is finite, so dest is reachable
        if(dist[dest] != Integer.MAX_VALUE)
        {
            int now = dest ;
            while(now != -1)
            {
                ret.add(Integer.toString(now)) ;
                now = parent[now];
            }
            Collections.reverse(ret);
            ret.add(Integer.toString(dist[dest]));
            return ret ;
        }
        else
        {
            ret.add(Integer.toString(-1)) ;
            return ret ;
        }
    }


}

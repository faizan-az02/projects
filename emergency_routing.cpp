/*
Emergency Travel Plan Optimizer
CS-2001 Data Structures – Semester Project

This C++ program calculates the minimum number of days required for a traveler to 
reach their destination city (city N-1) from the starting city (city 0), given a 
graph of cities connected via roads and aerial routes, under certain constraints.

Constraints:
- The traveler can travel through a maximum of 6 cities per day by road.
- Aerial routes allow instant travel between two cities on the same day.
- The traveler must avoid using aerial routes that create backward movement or loops.

Approach (Specific to this implementation):
- The city network is represented as an adjacency matrix where:
  - Road connections are sequential (city i to city i+1).
  - Aerial routes are added after filtering overlapping flights using a custom 
    overlap elimination function `flights()` that retains only the most beneficial ones.
- Traversal is done linearly with basic checks on:
  - Number of cities traveled per day (reset after 6).
  - Availability of forward aerial routes (selected if they help progress).
  - Avoiding backward aerial routes (ignored or stepped back if needed).
- The number of days is incremented when:
  - The traveler uses an aerial route (unless it's the last leg).
  - The 6-city daily travel limit by road is reached.

Input:
- Number of test cases.
- For each test case: number of cities and number of aerial routes.
- Each aerial route is defined by its source and destination city.

Output:
- Minimum number of days required for each test case.
- Adjacency matrix representing the final graph with all road and aerial connections.

Note:
- This implementation uses console input/output and basic matrix-based graph logic.
- BFS or advanced pathfinding is not used; the solution simulates a constrained 
  traversal with priority on aerial routes that push forward.

*/

#include <iostream>

using namespace std;

int** flights(int** act, int size)
{
	int diff1 = 0, diff2 = 0, k = 0;

	//identifying the overlapping flights and keeping the one to be taken

	while (k < size)
	{
		for (int i = 0; i < size - 1; i++)
		{
			for (int j = 0; j < size - i; j++)
			{
				if (act[i + j][0] < act[i][1] && act[i + j][0] > act[i][0])
				{
					diff1 = act[i][1] - act[i][0];

					diff2 = act[i + j][1] - act[i + j][0];

					if (diff2 > diff1)
					{
						act[i][0] = -1;

						act[i][1] = -1;
					}
					else
					{
						act[i + j][0] = -1;

						act[i + j][1] = -1;
					}
				}
			}
		}

		k++;
	}

	//creating an array of the kept flights

	int** res = new int* [size];

	for (int i = 0; i < size; i++)
	{
		res[i] = new int[2];
	}

	for (int i = 0; i < size; i++)
	{
		res[i][0] = act[i][0];

		res[i][1] = act[i][1];

	}

	//returing the flights to be taken

	return res;
}

void printGraph(int** graph, int cities)
{
	//printing city numbers horizontally

	cout << "	";

	for (int i = 0; i < cities; i++)
	{
		cout << i << "	";
	}

	cout << endl;

	//printing cities vertically along the adjacency matrix

	for (int i = 0; i < cities; i++)
	{
		cout << i << "	";

		for (int j = 0; j < cities; j++)
		{
			cout << graph[i][j] << "	";
		}

		cout << endl;
	}
}

int main()
{

	//declaration of variables used

	int tc = 0, cities = 0, from = 0, to = 0, air_routes = 0, iter = 0, check = 0, c = 0, max_route = 0;

	int days = 1;

	//interface

	//taking the number of test cases

	cout << "Enter the number of test cases" << endl;

	cin >> tc;

	int* res = new int[tc];

	for (int k = 0; k < tc; k++)
	{
		//resetting the variables for the next test case

		iter = 0;

		check = 0;

		days = 1;

		//taking the inputs

		cout << "Enter the number of cities" << endl;

		cin >> cities;

		while (cities < 0)
		{
			cout << "Enter a valid input!" << endl;

			cin >> cities;
		}

		//making the graph on the given input

		int** graph = new int* [cities];

		for (int i = 0; i < cities; i++)
		{
			graph[i] = new int[cities];
		}

		//initializing all with 0

		for (int i = 0; i < cities; i++)
		{
			for (int j = 0; j < cities; j++)
			{
				graph[i][j] = 0;
			}
		}

		//connections by road

		for (int i = 0; i < cities - 1; i++)
		{
			for (int j = 0; j < cities; j++)
			{
				if (i == j)
				{
					graph[i][j + 1] = 1;
				}
			}
		}

		//aerial routes interface

		cout << "Enter the number of aerial routes" << endl;

		cin >> air_routes;

		while (air_routes < 0)
		{
			cout << "Enter a valid input!" << endl;

			cin >> air_routes;
		}

		//making two arrays one for the flights taken and one for keeping the track of original

		int** inp_flights = new int* [air_routes];

		int** actual = new int* [air_routes];

		for (int i = 0; i < air_routes; i++)
		{
			inp_flights[i] = new int[2];

			actual[i] = new int[2];
		}

		for (int i = 0; i < air_routes; i++)
		{

			//taking the aerial routes inputs

			cout << "Enter the coordinates of the " << i + 1 << " aerial route" << endl;

			cout << "From - ";

			cin >> from;

			cout << "To - ";

			cin >> to;

			//validation

			while (to >= cities)
			{
				cout << "Enter a valid input!" << endl;

				cin >> to;
			}

			//keeping the record of flights

			inp_flights[i][0] = from;

			inp_flights[i][1] = to;

			actual[i][0] = from;

			actual[i][1] = to;
		}

		//getting the flights to be taken after removal of not being used ones

		int** flights_taken = flights(inp_flights, air_routes);

		for (int i = 0; i < air_routes; i++)
		{
			if (flights_taken[i][0] != -1)
			{
				graph[flights_taken[i][0]][flights_taken[i][1]] = 1;
			}
		}

		//travelling

		while (iter < cities - 1)
		{
			cout << "From - " << iter << endl;

			check++;

			//checking each column i.e. the connections

			for (int i = 0; i < cities; i++)
			{
				if (graph[iter][i] == 1)
				{
					if (i < iter && check == 6)
					{
						iter--;
					}
					else if (i < iter)
					{
						continue;
					}
					else if (i == iter + 1)
					{
						continue;
					}
					else if (i > iter)
					{
						if (i > max_route)
						{
							max_route = i - 1;
						}
					}
				}
			}

			//using the aerial route

			if (max_route != 0)
			{
				if (max_route + 1 != cities - 1)
				{
					days++;
				}

				check = 0;

				iter = max_route;

				max_route = 0;
			}

			//check for the number of cities per day

			if (check == 6)
			{
				check = 0;

				days++;
			}

			//moving to the next row of adjacency matrix i.e. next city

			iter++;

			cout << "To - " << iter << endl;
		}

		//final output

		cout << "Days required are " << days << endl;

		//printing the adjacency matrix implementing the flights

		for (int i = 0; i < air_routes; i++)
		{
			graph[actual[i][0]][actual[i][1]] = 1;
		}

		printGraph(graph, cities);
	}

	return 0;
}


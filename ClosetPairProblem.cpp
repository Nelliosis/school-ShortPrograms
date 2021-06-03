#include <iostream>
#include <ctime>
#include <windows.h>
#include <algorithm>

using namespace std;

int main () 
{
   int size, gst;
   
   cout<< "Enter Number of Chairs: ";
   cin>> size;
   
   int chairsarray[size];
   
   cout<< "The number of chairs avalaible is: " << size << endl;
   
   cout<< "Enter number of guests: ";
   cin>> gst;
   	
	for (int i = 0; i < size; i++)
	{
		bool check; 
		int n;
		
		if(i < gst)
		{
			do
			{	
				srand(time(0));
				n = rand() % size + 1;  		
			
				//check or number is already used:
				check=true;
				
				for (int j=0;j<i;j++)
				if (n == chairsarray[j]) //if number is already used
				{
					check=false; //set check to false
				    break; //no need to check the other elements of value[]
				}
		
			} while (!check); //loop until new, unique number is found
	
			chairsarray[i]=n; //store the generated number in the array
		}
		
		else
		{
			chairsarray[i] = 0;
		}
	}    
	
	int guestchairs[gst];
	
	for (int i = 0; i < gst; i++)
	{
		guestchairs[i] = chairsarray[i];
	}

	int n = sizeof(guestchairs) / sizeof(guestchairs[0]);	
	sort(guestchairs, guestchairs + n);
	
	
	int median = (gst/2) - 1;
	
	
	
		
	/*for (int i = 0; i < gst; i++)
	{
		cout<< guestchairs[i] << " ";
	}*/

	return 0;
}



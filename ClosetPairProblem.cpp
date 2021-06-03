#include <iostream>
#include <ctime>
#include <windows.h>

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
				n = rand() % 20 + 1;  		
			
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
	
	for (int i = 0; i < size; i++)
	{
		cout<< chairsarray[i] << " ";
	}
    		
	return 0;
}


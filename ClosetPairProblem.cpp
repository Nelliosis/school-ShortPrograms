#include <iostream>
#include <ctime>
#include <windows.h>
#include <algorithm>
#include <cmath>
#include <cstdlib>

using namespace std;

int recursionLeft(int array[], int size);
int recursionRight(int array[], int size);


int main ()
{
	int size, gst;
	char choice;
	
	do
	{	
		system("CLS");	
		cout<< "Enter Number of Chairs: ";
		cin>> size;
		cout<< "The number of chairs avalaible is: " << size << endl;
	
		cout<< "Enter number of guests: ";
		cin>> gst;
	   
		int chairsarray[gst];
		
		for (int i = 0; i < gst; i++)
		{
			bool check;
			int n;
	
				do
				{
					srand(time(0));
					n = rand() % size + 1;
	
					//check if number is already used:
					check=true;
	
					for (int j = 0; j < i; j++)
					{
						if (n == chairsarray[j]) //if number is already used
						{
							check=false; //set check to false
					    	break; //no need to check the other elements of value[]
						}
					}
				}while (!check); //loop until new, unique number is found
	
				chairsarray[i]=n; //store the generated number in the array
		}
	
		int n = sizeof(chairsarray) / sizeof(chairsarray[0]);
		sort(chairsarray, chairsarray + n);
		
		int median;
	    median = (gst/2);
	
		for (int i = 0; i < gst; i++)
		{
			cout<< chairsarray[i] << " ";
		}
	
		cout<< endl;
		  
	  	if(recursionLeft(chairsarray,median) < recursionRight(chairsarray, gst - 1))
	  	{
	  		cout<< "The distance of the closest pair of chairs is: " << recursionLeft(chairsarray,median) << endl;
	  	}
	  
	  	else if (recursionRight(chairsarray, gst - 1) < recursionLeft(chairsarray,median) )
	  	{
	  		cout<< "The distance of the closest pair of chairs is: " << recursionRight(chairsarray, gst - 1) << endl;
	  	}
	  
	  	else
	  	{
	  		cout<< "The distance of the closest pair of chairs is: " << recursionLeft(chairsarray,median) << endl;
	  	}
	  	
	  	cout<< "Would you like to try again? Press Y for YES and N for NO: ";
	  	cin>> choice;
	  	
	}while (choice == 'Y' || choice == 'y');

	return 0;
}

int recursionLeft(int array[], int size)
{
	int result;
  
	if(size > 0)
	{
  		int diff = abs(array[size] - array[size-1]);
  		result = min(diff, recursionLeft(array, size - 1));
  	}
  
  	else
  	{
    	return (array[1] - array[0]);
  	}
  
  	return result;
}

int recursionRight(int array[], int size)
{
	int result;
  
  	if(size > 0)
  	{
  		int diff = abs(array[size] - array[size-1]);
  		result = min(diff, recursionLeft(array, size - 1));
  	}
  
  	else
  	{
    	return (array[size] - array[size + 1]);
  	}
  
 	return result;
}

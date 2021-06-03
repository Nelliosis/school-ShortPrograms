#include <iostream>
#include <ctime>
//#include <windows.h>
#include <algorithm>

using namespace std;

int recursionLeft(int array[], int median ,int size);
int recursionRight(int array[], int median ,int size);



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


	int median;
  median = (gst/2);
  cout << "Median: " << guestchairs[median] << endl;

	for (int i = 0; i < gst; i++)
	{
		cout<< guestchairs[i] << " ";
	}

  cout << endl << "The closest value to the left is: " << recursionLeft(guestchairs,median,gst) << endl;

  cout << endl << "The closest value to the right is: " << recursionRight(guestchairs,median,gst) << endl;


	return 0;
}

int recursionLeft(int array[], int median ,int size)
{

  if(median < size)
  {
    return (array[1] - array[0]);
  }
  else
  {
    return array[size] - recursionLeft(array, median ,size - 1);
  }

}

int recursionRight(int array[], int median ,int size)
{

  if(median > size)
  {
    return (array[0] - array[1]);
  }
  else
  {
    return array[median] - recursionLeft(array, median + 1,size);
  }

}

#include <iostream>
#include <cmath>

using namespace std;

int main()
{
  int stack = 0;
  //int weight = 0;
  int coins = 0;
  int Weight_Catcher = 0;

  cout << "Enter number of stacks to weigh: ";
  cin >> stack;

  cout << "Enter the number of coins in the stack: ";
  cin >> coins;

  int Weight_Containter[stack][coins];


for(int i = 0; i < stack; i++) //assigning weights
{

  for(int j = 0; j < coins; j++)
  {
    cout << "Stack " << i;
    cout << " Coin " << j << ": ";
    cin >> Weight_Catcher;
    Weight_Containter[i][j] = Weight_Catcher;

  }
}
cout << endl;
for(int i = 0; i < stack; i++) //determining weights
{

  for(int j = 0; j < coins; j++)
  {
    cout << "Stack: " << i;
    cout << " Coin " << j << ": ";

    Weight_Catcher = Weight_Containter[i][j];

    if(Weight_Catcher % 10 == 0)
    {
      cout << "is genuine" << endl;
    }
    else
    {
      cout << "is fake" << endl;
    }

  }
}




return 0;
}

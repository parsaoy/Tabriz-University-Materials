#include <iostream>
#include <iomanip>
#include <math.h>
#include <chrono>
using namespace std;
using namespace chrono;

long double f(double X[], int array_size)
{
    long double sum = 0;
    for (int i = 0; i < array_size; i++)
        sum += sin(X[i]);
    return sum;
}

void printRes(long double y_max, double maxX[], int size)
{
    cout << setprecision(8) << "\nY-Max = " << y_max << endl;
    for (int i = 0; i < size; i++)
        cout << "X" << i + 1 << "-Max = " << maxX[i] << " RAD" << endl;
}

void D1(double step)
{
    auto start = chrono::steady_clock::now();
    double X[1];
    double maxX[1];
    long double y;
    long double y_max = LONG_MIN;

    for (X[0] = 0; X[0] < 10; X[0] += step)
    {
        y = f(X, 1);    
        if (y > y_max)
        {
            y_max = y;
            maxX[0] = X[0];
        }
    }
    auto end = chrono::steady_clock::now();
    auto diff = end - start;
    cout << setprecision(12) << chrono::duration<double, nano>(diff).count() << " Nano Seconds" << endl;
    printRes(y_max, maxX, 1);
}
// Parsa Yousefi Nejad
void D2(double step)
{
    double X[2];
    double maxX[2];
    long double y;
    long double y_max = LONG_MIN;

    auto start = chrono::steady_clock::now();
    for (X[0] = 0; X[0] < 10; X[0] += step)
        for (X[1] = 0; X[1] < 10; X[1] += step)
        {
            y = f(X, 2);
            if (y > y_max)
            {
                y_max = y;
                for (int i = 0; i <= 1; i++)
                    maxX[i] = X[i];
            }
        }
    auto end = chrono::steady_clock::now();
    auto diff = end - start;
    cout << setprecision(12) << chrono::duration<double, nano>(diff).count() << " Nano Seconds" << endl;
    printRes(y_max, maxX, 2);
}

void D3(double step)
{
    double X[3];
    double maxX[3];
    long double y;
    long double y_max = LONG_MIN;

    auto start = chrono::steady_clock::now();
    for (X[0] = 0; X[0] < 10; X[0] += step)
        for (X[1] = 0; X[1] < 10; X[1] += step)
            for (X[2] = 0; X[2] < 10; X[2] += step)
            {
                y = f(X, 3);
                if (y > y_max)
                {
                    y_max = y;
                    for (int i = 0; i <= 2; i++)
                        maxX[i] = X[i];
                }
            }
    auto end = chrono::steady_clock::now();
    auto diff = end - start;
    cout << setprecision(12) << chrono::duration<double, nano>(diff).count() << " Nano Seconds" << endl;
    printRes(y_max, maxX, 3);
}

void D4(double step)
{
    auto start = chrono::steady_clock::now();
    double X[4];
    double maxX[4];
    long double y;
    long double y_max = LONG_MIN;

    for (X[0] = 0; X[0] < 10; X[0] += step)
        for (X[1] = 0; X[1] < 10; X[1] += step)
            for (X[2] = 0; X[2] < 10; X[2] += step)
                for (X[3] = 0; X[3] < 10; X[3] += step)
                {
                    y = f(X, 4);
                    if (y > y_max)
                    {
                        y_max = y;
                        for (int i = 0; i <= 3; i++)
                            maxX[i] = X[i];
                    }
                }
    auto end = chrono::steady_clock::now();
    auto diff = end - start;
    cout << setprecision(12) << chrono::duration<double, nano>(diff).count() << " Nano Seconds" << endl;
    printRes(y_max, maxX, 4);
}

void D5(double step)
{
    double X[5];
    double maxX[5];
    long double y;
    long double y_max = LONG_MIN;

    auto start = chrono::steady_clock::now();
    for (X[0] = 0; X[0] < 10; X[0] += step)
        for (X[1] = 0; X[1] < 10; X[1] += step)
            for (X[2] = 0; X[2] < 10; X[2] += step)
                for (X[3] = 0; X[3] < 10; X[3] += step)
                    for (X[4] = 0; X[4] < 10; X[4] += step)
                    {
                        y = f(X, 5);
                        if (y > y_max)
                        {
                            y_max = y;
                            for (int i = 0; i <= 4; i++)
                                maxX[i] = X[i];
                        }
                    }
    auto end = chrono::steady_clock::now();
    auto diff = end - start;
    cout << setprecision(12) << chrono::duration<double, nano>(diff).count() << " Nano Seconds" << endl;
    printRes(y_max, maxX, 5);
}

int main()
{
    double Delta1{0.9};
    double Delta2{0.3};
    double Delta3{0.1};
    double Delta4{0.01};
    double Delta5{0.001};

    D4(Delta4);

    /*  row1: D1(Delta1); D2(Delta1); D3(Delta1); D4(Delta1); D5(Delta1);
        row2: D1(Delta2); D2(Delta2); D3(Delta2); D4(Delta2); D5(Delta2);
        row3: D1(Delta3); D2(Delta3); D3(Delta3); D4(Delta3); D5(Delta3);  */
}

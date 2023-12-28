/*
WEEK 4 of OS Lab: Memory Management
Part 1: MVT (Memory Management with Variable Partitioning Technique) 
->Implementation of MVT
**************************************************
    Coded by:
Arsalan FaridJafar Nejad - Parsa Yousefi Nejad
**************************************************
*/
#include <iostream>
#include <vector>
#include <numeric>
using namespace std;

#define COLOR_RED "\033[1;31m"
#define COLOR_GREEN "\033[1;32m"
#define COLOR_YELLOW "\033[1;33m"
#define COLOR_BLUE "\033[1;34m"
#define COLOR_MAGENTA "\033[1;35m"
#define COLOR_CYAN "\033[1;36m"
#define COLOR_RESET "\033[0m"

int main()
{
    int numProcesses=0;
    int totalMemorySize = 0;
    vector<int> memoryRequired;
    char choice = 'y';

    cout << COLOR_MAGENTA << "Enter the total memory available (in Bytes): " << COLOR_RESET;
    cin >> totalMemorySize;

    while (choice == 'y')
    {
        int memory;
        cout <<"\033[3;46;35m"<< "Enter memory required for process " <<COLOR_RESET<< "\033[3;43;30m" << numProcesses + 1 << COLOR_RESET <<"\033[3;46;35m"<< " (in Bytes):"<< COLOR_RESET<<" ";
        cin >> memory;

        if (memory <= 0)
        {
            cout << COLOR_RED << "Invalid memory size. Please enter a positive value." << COLOR_RESET << endl;
            continue;
        }

        if (memory <= totalMemorySize)
        {
            memoryRequired.push_back(memory);
            cout <<COLOR_GREEN<< "Memory is allocated for Process "<<COLOR_RESET<< COLOR_MAGENTA << numProcesses + 1 << COLOR_RESET << endl;
            totalMemorySize -= memory;
        }
        else
        {
            cout << COLOR_RED << "Memory size exceeds the total available memory. Memory is Full." << COLOR_RESET << endl;
            break;
        }

        cout << "Do you want to continue (y/n): ";
        cin >> choice;
        numProcesses++;
    }

    cout << "\n" << COLOR_BLUE << "Total Memory Available: " << totalMemorySize << COLOR_RESET << endl;
    cout << "\n\t" << COLOR_CYAN << "PROCESS" << "\t\tMEMORY ALLOCATED" << COLOR_RESET << endl;

    for (int i = 0; i < numProcesses; i++)
    {
        cout << "\t" << COLOR_CYAN << i + 1 << COLOR_RESET << "\t\t" << memoryRequired[i] << endl;
    }

    int sum = accumulate(memoryRequired.begin(), memoryRequired.end(), 0);   

    cout << "\n" << COLOR_BLUE << "Total Memory Allocated: " << sum << COLOR_RESET << endl;
    cout << COLOR_BLUE << "Total External Fragmentation: " << totalMemorySize << COLOR_RESET << endl;

    return 0;
}
/*
WEEK 4 of OS Lab: Memory Management
Part 2: MFT (Memory Management with Fixed Partitioning Technique) 
->Implementation of MFT
**************************************************
    Coded by:
Parsa Yousefi Nejad - Arsalan FaridJafar Nejad
**************************************************
*/

#include <iostream>
#include <vector>
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
    vector<int> memoryRequired;
    int totalMemorySize, blockSize, numProcesses, externalFragmentation, totalInternalFragmentation,numBlocks = 0;
    int allocatedBlocks = 0;

    string FONT_BOLD = "\033[1m";
    string FONT_UNDERLINE = "\033[4m";
    string FONT_RESET = "\033[0m";

    cout << COLOR_MAGENTA << FONT_BOLD << "Enter the total memory available (in Bytes): " << FONT_RESET;
    cin >> totalMemorySize;

    cout << COLOR_MAGENTA << FONT_BOLD << "Enter the block size (in Bytes): " << FONT_RESET;
    cin >> blockSize;

    numBlocks = totalMemorySize / blockSize;                            // Calculate the number of blocks available in memory

    externalFragmentation = totalMemorySize % blockSize; 
    // externalFragmentation = totalMemorySize - numBlocks * blockSize;     // Calculate the external fragmentation

    cout << COLOR_MAGENTA << FONT_BOLD << "Enter the number of processes: " << FONT_RESET;
    cin >> numProcesses;

    // Input memory required for each process
    cout << "\n";
    for (int i = 0; i < numProcesses; i++)
    {
        int processMemory;
        cout << COLOR_MAGENTA << FONT_BOLD << "Enter memory required for process "<<COLOR_RED<< i + 1 <<FONT_RESET<< " in bytes: " << FONT_RESET;
        cin >> processMemory;
        memoryRequired.push_back(processMemory);
    }

    // Display the number of blocks available in memory
    cout << "\n";
    cout << COLOR_CYAN << FONT_BOLD << "Number of blocks available in memory: " << numBlocks << FONT_RESET << "\n\n";
    cout << COLOR_CYAN << FONT_BOLD << "PROCESS\tMEMORY REQUIRED\tALLOCATED\tINTERNAL FRAGMENTATION" << FONT_RESET << "\n";

    // Allocate memory to processes based on their size
    for (int i = 0; i < numProcesses and allocatedBlocks < numProcesses; i++)
    {
        cout << i + 1 << "\t\t" << memoryRequired[i];

        if (memoryRequired[i] > blockSize)
        {
            cout << "\t\t" << COLOR_RED << "NO" << COLOR_RESET << "\t\t---";
        }
        else
        {   
            cout << "\t\t" << COLOR_GREEN << "YES" << COLOR_RESET << "\t" << blockSize - memoryRequired[i];
            totalInternalFragmentation += blockSize - memoryRequired[i];
            allocatedBlocks++;
        }
        cout << "\n";
    }
    // totalInternalFragmentation--;
    // If there are remaining processes that cannot be accommodated
    if (allocatedBlocks < numProcesses)
    {
        cout << COLOR_RED << FONT_BOLD << "Memory is full. Remaining processes cannot be accommodated." << FONT_RESET << "\n";
    }

    // Display the total internal and external fragmentation
    cout << "\n";
    cout << COLOR_BLUE << FONT_BOLD << "Total internal fragmentation: " << totalInternalFragmentation << " bytes" << FONT_RESET << "\n";
    cout << COLOR_BLUE << FONT_BOLD << "Total external fragmentation: " << externalFragmentation << " bytes" << FONT_RESET << "\n";

    return 0;
}
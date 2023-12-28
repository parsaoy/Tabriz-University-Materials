/*
WEEK 5 of OS Lab: Memory Allocation Techniques
Part 2: Best Fit 
->Implementation of Best Fit
**************************************************
    Coded by:
            Arsalan FaridJafar Nejad - Parsa Yousefi Nejad
**************************************************
*/
#include <iostream>
#include <vector>

using namespace std;

struct ProcessAllocation
{
    int processNumber;
    int processSize;
    int blockNumber;
    int blockSize;
    int fragment;
};

int main()
{
    vector<ProcessAllocation> processAllocations;
    vector<int> blockSizes;
    int numBlocks, numProcesses;

    cout << "\tMemory Management Scheme - Best Fit" << endl;

    cout << "Enter the number of blocks: ";
    cin >> numBlocks;

    cout << "Enter the number of processes: ";
    cin >> numProcesses;

    cout << "\nEnter the sizes of the blocks:" << endl;
    for (int i = 0; i < numBlocks; i++)
    {
        int blockSize;
        cout << "Block " << i + 1 << ": ";
        cin >> blockSize;
        blockSizes.push_back(blockSize);
    }

    cout << "Enter the sizes of the processes:" << endl;
    for (int i = 0; i < numProcesses; i++)
    {
        int processSize;
        cout << "Process " << i + 1 << ": ";
        cin >> processSize;

        ProcessAllocation ProcessAllocation;
        ProcessAllocation.processNumber = i + 1;
        ProcessAllocation.processSize = processSize;
        ProcessAllocation.blockNumber = -1;
        ProcessAllocation.blockSize = -1;
        ProcessAllocation.fragment = -1;

        processAllocations.push_back(ProcessAllocation);
    }

    for (int i = 0; i < numProcesses; i++)
    {
        int lowestFragment = INT_MAX;
        int processIndex = -1;

        for (int j = 0; j < numBlocks; j++)
        {
            if (blockSizes[j] >= processAllocations[i].processSize && blockSizes[j] - processAllocations[i].processSize < lowestFragment)
            {
                processIndex = j;
                lowestFragment = blockSizes[j] - processAllocations[i].processSize;
            }
        }

        if (processIndex != -1)
        {
            processAllocations[i].blockNumber = processIndex + 1;
            processAllocations[i].blockSize = blockSizes[processIndex];
            processAllocations[i].fragment = lowestFragment;
            blockSizes[processIndex] -= processAllocations[i].processSize;
        }
    }

    cout << "\n\x1B[41;2;35mProcess No.\tProcess Size\tBlock No.\tBlock Size\tFragment\033[0m" << endl;
    for (const auto& ProcessAllocation : processAllocations)
    {
        cout << ProcessAllocation.processNumber << "\t\t" << ProcessAllocation.processSize << "\t\t";
        if (ProcessAllocation.blockNumber != -1)
        {
            cout << ProcessAllocation.blockNumber << "\t\t" << ProcessAllocation.blockSize << "\t\t" << ProcessAllocation.fragment << endl;
        }
        else
        {
            cout << "Not allocated\tNot allocated\tNot allocated" << endl;
        }
    }

    return 0;
}
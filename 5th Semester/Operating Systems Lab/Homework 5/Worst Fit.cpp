/*
WEEK 5 of OS Lab: Memory Allocation Techniques
Part 1: Worst Fit 
->Implementation of Worst Fit
**************************************************
    Coded by:
            Parsa Yousefi Nejad - Arsalan FaridJafar Nejad
**************************************************
*/
#include <iostream>
#include <vector>
#include <algorithm>

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
    vector<int> fragment;
    vector<int> blockSize;
    vector<int> processSize;
    vector<int> blockAllocated;
    vector<int> blockFragment;
    vector<ProcessAllocation> processAllocations;

    int numBlocks, numProcesses;

    cout << "\tMemory Management Scheme - Worst Fit" << endl;
    cout << "Enter the number of blocks: ";
    cin >> numBlocks;

    cout << "Enter the number of Processes: ";
    cin >> numProcesses;

    blockSize.resize(numBlocks);
    blockAllocated.resize(numBlocks, 0);
    blockFragment.resize(numBlocks, 0);
    fragment.resize(numProcesses, 0);
    processSize.resize(numProcesses);

    cout << "\nEnter the size of the blocks:" << endl;
    for (int i = 0; i < numBlocks; i++)
    {
        cout << "Block " << i + 1 << ": ";
        cin >> blockSize[i];
    }

    cout << "Enter the size of the Processes:" << endl;
    for (int i = 0; i < numProcesses; i++)
    {
        cout << "Process " << i + 1 << ": ";
        cin >> processSize[i];

        ProcessAllocation processAllocation;
        processAllocation.processNumber = i + 1;
        processAllocation.processSize = processSize[i];
        processAllocation.blockNumber = -1;
        processAllocation.blockSize = -1;
        processAllocation.fragment = -1;

        processAllocations.push_back(processAllocation);
    }

    for (int i = 0; i < numProcesses; i++)
    {
        int highestFragment = INT_MIN;
        int blockIndex = -1;

        for (int j = 0; j < numBlocks; j++)
        {
            if (blockAllocated[j] != 1 && blockSize[j] >= processAllocations[i].processSize)
            {
                int currentFragment = blockSize[j] - processAllocations[i].processSize;
                if (currentFragment > highestFragment)
                {
                    highestFragment = currentFragment;
                    blockIndex = j;
                }
            }
        }

        if (blockIndex != -1)
        {
            processAllocations[i].blockNumber = blockIndex + 1;
            processAllocations[i].blockSize = blockSize[blockIndex];
            processAllocations[i].fragment = highestFragment;
            blockAllocated[blockIndex] = 1;
        }
    }

    cout << "\x1B[41;2;35m\nProcess No.\tProcess Size\tBlock No.\tBlock Size\tFragment\033[0m" << endl;
    for (const auto& processAllocation : processAllocations)
    {
        cout << processAllocation.processNumber << "\t\t" << processAllocation.processSize << "\t\t";
        if (processAllocation.blockNumber != -1)
        {
            cout << processAllocation.blockNumber << "\t\t" << processAllocation.blockSize << "\t\t" << processAllocation.fragment << endl;
        }
        else
        {
            cout << "Not allocated\tNot allocated\tNot allocated" << endl;
        }
    }

    return 0;
}
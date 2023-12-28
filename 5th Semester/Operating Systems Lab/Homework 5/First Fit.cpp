/*
WEEK 5 of OS Lab: Memory Allocation Techniques
Part 3: First Fit 
->Implementation of First Fit
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

void firstFitAllocation(const vector<int>& blocks, const vector<int>& processes, vector<ProcessAllocation>& allocations)
{
    vector<int> allocatedBlocks(blocks.size(), 0);

    for (int i = 0; i < processes.size(); i++)
    {
        for (int j = 0; j < blocks.size(); j++)
        {
            if (allocatedBlocks[j] != 1 && blocks[j] >= processes[i])
            {
                allocatedBlocks[j] = 1;

                ProcessAllocation allocation;
                allocation.processNumber = i + 1;
                allocation.processSize = processes[i];
                allocation.blockNumber = j + 1;
                allocation.blockSize = blocks[j];
                allocation.fragment = blocks[j] - processes[i];

                allocations.push_back(allocation);
                break;
            }
        }
    }
}

void displayAllocations(const vector<ProcessAllocation>& allocations)
{
    cout<<"\n\x1B[41;2;35mProcess No.\tProcess Size\tBlock No.\tBlock Size\tFragment\033[0m"<<endl;
    for (const auto& allocation : allocations)
    {
        cout << allocation.processNumber << "\t\t" << allocation.processSize << "\t\t";
        if (allocation.blockNumber != 0)
        {
            cout << allocation.blockNumber << "\t\t" << allocation.blockSize << "\t\t" << allocation.fragment;
        }
        else
        {
            cout << "\033[31mNot allocated\033[0m\t\033[31mNot allocated\033[0m\t\033[31mNot allocated\033[0m";
        }
        cout << endl;
    }
}

int main()
{
    cout << "\t\033[1mMemory Management Scheme - First Fit\033[0m" << endl;

    int blockCount, processCount;
    cout << "Enter the number of blocks: ";
    cin >> blockCount;
    cout << "Enter the number of Processes: ";
    cin >> processCount;

    vector<int> blocks(blockCount);
    cout << "Enter the size of the blocks:" << endl;
    for (int i = 0; i < blockCount; i++)
    {
        cout << "\033[1mBlock " << i + 1 << ":\033[0m ";
        cin >> blocks[i];
    }

    vector<int> processes(processCount);
    cout << "Enter the size of the processes:" << endl;
    for (int i = 0; i < processCount; i++)
    {
        cout << "\033[1mProcess " << i + 1 << ":\033[0m ";
        cin >> processes[i];
    }

    vector<ProcessAllocation> allocations;
    firstFitAllocation(blocks, processes, allocations);
    displayAllocations(allocations);

}
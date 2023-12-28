/*
WEEK 6 of OS Lab: 
->Implementation of Optimal Page Replacement Technique
**************************************************
    Coded by:
            Parsa Yousefi Nejad - Arsalan FaridJafar Nejad
**************************************************
*/
#include <iostream>
#include <array>

using namespace std;

const int MAX_FRAMES = 10;
const int MAX_REFERENCES = 20;

void displayFrames(const array<int, MAX_FRAMES>& frameArray, int numFrames) {
    for (int i = 0; i < numFrames; i++)
        cout <<"\x1B[93m"<< frameArray[i] <<"\033[0m"<< "\t";
    cout << endl;
}

int findIndexToReplace(const array<int, MAX_FRAMES>& frameArray, const array<int, MAX_REFERENCES>& pageArray, int numFrames, int currentPageIndex, int numReferences) {
    array<int, MAX_FRAMES> lastGone{};
    int index,found = 0;

    for (int i = 0; i < numFrames; i++) {
        for (int k = currentPageIndex + 1; k < numReferences; k++) {
            if (frameArray[i] == pageArray[k]) {
                lastGone[i] = k - currentPageIndex;
                break;
            }
        }
    }

    for (int i = 0; i < numFrames; i++) {
        if (lastGone[i] == 0) {
            index = i;
            found = 1;
            break;
        }
    }

    if (found == 0) {
        int max = lastGone[0];
        index = 0;

        for (int i = 0; i < numFrames; i++) {
            if (max < lastGone[i]) {
                max = lastGone[i];
                index = i;
            }
        }
    }

    return index;
}

int main() {
    array<int, MAX_FRAMES> frameArray{};
    array<int, MAX_REFERENCES> pageArray{};
    int numReferences, numFrames;

    cout << "\033[1;42;34mEnter the length of the reference string:\033[0m ";
    cin >> numReferences;

    if (numReferences <= 0 or numReferences > MAX_REFERENCES) {
        cout << "Invalid number of references. Exiting..." << endl;
        return 1;
    }

    cout << "\033[1;42;34mEnter the reference string:\033[0m ";
    for (int i = 0; i < numReferences; i++)
        cin >> pageArray[i];

    cout << "\033[1;42;34mEnter the number of frames:\033[0m ";
    cin >> numFrames;

    if (numFrames <= 0 or numFrames > MAX_FRAMES) {
        cout << "Invalid number of frames. Exiting..." << endl;
        return 1;
    }

    int numPageFaults = numFrames;

    for (int i = 0; i < numFrames; i++)
        frameArray[i] = -1;

    for (int j = 0; j < numReferences; j++) {


        
        bool flagPageFound = false;
        bool flagFrameFound = false;

        for (int i = 0; i < numFrames; i++) {
            if (frameArray[i] == pageArray[j]) {
                flagPageFound = true;
                flagFrameFound = true;
                break;
            }
        }

        if (!flagPageFound) {
            for (int i = 0; i < numFrames; i++) {
                if (frameArray[i] == -1) {
                    frameArray[i] = pageArray[j];
                    flagFrameFound = true;
                    break;
                }
            }
        }

        if (!flagFrameFound) {
            int index = findIndexToReplace(frameArray, pageArray, numFrames, j, numReferences);
            frameArray[index] = pageArray[j];
            numPageFaults++;
        }

        displayFrames(frameArray,numFrames);
    }
    cout << "\x1B[41;2;35mNumber of page faults:\033[0m " << numPageFaults << endl;
    float pageFaultRate = static_cast<float>(numPageFaults) / numReferences * 100;
    cout << "\033[1;44;35mPage fault rate = \033[0m" <<"\033[3;46;35m"<< pageFaultRate << "%\033[0m" << endl;
    
    return 0;
}
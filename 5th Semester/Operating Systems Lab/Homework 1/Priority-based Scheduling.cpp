// Tamrin 1: Priority Scheduling (non-Preemptive)
// Operating Systems Laboratory
// Group: Parsa Yousefi Nejad, Arsalan Farid Jafarnejad

#include <iostream>
#include <vector>
#include <algorithm>
#include <iomanip>

using namespace std;

struct Task {
    int ordinalNumber;
    double processTime;
    int priority;

    double waitTime;
    double turnAroundTime;
};

int main()
{

    int numberOfTasks;
    printf("\033[2;46;36mEnter number of Tasks:\033[0m");
    cout<<' ';
    cin>>numberOfTasks;


    vector<Task> tasks;

printf("\x1B[41;1;35m\nPlease enter the details for each task:\n\033[0m");
    for (size_t i = 1; i <= numberOfTasks; i++) {
        Task task;

        task.ordinalNumber = i;

        cout<<"\033[1;42;34mTask "<<i<<":"<<"\033[0m";
        cout<<endl;

        cout << "  Enter duration: ";
        cin >> task.processTime;

        cout << "  Enter priority: ";
        cin >> task.priority;

        tasks.push_back(task);
    }

    sort(tasks.begin(), tasks.end(),[](const Task& a, const Task& b) {
        return a.priority < b.priority;});


    printf("\033[3;43;30m\n\nSorting Tasks based on their priorties:\n\033[0m");

    cout << "-----------------------------------------------------------\n";
    cout << "| Task    | Process Duration | Priority                |\n";
    cout << "-----------------------------------------------------------\n";

    for (const Task& task : tasks) {
        cout << "| Task " << task.ordinalNumber <<right<< "  | " << task.processTime <<right<< setw(18)<<"  | " << task.priority << setw(24);

        cout << "|\n";
    }

    cout << "-----------------------------------------------------------\n";


    // Calculating each task's wating and turnAround times
    // enterTime for every process = 0

    //Wait time Formula: (ExitTime - ProcessTime - EnterTime) = (ExitTime - ProcessTime)
    //TurnAround time Formula: (ExitTime - EnterTime) = ExitTime

    double currentExitTime = 0;

    for(Task& task: tasks){

        currentExitTime += task.processTime;
        task.waitTime = currentExitTime - task.processTime;
        task.turnAroundTime = currentExitTime;

    }
    double averageWaitingTime;
    double averageTurnAroundTime;

    for(const Task& task: tasks){

        averageWaitingTime += task.waitTime;
        averageTurnAroundTime += task.turnAroundTime;

    }
    averageWaitingTime /= numberOfTasks;
    averageTurnAroundTime /= numberOfTasks;

    cout<<"\n\n";
    printf("\033[3;45;37mResult Table:\033[0m");

    cout << "\n\n-----------------------------------------------------------\n";
    cout << "| Task   | Wait Time | TurnAround Time                     |\n";
    cout << "-----------------------------------------------------------\n";

    for (const Task& task : tasks) {
        
        cout << "| Task " << task.ordinalNumber <<right<<setw(7) << task.waitTime << setw(18)<<"  " << task.turnAroundTime << setw(24);

        cout << "|\n";
    }

    cout << "------------------------------------------------------------------\n";
    printf("\033[3;104;30mAverage Waiting time:\033[0m");
    cout<<" "<<averageWaitingTime<<"       ";
    printf("\033[3;104;30mAverage TurnAround time:\033[0m");
    cout<<" "<<averageTurnAroundTime;
    cout << "\n------------------------------------------------------------------\n";

}
// Coded by Parsa Yousefi Nejad, Arsalan Farid Jafarnejad
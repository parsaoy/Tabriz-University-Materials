#include <iostream>
#include <iomanip>
#include <thread>
#include <mutex>
#include <chrono>
#include <random>

using namespace std;

mutex g_lockprint;
constexpr int no_of_philosophers = 5;

struct Philosopher {
    string name;
    mutex& left_fork;
    mutex& right_fork;
    mt19937 rng{ random_device{}() };

    Philosopher(const string& n, mutex& l, mutex& r) :
        name(n), left_fork(l), right_fork(r)
    {}

    void dine() {
        while (true) {
            think();
            eat();
        }
    }

    void print(const string& text) {
        lock_guard<mutex> cout_lock(g_lockprint);

        // Set color based on philosopher's name
        if (name == "Philosopher 1")
            cout << "\033[1;31m"; // Red color
        else if (name == "Philosopher 2")
            cout << "\033[1;32m"; // Green color
        else if (name == "Philosopher 3")
            cout << "\033[1;33m"; // Yellow color
        else if (name == "Philosopher 4")
            cout << "\033[1;34m"; // Blue color
        else if (name == "Philosopher 5")
            cout << "\033[1;35m"; // Magenta color

        cout << setw(15) << left << name << setw(20) << left << text << "\033[0m" << endl; // Reset color
    }

    void eat() {
        lock(left_fork, right_fork);

        lock_guard<mutex> left_lock(left_fork, adopt_lock);
        lock_guard<mutex> right_lock(right_fork, adopt_lock);

        print("started eating.");

        uniform_int_distribution<> eat(1, 6);
        this_thread::sleep_for(chrono::milliseconds(eat(rng) * 50));

        print("finished eating.");
    }

    void think() {
        uniform_int_distribution<> think(1, 6);
        this_thread::sleep_for(chrono::milliseconds(think(rng) * 150));
        print("is thinking.");

    }
};

void dine() {
    mutex forks[no_of_philosophers];
    Philosopher philosophers[no_of_philosophers]{
        { "Philosopher 1", forks[0], forks[1] },
        { "Philosopher 2", forks[1], forks[2] },
        { "Philosopher 3", forks[2], forks[3] },
        { "Philosopher 4", forks[3], forks[4] },
        { "Philosopher 5", forks[4], forks[0] }
    };

    cout << setw(15) << left << "Philosopher" << setw(20) << left << "Status" << endl;
    cout << setfill('=') << setw(37) << "" << setfill(' ') << endl;

    thread threads[no_of_philosophers];
    for (int i = 0; i < no_of_philosophers; ++i) {
        threads[i] = thread(&Philosopher::dine, &philosophers[i]);
    }

    this_thread::sleep_for(chrono::seconds(5));

    for (int i = 0; i < no_of_philosophers; ++i) {
        threads[i].detach();
    }
}

int main() {
    cout << "Dinner started:" << endl;
    dine();
    cout << "Dinner done!" << endl;

    return 0;
}
/*
************************************************************
Homework 2: Producer-Consumer Problem using semaphore Mutex
multiThreaded.

Coded by Parsa Yousefi Nejad, Arsalan FaridJafar Nejad

OS Lab
************************************************************
*/

#include <iostream>
#include <thread>
#include <queue>
#include <condition_variable>
#include <mutex>

using namespace std;

template <typename E>
class blockingQueue
{

private:
    mutex _mtx;
    condition_variable _cond;
    int _max_size;
    queue<E> _queue;

public:
    blockingQueue(int i_size) : _max_size(i_size) {}

    void push(E element)
    {
        unique_lock<mutex> lock(_mtx);

        _cond.wait(lock, [&]()
                   { return (_queue.size() < _max_size); });
        _queue.push(element);
        lock.unlock();
        _cond.notify_one();
    }

    E front()
    {
        unique_lock<mutex> lock(_mtx);
        _cond.wait(lock, [this]()
                   { return !_queue.empty(); });
        lock.unlock();
        _cond.notify_one();
        return _queue.front();
    }

    void pop()
    {
        unique_lock<mutex> lock(_mtx);
        int n;
        
        _cond.wait(lock, [&]()
                   {return (!_queue.empty()); });

        _queue.pop();
        lock.unlock();
        _cond.notify_one();
    }

    int size()
    {
        lock_guard<mutex> god(_mtx);
        return _queue.size();
    }
};

int main()
{

    blockingQueue<int> qu(3);

    thread producer([&]()
                    {
        for(int i = 0;i <=6;i++){
            // ******************************
            printf("\033[1;42;34mpushing\033[0m");
            cout<<" ";
            printf("\033[1;42;34m%d\033[0m",i);
            cout<<endl;
            // ******************************
            qu.push(i);
            // ******************************
            printf("\x1B[1;1;33mcurrent buffer size is %d\033[0m\n",qu.size());
        } });

    thread consumer([&]()
                    {
        for (int i = 0; i <= 4; i++)
        {
        
        auto res = qu.front();
        qu.pop();

            // ******************************
        printf("\x1B[41;1;35mconsumed\033[0m");
        cout<<" ";
        printf("\x1B[41;1;35m%d\033[0m",res);
        cout<<endl;
            // ******************************
        } });

    producer.join();
    consumer.join();
}
//
//  PThread.c
//  QObjcTour
//
//  Created by cdzdev on 2017/6/30.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#include "PThread.h"

#include <assert.h>
#include <pthread.h>
#include <stdlib.h>
void* PosixThreadMainRoutine(void* data)
{
    // Do some work here.
    for (int i=0;i<50;i++){
        printf("%ld  \n",random());
    }
    
    return NULL;
}

void LaunchThread()
{
    // Create the thread using POSIX routines.
    pthread_attr_t  attr;
    pthread_t       posixThreadID;
    int             returnVal;
    
    returnVal = pthread_attr_init(&attr);
    assert(!returnVal);
    returnVal = pthread_attr_setdetachstate(&attr, PTHREAD_CREATE_DETACHED);
    assert(!returnVal);
    
    int threadError = pthread_create(&posixThreadID, &attr, &PosixThreadMainRoutine, NULL);
    
    returnVal = pthread_attr_destroy(&attr);
    assert(!returnVal);
    if (threadError != 0)
    {
        // Report an error.
    }
}

#include <pthread.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <string.h>

pthread_t ntid;
void printids(const char *s) {
    pid_t pid;
    pthread_t tid;
    pid = getpid();
    tid = pthread_self();
    printf("%s pid %u tid %u (0x%x)\n", s,(unsigned int)pid, (unsigned int)tid, (unsigned int)tid);
}

void *thr_fn(void *arg){
    printids("new thread: ");
    return((void *)0);
}

int newPthread() {
    int err;
        
    err = pthread_create(&ntid, NULL, thr_fn, NULL);
    if (err != 0)
    printf("can't create thread: %s\n", strerror(err));
    
    printids("self thread:");
    sleep(10);
    
    exit(0);
}


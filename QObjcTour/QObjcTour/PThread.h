//
//  PThread.h
//  QObjcTour
//
//  Created by cdzdev on 2017/6/30.
//  Copyright © 2017年 cdz's mac. All rights reserved.
//

#ifndef PThread_h
#define PThread_h

#include <stdio.h>

void* PosixThreadMainRoutine(void* data);
void LaunchThread();

void printids(const char *s);
void *thr_fn(void *arg);
int newPthread() ;

#endif /* PThread_h */

//
//  main.m
//  SafeContainer
//
//  Created by tanhao on 14-3-7.
//  Copyright (c) 2014年 http://www.tanhao.me. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QMSafeMutableArray.h"
#import "QMSafeMutableDictionary.h"

void testArray(void);
void testDictionary(void);

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        //testArray();
        testDictionary();
    }
    return 0;
}

void testArray(void)
{
    int count = pow(10, 4);
    NSTimeInterval intervalBegin=0,intervalEnd=0;
    QMSafeMutableArray *safeArray = [[QMSafeMutableArray alloc] init];
    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    NSLog(@"测试插入性能");
    {
        intervalBegin = [NSDate timeIntervalSinceReferenceDate];
        for (int i=0; i<count; i++)
        {
            [array addObject:@(i)];
        }
        intervalEnd = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%f",intervalEnd-intervalBegin);
        
        intervalBegin = [NSDate timeIntervalSinceReferenceDate];
        for (int i=0; i<count; i++)
        {
            [safeArray addObject:@(i)];
        }
        intervalEnd = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%f",intervalEnd-intervalBegin);
    }
    
    NSLog(@"测试查找性能");
    {
        intervalBegin = [NSDate timeIntervalSinceReferenceDate];
        for (int i=0; i<count; i++)
        {
            [array indexOfObject:@(i)];
        }
        intervalEnd = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%f",intervalEnd-intervalBegin);
        
        intervalBegin = [NSDate timeIntervalSinceReferenceDate];
        for (int i=0; i<count; i++)
        {
            [safeArray indexOfObject:@(i)];
        }
        intervalEnd = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%f",intervalEnd-intervalBegin);
    }
    
    NSLog(@"测试删除性能");
    {
        intervalBegin = [NSDate timeIntervalSinceReferenceDate];
        for (int i=count-1; i>=0; i--)
        {
            [array removeObjectAtIndex:i];
        }
        intervalEnd = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%f",intervalEnd-intervalBegin);
        
        intervalBegin = [NSDate timeIntervalSinceReferenceDate];
        for (int i=count-1; i>=0; i--)
        {
            [safeArray removeObjectAtIndex:i];
        }
        intervalEnd = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%f",intervalEnd-intervalBegin);
    }
}

void testDictionary(void)
{
    int count = pow(10, 6);
    NSTimeInterval intervalBegin=0,intervalEnd=0;
    QMSafeMutableDictionary *safeDictionary = [[QMSafeMutableDictionary alloc] init];
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    
    NSLog(@"测试插入性能");
    {
        intervalBegin = [NSDate timeIntervalSinceReferenceDate];
        for (int i=0; i<count; i++)
        {
            [dictionary setObject:@(i) forKey:@(i)];
        }
        intervalEnd = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%f",intervalEnd-intervalBegin);
        
        intervalBegin = [NSDate timeIntervalSinceReferenceDate];
        for (int i=0; i<count; i++)
        {
            [safeDictionary setObject:@(i) forKey:@(i)];
        }
        intervalEnd = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%f",intervalEnd-intervalBegin);
    }
    
    NSLog(@"测试查找性能");
    {
        intervalBegin = [NSDate timeIntervalSinceReferenceDate];
        for (int i=0; i<count; i++)
        {
            [dictionary objectForKey:@(i)];
        }
        intervalEnd = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%f",intervalEnd-intervalBegin);
        
        intervalBegin = [NSDate timeIntervalSinceReferenceDate];
        for (int i=0; i<count; i++)
        {
            [safeDictionary objectForKey:@(i)];
        }
        intervalEnd = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%f",intervalEnd-intervalBegin);
    }
    
    NSLog(@"测试删除性能");
    {
        intervalBegin = [NSDate timeIntervalSinceReferenceDate];
        for (int i=count-1; i>=0; i--)
        {
            [dictionary removeObjectForKey:@(i)];
        }
        intervalEnd = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%f",intervalEnd-intervalBegin);
        
        intervalBegin = [NSDate timeIntervalSinceReferenceDate];
        for (int i=count-1; i>=0; i--)
        {
            [safeDictionary removeObjectForKey:@(i)];
        }
        intervalEnd = [NSDate timeIntervalSinceReferenceDate];
        NSLog(@"%f",intervalEnd-intervalBegin);
    }
}


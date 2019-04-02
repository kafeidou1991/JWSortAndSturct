//
//  JWMath.h
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/3/16.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JWMath : NSObject

/**
 斐波拉契函数的第N个数是多少

 @param n n
 @return 1
 */
- (int)fibonacci:(int)n;

/**
 二分查找

 @param a 元素
 */
- (void)binarySearch:(NSNumber *)a;

/**
 两个升序重新排列

 @return new array
 */
- (NSMutableArray *)mergeSort;

/**
 一个升序序列，找到两数之和的两个等于某个数
 */
- (void)search:(NSNumber *)sum ;

/**
 数组中最小的k个数

 @param array arr
 @param k k
 */
- (void)topKFromArray:(NSMutableArray *)array topIndex:(int)k ;

/**
 是否是质数

 @param num num
 */
- (void)isPrime:(int)num;

/**
 是否是丑数 （因子仅包含2，3，5）
 
 @param num num
 */
- (void)isUgly:(int)num;

/**
 字符串翻转

 @param s 递归翻转
 */
- (void)reverse:(NSString *)s;

@end

NS_ASSUME_NONNULL_END

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

//找到二维数组中的某个数

- (void)findElem:(NSArray *)array row:(int)n col:(int)m target:(int)target ;


/**
 判断一个数，是否是2的平方数

 @param n
 */
- (void)isPowerOfTwo:(int)n;

/**
 求base的n次方函数 pow函数

 @param base 底数
 @param n 阶乘
 @return 返回
 */
- (double)myPower:(int)base n:(int)n ;

@end

NS_ASSUME_NONNULL_END

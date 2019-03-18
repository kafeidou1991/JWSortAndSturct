//
//  JWMath.m
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/3/16.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import "JWMath.h"

@implementation JWMath
#pragma mark - 斐波拉契第N个函数
- (int)fibonacci:(int)n {
    NSArray * array = @[@0,@1];
    if (n < 2) {
        return [array[n]intValue];
    }
    int rear = 0;
    int fornt = 1;
    int fibN = 0;
    for (int i = 2; i <= n; i++) {
        fibN = rear + fornt;
        rear = fornt;
        fornt = fibN;
    }
    NSLog(@"====%d",fibN);
    return fibN;
}
#pragma mark - 二分查找、 一个升序序列
- (void)binarySearch:(NSNumber *)a {
    NSArray * arr = @[@2, @5, @7, @9, @10, @12, @15, @17, @22, @28];
    int i = 0; int j = (int)arr.count - 1;
    int n = -1;
    while (i <= j) {
        n = (i + j)/2;
        if ([arr[n]intValue] == a.intValue) {
            break;
        }else if ([arr[n]intValue] > a.intValue) {
            j = n -1;
        }else {
            i = n + 1;
        }
    }
    if (i > j) {
        //没找到
        n = -1;
    }
    NSLog(@"查找到的索引是%@",n >0 ? @(n) : @"不存在的");
}

#pragma mark - 两个升序序列重新排序
- (NSMutableArray *)mergeSort {
    NSArray *arr1 = @[@2, @5, @8, @10, @14, @16];
    NSArray *arr2 = @[@3, @7, @9, @11, @15, @17];
    NSMutableArray *arr = [NSMutableArray array];
    int i = 0; int j = 0;
    while (i < arr1.count && j < arr2.count) {
        if ([arr1[i]intValue] > [arr2[j]intValue]) {
            [arr addObject:arr2[j]];
            j++;
        }else {
            [arr addObject:arr1[i]];
            i++;
        }
    }
    if (i != arr1.count) {
        while (i != arr1.count) {
            [arr addObject:arr1[i]];
            i++;
        }
    }
    if (j != arr2.count) {
        while (j != arr2.count) {
            [arr addObject:arr2[j]];
            j++;
        }
    }
    return arr;
}

#pragma mark - 一个升序序列，找到两数之和的两个等于某个数
- (void)search:(NSNumber *)sum {
    NSArray * arr = @[@2, @5, @7, @9, @10, @12, @15, @17, @22, @28];
    int i = 0; int j = (int)arr.count - 1;
    while (i < j) {
        if ([arr[i]intValue] + [arr[j]intValue] == sum.intValue) {
            NSLog(@"查找到的索引是%d====%d",i,j);
            return;
        }else if ([arr[i]intValue] + [arr[j]intValue] > sum.intValue){
            j--;
        }else {
            i++;
        }
    }
    NSLog(@"没找到");
}

#pragma mark - 数组中前ke个最小的数
- (void)topKFromArray:(NSMutableArray *)array topIndex:(int)k {
    if (k <=0 || k > array.count - 1) {
        return;
    }
    int low = 0;
    int high = (int)array.count - 1;
//    @[@16,@21,@12,@3,@5,@17,@11,@18,@4,@2]
    int mid = [self midNumber:array low:low high:high];
    
    while (mid != k-1) {
        if (mid > k-1) {
            high = mid-1;
            mid = [self midNumber:array low:low high:high];
        }else {
            low = mid +1;
            mid = [self midNumber:array low:low high:high];
        }
    }
    
    NSLog(@"==%@",array);
}
- (int)midNumber:(NSMutableArray *)array low:(int)low high:(int)high {
//    @[@16,@21,@12,@3,@5,@17,@1,@18,@4,@2]
    NSNumber * mid = array[low];
    
    while (low < high) {
        while (low < high && [array[high] compare:mid] != NSOrderedAscending) {
            high--;
        }
        array[low] = array[high];
        while (low < high && [array[low] compare:mid] != NSOrderedDescending ) {
            low ++;
        }
        array[high] = array[low];
    }
    array[low] = mid;
    return low;
}


- (void)findElem:(NSArray *)array row:(int)n col:(int)m target:(int)target {
    if (array.count == 0 || m <0 || n <0) {
        return;
    }
    int row = 0;
    while (row < n) {
        if (([array[row][0]intValue] <= target) && (target <= [array[row][m-1]intValue])) {
            for (int i = 0; i < m; i++) {
                if ([array[row][i]intValue] == target) {
                    NSLog(@"找到了元素在第%d行，第%d位置",row+1,i+1);
                    return;
                }
            }
        }else {
            row++;
        }
    }
}

@end

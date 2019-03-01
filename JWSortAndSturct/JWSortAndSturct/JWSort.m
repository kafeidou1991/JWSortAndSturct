//
//  JWSort.m
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/2/28.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import "JWSort.h"

@interface JWSort ()
@property (nonatomic, strong) NSMutableArray *sortArray;
@end

@implementation JWSort
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.sortArray = @[@1,@5,@3,@5,@8,@9,@7,@4,@2,@6].mutableCopy;
    }
    return self;
}
//排序
- (void)sort {
//    [self selectSort];
//    [self bubbleSort];
//    [self quickSort:self.sortArray start:0 end:(int)self.sortArray.count - 1];
//    self.sortArray = [self mergeSort];
//    NSLog(@"排序结果：%@",self.sortArray.description);
    
    
    [self binarySearch:@5];
//    NSArray * arr = @[@2, @5, @7, @9, @10, @12, @15, @17, @22, @28];
}
#pragma mark - 选择排序
/*
 选择排序算法步骤
 首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置
 
 再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
 
 重复第二步，直到所有元素均排序完毕。
 */
- (void)selectSort {
    for (int i = 0; i < self.sortArray.count; i++) {
        for (int j = i +1; j <self.sortArray.count; j ++) {
            if ([self.sortArray[i]intValue] > [self.sortArray[j]intValue]) {
                [self.sortArray exchangeObjectAtIndex:i withObjectAtIndex:j];
            }
        }
    }
}
#pragma mark - 冒泡排序
/*
 冒泡排序算法步骤
 首先在未排序序列中找到最小（大）元素，存放到排序序列的起始位置
 
 再从剩余未排序元素中继续寻找最小（大）元素，然后放到已排序序列的末尾。
 
 重复第二步，直到所有元素均排序完毕。
 */
- (void)bubbleSort {
    for (int i = 0; i < self.sortArray.count - 1; i++) {
        for (int j = 0; j < self.sortArray.count - 1 - i; j++) {
            if ([self.sortArray[j]intValue] > [self.sortArray[j+1]intValue]) {
                [self.sortArray exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
}
#pragma mark - 快速排序
/*
快速排序
随机找出一个数，可以随机取，也可以取固定位置，一般是取第一个或最后一个称为基准，然后就是比基准小的在左边，比基准大的放到右边，如何放做，就是和基准进行交换，这样交换完左边都是比基准小的，右边都是比较基准大的，这样就将一个数组分成了两个子数组，然后再按照同样的方法把子数组再分成更小的子数组，直到不能分解为止

*/
- (void)quickSort:(NSMutableArray *)array start:(int)start end:(int)end {
    //两个方向碰头了直接返回
    if (start >= end) {
        return;
    }
    int low = start;
    int high = end;
    NSNumber * mid = array[start];
    
    while (low < high) {
        //右边开始走
        while (low < high && [array[high]intValue] > mid.intValue) {
            high--;
        }
        //找到了右边比mid小的数字，替换
        array[low] = array[high];
        
        //接下来，左边寻找比mid大的数，放右边
        while (low < high && [array[low]intValue] <= mid.intValue) {
            low ++;
        }
        array[high] = array[low];
    }
    //以此循环截止 ，此时左部y小于mid，右步大于mid，讲mid放置中间
    array[low] = mid;
    //排序左步顺序
    [self quickSort:array start:start end:low -1];
    //右边
    [self quickSort:array start:low+1 end:end];
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





@end

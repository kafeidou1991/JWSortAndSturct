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
//        self.sortArray = @[@1,@5,@3,@5,@8,@9,@7,@4,@2,@6].mutableCopy;
        self.sortArray = @[@1,@5,@4,@2,@3].mutableCopy;
    }
    return self;
}
//排序
- (void)sort {
//    [self selectSort];
//    [self bubbleSort];
//    [self quickSort:self.sortArray start:0 end:(int)self.sortArray.count - 1];
//    [self insertSort];
//    self.sortArray = [self mergeSort];
//    [self mergeSort:self.sortArray start:0 end:(int)self.sortArray.count - 1];
//    [self heapSort];
    [self search:@24];
    NSLog(@"排序结果：%@",self.sortArray.description);
    
    
//    [self binarySearch:@5];
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
#pragma mark - 插入排序
//每次将一个待排序的记录，按其关键字大小插入到前面已经排好序的子序列中的适当位置，直到全部记录插入完成为止
- (void)insertSort {
    for (int i = 0; i < self.sortArray.count; i++) {
        NSNumber * e = self.sortArray[i];
        int j;
        for (j = i; j>0 && [self.sortArray[j-1] compare:e] == NSOrderedDescending; j--) {
            [self.sortArray exchangeObjectAtIndex:j withObjectAtIndex:j-1];
        }
        self.sortArray[j] = e;
    }
}
#pragma mark - 归并排序
/*
申请空间，使其大小为两个已经排序序列之和，该空间用来存放合并后的序列；
设定两个指针，最初位置分别为两个已经排序序列的起始位置；
比较两个指针所指向的元素，选择相对小的元素放入到合并空间，并移动指针到下一位置；
重复步骤 3 直到某一指针达到序列尾；
将另一序列剩下的所有元素直接复制到合并序列尾。
 */
- (void)mergeSort:(NSMutableArray *)array start:(int)start end:(int)end {
//    @1,@5,@4,@2,@3
    if (start >= end) {
        return;
    }
    int mid = (start + end) / 2;
    [self mergeSort:array start:start end:mid];    // 递归出来以后左边有序
    [self mergeSort:array start:mid + 1 end:end];  // 右边有序
    [self mergeArray:array start:start end:end mid:mid]; // 合并两个有序序列
}
- (void)mergeArray:(NSMutableArray *)array start:(int)start end:(int)end mid:(int)mid {
    // 开辟新的空间 r-l+1的空间
    NSMutableArray *aux = [NSMutableArray arrayWithCapacity:end-start+1];
    //注意这里需要等于end
    for (int i = start; i<=end; i++) {
        // aux 中索引 i-l 的对象 与 array 中索引 i 的对象一致
        aux[i-start] = array[i];
    }
    int i = start;
    int j = mid + 1;
    for (int k = start; k <= end; k++) {
        if (i > mid) {// 如果左半部分元素已经全部处理完毕
            self.sortArray[k] = aux[j - start];
            j++;
        }else if (j > end) { // 如果右半部分元素已经全部处理完毕
            self.sortArray[k] = aux[i - start];
            i++;
        }else if ([aux[i - start]compare:aux[j - start]] == NSOrderedAscending) {// 左半部分所指元素 < 右半部分所指元素
            self.sortArray[k] = aux[i - start];
            i++;
        }else {
            self.sortArray[k] = aux[j - start];
            j++;
        }
    }
}
#pragma mark - 堆排序
/*
创建一个堆 H[0……n-1]；
把堆首（最大值）和堆尾互换；
把堆的尺寸缩小 1，并调用 shift_down(1)，目的是把新的数组顶端数据调整到相应位置；
重复步骤 2，直到堆的尺寸为 1
 堆排序 = 构造堆 + 交换堆末尾元素与根结点 + 删除末尾结点 + 构造堆 + 交换....依次循环, 由于根结点必定是堆中最大(最小)的元素, 所以删除出来的元素序列也必定是升序(降序)的.
 */
- (void)heapSort {
//    @1,@5,@4,@2,@3
    for (int i = ((int)self.sortArray.count - 1) / 2; i >= 0; i--) {
        // 构造小顶堆
        [self minHeapFixdown:self.sortArray index:i count:(int)self.sortArray.count];
    }
    for (int i = (int)self.sortArray.count - 1; i >= 1; i--) {
        // 交换根结点与最末节点
        NSNumber * temp = self.sortArray[i];
        self.sortArray[i] = self.sortArray[0];
        self.sortArray[0] = temp;
        
        // 剩余的n-1个元素再次建立小顶堆
        [self minHeapFixdown:self.sortArray index:0 count:i];
        
    }
}
- (void)minHeapFixdown:(NSMutableArray *)array index:(int)i count:(int)count {
    int j;
    NSNumber * temp = array[i];
    j = 2 * i + 1;
    while(j < count) {
        if (j + 1 < count && [array[j+1]intValue] < [array[j]intValue]) j++; // 找出较小的子节点
        
        if ([array[j]intValue] >= temp.intValue) break; // 如果较小的子节点比父节点大, 直接返回
        
        array[i] = array[j]; // 设置父节点为较小节点
        i = j; // 调整的子节点作为新一轮的父节点
        j = 2 * i + 1; // 调整的子节点的子节点
    }
    array[i] = temp;
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




@end

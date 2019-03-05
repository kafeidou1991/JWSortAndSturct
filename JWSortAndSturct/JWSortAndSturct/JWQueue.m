//
//  JWQueue.m
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/3/4.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import "JWQueue.h"

@implementation JWQueueNode
@end
/*
 1. 队列是限定仅在一端操作插入 另外一端操作删除
 把允许删除操作的一端叫队头、允许插入队尾 先进先出 FIFO
 2. 循环队列：当栈的达到最大值的时候，防止『假溢出』队尾指针从队头开始重新排列
 front  rear
 0，1，2，3，4
 ------------- 出列0、1
 x，x，2，3，4
 ------------- 入列5、6
 5，6，2，3，4
 此时rear 指向6
 front指向2
 
 队列元素长度公式：(rear-front+QueueSize) % QueueSize
 队列是否满：  （rear+1）%QueueSize == front  相等则满了
 是否空列  ：   rear==front
 以上是队列是数组的存储方法
 
 无需考虑大小的链式存储结构  链队列
 */
#define MaxQueueSize 10
@implementation JWQueue {
    int count;
}
//MARK: 初始化队列
- (instancetype)initQueue {
    if (self = [super init]) {
        //初始化 队头 队尾
        self.front = [JWQueueNode new];
        self.front.next = nil;
        self.rear = self.front;
    }
    return self;
}

//MARK: 队列个数
- (int)QueueSize {
    return count;
//    int nodeCount = 0;
//    JWQueueNode * node = self.front.next;
//    while (node) {
//        node = node.next;
//        nodeCount ++;
//    }
//    (self.rear - self.front + MaxQueueSize) % MaxQueueSize
}
- (void)enQueue:(NSNumber *)data {
    if (count >= MaxQueueSize) {
        NSLog(@"链式队列已经达到最大");
        return;
    }
    JWQueueNode * node = [JWQueueNode new];
    node.data = data;
    node.next = nil;
    //讲node插入rear后面
    self.rear.next = node;
    //重新复制rear 复制尾节点
    self.rear = node;
    count ++;
    NSLog(@"入队%@成功",data);
}


- (void)outQueue {
    if (self.rear == self.front) {
        NSLog(@"已经是空队列了");
        return;
    }
    JWQueueNode * node = self.front.next;
    self.front.next = node.next;
    
    //判断是否已经到了队尾了
    if (node == self.rear) {
        self.rear = self.front;
    }
    count --;
    NSLog(@"出队%@成功",node.data);
}


@end

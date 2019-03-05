//
//  JWQueue.h
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/3/4.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JWQueueNode : NSObject
@property (nonatomic, strong) JWQueueNode * next;
@property (nonatomic, strong) NSNumber * data; //数据类型
@end

@interface JWQueue : NSObject

/**
 头指针 队头
 */
@property (nonatomic, strong) JWQueueNode *front;
/**
 尾指针  队尾
 */
@property (nonatomic, strong) JWQueueNode *rear;

/**
 初始化队列

 @return 对象
 */
- (instancetype)initQueue;

/**
 当前队列元素个数

 @return 个数
 */
- (int)QueueSize;

/**
 入队

 @param data 数据
 */
- (void)enQueue:(NSNumber *)data;

/**
 出队
 */
- (void)outQueue;

@end

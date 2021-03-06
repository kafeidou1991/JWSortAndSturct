//
//  JWNodeList.h
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/2/28.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JWNodeList : NSObject {
    @public
    NSNumber * data;
    JWNodeList * next;
    
    JWNodeList * pre; //双向链表用
}

/**
 创建单链表

 @param array 数组转换为链表
 @return 链表
 */
+ (instancetype)createNodeList:(NSArray *)array;

/**
 插入链表

 @param node node
 */
- (void)insertNodeList:(JWNodeList *)node withIndex:(int)index;

/**
 获取某个节点索引
 
 @param index 索引
 */
- (void)deleteNode:(int)index;

/**
 创建双向链表
 
 @param array 数组转换为链表
 @return 链表
 */
+ (instancetype)createTwoNodeList:(NSArray *)array;

/**
 反转链表
 */
- (JWNodeList *)reveriseNodeList;

/**
 查找中间节点
 */
- (void)middleNode;

/**
 检查是否存在环
 */
- (void)checkCircle;


/**
 打印链表
 */
+ (void)printeNodeList:(JWNodeList * )list;
/**
 清除链表
 */
- (void)cleanNodeList;

/**
 链表长度
 */
- (int)getListLengh;


@end

NS_ASSUME_NONNULL_END

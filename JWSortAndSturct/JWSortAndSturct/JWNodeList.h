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
- (void)insertNodeList:(JWNodeList *)node afterNode:(JWNodeList*)afterNode;

/**
 创建双向链表
 
 @param array 数组转换为链表
 @return 链表
 */
+ (instancetype)createTwoNodeList:(NSArray *)array;



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
- (void)getListLengh;

/**
 获取某个节点索引

 @param node 节点
 */
- (void)getNodeIndex:(JWNodeList *)node;


@end

NS_ASSUME_NONNULL_END

//
//  JWTree.m
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/3/5.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import "JWBinaryTree.h"

@implementation JWBinaryTree

+ (instancetype)creayBinaryTree:(NSArray *)array {
    JWBinaryTree * rootTree = nil;
    
    for (int i = 0; i < array.count; i++) {
        rootTree = [JWBinaryTree addTreeNode:rootTree data:array[i]];
    }
    return rootTree;
}
#pragma mark - 增加一个节点
/**
 增加一个节点
 
 @param rootTree 根节点
 @param data 数据
 @return 根节点
 */
+ (instancetype)addTreeNode:(JWBinaryTree *)rootTree data:(NSNumber *)data {
    if (!rootTree) {
        rootTree = [JWBinaryTree new];
        rootTree.data = data;
    }else if ([rootTree.data compare:data] != NSOrderedAscending) {
        rootTree.leftChild = [JWBinaryTree addTreeNode:rootTree.leftChild data:data];
    }else {
        rootTree.rightChild = [JWBinaryTree addTreeNode:rootTree.rightChild data:data];
    }
    return rootTree;
}
#pragma mark - 查询某个索引的节点
+ (JWBinaryTree *)binaryTreeIndex:(NSInteger)index rootTree:(JWBinaryTree *)rootThree {
    if (!rootThree || index < 0) {
        return nil;
    }
    //数组当做队列，进行先进先出的原则
    NSMutableArray * queuqArray = [NSMutableArray arrayWithObject:rootThree];
    while (queuqArray.count > 0) {
        JWBinaryTree * node = [queuqArray firstObject];
        if (index == 0) {
            return node;
        }
        index--;
        //弹出最前面的节点，仿照队列先进先出原则
        [queuqArray removeObjectAtIndex:0];
        if (node.leftChild) {
            [queuqArray addObject:node.leftChild];
        }
        if (node.rightChild) {
            [queuqArray addObject:node.rightChild];
        }
    }
    NSLog(@"没找到");
    return nil;
}
#pragma mark - 前序遍历
+ (void)preOrderBinaryTree:(JWBinaryTree *)rootNode {
    if (!rootNode) {
        return;
    }
    NSLog(@"前序遍历节点值：《%@》",rootNode.data);
    [self preOrderBinaryTree:rootNode.leftChild];
    [self preOrderBinaryTree:rootNode.rightChild];
}
#pragma mark - 中序遍历
+ (void)inOrderBinaryTree:(JWBinaryTree *)rootNode {
    if (!rootNode) {
        return;
    }
    [self inOrderBinaryTree:rootNode.leftChild];
    NSLog(@"中序遍历节点值：《%@》",rootNode.data);
    [self inOrderBinaryTree:rootNode.rightChild];
}




@end

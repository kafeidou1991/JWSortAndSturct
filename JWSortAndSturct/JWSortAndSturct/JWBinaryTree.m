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
#pragma mark - 翻转二叉树
//算法L： 递归：如果遇到子节点 返回当前二叉树， 遍历左子树、右子树，临时变量改变
+ (JWBinaryTree *)reversBinaryTree:(JWBinaryTree *)rootNode {
    if (!rootNode) {
        return nil;
    }
    if (!rootNode.leftChild && !rootNode.rightChild) {
        return rootNode;
    }
    [self reversBinaryTree:rootNode.leftChild];
    [self reversBinaryTree:rootNode.rightChild];
    
    //反转
    JWBinaryTree * tmp = rootNode.leftChild;
    rootNode.leftChild = rootNode.rightChild;
    rootNode.rightChild = tmp;
    return rootNode;
}
#pragma mark - 比较两个二叉树相等
/*
 A、B两棵树相等当且仅当RootA->c==RootB–>c,而且A和B的左右子树相等或者左右互换相等。
 */
+ (BOOL)compareBinaryTree:(JWBinaryTree *)rootNode1 :(JWBinaryTree *)rootNode2 {
    if (!rootNode1 && !rootNode2) {
        return YES;
    }
    if (!rootNode1 || !rootNode2) {
        return NO;
    }
    if ([rootNode1.data compare:rootNode2.data] != NSOrderedSame) {
        return NO;
    }
    BOOL is_left = [self compareBinaryTree:rootNode1.leftChild :rootNode2.leftChild];
    BOOL is_right = [self compareBinaryTree:rootNode1.rightChild :rootNode2.rightChild];
    if (is_left && is_right) {
        return YES;
    } else {
        is_left = [self compareBinaryTree:rootNode1.leftChild :rootNode2.rightChild];
        is_right = [self compareBinaryTree:rootNode1.rightChild :rootNode2.leftChild];
        if (is_left && is_right) {
            return YES;
        }else {
            return NO;
        }
    }
    
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
#pragma mark - 后序遍历
+ (void)postOrderBinaryTree:(JWBinaryTree *)rootNode {
    if (!rootNode) {
        return;
    }
    [self postOrderBinaryTree:rootNode.leftChild];
    [self postOrderBinaryTree:rootNode.rightChild];
    NSLog(@"后序遍历节点值：《%@》",rootNode.data);
}
#pragma mark - 层次遍历
//层次遍历，从上到下 从左到右 依次遍历 又叫 广度优先遍历 需要用到队列
+ (void)levelOrderBinaryTree:(JWBinaryTree *)rootNode {
    if (!rootNode) {
        return;
    }
    NSMutableArray * queueArray = [NSMutableArray arrayWithObject:rootNode];
    while (queueArray.count > 0) {
        JWBinaryTree * node = [queueArray firstObject];
        NSLog(@"层次遍历节点值：《%@》",node.data);
        //FIFO原则
        [queueArray removeObjectAtIndex:0];
        if (node.leftChild) {
            [queueArray addObject:node.leftChild];
        }
        if (node.rightChild) {
            [queueArray addObject:node.rightChild];
        }
    }
}
#pragma mark - 二叉树深度
/*算法： 1.node为nil返回0
        2.node.left =nil & node.right = nil 深度为1
        3.递归取MAX(left,right) +1
 */
+ (int)depthForBinaryTree:(JWBinaryTree *)rootNode {
    if (!rootNode) {
        return 0;
    }
    if (!rootNode.leftChild && !rootNode.rightChild) {
        return 1;
    }
    int leftDepth = [self depthForBinaryTree:rootNode.leftChild];
    int rightDepth = [self depthForBinaryTree:rootNode.rightChild];
    
    return MAX(leftDepth, rightDepth) + 1;
}
#pragma mark - 二叉树宽度
/*算法： FIFO遍历每一层 比较大小
 */
+ (int)widthForBinaryTree:(JWBinaryTree *)rootNode {
    if (!rootNode) {
        return 0;
    }
    NSMutableArray * queueArray = [NSMutableArray arrayWithObject:rootNode];
    int maxWidth = 1; //有根节点所以至少为1
    int currWidth = 0;
    while (queueArray.count > 0) {
        currWidth = (int)queueArray.count;
        for (int i = 0; i < currWidth; i++) {
            JWBinaryTree * node = [queueArray firstObject];
            [queueArray removeObjectAtIndex:0]; //第一个出列
            if (node.leftChild) {
                [queueArray addObject:node.leftChild];
            }
            if (node.rightChild) {
                [queueArray addObject:node.rightChild];
            }
        }
        maxWidth = MAX((int)queueArray.count, maxWidth);
    }
    return maxWidth;
}
#pragma mark - 二叉树所有节点数
//二叉树所有节点数=左子树节点数+右子树节点数+1(根节点)
//如果求某层的节点数：  if leve==1 ret 1 ； num = [self number:node.left level:level-1] +  [self number:node.right level:level-1] [self number:node.right level:level-1]
//如果是第一层返回1 ，某层节点数= k-1层的左子树数+ k-1层右子树数
+ (int)numberOfNodeForBinary:(JWBinaryTree *)rootNode {
    if (!rootNode) {
        return 0;
    }
    return [self numberOfNodeForBinary:rootNode.leftChild] + [self numberOfNodeForBinary:rootNode.rightChild] + 1;
}
#pragma mark - 二叉树所有叶子节点数
//二叉树所有叶子节点数=左子树叶子节点数+右子树叶子节点数
+ (int)numberOfLeafNodeForBinaryTree:(JWBinaryTree *)rootNode {
    if (!rootNode) {
        return 0;
    }
    if (!rootNode.leftChild && !rootNode.rightChild) {
        return 1;
    }
    return [self numberOfLeafNodeForBinaryTree:rootNode.leftChild] + [self numberOfLeafNodeForBinaryTree:rootNode.rightChild];
}



@end

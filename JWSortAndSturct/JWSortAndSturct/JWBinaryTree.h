//
//  JWTree.h
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/3/5.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JWBinaryTree : NSObject

/**
 二叉树存储的值
 */
@property (nonatomic, strong) NSNumber *data;

/**
 左子树
 */
@property (nonatomic, strong) JWBinaryTree *leftChild;

/**
 右子树
 */
@property (nonatomic, strong) JWBinaryTree *rightChild;

/**
 创建一个二叉树

 @param array 数据源
 @return 二叉树
 */
+ (instancetype)creayBinaryTree:(NSArray *)array;

/**
 查询tree某个索引的节点

 @param index 索引
 @param rootThree 根节点
 @return s节点
 */
+ (JWBinaryTree *)binaryTreeIndex:(NSInteger)index rootTree:(JWBinaryTree *)rootThree;

/**
 翻转二叉树

 @param rootNode 二叉树
 @return 新的二叉树
 */
+ (JWBinaryTree *)reversBinaryTree:(JWBinaryTree *)rootNode;

/**
 比较两个二叉树是否相等

 @param rootNode1 茶树1
 @param rootNode2 茶树2
 */
+ (BOOL)compareBinaryTree:(JWBinaryTree *)rootNode1 :(JWBinaryTree *)rootNode2;

/**
 前序遍历

 @param rootNode 二叉树
 */
+ (void)preOrderBinaryTree:(JWBinaryTree *)rootNode;

/**
 中序遍历

 @param rootNode 二叉树
 */
+ (void)inOrderBinaryTree:(JWBinaryTree *)rootNode;

/**
 后序遍历
 
 @param rootNode 二叉树
 */
+ (void)postOrderBinaryTree:(JWBinaryTree *)rootNode;

/**
 层次遍历

 @param rootNode 二叉树
 */
+ (void)levelOrderBinaryTree:(JWBinaryTree *)rootNode;

/**
 二叉树的深度

 @param rootNode 二叉树
 @return 深度
 */
+ (int)depthForBinaryTree:(JWBinaryTree *)rootNode;

/**
 二叉树的宽度

 @param rootNode 茶树
 @return 宽度
 */
+ (int)widthForBinaryTree:(JWBinaryTree *)rootNode;

/**
 二叉树所有节点数

 @param rootNode 二叉树
 @return num
 */
+ (int)numberOfNodeForBinary:(JWBinaryTree *)rootNode;

/**
 二叉树所有叶子节点

 @param rootNode 二叉树
 @return num
 */
+ (int)numberOfLeafNodeForBinaryTree:(JWBinaryTree *)rootNode;

@end

NS_ASSUME_NONNULL_END

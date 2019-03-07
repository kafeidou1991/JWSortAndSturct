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
 前序遍历

 @param rootNode 二叉树
 */
+ (void)preOrderBinaryTree:(JWBinaryTree *)rootNode;

/**
 中序遍历

 @param rootNode 二叉树
 */
+ (void)inOrderBinaryTree:(JWBinaryTree *)rootNode;



@end

NS_ASSUME_NONNULL_END

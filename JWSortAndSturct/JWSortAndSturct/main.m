//
//  main.m
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/2/28.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JWSort.h"
#import "JWNodeList.h"
#import "JWStack.h"
#import "JWQueue.h"
#import "JWBinaryTree.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //排序
        JWSort * sort = [JWSort new];
        [sort sort];
        
        
        //单向链表
//        JWNodeList * list = [JWNodeList createNodeList:@[@1,@2,@3,@4,@5,@6,@7,@8]];
//        [list cleanNodeList];
        
//        [list getListLengh];
        
//        [list deleteNode:10];
        
//        list = [list reveriseNodeList];
//        [list middleNode];
//        [list checkCircle];
        
        //插入
//        JWNodeList * node = [JWNodeList new];
//        node->data = @100;
//        [list insertNodeList:node withIndex:8];
        
//        [JWNodeList printeNodeList:list];
        
        //栈
//        JWStack * stack = [JWStack new];
//
//        for (int i = 0; i<10; i++) {
//            [stack pushElem:[NSNumber numberWithInt:i]];
//        }
//
//        for (int i = 0; i<5; i++) {
//            [stack pop];
//        }
        
        //队列
//        JWQueue * queue = [[JWQueue alloc]initQueue];
//
//        [queue enQueue:@1];
//        [queue enQueue:@2];
//        [queue enQueue:@3];
        
//        [queue outQueue];
//        [queue outQueue];
//        [queue outQueue];
//        [queue outQueue];
        
        //二叉树
        JWBinaryTree * tree = [JWBinaryTree creayBinaryTree:@[@9,@3,@4,@6,@7,@1,@2,@5,@8]];
//        JWBinaryTree * tree = [JWBinaryTree creayBinaryTree:@[@1,@2,@3,@4,@5,@6,@7,@8,@9]];
//        JWBinaryTree * tree = [JWBinaryTree creayBinaryTree:@[@9,@8,@7,@6,@5,@4,@3,@2,@1]];
        
//        JWBinaryTree * indexNode = [JWBinaryTree binaryTreeIndex:3 rootTree:tree];
        //反转二叉树
//        tree = [JWBinaryTree reversBinaryTree:tree];
        //前序
//        [JWBinaryTree preOrderBinaryTree:tree];
//        //中序
//        [JWBinaryTree inOrderBinaryTree:tree];
        //后序
//        [JWBinaryTree postOrderBinaryTree:tree];
        //曾层次遍历
//        [JWBinaryTree levelOrderBinaryTree:tree];
        //最大深度
//        int depthTree = [JWBinaryTree depthForBinaryTree:tree];
//        NSLog(@"二叉树深度为       %d",depthTree);
        
//        int width = [JWBinaryTree widthForBinaryTree:tree];
//        NSLog(@"二叉树宽度为       %d",width);
        
//        int number = [JWBinaryTree numberOfNodeForBinary:tree];
//        NSLog(@"二叉树所有节点数       %d",number);
        
//        int number = [JWBinaryTree numberOfLeafNodeForBinaryTree:tree];
//        NSLog(@"二叉树所有叶子节点数       %d",number);
        
        BOOL b = [JWBinaryTree compareBinaryTree:tree :tree];
        NSLog(@"%@",b?@"相等":@"不相等");
        
        
    }
    return 0;
}

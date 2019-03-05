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

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //排序
//        JWSort * sort = [JWSort new];
//        [sort sort];
        
        
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
        JWQueue * queue = [[JWQueue alloc]initQueue];

        [queue enQueue:@1];
        [queue enQueue:@2];
        [queue enQueue:@3];
        
//        [queue outQueue];
//        [queue outQueue];
//        [queue outQueue];
//        [queue outQueue];
        

        
    }
    return 0;
}

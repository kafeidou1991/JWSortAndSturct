//
//  JWNodeList.m
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/2/28.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import "JWNodeList.h"

@implementation JWNodeList {
    int count;
}

+ (instancetype)createNodeList:(NSArray *)array {
//    [JWNodeList printeNodeList:[self headCreateNodeList:array]];
    return [self tailCreateNodeList:array];
}

+ (instancetype)createTwoNodeList:(NSArray *)array {
    //头结点
    JWNodeList * head = [JWNodeList new];
    head->next = NULL;
    head->pre = NULL;
    JWNodeList *parentNode = head;
    for (int i = 0; i<array.count; i++) {
        JWNodeList * p = [JWNodeList new];
        p->data = array[i];
        p->next = head->next; //插入到表头,后来的始终放在第一位，第一次链接的时候是用的头结点，所以最后一个节点.next-->NULL
        p->pre = parentNode;
        head->next = p;
        parentNode = p;
    }
    return head;
}
#pragma mark -  头插法
/**
 头插法, 数组的第一个数据在链表的尾端（倒序排列）
 
 @param array 数据
 */
+ (instancetype)headCreateNodeList:(NSArray *)array {
    //头结点
    JWNodeList * list = [JWNodeList new];
    list->next = NULL;
    for (int i = 0; i<array.count; i++) {
        JWNodeList * p = [JWNodeList new];
        p->data = array[i];
        p->next = list->next; //插入到表头,后来的始终放在第一位，第一次链接的时候是用的头结点，所以最后一个节点.next-->NULL
        list->next = p;
    }
    return list;
}
#pragma mark -  尾插法
/**
 尾插法, 数组的第一个数据在链表的头端（正序排列）
 
 @param array 数据
 */
+ (instancetype)tailCreateNodeList:(NSArray *)array {
    //尾部接点,需要创建首位2个节点，因为尾节点一直在变化
    JWNodeList * headNode = [JWNodeList new];
    headNode->next = NULL;
    JWNodeList * tailNode = nil;
    tailNode = headNode;
    for (int i = 0; i<array.count; i++) {
        JWNodeList * p = [JWNodeList new];
        p->data = array[i];
        tailNode->next = p;
        tailNode = p; //将新建的结点 node 的地址赋给尾结点 end
    }
    tailNode->next = NULL; //链表结束
    
    return headNode;
}
#pragma mark -  单链表插入某个节点
- (void)insertNodeList:(JWNodeList *)node afterNode:(JWNodeList *)afterNode {
    
}
#pragma mark -  打印链表
+ (void)printeNodeList:(JWNodeList * )list{
    JWNodeList * copyList = list;
    while (copyList) {
        NSLog(@"%@",copyList->data);
        copyList = copyList->next;
    }
}

#pragma mark -  清除链表
- (void)cleanNodeList {
    JWNodeList * p = self->next;
    JWNodeList * q;
    while (p) {
        q = p->next;
        p = nil;
        p = q;
    }
    self->next = NULL;
}

#pragma mark -  清除长度
- (void)getListLengh {
    count = 0;
    JWNodeList * p = self->next;
    while (p) {
        count++;
        p = p->next;
    }
    NSLog(@"链表长度%d",count);
}
#pragma mark -  获取节点
- (void)getNodeIndex:(JWNodeList *)node {
    
}


@end

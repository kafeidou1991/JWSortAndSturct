//
//  JWNodeList.m
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/2/28.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import "JWNodeList.h"

@implementation JWNodeList
+ (instancetype)createNodeList:(NSArray *)array {
//    return [self tailCreateNodeList:array];
    return [self headCreateNodeList:array];
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
    for (int i = 0; i<array.count; i++) {
        JWNodeList * p = [JWNodeList new];
        p->data = array[i];
        p->next = list->next; //插入到表头,后来的始终放在第一位，第一次链接的时候是用的头结点，所以最后一个节点.next-->NULL
        list->next = p;
    }
    return list;
}
#pragma mark -  尾插法(可以逆转一个链表)
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
- (void)insertNodeList:(JWNodeList *)node withIndex:(int)index {
    int i = 1;
    JWNodeList * p = self;
    while (p && index > i) {
        i++;
        p = p->next;
    }
    if (!p || index < i || !node) {
        NSLog(@"插入节点不存在");
        return;
    }
    //设置node
    node->next = p->next;
    p->next = node;
    NSLog(@"插入成功");
}
#pragma mark -  单链表删除节点
- (void)deleteNode:(int)index {
    //因为有头节点，所以从1开始计算索引
    int i = 1;
    JWNodeList * p, * q;
    p = self;
    while (p->next && i < index) {
        p = p->next;
        ++i;
    }
    if (!p->next || index < i) {
        NSLog(@"删除的元素不存在");
        return;
    }
    //要删除的元素
    q = p->next;
    //链接
    p->next = q->next;
    q = nil;
    NSLog(@"删除完成");
}
#pragma mark -  反转链表
/*
 方法1. 尾插发逆转（[self tailCreateNodeList:list]）
 方法2. 使用3个指针遍历单链表，逐个链接点进行反转。
 方法3. 递归（系统栈）。
 */
- (JWNodeList *)reveriseNodeList {
    //递归方法
//    return [self reveriseNodeList3];
    
    
    JWNodeList * head = self;
    JWNodeList * p = head;
    JWNodeList * q = p->next;
    if (!p || !q) {
        NSLog(@"空表返回");
        return nil;
    }
    JWNodeList * r;
    //旧的头指针 是新的尾指针
    head->next = NULL;
    
    while (q) {
        r = q->next;
        q->next = p;
        p = q;
        q = r;
    }
    //最后q必然指向NULL，所以返回了p作为新的头指针  
    head = p;
    return head;
}
/**
 *  递归方式逆转一个链表
 思路：现在需要把A->B->C->D进行反转，
 可以先假设B->C->D已经反转好，已经成为了D->C->B,那么接下来要做的事情就是将D->C->B看成一个整体，让这个整体的next指向A，所以问题转化了反转B->C->D。那么，
 可以先假设C->D已经反转好，已经成为了D->C,那么接下来要做的事情就是将D->C看成一个整体，让这个整体的next指向B，所以问题转化了反转C->D。那么，
 可以先假设D(其实是D->NULL)已经反转好，已经成为了D(其实是head->D),那么接下来要做的事情就是将D(其实是head->D)看成一个整体，让这个整体的next指向C，所以问题转化了反转D。
 */
- (JWNodeList *)reveriseNodeList3 {
    JWNodeList * head = self;
    JWNodeList * curr;
    JWNodeList * headNext;
    if (!head) {
        return nil;
    }
    if (!head->next) {
        return head;
    }else {
        curr = head;
        headNext = head->next;
        head = [headNext reveriseNodeList3];
        headNext->next = curr;
        curr->next = nil;
    }
    return head;
}
/*
 设两个初始化指向头结点的指针p, q.p每次前进两个结点, q每次前进一个结点, 这样当p到达链表尾巴的时候, q到达了中间。
 */
- (void)middleNode {
    JWNodeList * p = self;
    JWNodeList * q = self;
    while (p && p->next) {
        p = p->next;
        p = p->next;
        q = q->next;
    }
    NSLog(@"中间节点%@",q->data);
}
/*
 快慢指针
 设两个初始化指向头结点的指针p, q.p每次前进两个结点, q每次前进一个结点,如果存在环 p、q一定会在环中相遇
 查找相遇点：  找到环之后，slow == head，slow fast 继续已1步的距离走，相遇的点就是环的节点
 */
- (void)checkCircle {
    JWNodeList * fast = self;
    JWNodeList * slow = self;
    while (fast && fast->next) {
        fast = fast->next;
        fast = fast->next;
        slow = slow->next;
        if (fast == slow) {
            NSLog(@"存在环");
            break;
        }
    }
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
- (int)getListLengh {
    int count = 0;
    JWNodeList * p = self;
    while (p) {
        count++;
        p = p->next;
    }
    NSLog(@"链表长度%d",count);
    return count;
}
#pragma mark -  获取节点
- (void)getNodeIndex:(JWNodeList *)node {
    
}


@end

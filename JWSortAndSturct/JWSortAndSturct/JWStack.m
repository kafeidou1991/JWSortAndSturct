//
//  JWStack.m
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/3/4.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import "JWStack.h"
#import <os/lock.h>
#define MAXSIZE 40
/*
 1. 栈是限定仅在表尾进行插入 删除
 把允许操作的一端叫栈顶、栈底 后进先出 LIFO
 */
@interface JWStack ()
//数据
@property (nonatomic, strong) NSMutableArray *data;
//栈顶索引 空栈=-1 && <MAXSIZE
@property (nonatomic, assign) int top;

@property (nonatomic, assign) os_unfair_lock lock ;

@end


@implementation JWStack

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.data = [NSMutableArray arrayWithCapacity:0];
        self.top = -1;
        self.lock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}
//压栈
- (void)pushElem:(NSNumber *)elem {
    if (self.top == MAXSIZE - 1) {
        NSLog(@"栈已经满了");
        return;
    }
    if (!elem) {
        NSLog(@"元素不存在");
        return;
    }
    os_unfair_lock_lock(&_lock);
    self.top ++;
    self.data[self.top] = elem;
    NSLog(@"插入元素：%@成功",elem);
    os_unfair_lock_unlock(&_lock);
}
//出栈
- (void)pop {
    if (self.top == -1) {
        NSLog(@"空栈");
        return;
    }
    os_unfair_lock_lock(&_lock);
    NSNumber * topElem = self.data[self.top];
    self.top --;
    [self.data removeLastObject];
    NSLog(@"删除元素：%@成功",topElem);
    os_unfair_lock_unlock(&_lock);
}





@end

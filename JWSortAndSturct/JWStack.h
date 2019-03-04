//
//  JWStack.h
//  JWSortAndSturct
//
//  Created by 张竟巍 on 2019/3/4.
//  Copyright © 2019 张竟巍. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JWStack : NSObject


/**
 添加入栈

 @param elem <#elem description#>
 */
- (void)pushElem:(NSNumber *)elem;


/**
 出栈
 */
- (void)pop;


@end

NS_ASSUME_NONNULL_END

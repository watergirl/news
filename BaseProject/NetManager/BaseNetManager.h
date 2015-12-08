//
//  BaseNetManager.h
//  BaseProject
//
//  Created by jiyingxin on 15/10/21.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>
//用户自定义的宏,习惯头部加 K
#define kCompletionHandle completionHandle:(void(^)(id responseObj,NSError *error))completionHandle
@interface BaseNetManager : NSObject

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params kCompletionHandle;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params kCompletionHandle;

@end

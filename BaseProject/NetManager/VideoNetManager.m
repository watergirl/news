//
//  VideoNetManager.m
//  BaseProject
//
//  Created by ios－23 on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoNetManager.h"

@implementation VideoNetManager

+(id)getVideoWithIndex:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle{
    
    NSString *path = [NSString stringWithFormat:@"http://c.m.163.com/nc/video/home/%ld-10.html",index];
    return [self GET:path parameters:nil completionHandle:^(id responseObj, NSError *error) {
        
        completionHandle([VideoModel objectWithKeyValues:responseObj],error);
        
    }];
}

@end

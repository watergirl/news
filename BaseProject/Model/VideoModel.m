//
//  VideoModel.m
//  BaseProject
//
//  Created by ios－23 on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel

//第一两个数组元素对应的解析类
+(NSDictionary *)objectClassInArray{
    return @{
             @"videoList":[VideoVideoListModel class],
             @"videoSidList":[VideoVideoSidListModel class]
             
             
             };
}

@end

@implementation VideoVideoListModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{
             @"desc":@"description",
             @"m3u8HdUrl":@"m3u8Hd_url",
             @"m3u8Url":@"m3u8_url",
             @"mp4Url":@"mp4_url",
             @"mp4HdUrl":@"mp4Hd_url"
             
             };
}
//快捷的把 M3u8 _ m3u8Url
//loveyou ->love_You
//下方代码需要服务人员代码规范十分严谨
//命名:单词小写,以_间隔
//+(NSString *)replacedKeyFromPropertyName121:(NSString *)propertyName{
//    
//    return [propertyName underlineFromCamel];
//    
//}

@end



@implementation VideoVideoSidListModel



@end
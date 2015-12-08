//
//  VideoViewModel.h
//  BaseProject
//
//  Created by ios－23 on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoNetManager.h"


@interface VideoViewModel : BaseViewModel

@property (nonatomic,assign)NSInteger rowNumber;
@property (nonatomic,assign)NSInteger index;

-(NSString *)titleForRow:(NSInteger)row;
-(NSString *)descForRow:(NSInteger)row;
-(NSURL *)iconURLForRow:(NSInteger)row;
-(NSURL *)videoURLForRow:(NSInteger)row;




@end

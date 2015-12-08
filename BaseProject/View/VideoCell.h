//
//  VideoCell.h
//  BaseProject
//
//  Created by ios－23 on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLable;

@property (weak, nonatomic) IBOutlet UILabel *descLable;
@property (weak, nonatomic) IBOutlet UIButton *iconBtn;

@property (nonatomic,strong)NSURL *videoURL;

@end

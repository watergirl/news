//
//  VideoCell.m
//  BaseProject
//
//  Created by ios－23 on 15/10/27.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoCell.h"
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>
@implementation VideoCell

//为了保证只有一个播放器使用单力模式

+(AVPlayerViewController *)sharedInstance{
    static AVPlayerViewController *vc = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        vc = [AVPlayerViewController new];
    });
    return vc;
    
}


//按钮点击
- (IBAction)play:(id)sender {
    
    
    
    AVPlayer *player = [AVPlayer playerWithURL:self.videoURL];
    [player play];
    [VideoCell sharedInstance].player = player;
    [sender addSubview:[VideoCell sharedInstance].view];
   
    [[VideoCell sharedInstance].view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    
}

//如果cell被复用
-(void)prepareForReuse{
    [super prepareForReuse];
    
    
    //判断是否有播放,如果有删除
    
    [[VideoCell sharedInstance].view removeFromSuperview];
    [VideoCell sharedInstance].player = nil;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

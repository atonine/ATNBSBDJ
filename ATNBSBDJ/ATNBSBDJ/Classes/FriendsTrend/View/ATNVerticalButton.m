//
//  ATNVerticalButton.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/7/16.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNVerticalButton.h"

@implementation ATNVerticalButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self =[super initWithFrame:frame]) {
        [self setup];
        
    }
    return self;
}

-(void)setup{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    
}

-(void)awakeFromNib{
    [self setup];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    //调整图片
    self.imageView.x = 0;
    self.imageView.y = 0;
    self.imageView.width = self.width;
    self.imageView.height = self.imageView.height;
    
    //调整文字
    self.titleLabel.x = 0;
    self.titleLabel.y = self.imageView.height;
    self.titleLabel.width = self.width;
    self.titleLabel.height = self.height - self.titleLabel.y;
    
}

@end

//
//  ATNTabBar.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/6/29.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNTabBar.h"


@interface ATNTabBar ()
@property(strong,nonatomic)UIButton*publishBtn;
@end

@implementation ATNTabBar



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIButton*pblsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [pblsButton setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [pblsButton setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
      //  [pblsButton addTarget:self action:@selector(clicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:pblsButton];
       
        
        self.publishBtn = pblsButton;
        
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
//    self.publishBtn.bounds = CGRectMake(0, 0, self.publishBtn.currentImage.size.width, self.publishBtn.currentImage.size.height);
    [self.publishBtn sizeToFit];
    self.publishBtn.center = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
    
    
    CGFloat buttonY = 0;
    CGFloat buttonW = self.frame.size.width/5;
    CGFloat buttonH = self.frame.size.height;
    NSInteger index= 0;
    
    for (UIView*button in self.subviews) {
        if (![button isKindOfClass:[UIControl class]]||button==self.publishBtn) continue;
        
        
        CGFloat buttonX = buttonW*((index>1)?(index+1):index);
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        index++;
    }
    
}
@end

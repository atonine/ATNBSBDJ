//
//  ATNPublishGuide.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/7/17.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNPublishGuide.h"

@implementation ATNPublishGuide


+(void)show{
    NSString*key = @"CFBundleShortVersionString";
    //获取当前版本号
    NSString*curentVersion = [NSBundle mainBundle].infoDictionary[key];
    NSString*sandboxVersion = [[NSUserDefaults standardUserDefaults]stringForKey:key];
    
    if (![curentVersion isEqualToString:sandboxVersion]) {
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        ATNPublishGuide*gv = [ATNPublishGuide guideView];
        gv.frame = window.bounds;
        
        [window addSubview:gv];
        
        
        
        [[NSUserDefaults standardUserDefaults]setObject:curentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
    }
}
+(instancetype)guideView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
- (IBAction)close {
    [self removeFromSuperview];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

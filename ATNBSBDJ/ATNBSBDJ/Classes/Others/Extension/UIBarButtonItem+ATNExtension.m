//
//  UIBarButtonItem+ATNExtension.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/6/30.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "UIBarButtonItem+ATNExtension.h"

@implementation UIBarButtonItem (ATNExtension)

+(instancetype)itemWithImageName:(NSString *)imageName highlightImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action{
  //  UIBarButtonItem*item =[[UIBarButtonItem alloc]init];
    UIButton*btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    return [[self alloc]initWithCustomView:btn];
   
    
}
@end

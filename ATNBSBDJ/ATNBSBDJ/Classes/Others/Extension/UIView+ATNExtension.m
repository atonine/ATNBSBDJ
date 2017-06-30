//
//  UIView+ATNExtension.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/6/30.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "UIView+ATNExtension.h"

@implementation UIView (ATNExtension)

-(CGFloat )x{
    return self.bounds.origin.x;
}

-(CGFloat  )y{
    return self.frame.origin.y;
}
-(CGFloat)width{
    return self.frame.size.width;
}
-(CGFloat)height{
    return self.frame.size.height;
}

-(void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
    
}
-(void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
-(void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
-(void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
@end

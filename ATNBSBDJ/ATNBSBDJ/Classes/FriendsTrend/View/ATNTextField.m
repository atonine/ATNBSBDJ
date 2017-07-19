//
//  ATNTextField.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/7/16.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNTextField.h"

static NSString * const ATNPlacerholderColorKeyPath = @"_placeholderLabel.textColor";

@implementation ATNTextField


-(void)awakeFromNib{
    self.tintColor = self.textColor;
    [self resignFirstResponder];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(BOOL)becomeFirstResponder{
    [self setValue:self.textColor forKeyPath:ATNPlacerholderColorKeyPath];
    return [super becomeFirstResponder];
}
-(BOOL)resignFirstResponder{
    [self setValue:[UIColor grayColor] forKeyPath:ATNPlacerholderColorKeyPath];
    return [super resignFirstResponder];
}
@end

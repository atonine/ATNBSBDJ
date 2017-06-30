//
//  UIBarButtonItem+ATNExtension.h
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/6/30.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ATNExtension)

+(instancetype)itemWithImageName:(NSString*)imageName highlightImageName:(NSString*)highlightedImageName target:(id)target action:(SEL)action;

@end

//
//  ATNCategory.h
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/7/1.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATNCategory : NSObject


@property(assign,nonatomic)NSInteger id;
@property(strong,nonatomic)NSString*name;
@property(assign,nonatomic)NSInteger count;
@property(strong,nonatomic)NSMutableArray*users;

@property(assign,nonatomic)NSInteger total;

@property(assign,nonatomic)NSInteger currentPage;
@end

//
//  ATNCategory.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/7/1.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNCategory.h"

@implementation ATNCategory
-(NSMutableArray *)users{
    if (!_users) {
        _users = [NSMutableArray array];
    }
    return _users;
}

@end

//
//  ATNRecommendUserCell.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/7/2.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNRecommendUserCell.h"
#import <UIImageView+WebCache.h>

#import "ATNRecommendUser.h"
@interface ATNRecommendUserCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userHeaderImage;
@property (weak, nonatomic) IBOutlet UILabel *screenName;

@property (weak, nonatomic) IBOutlet UILabel *fansCount;

@end

@implementation ATNRecommendUserCell

-(void)setUser:(ATNRecommendUser *)user{
    _user = user;
    [self.userHeaderImage sd_setImageWithURL:[NSURL URLWithString:user.header] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"] ];
    self.screenName.text = user.screen_name;
    self.fansCount.text = user.fans_count;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

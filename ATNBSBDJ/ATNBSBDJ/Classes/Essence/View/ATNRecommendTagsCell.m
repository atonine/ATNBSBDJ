//
//  ATNRecommendTagsCell.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/7/6.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNRecommendTagsCell.h"
#import <UIImageView+WebCache.h>
#import "ATNRecommendTag.h"
@interface ATNRecommendTagsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageListImageView;
@property (weak, nonatomic) IBOutlet UILabel *themNameLabel;

@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;

@end


@implementation ATNRecommendTagsCell


-(void)setRecTag:(ATNRecommendTag *)recTag{
    _recTag = recTag;
    
    [self.imageListImageView sd_setImageWithURL:[NSURL URLWithString:recTag.image_list]placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.themNameLabel.text = recTag.theme_name;
    NSString*subnumber = nil;
    if (recTag.sub_number<10000) {
        subnumber = [NSString stringWithFormat:@"%zd订阅",recTag.sub_number];
    }else{
        subnumber = [NSString stringWithFormat:@"%.1f万人订阅",recTag.sub_number/10000.0];
        
    }
    self.subNumberLabel.text =  subnumber;
//    ATNLog(@"%@",recTag.image_list);
    
}
- (void)awakeFromNib {
   
    [super awakeFromNib];
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setFrame:(CGRect)frame{
    frame.origin.x = 5;
    frame.size.width-=2*frame.origin.x;
    frame.size.height-=1;
    [super setFrame:frame];
    
}

@end

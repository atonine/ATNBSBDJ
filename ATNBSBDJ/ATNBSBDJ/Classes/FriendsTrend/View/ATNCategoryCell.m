//
//  ATNCategoryCell.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/7/1.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNCategoryCell.h"
#import "ATNCategory.h"

@interface ATNCategoryCell ()

@property (weak, nonatomic) IBOutlet UIView *selectedIndicator;


@end
@implementation ATNCategoryCell



- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.backgroundColor  = ATNGloableBG;
    self.selectedIndicator.backgroundColor = ATNColor(219, 21, 26);
    ATNLogFunc;
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.textLabel.y = 2;
    self.textLabel.height = self.contentView.height - 2*self.textLabel.y;
}

-(void)setCat:(ATNCategory *)cat{
    _cat = cat;
    [self.textLabel setFont:[UIFont systemFontOfSize:12]];
    self.textLabel.text = cat.name;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectedIndicator.hidden = !selected;
    self.textLabel.textColor = selected?self.selectedIndicator.backgroundColor:ATNColor(78, 78, 78);
    // Configure the view for the selected state
}

@end

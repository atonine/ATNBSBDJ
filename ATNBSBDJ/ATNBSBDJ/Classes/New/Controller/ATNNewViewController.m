//
//  ATNNewViewController.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/6/30.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNNewViewController.h"

@interface ATNNewViewController ()

@end

@implementation ATNNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:223/255.0];
    self.navigationItem.title = @"新帖";
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"MainTagSubIcon" highlightImageName:@"MainTagSubIconClick" target:self action:@selector(newClicked)];
    // Do any additional setup after loading the view.
}
-(void)newClicked{
    ATNLogFunc;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

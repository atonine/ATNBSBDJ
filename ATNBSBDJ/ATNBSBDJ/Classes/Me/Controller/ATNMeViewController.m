//
//  ATNMeViewController.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/6/30.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNMeViewController.h"

@interface ATNMeViewController ()

@end

@implementation ATNMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:223/255.0];
    self.navigationItem.title = @"我的";
    UIBarButtonItem*settingItem = [UIBarButtonItem itemWithImageName:@"mine-setting-icon" highlightImageName:@"mine-setting-icon-click" target:self action:@selector(meSettingClick)];
    UIBarButtonItem*moonItem = [UIBarButtonItem itemWithImageName:@"mine-moon-icon" highlightImageName:@"mine-moon-icon-click" target:self action:@selector(meMoonClick)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,moonItem];
    // Do any additional setup after loading the view.
}
-(void)meSettingClick{
    ATNLogFunc;
}
-(void)meMoonClick{
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

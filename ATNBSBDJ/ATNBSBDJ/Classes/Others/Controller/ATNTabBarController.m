//
//  ATNTabBarController.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/6/29.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNTabBarController.h"
#import "ATNTabBar.h"
#import "ATNEssenceViewController.h"
#import "ATNNewViewController.h"
#import "ATNFriendTrendsViewController.h"
#import "ATNMeViewController.h"
#import "ATNNavigationController.h"

@interface ATNTabBarController ()

@end

@implementation ATNTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [UINavigationBar appearance];
    NSMutableDictionary*normalAttr = [NSMutableDictionary dictionary];
    normalAttr[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    normalAttr[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary*selectedAttr = [NSMutableDictionary dictionary];
    normalAttr[NSFontAttributeName]=[UIFont systemFontOfSize:12];
    normalAttr[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    
    UIBarItem*item = [UITabBarItem appearance];
    [item setTitleTextAttributes:normalAttr forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectedAttr forState:UIControlStateSelected];
    
    [self setupVC:[[ATNEssenceViewController alloc]init] normalImageName:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon" titleName:@"精华"];
    [self setupVC:[[ATNNewViewController alloc]init] normalImageName:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon" titleName:@"新帖"];
    [self setupVC:[[ATNFriendTrendsViewController alloc]init] normalImageName:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon" titleName:@"关注"];
    [self setupVC:[[ATNMeViewController alloc]init] normalImageName:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon" titleName:@"我的"];
    
    [self setValue:[[ATNTabBar alloc]init] forKeyPath:@"tabBar"];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
-(void)setupVC:(UIViewController*)vc normalImageName:(NSString*)normalImageName selectedImage:(NSString*)selectImageName titleName:(NSString*)title{
    vc.tabBarItem.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:normalImageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectImageName];
  //  vc.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(100)/100.0 green:arc4random_uniform(100)/100.0 blue:arc4random_uniform(100)/100.0 alpha:1.0];
    ATNNavigationController*nvc = [[ATNNavigationController alloc]init];
    [nvc addChildViewController:vc];
    [self addChildViewController:nvc];

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

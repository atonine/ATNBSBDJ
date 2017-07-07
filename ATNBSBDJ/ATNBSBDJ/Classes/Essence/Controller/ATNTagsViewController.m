//
//  ATNTagsViewController.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/7/6.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNTagsViewController.h"
#import <MJExtension.h>
#import "ATNRecommendTagsCell.h"
#import "ATNRecommendTag.h"
#import <SVProgressHUD.h>
#import <AFNetworking.h>

@interface ATNTagsViewController ()


@property(copy,nonatomic)NSArray*tags;

@end

static NSString * const XMGTagsId = @"tag";

@implementation ATNTagsViewController
-(void)loadTags{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    NSMutableDictionary*params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    
    [[AFHTTPSessionManager manager] GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.tags = [ATNRecommendTag mj_objectArrayWithKeyValuesArray:responseObject];
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
    }];
}
-(void)setupTableView{
    self.title = @"推荐标签";
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([ATNRecommendTagsCell class]) bundle:nil] forCellReuseIdentifier:XMGTagsId];
    self.tableView.rowHeight = 70;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = ATNGloableBG;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupTableView];
    [self loadTags];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
#pragma mark -TableView data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tags.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ATNRecommendTagsCell*cell = [tableView dequeueReusableCellWithIdentifier:XMGTagsId];
    cell.recTag = self.tags[indexPath.row];
    return cell;
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

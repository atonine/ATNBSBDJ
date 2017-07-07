//
//  ATNRecommendController.m
//  ATNBSBDJ
//
//  Created by 于洪志 on 2017/7/1.
//  Copyright © 2017年 于洪志. All rights reserved.
//

#import "ATNRecommendController.h"
#import "AFNetworking.h"
#import "SVProgressHUD.h"
#import "ATNCategory.h"
#import <MJExtension.h>
#import "ATNCategoryCell.h"
#import "ATNRecommendUserCell.h"
#import "ATNRecommendUser.h"
#import <MJRefresh.h>


#define ATNSelectedCategory  self.categoryArr[self.categoryTableView.indexPathForSelectedRow.row]

@interface ATNRecommendController ()<UITableViewDelegate,UITableViewDataSource>

@property(copy,nonatomic)NSArray*categoryArr;
@property(copy,nonatomic)NSArray*userArr;
@property (weak, nonatomic) IBOutlet UITableView *categoryTableView;
@property (weak, nonatomic) IBOutlet UITableView *recmdUserTable;

@property(strong,nonatomic)NSMutableDictionary*params;


@property(strong,nonatomic)AFHTTPSessionManager*manager;


@end

static NSString *categoryId=@"cate";
static NSString *userId = @"user";


@implementation ATNRecommendController

-(AFHTTPSessionManager *)manager{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"推荐关注";
    
    
    self.view.backgroundColor = ATNGloableBG;
    
   
    [self setTableView];
    
    [self setupRefresh];
    
   
    [self loadData];
    
    // Do any additional setup after loading the view from its nib.
}
-(void)setTableView{
    [self.categoryTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ATNCategoryCell class]) bundle:nil] forCellReuseIdentifier:categoryId];
    
    
    
    
    [self.recmdUserTable registerNib:[UINib nibWithNibName:NSStringFromClass([ATNRecommendUserCell class]) bundle:nil] forCellReuseIdentifier:userId];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.categoryTableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.recmdUserTable.contentInset = self.categoryTableView.contentInset;
    self.recmdUserTable.rowHeight = 72;
}
-(void)loadData{
    [SVProgressHUD showWithStatus:@"正在加载"];
    
    NSMutableDictionary*params = [NSMutableDictionary dictionary];
    params[@"a"] =@"category";
    
    params[@"c"] =@"subscribe";
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [SVProgressHUD showSuccessWithStatus:@"加载成功"];
        
        //    ATNLog(@"%@",responseObject);
        self.categoryArr = [ATNCategory mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.categoryTableView reloadData];
        [self.categoryTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]animated:NO scrollPosition:UITableViewScrollPositionTop];
        [self.recmdUserTable.mj_header beginRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"加载信息失败"];
    }];
}
#pragma mark-建立刷新组件
-(void)setupRefresh
{
    self.recmdUserTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewUsers)];
    self.recmdUserTable.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreUsers)];
}
/**
 *加载用户新数据
 */
-(void)loadNewUsers{
    ATNCategory*c = ATNSelectedCategory;
    NSMutableDictionary*params = [NSMutableDictionary dictionary];
    c.currentPage = 1;
    
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] =  @(c.id);
    params[@"page"] = @(c.currentPage);
    self.params = params;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray*arr = [ATNRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [c.users removeAllObjects];
        [c.users addObjectsFromArray:arr];
        
        c.total = [responseObject[@"total"] integerValue];
        if (self.params!=params)
            return ;
        [self.recmdUserTable reloadData];
        
        [self.recmdUserTable.mj_header endRefreshing];
        [self checkFooterState];
        ATNLog(@"%@",self.userArr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) {
            return ;
        }
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        
        [self.recmdUserTable.mj_header endRefreshing];
    }];
    
}
-(void)loadMoreUsers{
    ATNCategory*c = ATNSelectedCategory;
    NSMutableDictionary*params = [NSMutableDictionary dictionary];
   // c.currentPage = 1;
    
    params[@"a"] = @"list";
    params[@"c"] = @"subscribe";
    params[@"category_id"] =  @(c.id);
    params[@"page"] = @(++c.currentPage);
    self.params = params;
    [self.manager GET:@"http://api.budejie.com/api/api_open.php" parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSArray*arr = [ATNRecommendUser mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
    //      [c.users removeAllObjects];
        [c.users addObjectsFromArray:arr];
        
        c.total = [responseObject[@"total"] integerValue];
        if (self.params!=params)
            return ;
        [self.recmdUserTable reloadData];
        
        [self.recmdUserTable.mj_header endRefreshing];
        [self checkFooterState];
        ATNLog(@"%@",self.userArr);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (self.params != params) {
            return ;
        }
        [SVProgressHUD showErrorWithStatus:@"加载失败"];
        
        [self.recmdUserTable.mj_header endRefreshing];
    }];
}

/**
 *时刻检测footer状态
 */
-(void)checkFooterState
{
    ATNCategory*c = ATNSelectedCategory;
    self.recmdUserTable.mj_footer.hidden=(c.users.count==0);
    if (c.users.count == c.total) {
        [self.recmdUserTable.mj_footer endRefreshingWithNoMoreData];
        
    }else{
        [self.recmdUserTable.mj_footer endRefreshing];
    }
}
-(void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    
}

#pragma mark - <UITableViewDelegate>

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView==self.categoryTableView) {
        return self.categoryArr.count;
    }else{
        [self checkFooterState];
        ATNCategory*c = self.categoryArr[self.categoryTableView.indexPathForSelectedRow.row];
        return c.users.count;
    }
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView==self.categoryTableView) {
        ATNCategoryCell*cell = [tableView dequeueReusableCellWithIdentifier:categoryId];
        cell.cat = self.categoryArr[indexPath.row];
 //       ATNLog(@"%@",self.categoryArr[indexPath.row]);
        return cell;
    }else{
        ATNRecommendUserCell*cell = [tableView dequeueReusableCellWithIdentifier:userId];
     //   ATNCategory*c = self.categoryArr[self.categoryTableView.indexPathForSelectedRow.row];
        ATNCategory*c = ATNSelectedCategory;
        cell.user = c.users[indexPath.row];
   //     ATNLog(@"%@",self.userArr[indexPath.row]);
        return cell;
    }
    
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  //   [self.recmdUserTable.mj_header endRefreshing];
  //  [self.recmdUserTable.mj_footer endRefreshing];
    
    ATNCategory*c = self.categoryArr[indexPath.row];
    
    if (c.users.count) {
        [self.recmdUserTable reloadData];
    }else{
        [self.recmdUserTable reloadData];
        
        [self.recmdUserTable.mj_header beginRefreshing];
    }
    
}
-(void)dealloc{
    [self.manager.operationQueue cancelAllOperations];
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

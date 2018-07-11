//
//  ViewController.m
//  ZYPreLoadingView
//
//  Created by chenzhengying on 2018/7/10.
//  Copyright © 2018年 canzoho. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@interface Person : NSObject

@property (nonatomic, copy) NSString *avator;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *detail;
@end


@implementation Person


@end


@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *datas;

@property (nonatomic, assign) BOOL previewing;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) NSInteger animationType;


@end

@implementation ViewController

- (NSMutableArray *)datas
{
    if (!_datas) {
        
        NSMutableArray *datas = [NSMutableArray array];
        
        self.datas = datas;
    }

    return _datas;
}

- (void)reloadAgain
{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"" message:@"类型" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"ZYChildPreViewAnimationTypeOpacity" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        self.animationType = 1;
        
        [self loadAgain];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"ZYChildPreViewAnimationTypeHor" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        self.animationType = 2;
        
        [self loadAgain];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"ZYChildPreViewAnimationTypeVer" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        self.animationType = 3;
        
        [self loadAgain];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertVc addAction:action1];
    [alertVc addAction:action2];
    [alertVc addAction:action3];
    [alertVc addAction:cancel];
    
    [self presentViewController:alertVc animated:YES completion:nil];
}

- (void)loadAgain
{
    if (self.previewing == YES) {
        
        return;
    }
    
    self.previewing = YES;
    
    [self.tableView reloadData];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [self.datas removeAllObjects];
        
        for (NSInteger i=0; i<50; i++) {
            
            Person *p = [Person new];
            p.name = [NSString stringWithFormat:@"name- %ld", i];
            p.detail = [NSString stringWithFormat:@"detial -%ld", i];
            
            [self.datas addObject:p];
        }
        
        self.previewing = NO;
        
        [self.tableView reloadData];
    });
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"重新加载" style:UIBarButtonItemStylePlain target:self action:@selector(reloadAgain)];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.animationType = 1;
    [self loadAgain];
    
    [self.tableView registerClass:[TableViewCell class] forCellReuseIdentifier:NSStringFromClass([TableViewCell class])];
}

#pragma mark - <UITableViewDelegate, UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.previewing) {
        
        return 10;
    }
    
    return self.datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
    
    if (cell == nil) {
        
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([TableViewCell class])];
    }
    
    cell.animationType = self.animationType;
    
    if (!self.previewing) {
        
        cell.lab2.text = [self.datas[indexPath.row] name];
        cell.lab3.text = [self.datas[indexPath.row] detail];
    }
    
    return cell;
}

#pragma mark - 控制是否显示预加载层
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *tableViewCell = (TableViewCell *)cell;
    
    tableViewCell.isPreview = self.previewing;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}

@end

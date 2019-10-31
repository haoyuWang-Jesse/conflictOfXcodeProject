//
//  ViewController.m
//  testtttt
//
//  Created by 王浩宇 on 2019/7/2.
//  Copyright © 2019 王浩宇. All rights reserved.
//

#import "ViewController.h"
#import "HYTableViewCell.h"

#define MyCellID @"aaabbbccc"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic ,strong) UITableView *tableView;

@property(nonatomic,strong) NSArray*tableDataArray;
@property (nonatomic, assign) BOOL isroated;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor= [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 859, 404)
                                                  style:UITableViewStylePlain];
    self.tableDataArray= @[[UIColor redColor], [UIColor yellowColor],[UIColor yellowColor],[UIColor yellowColor],[UIColor yellowColor],[UIColor yellowColor],[UIColor yellowColor],[UIColor yellowColor],[UIColor yellowColor], [UIColor blueColor]];
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.scrollsToTop=NO;
    self.tableView.transform=CGAffineTransformMakeRotation(M_PI_2);
    self.tableView.showsVerticalScrollIndicator=NO;
    self.tableView.pagingEnabled=YES;
    self.tableView.bounces=NO;
    self.tableView.backgroundColor = [UIColor redColor];
    [self.tableView registerClass:[HYTableViewCell class] forCellReuseIdentifier:MyCellID];
    [self.view addSubview:self.tableView];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    self.tableView.center = self.view.center;
    
}

- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tableDataArray.count;
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath {
//    return tableView.frame.size.height;
//    return [UIScreen mainScreen].bounds.size.height;
    if(self.isroated) {
        return 414;
    }
    return [UIScreen mainScreen].bounds.size.height;
}

- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath{
    HYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyCellID];
    if (!cell) {
        cell = [[HYTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyCellID];
    }
    [(HYTableViewCell *)cell config];
//    if(self.isroated) {
        cell.contentView.transform=CGAffineTransformMakeRotation(-M_PI_2);
//    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"=========1111111%@",self.tableView);
        self.tableView.transform=CGAffineTransformMakeRotation(-M_PI_2);
        NSLog(@"=========%@",self.tableView);
        self.tableView.frame = CGRectMake(0, 0, 414, self.view.frame.size.height);
        NSLog(@"=========333333%@",self.tableView);
        [self.tableView reloadData];
        self.isroated = YES;
    });
    
}
    
   

@end

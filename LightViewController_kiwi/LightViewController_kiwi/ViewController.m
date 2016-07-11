//
//  ViewController.m
//  LightViewController_kiwi
//
//  Created by fenglin on 7/11/16.
//  Copyright © 2016 fenglin. All rights reserved.
//

#import "ViewController.h"
#import "ArrayDataSource.h"
#import "Store.h"
#import "PhotoCell.h"
#import "Photo.h"
#import "PhotoViewController.h"




static  NSString * identifier = @"identifier";

@interface ViewController ()<UITableViewDelegate>
@property (nonatomic, strong) Store *store;
@property (nonatomic, strong) ArrayDataSource *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.store = [Store store];
    
    self.dataSource = [[ArrayDataSource alloc] initWithItems:self.store.photos cellIdentifier:identifier configureCellBlock:^(PhotoCell *cell, Photo *photo) {
        [cell configureForModel:photo];
    }];
    
    self.tableView.delegate = self;
    
    self.tableView.dataSource = self.dataSource;
    
    self.tableView.rowHeight = 60;
    
    [self.tableView registerNib:[PhotoCell nib] forCellReuseIdentifier:identifier];
    
}


#pragma mark -- UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PhotoViewController *photoVC = [[PhotoViewController alloc] init];
    photoVC.photo = [self.dataSource itemAtIndexPath:indexPath];
    [self.navigationController pushViewController:photoVC animated:YES];
}

@end

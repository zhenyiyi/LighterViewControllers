//
//  ArrayDataSourceSpec.m
//  LightViewController_kiwi
//
//  Created by fenglin on 7/11/16.
//  Copyright 2016 fenglin. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "ArrayDataSource.h"


SPEC_BEGIN(ArrayDataSourceSpec)

describe(@"ArrayDataSource", ^{
    context(@"init", ^{
        it(@"should not be allowed to use 'init' or 'new' ", ^{
//            [[[[ArrayDataSource alloc] init] should] beNil];
            [[[ArrayDataSource new] should] beNil];
        });
    });
    
    context(@"Configuration", ^{
        
        __block UITableViewCell *configureCell = nil;
        __block id configureItem = nil;
        TableViewCellConfigureBlock configureBlock = ^(id cell, id item){
            configureCell = cell;
            configureItem = item;
        };
        
        ArrayDataSource *dataSource = [[ArrayDataSource alloc] initWithItems:@[@"A",@"B"] cellIdentifier:@"foo" configureCellBlock:configureBlock];
        
        id mockTableView = [UITableView mock];
        UITableViewCell *cell = [[UITableViewCell alloc] init];
        
        __block id result = nil;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        it(@"should receive cell request", ^{
            [[mockTableView should] receive:@selector(dequeueReusableCellWithIdentifier:forIndexPath:) andReturn:cell withArguments:@"foo",indexPath];
            result = [dataSource tableView:mockTableView cellForRowAtIndexPath:indexPath];
        });
        
        it(@"should return the same cell", ^{
            [[result should] equal:cell];
        });
        
        it(@"shoule have benn passed to the block", ^{
            [[configureCell should] equal:cell];
        });
        
        it(@"shoule have the same configure object", ^{
            [[configureItem should] equal:@"A"];
        });
        
    });
    
    context(@"numberOfRowsInSection", ^{
        id mockTableView = [UITableView mock];
        ArrayDataSource *dataSource = [[ArrayDataSource alloc] initWithItems:@[@"A",@"B"] cellIdentifier:@"foo" configureCellBlock:nil];
        it(@"should be have 2 items", ^{
            NSInteger count = [dataSource tableView:mockTableView numberOfRowsInSection:0];
            [[theValue(count) should] equal:@2];
        });
    });
});

SPEC_END

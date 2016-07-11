//
//  ViewControllerSpec.m
//  LightViewController_kiwi
//
//  Created by fenglin on 7/11/16.
//  Copyright 2016 fenglin. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "ViewController.h"
#import "PhotoViewController.h"
#import "Photo.h"


SPEC_BEGIN(ViewControllerSpec)

describe(@"ViewController", ^{
    context(@"when click a cell in tableView", ^{
        
        ViewController *viewControler = [[ViewController alloc] init];
        
        [[viewControler.view shouldNot] beNil];
        
        UINavigationController *mockNavController = [UINavigationController mock];
        
        [[viewControler should] stub:@selector(navigationController) andReturn:mockNavController];
        
        [[mockNavController should] receive:@selector(pushViewController:animated:)];
        
        KWCaptureSpy *spy = [mockNavController captureArgument:@selector(pushViewController:animated:) atIndex:0];
        [[viewControler should] tableView:[[viewControler should] tableView] didSelectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        
//        id obj = spy.argument;
//        
//        PhotoViewController *vc = obj;
//        
//        [[vc should] beKindOfClass:[PhotoViewController class]];
//        [[vc.photo shouldNot] beNil];
    });
    
});

SPEC_END

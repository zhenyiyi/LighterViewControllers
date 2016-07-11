//
//  PhotoViewController.m
//  LightViewController_kiwi
//
//  Created by fenglin on 7/11/16.
//  Copyright © 2016 fenglin. All rights reserved.
//

#import "PhotoViewController.h"
#import "Photo.h"


@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.photo.name;
    
    self.view.backgroundColor = [UIColor whiteColor];
}



@end

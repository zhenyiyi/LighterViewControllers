//
//  CellProtocol.h
//  LightViewController_kiwi
//
//  Created by fenglin on 7/11/16.
//  Copyright © 2016 fenglin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@protocol CellProtocol <NSObject>

@optional;

- (void)configureForModel:(id) model;

+ (UINib *)nib;

@end

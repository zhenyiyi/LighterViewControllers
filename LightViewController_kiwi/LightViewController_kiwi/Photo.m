//
//  Photo.m
//  LightViewController_kiwi
//
//  Created by fenglin on 7/11/16.
//  Copyright © 2016 fenglin. All rights reserved.
//

#import "Photo.h"
#import <MJExtension/MJExtension.h>
#import "User.h"


@implementation Photo


MJCodingImplementation;

- (NSString*)authorFullName
{
    return self.user.fullName;
}

- (double)adjustedRating
{
    double adjustedRating = (self.rating - 97) / 3.0;
    if (adjustedRating < 0) {
        adjustedRating = 0;
    }
    return adjustedRating;
}
@end

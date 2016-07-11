//
//  User.m
//  LightViewController_kiwi
//
//  Created by fenglin on 7/11/16.
//  Copyright © 2016 fenglin. All rights reserved.
//

#import "User.h"
#import <MJExtension/MJExtension.h>


@implementation User

MJCodingImplementation;

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSUInteger)numberOfPhotosTaken
{
    return self.photos.count;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"<%@: %p> (%lld) \"%@\"",[self class],self, self.identifier , self.username];
}
@end

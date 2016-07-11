//
//  User.h
//  LightViewController_kiwi
//
//  Created by fenglin on 7/11/16.
//  Copyright © 2016 fenglin. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface User : NSObject<NSCoding>



@property (nonatomic) int64_t identifier;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, copy) NSArray *photos;

- (NSString *)fullName;
- (NSUInteger)numberOfPhotosTaken;

@end

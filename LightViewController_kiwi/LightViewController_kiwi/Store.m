//
//  Store.m
//  LightViewController_kiwi
//
//  Created by fenglin on 7/11/16.
//  Copyright © 2016 fenglin. All rights reserved.
//

#import "Store.h"
#import "User.h"
#import "Photo.h"


@implementation Store


+(instancetype)store{
    return [[[self class] alloc] init];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self readingArchive];
    }
    return self;
}

- (void)readingArchive{
    NSURL *path = [[NSBundle mainBundle] URLForResource:@"photo-data" withExtension:@"bin"];
    NSData *data = [[NSData alloc] initWithContentsOfURL:path];
    NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    _users = [unArchiver decodeObjectOfClass:[NSArray class] forKey:@"users"];
    _photos = [unArchiver decodeObjectOfClass:[NSArray class] forKey:@"photos"];
    NSLog(@"obj: %@",unArchiver);
    [unArchiver finishDecoding];
}

-(NSArray *)sortedPhotos{
    return nil;
}
@end

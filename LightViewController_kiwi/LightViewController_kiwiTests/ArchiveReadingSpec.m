//
//  ArchiveReadingSpec.m
//  LightViewController_kiwi
//
//  Created by fenglin on 7/11/16.
//  Copyright 2016 fenglin. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "Store.h"
#import "User.h"
#import "Photo.h"



SPEC_BEGIN(ArchiveReadingSpec)

describe(@"ArchiveReading", ^{
    context(@"when store created", ^{
        Store *store = [[Store alloc] init];
        it(@"should not be nil", ^{
            [[store shouldNot] beNil];
            [[store.photos shouldNot] beNil];
            [[store.users shouldNot] beNil];
        });
    });
    
    context(@"the photos in store", ^{
        Store * store = [Store store];
        it(@"should have an id and user for each", ^{
            for(Photo *photo in store.photos){
                [[theValue(photo.identifier) shouldNot] equal:theValue(-1)];
                [[photo.user shouldNot] beNil];
            }
        });
        
        it(@"each photo should have its name", ^{
            NSUInteger count = [[store.photos filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(Photo *photo, NSDictionary *bindings) {
                return photo.name.length > 0;
            }]] count];
            [[theValue(count) should] equal:theValue(store.photos.count)];
        });
    });
    /**
     *  [0]	User *	0x7fb1f9669c80	0x00007fb1f9669c80
     NSObject	NSObject
     _identifier	int64_t	527106
     _username	NSTaggedPointerString *	@"wimdenijs"	0xa240462802c158c9
     _firstName	NSString *	nil	0x0000000000000000
     _lastName	NSString *	nil	0x0000000000000000
     _photos	__NSArrayI *	@"1 element"	0x00007fb1f9656950
     */
    context(@"the users in store", ^{
        Store * store = [Store store];
        it(@"should have id, username and at least photos , fullname or numberOfPhotosTaken cannot be nil", ^{
            for(User *user in store.users){
                [[theValue(user.identifier) shouldNot] equal:theValue(-1)];
                [[theValue(user.username) shouldNot] beNil];
                [[theValue(user.photos) shouldNot] beNil];
                [[theValue(user.fullName) shouldNot] beNil];
                [[theValue(user.numberOfPhotosTaken) shouldNot] beNil];
            }
        });
        
        it(@"should at least 1 haveing firstname ", ^{
            NSInteger count = [[store.users filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(User *user, NSDictionary *bindings){
                return user.firstName.length > 0;
            }]] count];
            [[theValue(count) should] beGreaterThan:theValue(0)];
        });
        
        it(@"should at least 1 having lastName", ^{
            NSInteger count = [[store.users filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(User *user, NSDictionary *bindings){
                return user.lastName.length > 0;
            }]] count];
            [[theValue(count) should] beGreaterThan:theValue(0)];
        });
        
        
    });
});

SPEC_END

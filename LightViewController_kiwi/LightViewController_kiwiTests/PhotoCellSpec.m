//
//  PhotoCellSpec.m
//  LightViewController_kiwi
//
//  Created by fenglin on 7/11/16.
//  Copyright 2016 fenglin. All rights reserved.
//

#import <Kiwi/Kiwi.h>
#import "PhotoCell.h"


SPEC_BEGIN(PhotoCellSpec)

describe(@"PhotoCell", ^{
    context(@"when nib loaded", ^{
        UINib *nib = [PhotoCell nib];
        it(@"should not be nil", ^{
            [[nib shouldNot] beNil];
        });
        
        NSArray *arr = [nib instantiateWithOwner:nib options:0];
        it(@"should contains one instance", ^{
            [[arr should] haveCountOf:1];
        });
        
        PhotoCell * cell = [arr lastObject];
        
        it(@"shoule be the class of PhotoCell", ^{
            [[cell should] beKindOfClass:[PhotoCell class]];
        });
        
        it(@"should have non nil label", ^{
            [[cell.photoDateLabel shouldNot] beNil];
            [[cell.photoTitleLabel shouldNot] beNil];
        });
        
    });
});

SPEC_END

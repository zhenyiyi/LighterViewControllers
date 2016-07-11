//
//  ArrayDataSource.h
//  objc.io example project (issue #1)
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


typedef void (^TableViewCellConfigureBlock)(id cell, id item);


@interface ArrayDataSource : NSObject <UITableViewDataSource>

- (id)init DEPRECATED_ATTRIBUTE;

- (id)initWithItems:(NSArray *)anItems
     cellIdentifier:(NSString *)aCellIdentifier
 configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock NS_DESIGNATED_INITIALIZER;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end

//
//  PhotoCell.h
//  objc.io example project (issue #1)
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CellProtocol.h"



@interface PhotoCell : UITableViewCell<CellProtocol>

@property (weak, nonatomic) IBOutlet UILabel *photoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *photoDateLabel;

@end

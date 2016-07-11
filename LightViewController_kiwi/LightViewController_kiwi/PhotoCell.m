//
//  PhotoCell.h
//  objc.io example project (issue #1)
//

#import "PhotoCell.h"
#import "Photo.h"


@implementation PhotoCell

+ (UINib *)nib
{
    return [UINib nibWithNibName:@"PhotoCell" bundle:nil];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    if (highlighted) {
        self.photoTitleLabel.shadowColor = [UIColor darkGrayColor];
        self.photoTitleLabel.shadowOffset = CGSizeMake(3, 3);
    } else {
        self.photoTitleLabel.shadowColor = nil;
    }
}

- (void)configureForModel:(id)model{
    Photo *photo = model;
    self.photoTitleLabel.text = photo.name;
    self.photoDateLabel.text = [[self dataFormatter] stringFromDate:photo.creationDate];
}

- (NSDateFormatter *)dataFormatter{
    static NSDateFormatter *dataFormatter;
    if (!dataFormatter) {
        dataFormatter = [[NSDateFormatter alloc] init];
        dataFormatter.timeStyle = kCFDateFormatterLongStyle;
        dataFormatter.dateStyle = kCFDateFormatterLongStyle;
    }
    return dataFormatter;
}


@end

//
//  DXTableViewCell.m
//  适配iOS11和iPhoneX
//
//  Created by Darren  xu on 2018/1/6.
//  Copyright © 2018年 Darren  xu. All rights reserved.
//

#import "DXTableViewCell.h"

@implementation DXTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
//        self.backgroundColor = RANDOM_COLOR;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

@end

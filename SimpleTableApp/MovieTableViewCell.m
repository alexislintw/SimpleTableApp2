//
//  MovieTableViewCell.m
//  SimpleTableApp
//
//  Created by Alexis Lin on 2017/7/19.
//  Copyright © 2017年 Goldrock Inc. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.labelRank.layer.cornerRadius = 25;
    self.labelRank.clipsToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

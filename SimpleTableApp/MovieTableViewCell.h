//
//  MovieTableViewCell.h
//  SimpleTableApp
//
//  Created by Alexis Lin on 2017/7/19.
//  Copyright © 2017年 Goldrock Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieTableViewCell : UITableViewCell

    @property(nonatomic,weak) IBOutlet UILabel *labelRank;
    @property(nonatomic,weak) IBOutlet UILabel *labelMovieName;
    @property(nonatomic,weak) IBOutlet UILabel *labelImdbScore;
    @property(nonatomic,weak) IBOutlet UIImageView *imageViewPoster;

@end

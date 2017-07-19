//
//  MovieListViewController.m
//  SimpleTableApp
//
//  Created by Alexis Lin on 2017/7/19.
//  Copyright © 2017年 Goldrock Inc. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieTableViewCell.h"


@interface MovieListViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation MovieListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -
#pragma UITableViewDataSource methods
    
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.labelRank.text = @"1";
    cell.labelMovieName.text = @"猩球崛起：終極決戰";
    cell.labelImdbScore.text = @"8.1";
    cell.imageViewPoster.image = [UIImage imageNamed:@"poster1.jpg"];
    
    return cell;
}
    
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
    
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"排行榜";
}

@end

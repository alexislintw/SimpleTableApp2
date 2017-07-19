//
//  MovieListViewController.m
//  SimpleTableApp
//
//  Created by Alexis Lin on 2017/7/19.
//  Copyright © 2017年 Goldrock Inc. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieTableViewCell.h"

@import FirebaseDatabase;


@interface MovieListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (strong, nonatomic) NSArray *data;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end


@implementation MovieListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

-(void)loadData
{
    self.ref = [[[FIRDatabase database] reference] child:@"movies"];
    [self.ref observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSLog(@"%@",snapshot.value);
        self.data = snapshot.value;
        [self.tableView reloadData];
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}


#pragma mark -
#pragma UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%lu",(unsigned long)[self.data count]);
    return [self.data count];
}
    
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
 
    NSDictionary *dic = [self.data objectAtIndex:indexPath.row];
    if (dic != (id)[NSNull null]) {
        cell.labelRank.text = [[dic objectForKey:@"rank"] stringValue];
        cell.labelMovieName.text = [dic objectForKey:@"movie_name"];
        cell.labelImdbScore.text = [[dic objectForKey:@"imdb_score"] stringValue];
    }
    
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

//
//  NewsListViewController.m
//  SimpleTableApp
//
//  Created by Alexis Lin on 2017/7/18.
//  Copyright © 2017年 Goldrock Inc. All rights reserved.
//

/*
 本程式：讀取檔案news.csv，並顯示在tableView上。(只有1個section)
 練習題：讀取檔案news2.plist，並顯示在tableView上。(以日期分成2個sections)
*/

#import "NewsListViewController.h"

@interface NewsListViewController () <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSArray *data;

@end

@implementation NewsListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.data = [self loadDataFromCsv];
}

-(NSArray*)loadDataFromCsv
{
    NSMutableArray *rows = [[NSMutableArray alloc] init];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"news" ofType:@"csv"];
    NSString *string = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *array = [[NSArray alloc] initWithArray:[string componentsSeparatedByString:@"\n"]];
    
    for(int i=0; i<[array count]; i++) {
        NSString *line = [array objectAtIndex:i];
        if (line.length > 0) {
            NSArray *row = [line componentsSeparatedByString:@","];
            [rows addObject:row];
        }
    }
    return rows;
}

-(NSArray*)getSectionTitlesFromPlist
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"news2" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *array = [dictionary allKeys];
    return array;
}

-(NSArray*)getNewsTitlesFromPlist
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"news2" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *array = [dictionary allValues];
    return array;
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    NSArray *row = [self.data objectAtIndex:indexPath.row];
    cell.textLabel.text = [row objectAtIndex:1];
    cell.detailTextLabel.text = [row objectAtIndex:2];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"title";
}
*/
    
@end

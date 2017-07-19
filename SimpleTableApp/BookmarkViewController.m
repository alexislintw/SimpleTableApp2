//
//  BookmarkViewController.m
//  SimpleTableApp
//
//  Created by Alexis Lin on 2017/7/18.
//  Copyright © 2017年 Goldrock Inc. All rights reserved.
//

/*
 本程式：以swipe方式刪除資料
 練習題：以button切換編輯模式
 */

#import "BookmarkViewController.h"

@interface BookmarkViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSMutableArray *arrBookmark;
@property (nonatomic,weak) IBOutlet UITableView *tableView;

@end

@implementation BookmarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _arrBookmark = [NSMutableArray arrayWithObjects:@"猩球崛起",@"蜘蛛人",@"名偵探柯南",@"神偷奶爸3",@"銀魂",@"盜速飛車", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrBookmark count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = [_arrBookmark objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark -
#pragma mark editing for cell

-(IBAction)pressEditingButton:(id)sender
{
    /*
    if (self.tableView.editing) {
        [self.navigationItem.rightBarButtonItem setTitle:@"刪除"];
        [self.tableView setEditing:NO animated:YES];
    }
    else {
        [self.navigationItem.rightBarButtonItem setTitle:@"完成"];
        [self.tableView setEditing:YES animated:YES];
    }
     */
}

/*
//設YES可用swipe方式進行刪除 (預設為YES)
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
*/

/*
//tableView.editing設為YES時，可設該cell左側的圖示 (預設為YES)
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCellEditingStyleDelete
    //UITableViewCellEditingStyleInsert
    //UITableViewCellEditingStyleNone
    
    return UITableViewCellEditingStyleDelete;
}
*/

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_arrBookmark removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    else {
        NSLog(@"Unhandled editing style! %ld", (long)editingStyle);
    }
}

@end

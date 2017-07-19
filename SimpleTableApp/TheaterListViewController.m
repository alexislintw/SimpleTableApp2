//
//  TheaterListViewController.m
//  SimpleTableApp
//
//  Created by Alexis Lin on 2017/7/18.
//  Copyright © 2017年 Goldrock Inc. All rights reserved.
//

/*
 本程式：在程式碼中直接指定戲院名稱和地址(textLabel)
 練習題：將戲院清單存在陣列中，指定陣列值給TtextLabel
 */

/*
 本程式：呈現1個section,1筆資料
 練習題：呈現2個sections,各3筆資料
 */

/*
 本程式：在Storyboard的inspector視窗中指定tableView和tableViewCell的屬性
 練習題：以程式碼指定ableView和tableViewCell的屬性
 */

/*
 本程式：以"cell"格式呈現戲院名稱和地址
 練習題：以"cell2"或"cell3"格式呈現戲院名稱和地址
*/

/*
 本程式：以storyboard的segue進行場景轉換(注意：參數傳遞方式)
 練習題：以手動方式(程式碼)進行場景轉換
 */


#import "TheaterListViewController.h"
#import "DetailViewController.h"


@interface TheaterListViewController () <UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,weak) IBOutlet UITableView *tableView;
@end

@implementation TheaterListViewController

static NSArray *arrTheaterNames = nil;
static NSArray *arrTheaterAddress = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    arrTheaterNames = @[@[@"信義威秀",@"國賓大戲院",@"真善美戲院"],
                        @[@"板橋大遠百威秀影城",@"國賓環球",@"鴻金寶影城"]];
    arrTheaterAddress = @[@[@"台北市信義區松壽路20號",
                            @"台北市萬華區成都路88號",
                            @"台北市萬華區漢中街116號"],
                          @[@"新北市板橋區新站路28號",
                            @"新北市中和區中山路三段122號",
                            @"新北市新莊區民安路188巷5號"]];
     */
}

#pragma mark -
#pragma UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = @"信義威秀";
    cell.detailTextLabel.text = @"台北市信義區松壽路20號";
    
    /*
    switch (indexPath.row) {
        case 0:
        cell.textLabel.text = @"信義威秀";
        cell.detailTextLabel.text = @"台北市信義區松壽路20號";
        break;
        
        case 1:
        cell.textLabel.text = @"國賓大戲院";
        cell.detailTextLabel.text = @"台北市萬華區成都路88號";
        break;
        
        case 2:
        cell.textLabel.text = @"真善美戲院";
        cell.detailTextLabel.text = @"台北市萬華區漢中街116號";
        break;
        
        default:
        break;
    }
    */
    
    /* 設定屬性
     cell.textLabel.textColor = [UIColor blueColor];
     cell.detailTextLabel.textColor = [UIColor grayColor];
     cell.textLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
     cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     */
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    //return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"戲院";
    /*
    switch (section) {
        case 0:
        return @"台北市";
        break;

        case 1:
        return @"新北市";
        break;
        
        default:
        break;
    }
    
    return nil;
    */
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Tapped accessory button");
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"did select row at indexPath:%ld,%ld",(long)indexPath.section,(long)indexPath.row);
    
    /*
    DetailViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"detail"];
    vc.sn = indexPath.row;
    vc.name = [[[tableView cellForRowAtIndexPath:indexPath] textLabel] text];
    [self.navigationController pushViewController:vc animated:YES];
    */
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{    
    DetailViewController *vc = [segue destinationViewController];
    //NSLog(@"%@",sender);
    
    UITableViewCell *cell = (UITableViewCell*)sender;
    vc.name = [[cell textLabel] text];
    vc.sn = [self.tableView indexPathForCell:cell].row;
}


@end

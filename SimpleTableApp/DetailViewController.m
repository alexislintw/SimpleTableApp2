//
//  DetailViewController.m
//  SimpleTableApp
//
//  Created by Alexis Lin on 2017/7/19.
//  Copyright © 2017年 Goldrock Inc. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property(nonatomic,weak) IBOutlet UILabel *labelSn;
@property(nonatomic,weak) IBOutlet UILabel *labelName;
    
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.labelSn setText:[NSString stringWithFormat:@"%ld",(long)self.sn]];
    [self.labelName setText:self.name];
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

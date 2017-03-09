//
//  ANUserViewController.m
//  AntNest
//
//  Created by 沈强 on 2017/3/8.
//  Copyright © 2017年 yuzhoulangzik@126.com. All rights reserved.
//

#import "ANUserViewController.h"
#import "AntQueen.h"

@interface ANUserViewController ()

@end

@implementation ANUserViewController

ANT_EXPORT_ANT();

+ (AntType)antType {
  return @"UserAnt";
}


+ (instancetype)createInstance:(id<AntDescriptionProtocol>)antDescription {
  ANUserViewController* user = [ANUserViewController new];
  user.tabBarItem.title = @"我";
  return user;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  self.tabBarItem.title = @"我";
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

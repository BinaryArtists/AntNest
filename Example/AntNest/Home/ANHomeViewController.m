//
//  ANHomeViewController.m
//  AntNest
//
//  Created by 沈强 on 2017/3/8.
//  Copyright © 2017年 yuzhoulangzik@126.com. All rights reserved.
//

#import "ANHomeViewController.h"
#import "AntChannel.h"
#import "ANAntDes.h"
#import "AntQueen.h"


@interface ANHomeViewController ()

@end

@implementation ANHomeViewController

ANT_EXPORT_ANT()

+ (AntType)antType {
  return @"HomeAnt";
}


+ (instancetype)createInstance:(id<AntDescriptionProtocol>)antDescription {
  return [ANHomeViewController new];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIViewController *order = [AntChannel antWith:[[ANAntDes alloc] initWith:@"OrderAnt"]];
  UIViewController *user = [AntChannel antWith:[[ANAntDes alloc] initWith:@"UserAnt"]];
  UINavigationController *orderNavigation = [[UINavigationController alloc] initWithRootViewController:order];
  orderNavigation.tabBarItem.title = order.tabBarItem.title;
  self.viewControllers = @[orderNavigation,user];
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

@end

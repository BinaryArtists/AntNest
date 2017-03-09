//
//  ANOrderViewController.m
//  AntNest
//
//  Created by 沈强 on 2017/3/8.
//  Copyright © 2017年 yuzhoulangzik@126.com. All rights reserved.
//

#import "ANOrderViewController.h"
#import "AntQueen.h"
#import "ANOrderAccounInfo.h"
#import "ANAntDes.h"
#import "UIView+AntNest.h"

@interface ANDetailOrder : NSObject<AntDescriptionProtocol>

@property(nonatomic, copy)AntType antType;

@property(nonatomic, strong) NSString *orderID;

@property(nonatomic, strong) NSString *customerName;

@property(nonatomic, strong) NSString *shopName;

@end

@implementation ANDetailOrder



@end

@interface ANOrderViewController ()

@end

@implementation ANOrderViewController

ANT_EXPORT_ANT()

+ (AntType)antType {
  return @"OrderAnt";
}


+ (instancetype)createInstance:(id<AntDescriptionProtocol>)antDescription {
  ANOrderViewController *order =  [ANOrderViewController new];
  order.title = @"订单";
  return order;
}


- (void)viewDidLoad {
  
  [super viewDidLoad];
  
  self.tabBarItem.title = @"订单";
  id<ANOrderAccounInfo> orderAccounInfo = [AntChannel antWith:[[ANAntDes alloc] initWith:@"AccountInfoAnt"]];
  NSLog(@"orderAccounInfo name %@ age %@",orderAccounInfo.userName,@(orderAccounInfo.age));
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
  button.backgroundColor = [UIColor greenColor];
  [button setTitle:@"detail" forState:UIControlStateNormal];
  button.frame = CGRectMake(0, 0, 100, 50);
  button.center = self.view.center;
  [button addTarget:self action:@selector(detail) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:button];
  
}

- (void)detail {
  
  ANDetailOrder *detailOrderDes = [ANDetailOrder new];
  detailOrderDes.antType = @"OrderDetailAnt";
  detailOrderDes.orderID = @"fdfdsfdsfds";
  detailOrderDes.customerName = @"carl shen";
  detailOrderDes.shopName = @"天朝";
  UIViewController *order = [AntChannel antWith:detailOrderDes];
  [self.view.an_navigationController pushViewController:order animated:YES];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}


@end

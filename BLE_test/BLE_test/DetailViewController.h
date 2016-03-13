//
//  DetailViewController.h
//  BLE_test
//
//  Created by 箱猫 on 2016/03/13.
//  Copyright © 2016年 Hakoneko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end


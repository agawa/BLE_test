//
//  BLEMainViewController.m
//  BLE_test
//
//  Created by 箱猫 on 2016/03/21.
//  Copyright © 2016年 Hakoneko. All rights reserved.
//

#import "BLEMainViewController.h"

@import CoreBluetooth;

@interface BLEMainViewController () <CBCentralManagerDelegate> {
    
    IBOutlet UILabel *logLabel;
}

@property (nonatomic, strong) CBCentralManager *centralManager;

@end

@implementation BLEMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [logLabel setText:@"起動したよ"];
    
    self.centralManager = [[CBCentralManager alloc] initWithDelegate:self
                                                               queue:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Search 関連

// スキャンボタン
- (IBAction)searchAction:(id)sender {
    [logLabel setText:@"スキャン開始"];
    [self.centralManager scanForPeripheralsWithServices:nil
                                                options:nil];
}

- (void)centralManager:(CBCentralManager *)central
 didDiscoverPeripheral:(CBPeripheral *)peripheral
     advertisementData:(NSDictionary<NSString *,id> *)advertisementData
                  RSSI:(NSNumber *)RSSI {
    [logLabel setText:[NSString stringWithFormat:@"発見したBLEデバイス :%@", peripheral]];
    
    // 自動的に止まらないので止めておく
    [self.centralManager stopScan];
}


- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    
    switch (central.state) {
        case CBCentralManagerStatePoweredOn:
            [logLabel setText:@"動作可能"];
            break;
            
        case CBCentralManagerStateUnsupported:
            [logLabel setText:@"BLEがサポートされてないよー"];
            break;
            
        case CBCentralManagerStateUnauthorized:
            [logLabel setText:@"使用許可がないよー"];
            break;
            
        case CBCentralManagerStatePoweredOff:
            [logLabel setText:@"BluetoothがOFFだよ"];
            break;
            
        default:
            break;
    }
}


@end

//
//  MasterViewController.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 8/4/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>




@interface MasterViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>


//@property (strong, nonatomic) NSString *userid;
//@property (strong, nonatomic) NSString *sessionid;

@property (strong, nonatomic) NSString *menuId;
@property (strong, nonatomic) NSString *menuName;

@end

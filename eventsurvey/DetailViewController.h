//
//  DetailViewController.h
//  Onboard
//
//  Created by Sai Kiran Gandham on 8/4/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>




@interface DetailViewController : UIViewController <UITableViewDelegate,UITableViewDataSource,UISplitViewControllerDelegate>


@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) UILabel *detailDescriptionLabel;


@end

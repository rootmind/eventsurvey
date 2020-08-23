////
////  OnBoardViewController.m
////  Onboard
////
////  Created by Sai Kiran Gandham on 4/10/15.
////  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
////
//
//#import <UIKit/UIKit.h>
//#import <QuartzCore/QuartzCore.h>
//#import "OnBoardViewController.h"
//#import "OnBoardData.h"
//#import "SingletonClass.h"
//#import "UIColor+Constants.h"
//#import "UIImage+Constants.h"
//#import "PopoverViewController.h"
//
//
//
//
//
//
//@interface OnBoardViewController ()
//
//
//@end
//
//#define rad 15  // radius
//#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red
//
//
//
//CGFloat lblConstraintX=0.52f;
//CGFloat lblConstraintY=1.0f;
//CGFloat lblConstraintWidth=0.5f;
//CGFloat lblConstraintHeight=0.8f;
//
//CGFloat constraintX=1.19f;
//CGFloat constraintY=1.0f;
//CGFloat constraintWidth=0.80f;
//CGFloat constraintHeight=0.8f;
//
//CGFloat constraint1X=0.69f;
//CGFloat constraint1Y=1.0f;
//CGFloat constraint1Width=0.3f;
//CGFloat constraint1Height=0.8f;
//
//CGFloat lblConstraint2X=1.52f;
//CGFloat lblConstraint2Y=1.0f;
//CGFloat lblConstraint2Width=0.5f;
//CGFloat lblConstraint2Height=0.8f;
//
//CGFloat constraint2X=1.69f;
//CGFloat constraint2Y=1.0f;
//CGFloat constraint2Width=0.3f;
//CGFloat constraint2Height=0.8f;
//
//
//@implementation OnBoardViewController
//
//
//@synthesize userid;
//@synthesize sessionid;
//@synthesize actionMode;
//
////@synthesize onBoardDataKeyData;
////@synthesize onBoardDataValueData;
//@synthesize dataDictionary;
//
//
//
//@synthesize onBoardArray;
//@synthesize onBoardData;
//
//@synthesize dateToolBar;
//@synthesize datePicker;
//
//@synthesize labelArray;
//@synthesize labelNameArray;
//@synthesize label2Array;
//@synthesize labelName2Array;
//@synthesize componentsArray;
//@synthesize componentsNameArray;
//@synthesize components2Array;
//@synthesize componentsName2Array;
//@synthesize dataArray;
//
//@synthesize webView;
//@synthesize activityIndicator;
//@synthesize lblLoading;
//
//@synthesize timerView;
//@synthesize switchFlag;
//
//int hours, minutes, seconds,secondsLeft;
//
//
//@synthesize existingCustomer;
//@synthesize txtExtRelation;
//@synthesize txtExtRelationNo;
//@synthesize txtCustomerName;
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//    
//    
//    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
//    
//    
//    
//    
//    
//    /*UIImageView *wallet =[[UIImageView alloc] initWithFrame:CGRectMake(50,50,80,80)];
//     wallet.image=[UIImage imageNamed:@"money-wallet-icon.png"];
//     wallet.contentMode=UIViewContentModeCenter;
//     wallet.layer.masksToBounds=YES;
//     [wallet.layer setBorderColor:[UIColor grayColor].CGColor];
//     [wallet.layer setBorderWidth:2.0f];
//     [wallet.layer setCornerRadius:15.0f];
//     [wallet.layer setShadowColor:[UIColor grayColor].CGColor];
//     [self.view addSubview:wallet];*/
//    
//    //UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,150,20)];
//    //    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,20,40)];
//    //    companyLogo.image=[UIImage imageNamed:@"logo_MobileBanker1.png"];
//    //    companyLogo.contentMode = UIViewContentModeScaleAspectFit;
//    //    companyLogo.clipsToBounds = NO;
//    //    companyLogo.layer.masksToBounds=NO;
//    //[self.view addSubview:companyLogo];
//    
//    ////self.navigationItem.titleView=companyLogo;
//    
//    //self.navigationItem.title=@"Account Summary";
//    
//    
//    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(callHost)];
//    
//    self.navigationItem.rightBarButtonItem =rightNavButton ;
//    
//    
//    //    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,50,20)];
//    //    companyLogo.image=[UIImage imageNamed:@"Mashreq_logo.png"];
//    //    //companyLogo.contentMode=UIViewContentModeCenter;
//    //    companyLogo.contentMode = UIViewContentModeScaleToFill;
//    //    companyLogo.clipsToBounds = NO;
//    //    //[self.view addSubview:companyLogo];
//    //
//    //    //self.navigationItem.titleView=companyLogo;
//    
//    
//    
//    //    CALayer *sublayerHeader = [CALayer layer];
//    //    sublayerHeader.backgroundColor = [UIColor whiteColor].CGColor;
//    //    sublayerHeader.shadowOffset = CGSizeMake(0, 3);
//    //    sublayerHeader.shadowRadius = 10.0;
//    //    sublayerHeader.shadowColor = [UIColor blackColor].CGColor;
//    //    sublayerHeader.shadowOpacity = 0.8;
//    //    sublayerHeader.cornerRadius = 30.0;
//    //    //sublayerHeader.frame = CGRectMake(30, 80, 270, 100);
//    //    sublayerHeader.bounds=headerView.bounds;
//    //    [self.view.layer addSublayer:sublayerHeader];
//    
//    
//    
//    
//    
//    
//    
//    //UIImageView *card =[[UIImageView alloc] initWithFrame:CGRectMake(200,50,50,50)];
//    //card.image=[UIImage imageNamed:@"Finance-Card-In-Use-icon.png"];
//    //card.contentMode=UIViewContentModeCenter;
//    //[self.view addSubview:card];
//    
//    //[self fetchonBoardData];
//    
//    
//    UIView *screenView = [[UIView alloc] init];
//    screenView.layer.borderWidth=1.0;
//    screenView.layer.borderColor=[UIColor whiteColor].CGColor;
//    screenView.layer.shadowRadius=10.0;
//    screenView.backgroundColor = [UIColor whiteColor];
//    screenView.layer.shadowOffset = CGSizeMake(0, 3);
//    screenView.layer.shadowRadius = 10.0;
//    screenView.layer.shadowColor = [UIColor blackColor].CGColor;
//    screenView.layer.shadowOpacity = 0.8;
//    screenView.layer.cornerRadius = 15.0;
//    screenView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:screenView];
//    
//    //---timer UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.90 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.70 constant:0]];
//    
//    
//    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
//    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    //tableView.frame = CGRectMake(30,200,270,300);
//    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
//    tableView.layer.borderWidth=1.0f;
//    tableView.layer.borderColor=[UIColor whiteColor].CGColor;
//    tableView.layer.cornerRadius=15.0f;
//    //tableView.allowsSelection = NO;
//    tableView.alwaysBounceVertical = NO;
//    tableView.contentInset = UIEdgeInsetsMake(-70, 0, 0, 0);
//    
//    
//    tableView.sectionHeaderHeight = 0.0;
//    tableView.sectionFooterHeight = 0.0;
//    tableView.rowHeight=UITableViewAutomaticDimension;
//
//    
//    //self.edgesForExtendedLayout = UIRectEdgeNone;
//    
////    CGRect titleRect = CGRectMake(0, 0, 100, 20);
////    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
////    tableTitle.textColor = [UIColor captionColor];
////    tableTitle.backgroundColor = [tableView backgroundColor];
////    tableTitle.opaque = YES;
////    tableTitle.font = [UIFont boldSystemFontOfSize:14];
////    tableTitle.textAlignment=NSTextAlignmentCenter;
////    tableTitle.text = @"onBoardData";
////    //tableTitle.translatesAutoresizingMaskIntoConstraints=NO;
////    tableView.tableHeaderView = tableTitle;
//    
//    //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
//    //[tableView setSeparatorColor:[UIColor whiteColor]];
//    tableView.separatorInset=UIEdgeInsetsZero;
//    //tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//    
//    
//    // add to canvas
//    tableView.translatesAutoresizingMaskIntoConstraints=NO;
//    [screenView addSubview:tableView];
//    
//    
//    
//    //[self drawRect:titleRect];
//    //
//    
//    // important! without this line it does not work!
//    //[tableView setBackgroundView:[[UIView alloc] init]];
//    // set plain background color
//    //[tableView setBackgroundColor:[UIColor colorWithRed:0.69 green:0.81 blue:0.79 alpha:1.0]];
//    // remove seperator color
//    
//    
//    
//    //tableView.contentInset = UIEdgeInsetsMake(-1.0f, 0.0f, 0.0f, 0.0);
//    
//    //    CGRect frame = tableView.tableHeaderView.frame;
//    //    frame.size.height = 1;
//    //    UIView *headerView = [[UIView alloc] initWithFrame:frame];
//    //    [tableView setTableHeaderView:headerView];
//    
//    
//    
//    
//    //---header UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:screenView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
//    
//
//    
////    labelNameArray=[[NSMutableArray alloc] initWithObjects:@"Existing Customer",@"Existing Relation",@"Relationship No",@"Title",@"Category Type",@"Customer Name",@"eName Check Flag",@"eName Performed By",@"eName Performed Date",@"Name Match",@"eName Performed Name",@"eName Result",@"eName Comment",@"Short Name",@"Branch",@"Joint Own",@"Nature of Relation",@"Residence Status",@"Nationality",@"Date of Birth",@"Education",@"Marital Status",@"Gender",@"Preferred Language",@"Family in UAE",@"Family Size",@"Car Ownership",@"Car Year",@"Media",@"Favourite City",@"Domicile",@"Passport No",@"Passport Issue Date",@"Passport Expiry Date",@"Passport Issue Place",@"Passport Issue Country",@"Immigration File Number",@"Visa Issue Place",@"Visa Issue Date",@"Visa Expiry Date",@"Driving License No",@"Driving Lic Exp Date",@"Labour Card No",@"Labour Card Exp Date",@"Emirates Id",@"EmiratesId Exp Date",@"Guardian Name",@"Intro Name",@"Intro Account No",@"Intro Customer Type",@"Intro Segment",@"Intro Industry",@"Intro Busi Group",@"Intro Branch",@"Intro Geography",@"Intro RMId",@"Intro SSO", nil];
////    
//// 
////    labelName2Array=[[NSMutableArray alloc] initWithObjects:@"Existing Customer",@"Existing Relation",@"Relationship No",@"Title",@"Category Type",@"Customer Name",@"eName Check Flag",@"eName Performed By",@"eName Performed Date",@"Name Match",@"eName Performed Name",@"eName Result",@"eName Comment",@"Short Name",@"Branch",@"Joint Own",@"Nature of Relation",@"Residence Status",@"Nationality",@"Date of Birth",@"Education",@"Marital Status",@"Gender",@"Preferred Language",@"Family in UAE",@"Family Size",@"Car Ownership",@"Car Year",@"Media",@"Favourite City",@"Domicile",@"Passport No",@"Passport Issue Date",@"Passport Expiry Date",@"Passport Issue Place",@"Passport Issue Country",@"Immigration File Number",@"Visa Issue Place",@"Visa Issue Date",@"Visa Expiry Date",@"Driving License No",@"Driving Lic Exp Date",@"Labour Card No",@"Labour Card Exp Date",@"Emirates Id",@"EmiratesId Exp Date",@"Guardian Name",@"Intro Name",@"Intro Account No",@"Intro Customer Type",@"Intro Segment",@"Intro Industry",@"Intro Busi Group",@"Intro Branch",@"Intro Geography",@"Intro RMId",@"Intro SSO", nil];
////
////    componentsNameArray=[[NSMutableArray alloc]initWithObjects:@"Existing Customer",@"Select Existing Relation",@"Enter Relationship No",@"Title",@"Category Type",@"Enter Customer Name",@"eName Check Flag",@"eName Performed By",@"eName Performed Date",@"Name Match",@"eName Performed Name",@"eName Result",@"eName Comment",@"Enter Short Name",@"Branch",@"Select Joint Own",@"Nature of Relation",@"Enter Residence Status",@"Nationality",@"Enter DOB",@"Education",@"Select Martial Status",@"Gender",@"Select Preferred Language",@"Family in UAE",@"Family Size",@"Car Ownership",@"Car Year",@"Media",@"Favourite City",@"Domicile",@"Passport No",@"Passport Issue Date",@"Passport Expiry Date",@"Passport Issue Place",@"Passport Issue Country",@"Immigration File Number",@"Visa Issue Place",@"Visa Issue Date",@"Visa Expiry Date",@"Driving License No",@"Driving Lic Exp Date",@"Labour Card No",@"Labour Card Exp Date",@"Emirates Id",@"EmiratesId Exp Date",@"Guardian Name",@"Intro Name",@"Intro Account No",@"Intro Customer Type",@"Intro Segment",@"Intro Industry",@"Intro Busi Group",@"Intro Branch",@"Intro Geography",@"Intro RMId",@"Intro SSO",  nil];
////    
////    
////    componentsName2Array=[[NSMutableArray alloc]initWithObjects:@"Existing Customer",@"Select Existing Relation",@"Enter Relationship No",@"Title",@"Category Type",@"Enter Customer Name",@"eName Check Flag",@"eName Performed By",@"eName Performed Date",@"Name Match",@"eName Performed Name",@"eName Result",@"eName Comment",@"Enter Short Name",@"Branch",@"Select Joint Own",@"Nature of Relation",@"Enter Residence Status",@"Nationality",@"Enter DOB",@"Education",@"Select Martial Status",@"Gender",@"Select Preferred Language",@"Family in UAE",@"Family Size",@"Car Ownership",@"Car Year",@"Media",@"Favourite City",@"Domicile",@"Passport No",@"Passport Issue Date",@"Passport Expiry Date",@"Passport Issue Place",@"Passport Issue Country",@"Immigration File Number",@"Visa Issue Place",@"Visa Issue Date",@"Visa Expiry Date",@"Driving License No",@"Driving Lic Exp Date",@"Labour Card No",@"Labour Card Exp Date",@"Emirates Id",@"EmiratesId Exp Date",@"Guardian Name",@"Intro Name",@"Intro Account No",@"Intro Customer Type",@"Intro Segment",@"Intro Industry",@"Intro Busi Group",@"Intro Branch",@"Intro Geography",@"Intro RMId",@"Intro SSO",  nil];
//// 
//  
//    switchFlag=@"N";
//    
//    labelNameArray=[[NSMutableArray alloc] initWithObjects:@"Existing Customer123",@"Existing Relation",@"Relationship No",@"Title",@"Branch",@"Nature of Relation",@"Nationality",@"Education",@"Gender",@"Family in UAE",@"Car Ownership",@"Media",@"Domicile",@"Passport Issue Date",@"Passport Issue Place",@"Immigration File Number",@"Visa Issue Date",@"Driving License No",@"Labour Card No",@"Emirates Id",@"Guardian Name",@"Intro Account No",@"Intro Segment",@"Intro Busi Group",@"Intro Geography",@"Intro SSO", nil];
//    
//    labelName2Array=[[NSMutableArray alloc] initWithObjects:@"Existing Customer",@"Existing Relation",@"Relationship No",@"Category Type",@"Joint Own",@"Residence Status",@"Date of Birth",@"Marital Status",@"Preferred Language",@"Family Size",@"Car Year",@"Favourite City",@"Passport No",@"Passport Expiry Date",@"Passport Issue Country",@"Visa Issue Place",@"Visa Expiry Date",@"Driving Lic Exp Date",@"Labour Card Exp Date",@"EmiratesId Exp Date",@"Intro Name",@"Intro Customer Type",@"Intro Industry",@"Intro Branch",@"Intro RMId",@"Code", nil];
//    
//    componentsNameArray=[[NSMutableArray alloc]initWithObjects:@"Existing Customer",@"Existing Relation",@"Relationship No",@"Title",@"Branch",@"Nature of Relation",@"Nationality",@"Education",@"Gender",@"Family in UAE",@"Car Ownership",@"Media",@"Domicile",@"Passport Issue Date",@"Passport Issue Place",@"Immigration File Number",@"Visa Issue Date",@"Driving License No",@"Labour Card No",@"Emirates Id",@"Guardian Name",@"Intro Account No",@"Intro Segment",@"Intro Busi Group",@"Intro Geography",@"Intro SSO",  nil];
//    
//    componentsName2Array=[[NSMutableArray alloc]initWithObjects:@"Existing Customer",@"Existing Relation",@"Relationship No",@"Category Type",@"Joint Own",@"Residence Status",@"Date of Birth",@"Marital Status",@"Preferred Language",@"Family Size",@"Car Year",@"Favourite City",@"Passport No",@"Passport Expiry Date",@"Passport Issue Country",@"Visa Issue Place",@"Visa Expiry Date",@"Driving Lic Exp Date",@"Labour Card Exp Date",@"EmiratesId Exp Date",@"Intro Name",@"Intro Customer Type",@"Intro Industry",@"Intro Branch",@"Intro RMId", @"Code", nil];
//    
//
//    labelArray=[[NSMutableArray alloc]initWithCapacity:[labelNameArray count]];
//    componentsArray = [[NSMutableArray alloc]initWithCapacity:[componentsNameArray count]];
//    
//    for (int i=0; i<=[componentsNameArray count]-1; i++) {
//        
//        
//            CommonLabel *commonLabel=[[CommonLabel alloc]init];
//            commonLabel.text=[labelNameArray objectAtIndex:i];
//            //commonLabel.tag=i;
//            //commonLabel.textColor=[UIColor blackColor];
//            commonLabel.translatesAutoresizingMaskIntoConstraints=NO;
//            [labelArray insertObject:commonLabel atIndex:i];
//            
//            
//            CommonTextField *commonTextField = [[CommonTextField alloc] init];
//            commonTextField.tag=100+i;
//            commonTextField.delegate=self;
//            commonTextField.placeholder=[componentsNameArray objectAtIndex:i];
//            commonTextField.translatesAutoresizingMaskIntoConstraints=NO;
//            [componentsArray insertObject:commonTextField atIndex:i];
//        
//    }
//
//
//    
//    label2Array=[[NSMutableArray alloc]initWithCapacity:[labelName2Array count]];
//    components2Array = [[NSMutableArray alloc]initWithCapacity:[componentsName2Array count]];
//    
//    for (int i=0; i<=[componentsName2Array count]-1; i++) {
//    
//        
//        CommonLabel *commonLabel=[[CommonLabel alloc]init];
//        commonLabel.text=[labelName2Array objectAtIndex:i];
//        //commonLabel.tag=i;
//        //commonLabel.textColor=[UIColor blackColor];
//        commonLabel.translatesAutoresizingMaskIntoConstraints=NO;
//        [label2Array insertObject:commonLabel atIndex:i];
//        
//        
//        CommonTextField *commonTextField = [[CommonTextField alloc] init];
//        commonTextField.tag=200+i;
//        commonTextField.delegate=self;
//        commonTextField.placeholder=[componentsName2Array objectAtIndex:i];
//        commonTextField.translatesAutoresizingMaskIntoConstraints=NO;
//        [components2Array insertObject:commonTextField atIndex:i];
//
//    }
//    
//    //dataArray =[[NSMutableArray alloc]initWithCapacity:500];
//    
//    timerView = [[UILabel alloc] init];
//    timerView.layer.borderWidth=1.0;
//    timerView.layer.borderColor=[UIColor whiteColor].CGColor;
//    timerView.layer.shadowRadius=10.0;
//    timerView.backgroundColor = [UIColor whiteColor];
//    timerView.layer.shadowOffset = CGSizeMake(0, 3);
//    timerView.layer.shadowRadius = 10.0;
//    timerView.layer.shadowColor = [UIColor blackColor].CGColor;
//    timerView.layer.shadowOpacity = 0.8;
//    timerView.layer.cornerRadius = 15.0;
//    timerView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:timerView];
//    
//    //---timer UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.35 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    secondsLeft = 16925;
//    [self countdownTimer];
//    
//    
//    UIButton *enameView = [[UIButton alloc] init];
//    enameView.layer.borderWidth=1.0;
//    enameView.layer.borderColor=[UIColor whiteColor].CGColor;
//    enameView.layer.shadowRadius=10.0;
//    enameView.backgroundColor = [UIColor whiteColor];
//    enameView.layer.shadowOffset = CGSizeMake(0, 3);
//    enameView.layer.shadowRadius = 10.0;
//    enameView.layer.shadowColor = [UIColor blackColor].CGColor;
//    enameView.layer.shadowOpacity = 0.8;
//    enameView.layer.cornerRadius = 15.0;
//    enameView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:enameView];
//    
//    //---timer UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    UIButton *dedupView = [[UIButton alloc] init];
//    dedupView.layer.borderWidth=1.0;
//    dedupView.layer.borderColor=[UIColor whiteColor].CGColor;
//    dedupView.layer.shadowRadius=10.0;
//    dedupView.backgroundColor = [UIColor whiteColor];
//    dedupView.layer.shadowOffset = CGSizeMake(0, 3);
//    dedupView.layer.shadowRadius = 10.0;
//    dedupView.layer.shadowColor = [UIColor blackColor].CGColor;
//    dedupView.layer.shadowOpacity = 0.8;
//    dedupView.layer.cornerRadius = 15.0;
//    dedupView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:dedupView];
//    
//    //---timer UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    [self displayGraph];
//    
//    
//    
//    
//
//    
//    
//    
//    //[self displayHeader];
//    
//    
//
//    
//    
//    //self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", accountName.count];
//    
//    
//
//    
//}
//
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    
////    if (textField == self.txtCustomerName) {
////        [textField resignFirstResponder];
////        return NO;
////    }
////    
////    if (textField == self.txtShortName) {
////        [textField resignFirstResponder];
////        return NO;
////    }
////    if (textField == self.txtJointOwn) {
////        [textField resignFirstResponder];
////        return NO;
////    }
////    if (textField == self.txtNationality) {
////        [textField resignFirstResponder];
////        return NO;
////    }
////    if (textField == self.txtDOB) {
////        [textField resignFirstResponder];
////        return NO;
////    }
//    
//    [textField resignFirstResponder];
//    
//    if(textField.tag==7)
//    {
//        return NO;
//    }
//    else
//    
//        return YES;
//}
//
//
//
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    
//    // Prevent crashing undo bug – see note below.
//    if(range.length + range.location > textField.text.length)
//    {
//        return NO;
//    }
//    
//    if (textField.tag == 0) {
//        
//
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 50;
//        
//    }
//    
////    if (textField == self.self.txtSalary) {
////        
////        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
////        
////        // allow backspace
////        if (range.length > 0 && [string length] == 0) {
////            return YES;
////        }
////        // do not allow . at the beggining
////        if (range.location == 0 && [string isEqualToString:@"."]) {
////            return NO;
////        }
////        // set the text field value manually
////        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
////        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
////        textField.text = newValue;
////        // return NO because we're manually setting the value
////        return NO;
////    }
////    return YES;
//    
//    return YES;
//    
//}
//
//
//-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
//{
//    
////    if ([textField isEqual: txtDOB])
////    {
////        [self setDate:txtDOB];
////        return NO;
////   
////    }
////    else if([textField isEqual:txtNationality])
////    {
////        [self popoverData:txtNationality:@"NATIONALITY"];
////        return NO; //to disable keyboard
////    }
////    else if([textField isEqual:txtJointOwn])
////    {
////        [self popoverData:txtJointOwn:@"JOINTOWN"];
////        return NO; //to disable keyboard
////    }
//
//    //NSLog(@"fieldTag %ld", (long)textField.tag);
//
//    
//    //Existing Relationship
//    if(textField.tag==2)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Branch
//    else if (textField.tag ==108)
//    {
//        [self popoverData:textField];
//        return NO;
//        
//    }
//    //Joint Own
//    else if (textField.tag ==208)
//    {
//        [self popoverData:textField];
//        return NO;
//        
//    }
//    //Nature of Relation
//    else if (textField.tag ==109)
//    {
//        [self popoverData:textField];
//        return NO;
//        
//    }
//    //Residence Status
//    else if (textField.tag ==209)
//    {
//        [self popoverData:textField];
//        return NO;
//        
//    }
//    //Nationality
//    else if(textField.tag==110)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //DOB
//    else if (textField.tag ==210)
//    {
//        [self popoverData:textField];
//        return NO;
//        
//    }
//    //Education
//    else if(textField.tag==111)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Marital Status
//    else if (textField.tag ==211)
//    {
//        [self popoverData:textField];
//        return NO;
//        
//    }
//    //Gender
//    else if(textField.tag==112)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Preferred Language
//    else if (textField.tag ==212)
//    {
//        [self popoverData:textField];
//        return NO;
//        
//    }
//    //Family In UAE
//    else if(textField.tag==113)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Car Ownership
//    else if(textField.tag==114)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Favourite City
//    else if(textField.tag==215)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Domicile
//    else if(textField.tag==116)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Passport Issue Date
//    else if(textField.tag==117)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Passport Exp Date
//    else if(textField.tag==217)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Passport Issue Country
//    else if(textField.tag==218)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Visa Issue Date
//    else if(textField.tag==120)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Visa Exp Date
//    else if(textField.tag==220)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Driving Lic Exp Date
//    else if(textField.tag==221)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Labour Card Exp Date
//    else if(textField.tag==222)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//    //Emiratesid Exp Date
//    else if(textField.tag==223)
//    {
//        [self popoverData:textField];
//        return NO; //to disable keyboard
//    }
//
//    else
//        return YES;
//    
//}
//
//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    [self animateTextField: textField up: YES];
//    
//    
//}
//
//
//
//-(void) setDate:(UITextField *)textField
//{
//
//    
//    
//    //UITextField *textField =(UITextField *)sender;
//    NSLog(@"fieldTag1 %ld", (long)textField.tag);
//    
//    datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,44,0, 0)];
//    textField.delegate=self;
//    datePicker.hidden=NO;
//    //[datePicker setDate:[NSDate date]];
//    datePicker.datePickerMode = UIDatePickerModeDate;
//    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
//    [textField setInputView:datePicker];
//    
//    
//    
//    dateToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
//    [dateToolBar setBarStyle:UIBarStyleDefault];
//    [dateToolBar sizeToFit];
//    
// 
//    UIBarButtonItem* flexButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace    target:self  action:nil];
//    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self  action:@selector(donePicker)];
//    NSArray* barItems = [NSArray arrayWithObjects:flexButton,doneButton, nil];
//    [dateToolBar setItems:barItems animated:YES];
//
//    textField.inputAccessoryView=dateToolBar;
//   
//    
//    
//}
//
//-(void)donePicker
//{
//    
//    [dateToolBar removeFromSuperview];
//    [datePicker removeFromSuperview];
//    
//
//    
//}
//
//-(void) dateTextField:(UITextField *)sender
//{
//    
//    NSLog(@"fieldTag2 %ld", (long)sender.tag);
//    
//    //UITextField *textField = (UITextField *)sender;
//    UIDatePicker *picker = (UIDatePicker*)sender.inputView;
//    [picker setMaximumDate:[NSDate date]];
//    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//    NSDate *eventDate = picker.date;
//    [dateFormat setDateFormat:@"dd/MM/yyyy"];
//    
//    NSString *dateString = [dateFormat stringFromDate:eventDate];
//    sender.text = [NSString stringWithFormat:@"%@",dateString];
//}
//
//
//-(void) popoverData: (UITextField *)sender //:(NSString *)actionCode
//{
//    
//    PopoverViewController *popoverViewController = [[PopoverViewController alloc]initWithNibName:nil bundle:nil];
//    //popoverViewController.actionCode=actionCode;
//    popoverViewController.fieldTag=(int)sender.tag;
//    popoverViewController.delegate=self;
//    
//    UIPopoverController *popoverController =[[UIPopoverController alloc] initWithContentViewController:popoverViewController];
//    [popoverController setPopoverContentSize:CGSizeMake(self.view.frame.size.width/4, self.view.frame.size.height/4)];
//   
//
//    if(popoverController.popoverVisible==NO){
//        
//        //NSLog(@" test %lf",sender.frame.origin.x);
//        //NSLog(@" test %lf",sender.frame.origin.y);
//        
//        [popoverController presentPopoverFromRect:CGRectMake(50, sender.frame.origin.y, 1, 1)    inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//    }
//    else{
//        [popoverController dismissPopoverAnimated:YES];
//    }
//    
//
//}
//
//
//
//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    
//    
//    [self animateTextField: textField up: NO];
//    
//    
//    
//}
//
//- (void) animateTextField: (UITextField*) textField up: (BOOL) up
//{
//    const int movementDistance = textField.frame.origin.y / 2;//80; // tweak as needed
//    const float movementDuration = 0.3f; // tweak as needed
//    
//    int movement = (up ? -movementDistance : movementDistance);
//    
//    [UIView beginAnimations: @"anim" context: nil];
//    [UIView setAnimationBeginsFromCurrentState: YES];
//    [UIView setAnimationDuration: movementDuration];
//    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
//    [UIView commitAnimations];
//}
//
//
//
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    
//
//    return [componentsArray count];
//}
//
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
//    
//    return 1;
//}
//
////- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
////{
////
////    return 50;
////    
////}
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
//
//    
//    
//    if(section == 0)
//    {
//        
//        return @" Customer Details";
//        
//    }
//    else if(section == 3)
//    {
//        
//        return @" eName Check";
//        
//    }
//    else if(section == 8)
//    {
//        
//        return @" Personal Details";
//        
//    }
//    else if(section == 15)
//    {
//        
//        return @" ID Details";
//        
//    }
//    else if(section == 25)
//    {
//        
//        return @" Bank Use Only";
//        
//    }
//    else
//        
//        return nil;
//}
//
////- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
////{
////    if(section ==0)
////    {
////        return 0.00f;
////    }
////    return 10.0f;
////}
//
//-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 0.1f;
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//    return nil;
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//    
//    return nil;
//}
//
//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    /*if ((indexPath.row % 2) == 1) {
//     cell.backgroundColor = [UIColor grayColor];
//     //cell.textLabel.backgroundColor = [UIColor blackColor];
//     cell.selectionStyle = UITableViewCellSelectionStyleGray;
//     }
//     else
//     {
//     cell.backgroundColor = [UIColor whiteColor];
//     
//     }*/
//    
//    cell.backgroundColor=[UIColor whiteColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor lightGrayColor];
//    //cell.layer.borderWidth=0.5f;
//    //cell.layer.cornerRadius=15.0f;
//    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
//    //cell.layer.borderColor=[UIColor borderColor].CGColor;
//    //cell.layer.shadowRadius=3.0f;
//    //cell.layer.shadowOffset = CGSizeMake(0, 3);
//    //cell.layer.shadowColor = [UIColor blackColor].CGColor;
//    //cell.layer.shadowOpacity = 0.8;
//    
//    
//    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
//    
//    UIFont *myFont = [UIFont boldSystemFontOfSize:14.0f];//[ UIFont fontWithName: @"Arial-BoldMT" size: 14.0 ];
//    cell.textLabel.font  = myFont;
//    //cell.textLabel.textColor=[UIColor blueColor];
//    UIFont *mySecondFont = [UIFont boldSystemFontOfSize:10.0f]; //[ UIFont fontWithName: @"Arial-BoldMT" size: 12.0 ];
//    cell.detailTextLabel.font  = mySecondFont;
//    //cell.detailTextLabel.textColor=[UIColor blueColor];
//    
//    
//    //top shadow
//    //UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
//    //CAGradientLayer *topShadow = [CAGradientLayer layer];
//    //topShadow.frame = CGRectMake(0, 0, tableView.bounds.size.width, 10);
//    //topShadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
//    //[topShadowView.layer insertSublayer:topShadow atIndex:0];
//    
//    //[cell.contentView addSubview:topShadowView];
//    
//    
//    
//    //UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(3,2, 20, 25)];
//    //imv.image=[UIImage imageNamed:@"money-wallet-icon.png"];
////    cell.imageView.image=[[UIImage imageNamed:@"account-sum-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    
//    
//    //    CAGradientLayer *gradient = [CAGradientLayer layer];
//    //    gradient.frame = cell.bounds;
//    //    gradient.layer.cornerRadius=10.0f;
//    //    gradient.color=[UIColor whiteColor];
//    //    //gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor]CGColor], (id)[[UIColor redColor]CGColor], nil];
//    //    [cell.layer addSublayer:gradient];
//    
//    
//    //[cell addSubview:imv];
//    
//    
//    //NSLog(@"table view%ldd",(long) indexPath.row);//[custKeyData objectAtIndex:indexPath.row]);
//    //NSLog(@"table view%ldd",(long) indexPath.section);
//    
//    
//    //    cell.textLabel.text =[NSString stringWithFormat:@"%@",[self.accountName objectAtIndex:indexPath.row]];
//    //    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@         %@   %@",[self.accountNumber objectAtIndex:indexPath.row],[self.accountCurrency objectAtIndex:indexPath.row],[self.accountCurrentBalance objectAtIndex:indexPath.row]];
//    
//    //onBoardData = [onBoardArray objectAtIndex:indexPath.row];
//    onBoardData = [onBoardArray objectAtIndex:indexPath.section];
//
//    
//    
//
//    
//}
//
//
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *MyIdentifier = @"MyReuseIdentifier";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
//
//
//    
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] init];//]WithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
//        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
//        cell.accessoryType = UITableViewCellAccessoryNone;
//        //cell.selectionStyle=UITableViewCellSelectionStyleNone;
//
//        
//        if(indexPath.section==0)
//        {
//            
//            CommonLabel *lblExtCustomerFlag=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblExtCustomerFlag.text=[labelNameArray objectAtIndex:indexPath.section];
//            lblExtCustomerFlag.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblExtCustomerFlag];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtCustomerFlag attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtCustomerFlag attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtCustomerFlag attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtCustomerFlag attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight constant:0]];
//            
//            
//            existingCustomer = [[UISwitch alloc] init];
//            existingCustomer.tag=1;
//            [existingCustomer addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
//            existingCustomer.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:existingCustomer];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:existingCustomer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:existingCustomer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:existingCustomer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:existingCustomer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height constant:0]];
//            
//   
//        }
//        else if(indexPath.section==1)
//        {
//            
//            CommonLabel *lblExtRelation=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblExtRelation.text=@"Existing Relationship";
//            lblExtRelation.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblExtRelation];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelation attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelation attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelation attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelation attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight constant:0]];
//            
//            
//            txtExtRelation = [[CommonTextField alloc] init];
//            txtExtRelation.tag=2;
//            txtExtRelation.delegate=self;
//            txtExtRelation.placeholder=@"Select Existing Relationship";
//            txtExtRelation.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtExtRelation];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelation attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelation attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelation attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelation attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height constant:0]];
//            
//            
//            CommonLabel *lblExtRelationNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblExtRelationNo.text=@"Relationship No";
//            lblExtRelationNo.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblExtRelationNo];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelationNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelationNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelationNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelationNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height constant:0]];
//            
//            
//            txtExtRelationNo = [[CommonTextField alloc] init];
//            txtExtRelationNo.tag=3;
//            txtExtRelationNo.delegate=self;
//            txtExtRelationNo.placeholder=@"Relationship No";
//            txtExtRelationNo.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtExtRelationNo];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelationNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelationNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelationNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelationNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height constant:0]];
//            
//            
//        }
//        else if(indexPath.section==2)
//        {
//            
//            CommonLabel *lblCustomerName=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblCustomerName.text=@"Customer Name";
//            lblCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblCustomerName];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight constant:0]];
//            
//            
//            txtCustomerName = [[CommonTextField alloc] init];
//            txtCustomerName.tag=4;
//            txtCustomerName.delegate=self;
//            txtCustomerName.placeholder=@"Enter Customer Name";
//            txtCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtCustomerName];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintX constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintY constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintWidth constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintHeight constant:0]];
//            
//            
//            
//        }
//    
//        else
//        {
//            
//            if(![[labelNameArray objectAtIndex:indexPath.section] isEqualToString:@"X"])
//            {
//                
//         
//        
//                [cell.contentView addSubview:[labelArray objectAtIndex:indexPath.section]];
//                
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[labelArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX constant:0]];
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[labelArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY constant:0]];
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[labelArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth constant:0]];
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[labelArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight constant:0]];
//                
//
//                [cell.contentView addSubview:[componentsArray objectAtIndex:indexPath.section]];
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[componentsArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X constant:0]];
//            
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[componentsArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y constant:0]];
//            
//            
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[componentsArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width constant:0]];
//            
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[componentsArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height constant:0]];
//                
//                
//                //------------------
//                
//
//                [cell.contentView addSubview:[label2Array objectAtIndex:indexPath.section]];
//                
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[label2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X constant:0]];
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[label2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y constant:0]];
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[label2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width constant:0]];
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[label2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height constant:0]];
//                
//                
//                [cell.contentView addSubview:[components2Array objectAtIndex:indexPath.section]];
//                
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[components2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X constant:0]];
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[components2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y constant:0]];
//                
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[components2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width constant:0]];
//                
//                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[components2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height constant:0]];
//                //-----------------
//                
//            }
//            
// 
//        }
//        
//
//    }
//    else{
//        
//
//        
//        [cell.contentView viewWithTag:100+indexPath.section];
//        [cell.contentView viewWithTag:indexPath.section];
//        
//        [cell.contentView viewWithTag:500+indexPath.section];
//        [cell.contentView viewWithTag:600+indexPath.section];
//        
//    }
//    
//
//    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
//    
//    
//    return cell;
//}
//
//
//// Implement something like this in your UITableViewController subclass
//// or in the delegate object you use to manage your table.
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    //    // Create a view controller with the title as its
//    //    // navigation title and push it.
//    //    NSUInteger row = indexPath.row;
//    //    if (row != NSNotFound)
//    //    {
//    //        // Create the view controller and initialize it with the
//    //        // next level of data.
//    //        MyViewController *viewController = [[MyViewController alloc]
//    //                                            initWithTable:tableView andDataAtIndexPath:indexPath];
//    //        [[self navigationController] pushViewController:viewController
//    //                                               animated:YES];
//    //    }
//    
//    NSUInteger row = indexPath.section;//row;
//    
//    
//    
//    if (row != NSNotFound)
//    {
//        onBoardData = [onBoardArray objectAtIndex:indexPath.section];
//        
//       // NSLog(@"selected account %@",onBoardData.accountNumber);
//        
//        if([actionMode isEqualToString:@"TRNHISTORY"])
//        {
//            
//            
////            AccountTrnViewController *accountTrnViewController = [[AccountTrnViewController alloc]initWithNibName:nil bundle:nil];
////            
////            //NSLog(@"selected account %@",[self.onBoardDataValueData objectAtIndex:indexPath.row]);
////            
////            accountTrnViewController.cifNumber=onBoardData.cifNumber;
////            accountTrnViewController.accountNumber=onBoardData.accountNumber;
////            accountTrnViewController.sessionid=self.sessionid;
////            accountTrnViewController.userid=self.userid;
////            
////            [self.navigationController pushViewController:accountTrnViewController animated:YES];
//            
//        }
//        
//        
//        
//    }
//
//    
//    
//    
//    
//}
//
//// Tap on row accessory
//- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
//    
//}
//
//
//- (void) callHost {
//
//    
//    NSDictionary *jsonDictionary;
//    
//    
//    //------validation starts---------
//    if([CommonUtils checkEmptyString:txtExtRelation.text]==YES)
//    {
//        
//        [self showMessage:@"Existing Relationship Number can't be blank"];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    
//    
//    //-------
//
//    jsonDictionary= @{@"existingCustomerFlag":switchFlag,
//                      @"existingCustomerType":self.txtExtRelation.text,
//                      @"existingCIFNumber":self.txtExtRelationNo.text,
//                      @"existingAccountNo":self.txtExtRelationNo.text,
//                      @"existingCreditCardNo":self.txtExtRelationNo.text,
//                      @"customerName":self.txtCustomerName.text,
//                      @"title":((UITextField *)[componentsArray objectAtIndex:3]).text,
//                      @"categoryType":((UITextField *)[components2Array objectAtIndex:3]).text,
//                      @"eNameCheckFlag":((UITextField *)[componentsArray objectAtIndex:4]).text,
//                      @"eNamePerformedBy":((UITextField *)[components2Array objectAtIndex:4]).text,
//                      @"eNamePerformedDate":((UITextField *)[componentsArray objectAtIndex:5]).text,
//                      @"eNameMatchFlag":((UITextField *)[components2Array objectAtIndex:5]).text,
//                      @"eNamePerformedName":((UITextField *)[componentsArray objectAtIndex:6]).text,
//                      @"eNameResult":((UITextField *)[components2Array objectAtIndex:6]).text,
//                      @"eNameComment":((UITextField *)[componentsArray objectAtIndex:7]).text,
//                      @"shortName":((UITextField *)[components2Array objectAtIndex:7]).text,
//                      @"branch":((UITextField *)[componentsArray objectAtIndex:8]).text,
//                      @"jointOwn":((UITextField *)[components2Array objectAtIndex:8]).text,
//                      @"natureOfRelation":((UITextField *)[componentsArray objectAtIndex:9]).text,
//                      @"residenceStatus":((UITextField *)[components2Array objectAtIndex:9]).text,
//                      @"nationality":((UITextField *)[componentsArray objectAtIndex:10]).text,
//                      @"dob":((UITextField *)[components2Array objectAtIndex:10]).text,
//                      @"educated":((UITextField *)[componentsArray objectAtIndex:11]).text,
//                      @"maritalStatus":((UITextField *)[components2Array objectAtIndex:11]).text,
//                      @"gender":((UITextField *)[componentsArray objectAtIndex:12]).text,
//                      @"preferredLanguage":((UITextField *)[components2Array objectAtIndex:12]).text,
//                      @"familyInUAE":((UITextField *)[componentsArray objectAtIndex:13]).text,
//                      @"familySizeUAE":((UITextField *)[components2Array objectAtIndex:13]).text,
//                      @"carOwnership":((UITextField *)[componentsArray objectAtIndex:14]).text,
//                      @"carYear":((UITextField *)[components2Array objectAtIndex:14]).text,
//                      @"media":((UITextField *)[componentsArray objectAtIndex:15]).text,
//                      @"favouriteCity":((UITextField *)[components2Array objectAtIndex:15]).text,
//                      @"domicile":((UITextField *)[componentsArray objectAtIndex:16]).text,
//                      @"passportNo":((UITextField *)[components2Array objectAtIndex:16]).text,
//                      @"passportIssueDate":((UITextField *)[componentsArray objectAtIndex:17]).text,
//                      @"passportExpDate":((UITextField *)[components2Array objectAtIndex:17]).text,
//                      @"passportIssuePlace":((UITextField *)[componentsArray objectAtIndex:18]).text,
//                      @"passportIssueCountry":((UITextField *)[components2Array objectAtIndex:18]).text,
//                      @"immiFileNumber":((UITextField *)[componentsArray objectAtIndex:19]).text,
//                      @"visaIssuePlace":((UITextField *)[components2Array objectAtIndex:19]).text,
//                      @"visaIssueDate":((UITextField *)[componentsArray objectAtIndex:20]).text,
//                      @"visaExpDate":((UITextField *)[components2Array objectAtIndex:20]).text,
//                      @"drivingLicenseNo":((UITextField *)[componentsArray objectAtIndex:21]).text,
//                      @"drivingLicenseExpDate":((UITextField *)[components2Array objectAtIndex:21]).text,
//                      @"laborCardNo":((UITextField *)[componentsArray objectAtIndex:22]).text,
//                      @"laborCardExpDate":((UITextField *)[components2Array objectAtIndex:22]).text,
//                      @"emiratesID":((UITextField *)[componentsArray objectAtIndex:23]).text,
//                      @"emiratesIDExpDate":((UITextField *)[components2Array objectAtIndex:23]).text,
//                      @"guardianName":((UITextField *)[componentsArray objectAtIndex:24]).text,
//                      @"introName":((UITextField *)[components2Array objectAtIndex:24]).text,
//                      @"introAccountNo":((UITextField *)[componentsArray objectAtIndex:25]).text,
//                      @"introCustType":((UITextField *)[components2Array objectAtIndex:25]).text,
//                      @"introSegment":((UITextField *)[componentsArray objectAtIndex:26]).text,
//                      @"introIndustry":((UITextField *)[components2Array objectAtIndex:26]).text,
//                      @"introBusinessGroup":((UITextField *)[componentsArray objectAtIndex:27]).text,
//                      @"introBranch":((UITextField *)[components2Array objectAtIndex:27]).text,
//                      @"introGeography":((UITextField *)[componentsArray objectAtIndex:28]).text,
//                      @"introRMID":((UITextField *)[components2Array objectAtIndex:28]).text,
//                      @"introSSO":((UITextField *)[componentsArray objectAtIndex:29]).text,
//
//                      };
//    
//
//    
////        for (int i=0; i<=[componentsArray count]-1; i++) {
////    
////            if([[componentsArray objectAtIndex:i] isKindOfClass:[UITextField class]])
////            {
////                
////                [jsonDictionary initWithObjects:<#(NSArray *)#> forKeys:<#(NSArray *)#>
////                
////                
////            }
////        }
//
//
//    
//    
//    //NSString *jsonString = [container JSONRepresentation];
//    
//    [self saveData:@"insertPersonalDetails" :jsonDictionary];
//
//}
//
//
//- (void) saveData:(NSString *)methodAction :(NSDictionary *) jsonDictionary {
//    
//    
//    @try {
//        
//        
//        
//        NSLog(@"saveData %@",userid);
//        
//    
//    
//        NSError *errorOut;
//        NSString *jsonString;
//        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
//                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
//                                                             error:&errorOut];
//        
//        if (! jsonData) {
//            NSLog(@"Got an error in json creation: %@", errorOut);
//        } else {
//            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//        }
//        
//        NSLog(@"jsondata %@",jsonString);
//        
//        
//        //string for the URL request
//        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/onBoardDataServlet";
//        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];//@"http://117.213.107.54:8081";
//        //create string for parameters that we need to send in the HTTP POST body
//        NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&methodAction=%@&message=%@",userid,sessionid,methodAction,jsonString];
//        
//        
//        //create a NSURL object from the string data
//        NSURL *myUrl = [NSURL URLWithString:myUrlString];
//        
//        //create a mutable HTTP request
//        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:myUrl];
//        //sets the receiver’s timeout interval, in seconds
//        [urlRequest setTimeoutInterval:120.0f];
//        //sets the receiver’s HTTP request method
//        [urlRequest setHTTPMethod:@"POST"];
//        //sets the request body of the receiver to the specified data.
//        [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        //allocate a new operation queue
//        //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//        //Loads the data for a URL request and executes a handler block on an
//        //operation queue when the request completes or fails.
//        /*[NSURLConnection
//         sendAsynchronousRequest:urlRequest
//         queue:queue
//         completionHandler:^(NSURLResponse *response,
//         NSData *data,
//         NSError *error) {
//         if ([data length] >0 && error == nil){
//         //process the JSON response
//         //use the main queue so that we can interact with the screen
//         dispatch_async(dispatch_get_main_queue(), ^{
//         [self parseResponse:data];
//         });
//         }
//         else if ([data length] == 0 && error == nil){
//         NSLog(@"Empty Response, not sure why?");
//         }
//         else if (error != nil){
//         NSLog(@"Not again, what is the error = %@", error);
//         }
//         }];*/
//        
//        
//        NSURLResponse *response = nil;
//        NSError *error = nil;
//        //getting the data
//        NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
//        if ([newData length] >0 && error == nil){
//            //process the JSON response
//            //use the main queue so that we can interact with the screen
//            
//            [self parseResponse:newData];
//            
//        }
//        else if ([newData length] == 0 && error == nil){
//            NSLog(@"Empty Response, not sure why?");
//            [self showMessage:@"No response from host system"];
//        }
//        else if (error != nil){
//            NSLog(@"Not again, what is the error = %@", error);
//            
//            [self showError:error];
//            
//        }
//        
//        
//        
//        
//        
//        
//        
//        //
//        //            //back to the main thread for the UI call
//        //            dispatch_async(dispatch_get_main_queue(), ^{
//        //                [spinner stopAnimating];
//        //            });
//        //            });
//        
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in fetch onBoardData code %@ reason %@ " , [exception name], [exception reason]);
//    }
//    @finally {
//        
//        NSLog(@"finally in fetch onBoardData Code");
//    }
//    
//    
//   
//    
//    
//    
//}
//
//
//
//- (void) fetchonBoardData  {
//    
//    
//    @try {
//        
//        
//        
//        NSLog(@"fetch onBoardData %@",userid);
//        
//        
//        
//        //        //main thread
//        //        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//        //        [self.view addSubview:spinner];
//        //
//        //        //switch to background thread
//        //        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
//        //
//        //            //back to the main thread for the UI call
//        //            dispatch_async(dispatch_get_main_queue(), ^{
//        //                [spinner startAnimating];
//        //            });
//        
//        
//        
//        //string for the URL request
//        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/onBoardDataServlet";
//        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];//@"http://92.97.103.252:8081";
//        //create string for parameters that we need to send in the HTTP POST body
//        NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&methodAction=insertOnBoard",userid,sessionid];
//        
//        
//        //create a NSURL object from the string data
//        NSURL *myUrl = [NSURL URLWithString:myUrlString];
//        
//        //create a mutable HTTP request
//        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:myUrl];
//        //sets the receiver’s timeout interval, in seconds
//        [urlRequest setTimeoutInterval:120.0f];
//        //sets the receiver’s HTTP request method
//        [urlRequest setHTTPMethod:@"POST"];
//        //sets the request body of the receiver to the specified data.
//        [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
//        
//        //allocate a new operation queue
//        //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//        //Loads the data for a URL request and executes a handler block on an
//        //operation queue when the request completes or fails.
//        /*[NSURLConnection
//         sendAsynchronousRequest:urlRequest
//         queue:queue
//         completionHandler:^(NSURLResponse *response,
//         NSData *data,
//         NSError *error) {
//         if ([data length] >0 && error == nil){
//         //process the JSON response
//         //use the main queue so that we can interact with the screen
//         dispatch_async(dispatch_get_main_queue(), ^{
//         [self parseResponse:data];
//         });
//         }
//         else if ([data length] == 0 && error == nil){
//         NSLog(@"Empty Response, not sure why?");
//         }
//         else if (error != nil){
//         NSLog(@"Not again, what is the error = %@", error);
//         }
//         }];*/
//        
//        
//        NSURLResponse *response = nil;
//        NSError *error = nil;
//        //getting the data
//        NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
//        if ([newData length] >0 && error == nil){
//            //process the JSON response
//            //use the main queue so that we can interact with the screen
//            
//            [self parseResponse:newData];
//            
//        }
//        else if ([newData length] == 0 && error == nil){
//            NSLog(@"Empty Response, not sure why?");
//            [self showMessage:@"No response from host system"];
//        }
//        else if (error != nil){
//            NSLog(@"Not again, what is the error = %@", error);
//            
//            [self showError:error];
//            
//        }
//        
//        
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in fetch onBoardData code %@ reason %@ " , [exception name], [exception reason]);
//    }
//    @finally {
//        
//        NSLog(@"finally in fetch onBoardData Code");
//    }
//    
//    
//}
//
//
//- (void) parseResponse:(NSData *) data {
//    
//    
//    @try {
//        
//        
//        
//        NSLog(@"get customer info enterest %@",userid);
//        
//        
//        
//        NSString *myData = [[NSString alloc] initWithData:data
//                                                 encoding:NSUTF8StringEncoding];
//        NSLog(@"JSON data = %@", myData);
//        NSError *error = nil;
//        
//        //parsing the JSON response
//        id jsonObject = [NSJSONSerialization
//                         JSONObjectWithData:data
//                         options:NSJSONReadingAllowFragments
//                         error:&error];
//        if (jsonObject != nil && error == nil){
//            NSLog(@"Successfully deserialized...");
//            
//            //check if the customer code was valid
//            //userid = [jsonObject objectForKey:@"userid"];
//            sessionid = [jsonObject objectForKey:@"sessionid"];
//            
//            NSLog(@"userid print :%@",userid);
//            NSLog(@"sessionid print :%@",sessionid);
//            
//            
//            NSNumber *success = [jsonObject objectForKey:@"success"];
//            if([success boolValue] == YES){
//                
//                
//                
//                //set the customer object of the second view controller
//                dataDictionary =[jsonObject objectForKey:@"fetchonBoardData"];
//                
//                NSLog(@"Dictionary: %@", [dataDictionary description]);
//                
//                
//                for(NSString *key in [dataDictionary allKeys]) {
//                    NSLog(@"key code: %@",key);
//                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
//                    
//                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
//                    
//                }
//                
//                // Create a new array to hold the locations
//                onBoardArray = [[NSMutableArray alloc] init];
//                
//                // Get an array of dictionaries with the key "locations"
//                NSArray *array = [dataDictionary objectForKey:@"onBoardDataWrapper"];
//                // Iterate through the array of dictionaries
//                for(NSDictionary *dict in array) {
//                    // Create a new Location object for each one and initialise it with information in the dictionary
//                    onBoardData = [[OnBoardData alloc] initWithJSONDictionary:dict];
//                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
//                    
//                    // Add the Location object to the array
//                    [onBoardArray addObject:onBoardData];
//                }
//                
//                
//                NSLog(@"data count %lu",(unsigned long)onBoardArray.count);
//                
//                
//                
//                //                NSDictionary *customerMasterData = [dataDictionary objectForKey:@"Customer Master Data"];
//                //
//                //                for(NSString *key in [customerMasterData allKeys])
//                //                {
//                //                    NSLog(@"key code: %@",key);
//                //                    NSLog(@"key: %@",[customerMasterData objectForKey:key]);
//                //
//                //                    if ([key isEqualToString:@"Customer number"]) {
//                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
//                //                    }
//                //                    if ([key isEqualToString:@"Customer name"]) {
//                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
//                //                    }
//                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
//                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
//                //                    //}
//                //
//                //                }
//                
//                //NSDictionary *customerDetailData = [dataDictionary objectForKey:@"onBoardDataWrapper"];
//                
//                //NSLog(@"customerDetailData: %@", [customerDetailData description]);
//                
//                
//                
//                
//                //                for(NSString *key in [customerDetailData allKeys])
//                //                {
//                //                    NSLog(@"key code: %@",key);
//                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
//                //                    NSLog(@"value: %@",[customerDetailData valueForKey:key]);
//                //
//                //                }
//                
//                
//                //                accountName = [customerDetailData objectForKey:@"customerName"];
//                //                accountNumber= [customerDetailData objectForKey:@"accountNumber"];
//                //                accountCurrency= [customerDetailData objectForKey:@"accountCurrency"];
//                //                accountAvlBalance= [customerDetailData objectForKey:@"availableBalance"];
//                //                accountCurrentBalance= [customerDetailData objectForKey:@"currentBalance"];
//                //                onBoardDatatatus= [customerDetailData objectForKey:@"onBoardDatatatus"];
//                
//                
//                //                for(NSString *key in [customerDetailData allKeys])
//                //                {
//                //                    NSLog(@"key code: %@",key);
//                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
//                //
//                //                    if ([key isEqualToString:@"accountNumber"]) {
//                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
//                //                    }
//                //                    if ([key isEqualToString:@"Customer name"]) {
//                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
//                //                    }
//                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
//                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
//                //                    //}
//                //
//                //                }
//                
//                //NSMutableArray *custData = [[NSMutableArray alloc] initWithCapacity:0];
//                //                onBoardDataKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
//                //                onBoardDataValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
//                
//                
//                //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//                //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
//                
//                //                for (NSString *string in onBoardDataKeyData) {
//                //                    NSLog(@" array key data:%@", string);
//                //                }
//                //
//                //                for (NSString *string in onBoardDataValueData) {
//                //                    NSLog(@" array value data:%@", string);
//                //                }
//                
//                //for (NSDictionary *info in [customerInfo allValues])
//                //{
//                //   [custData addObject:[info valueForKey:@"custName"]];
//                //}
//                
//                //NSArray * values = [dictionary allValues];
//                //NSArray *keys = [dictionary allKeys];
//                //NSArray *values = [dictionary allValues];
//                //NSMutableArray *values = [[NSMutableArray alloc] initWithArray:[dictionary allValues]];
//                //NSMutableArray *yourArray = [NSMutableArray arrayWithCapacity:6];
//                //[yourDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
//                //    [yourArray addObject:obj];
//                //}];
//                
//                
//            }
//            else {
//                NSLog(@"Success is invalid...");
//                
//                [self showMessage:@"Invalid userid or sessionid !"];
//                
//                
//            }
//            
//        }
//        else{
//            
//            [self showError:error];
//            
//            
//            
//        }
//        
//        
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
//    }
//    @finally {
//        
//        NSLog(@"finally in parseResponse Code");
//    }
//    
//}
//
//
////- (void) displayHeader{
////    
////    
////    if(onBoardArray.count >0)
////    {
////        
////        onBoardData = [onBoardArray objectAtIndex:0];
////        
////        //capture first account details
////        //customerName=[NSString stringWithFormat:@"%@",onBoardData.customerName ];
////        //customerSegment=[NSString stringWithFormat:@"%@",onBoardData.customerSegment];
////        //NSLog(@" custname %@",customerName);
////        //NSLog(@" custseg %@",customerSegment);
////    }
////    
////    
////    UIView *headerView = [[UIView alloc] init];
////    headerView.layer.borderWidth=1.0;
////    headerView.layer.borderColor=[UIColor borderBlueColor].CGColor;
////    headerView.layer.shadowRadius=10.0;
////    headerView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor whiteColor];
////    headerView.layer.shadowOffset = CGSizeMake(0, 3);
////    headerView.layer.shadowRadius = 10.0;
////    headerView.layer.shadowColor = [UIColor blackColor].CGColor;
////    headerView.layer.shadowOpacity = 0.8;
////    headerView.layer.cornerRadius = 15.0;
////    //headerView.layer.doubleSided=YES;
////    headerView.translatesAutoresizingMaskIntoConstraints=NO;
////    [self.view addSubview:headerView];
////    
////    //create the frame that will contain our label
////    //CGRect labelFrame = CGRectMake(40, 60, 240, 80);
////    
////    NSLog(@" frame width %lf",headerView.bounds.size.width);
////    NSLog(@" frame height %lf",headerView.bounds.size.height);
////    
////    
//////    //CGRectMake(25, 90, 270, 100);
//////    //labelFrame.size.height = 00.0f;
//////    UILabel *lblCustomerName = [[UILabel alloc] init];//WithFrame:headerView.frame];
//////    lblCustomerName.textColor = [UIColor blackColor];
//////    //set the number of lines to contain a bigger text
//////    //lblCustomerName.numberOfLines = 2;
//////    //lblCustomerName.font = [UIFont italicSystemFontOfSize:12.0f];
//////    lblCustomerName.font = [UIFont boldSystemFontOfSize:14.0f];
//////    lblCustomerName.textAlignment =  NSTextAlignmentLeft;
//////    //lblCustomerName.layer.borderColor = [UIColor blackColor].CGColor;
//////    //lblCustomerName.layer.borderWidth = 1.0;
//////    if(onBoardArray.count >0)
//////    {
//////        lblCustomerName.text =[NSString stringWithFormat:@"%@",onBoardData.customerName];
//////    }
//////    lblCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
//////    [self.view addSubview:lblCustomerName];
////    
////    
////    
////    //move the frame position
////    //labelFrame.origin.y += labelFrame.size.height + 0.1f;
////    //headerView.bounds.origin.y +=  15.0f;
////    UILabel *lblCustomerSegment = [[UILabel alloc] init];//WithFrame:headerView.frame];
////    lblCustomerSegment.font = [UIFont boldSystemFontOfSize:14.0f];
////    lblCustomerSegment.textAlignment =  NSTextAlignmentLeft;
////    lblCustomerSegment.textColor = [UIColor blackColor];
////    //lblCustomerNumber.layer.borderColor = [UIColor blackColor].CGColor;
////    //lblCustomerNumber.layer.borderWidth = 1.0;
////    
//////    if(onBoardArray.count >0)
//////    {
//////        lblCustomerSegment.text = [NSString stringWithFormat:@"%@",onBoardData.customerSegment];
//////    }
////    lblCustomerSegment.translatesAutoresizingMaskIntoConstraints=NO;
////    [self.view addSubview:lblCustomerSegment];
////    
////    
////    //---header UIView
////    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.45 constant:0]];
////    
////    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
////    
////    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
////    
////    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
////    
////    
////    //----customer name
////    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.9 constant:0]];
////    
////    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
////    //-----customer segement
////    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerSegment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
////    
////    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerSegment attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
////    
////    
////    
////    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.80 constant:0]];
////    //
////    
////    //    //labelFrame.origin.y += labelFrame.size.height + 1.0f;
////    //    labelFrame.origin.y +=  20.0f;
////    //    UILabel *lblavalBalance  = [[UILabel alloc] initWithFrame:labelFrame];
////    //    lblavalBalance.textColor = [UIColor blackColor];
////    //    lblavalBalance.text = [NSString stringWithFormat:@"Available Balance    %@",availableBalance];
////    //    //set the number of lines to 0, meaning use as many lines as needed
////    //    lblavalBalance.numberOfLines = 0;
////    //    //lblavalBalance.font = [UIFont fontWithName:@"Arial-Bold" size:12.0f];
////    //    lblavalBalance.font = [UIFont boldSystemFontOfSize:12.0f];
////    //    lblavalBalance.textAlignment =  NSTextAlignmentLeft;
////    //    //lblavalBalance.layer.borderColor = [UIColor blackColor].CGColor;
////    //    //lblavalBalance.layer.borderWidth = 1.0;
////    //    //Resizes and moves the receiver view so it just encloses its subviews.
////    //    //watch the border of the frame in this example
////    //    //[lblavalBalance sizeToFit];
////    //    [self.view addSubview:lblavalBalance];
////    
////}
////
////
//-(void) displayMessage:(NSError *) error{
//    
//    UIAlertController * alertController=   [UIAlertController
//                                            alertControllerWithTitle:@"message"
//                                            message:@"Unable to connect to server, please try again"
//                                            preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* okAction = [UIAlertAction
//                               actionWithTitle:@"OK"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action)
//                               {
//                                   //Do some thing here
//                                   [self.navigationController popViewControllerAnimated:YES];
//                                   
//                               }];
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
//    
//    
//    
//    
//}
//
//
//- (void)addItemViewController:(PopoverViewController *)controller didFinishEnteringItem:(NSString *)item  didFinishEnteringItem1:(NSString *)code didFinishEnteringItem2:(int)fieldTag
//{
//    //NSLog(@"This was returned from PopoverViewController %ld", (long)fieldTag);
//   // NSArray *components = [item componentsSeparatedByString:@"\n"];
//    //NSLog(@" popvalues %@", components[0]);
// 
//    
//    id viewObj = [self.view viewWithTag:(long)fieldTag];
//    
//    if([viewObj isKindOfClass:[UITextField class]])
//    {
//        UITextField *textField =(UITextField *)viewObj;
//        textField.text=item;
//        //[dataArray insertObject:code atIndex:fieldTag];
//    }
//    
//    
//    
//}
//
//- (void)changeSwitch:(id)sender{
//    if([sender isOn]){
//        switchFlag=@"Y";
//        NSLog(@"Switch is ON");
//    } else{
//        switchFlag=@"N";
//        NSLog(@"Switch is OFF");
//    }
//}
//
//-(void)countdownTimer{
//    
//    secondsLeft = hours = minutes = seconds = 0;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
//    
//}
//
//- (void)updateCounter:(NSTimer *)theTimer {
//    if(secondsLeft > 0 ){
//        secondsLeft -- ;
//        hours = secondsLeft / 3600;
//        minutes = (secondsLeft % 3600) / 60;
//        seconds = (secondsLeft %3600) % 60;
//        self.timerView.font=[UIFont systemFontOfSize:45.0f];
//        self.timerView.textColor=[UIColor brownColor];
//        self.timerView.textAlignment=NSTextAlignmentCenter;
//        self.timerView.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
//    }
//    else{
//        secondsLeft = 16925;
//    }
//}
//
//-(void)displayGraph
//{
//    
//    webView = [[UIWebView alloc] init];//]WithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
//    webView.tag=55;
//    webView.delegate = self;
//    webView.layer.borderWidth=1.0;
//    webView.layer.borderColor=[UIColor whiteColor].CGColor;
//    webView.layer.shadowRadius=10.0;
//    webView.backgroundColor = [UIColor whiteColor];
//    webView.layer.shadowOffset = CGSizeMake(0, 3);
//    webView.layer.shadowRadius = 10.0;
//    webView.layer.shadowColor = [UIColor blackColor].CGColor;
//    webView.layer.shadowOpacity = 0.8;
//    webView.layer.cornerRadius = 15.0;
//    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"www"]];
//    [webView loadRequest:[NSURLRequest requestWithURL:url]];
//    webView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:webView];
//    
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.6 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.70 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.25 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    
//}
//
//- (void)webViewDidFinishLoad:(UIWebView *)webView
//{
//    
//    NSString* json;
//    
//    
//    //NSLog(@"array count %ld",(unsigned long)projectsSummaryArray.count);
//    
//    
//    NSMutableDictionary *jsonDictionary = [[NSMutableDictionary alloc]init];
//    
////    for (int i=0; i<=projectsSummaryArray.count-1; i++) {
////        
////        projectsSummary = [projectsSummaryArray objectAtIndex:i];
////        
////        NSLog(@"business unit1 %@",projectsSummary.overallStatus);
////        
////        [jsonDictionary setObject:projectsSummary.projectsByOverallStatus forKey:projectsSummary.overallStatus];
////        
////        
////    }
//    
//    
//    NSError *errorOut;
//    NSString *jsonString;
//    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
//                                                       options:NSJSONWritingPrettyPrinted
//                                                         error:&errorOut];
//    
//    if (! jsonData) {
//        NSLog(@"Got an error in json creation chart: %@", errorOut);
//    } else {
//        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
//    }
//    
//    NSLog(@"jsondata %@",jsonString);
//    
//    //NSString *json = [NSString stringWithFormat:@"On Track:%@,Delayed:%@",projects.onTrackProjects,projects.delayedProjects];
//    
//    //NSLog(@"graph json %@",json);
//    
//    json = [NSString stringWithFormat:@ "loadDashboardChart(%@);",jsonString];
//    
//    NSLog(@"function json %@",json);
//    [self.webView stringByEvaluatingJavaScriptFromString: json];
//}
//
//
//-(void)didReceiveMemoryWarning
//{
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
//-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
//{
//    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
//    return [sObj valueForKey:InstVar];
//}
//
//-(void) logout:(id) sender
//{
//    
//    [self.navigationController popToRootViewControllerAnimated:YES];
//    return;
//}
//
//
//-(void) showMessage:(NSString *) msg{
//    
//    UIAlertController * alertController=   [UIAlertController
//                                            alertControllerWithTitle:@"message"
//                                            message:msg
//                                            preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* okAction = [UIAlertAction
//                               actionWithTitle:@"OK"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action)
//                               {
//                                   //Do some thing here
//                                   //[self.navigationController popViewControllerAnimated:YES];
//                                   
//                               }];
//    
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
//    
//    
//    
//}
//
//-(void) showError:(NSError *) error{
//    
//    //[NSString stringWithFormat:@"%ld,%@",(long)error.code,error.description]
//    
//    UIAlertController * alertController=   [UIAlertController
//                                            alertControllerWithTitle:@"error"
//                                            message:error.debugDescription
//                                            preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* okAction = [UIAlertAction
//                               actionWithTitle:@"OK"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action)
//                               {
//                                   //Do some thing here
//                                   //[self.navigationController popViewControllerAnimated:YES];
//                                   
//                               }];
//    
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
//    
//    
//    
//    
//}
//
//
//-(void) loadActivityIndicator
//{
//    //----activity indicator
//    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
//    
//    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
//    activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
//    activityIndicator.hidden=NO;
//    activityIndicator.color=[UIColor borderBlueColor];
//    [activityIndicator setHidesWhenStopped:YES];
//    
//    
//    
//    //-----label loading----
//    lblLoading = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height+30.0f)];
//    lblLoading.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    lblLoading.font = [UIFont boldSystemFontOfSize:12.0f];
//    lblLoading.numberOfLines = 1;
//    lblLoading.textAlignment=NSTextAlignmentCenter;
//    lblLoading.backgroundColor = [UIColor clearColor];
//    lblLoading.textColor = [UIColor borderBlueColor];
//    
//    
//    [self.view addSubview:lblLoading];
//    [self.view bringSubviewToFront:lblLoading];
//    [lblLoading addSubview:activityIndicator];
//    
//}
//
//-(void)startActivityIndicator
//{
//    lblLoading.text = @"Loading...";
//    activityIndicator.hidden=NO;
//    [activityIndicator startAnimating];
//    
//    
//}
//
//-(void)stopActivityIndicator
//{
//    lblLoading.text = @"";
//    [activityIndicator stopAnimating];
//    activityIndicator.hidden=YES;
//    
//    
//}
//
//
//
//@end
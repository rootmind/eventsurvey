//
//  FatcaViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 09/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "OnBoardData.h"
#import "PopoverData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "FatcaViewController.h"





@interface FatcaViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblConstraintFatX1=0.52f;
CGFloat lblConstraintFatY1=1.0f;
CGFloat lblConstraintFatWidth1=0.5f;
CGFloat lblConstraintFatHeight1=0.8f;

CGFloat constraintFatX1=1.19f;
CGFloat constraintFatY1=1.0f;
CGFloat constraintFatWidth1=0.80f;
CGFloat constraintFatHeight1=0.8f;

CGFloat constraintFat1X1=0.69f;
CGFloat constraintFat1Y1=1.0f;
CGFloat constraintFat1Width1=0.3f;
CGFloat constraintFat1Height1=0.8f;

CGFloat lblConstraintFat2X1=1.52f;
CGFloat lblConstraintFat2Y1=1.0f;
CGFloat lblConstraintFat2Width1=0.5f;
CGFloat lblConstraintFat2Height1=0.8f;

CGFloat constraintFat2X1=1.69f;
CGFloat constraintFat2Y1=1.0f;
CGFloat constraintFat2Width1=0.3f;
CGFloat constraintFat2Height1=0.8f;




@implementation FatcaViewController




@synthesize userid;
@synthesize sessionid;
@synthesize actionMode;

//@synthesize onBoardDataKeyData;
//@synthesize onBoardDataValueData;
@synthesize dataDictionary;



@synthesize onBoardArray;
@synthesize onBoardData;


@synthesize dateToolBar;
@synthesize datePicker;

//@synthesize labelArray;
//@synthesize labelNameArray;
//@synthesize label2Array;
//@synthesize labelName2Array;
//@synthesize componentsArray;
//@synthesize componentsNameArray;
//@synthesize components2Array;
//@synthesize componentsName2Array;
@synthesize dataArray;

@synthesize webView;
@synthesize activityIndicator;
@synthesize lblLoading;

@synthesize timerView;
@synthesize switchFlag;

int hours, minutes, seconds,secondsLeft;



@synthesize txtAccClassif;
@synthesize txtOtherNationality;
@synthesize txtCountryOfBirth;
@synthesize txtUsTaxpayer;
@synthesize txtResUSMailAdd;
@synthesize txtUSMailAdd1;
@synthesize txtUSMailAdd2;
@synthesize txtUSMailAddPOBox;
@synthesize txtUSMailAddPhone;
@synthesize txtOwnerUSTelePhNo;
@synthesize txtUsCountryCode;
@synthesize txtPhoneNo;
@synthesize txtOwnerUSProp;
@synthesize txtOwnerUSPropPOBox;
@synthesize txtOwnerUSPropPhoneNo;
@synthesize txtUsPropAdd1;
@synthesize txtUsPropAdd2;
@synthesize txtUsPropAdd3;
@synthesize txtUBOAddUS;
@synthesize txtUBOAddUSAdd1;
@synthesize txtUBOAddUSAdd2;
@synthesize txtUBOAddUSAdd3;
@synthesize txtUBOAddUSPhone;
@synthesize txtUBOAddUSPOBox;
@synthesize txtSignAuthAddUS;
@synthesize txtSignUSAdd1;
@synthesize txtSignUSAdd2;
@synthesize txtSignUSAdd3;
@synthesize txtSignUSAddPhone;
@synthesize txtSignUSAddPOBox;
@synthesize txtUsGreenCardHolder;
@synthesize txtGreenCardNumber;
@synthesize txtUsSSNHolder;
@synthesize txtUsSSN;
@synthesize txtSIUSBenificiary;
@synthesize txtSIAmount;
@synthesize txtSIFrequency;
@synthesize txtSIBenefName;
@synthesize txtSIAccNo;
@synthesize txtSIBranchCode;
@synthesize txtSIBankName;
@synthesize txtBusinessIncomeUS;
@synthesize txtWRecipt;
@synthesize txtBSWaiver;
@synthesize txtListedSExchange;
@synthesize txtTin;
@synthesize txtFatcaEntity;





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    [self.navigationItem setHidesBackButton:NO animated:YES];
    
//    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
//    [self.splitViewController.displayModeButtonItem action];
    
    self.navigationItem.title=@"Fatca Detaills";
    
    /*UIImageView *wallet =[[UIImageView alloc] initWithFrame:CGRectMake(50,50,80,80)];
     wallet.image=[UIImage imageNamed:@"money-wallet-icon.png"];
     wallet.contentMode=UIViewContentModeCenter;
     wallet.layer.masksToBounds=YES;
     [wallet.layer setBorderColor:[UIColor grayColor].CGColor];
     [wallet.layer setBorderWidth:2.0f];
     [wallet.layer setCornerRadius:15.0f];
     [wallet.layer setShadowColor:[UIColor grayColor].CGColor];
     [self.view addSubview:wallet];*/
    
    //UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,150,20)];
    //    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,20,40)];
    //    companyLogo.image=[UIImage imageNamed:@"logo_MobileBanker1.png"];
    //    companyLogo.contentMode = UIViewContentModeScaleAspectFit;
    //    companyLogo.clipsToBounds = NO;
    //    companyLogo.layer.masksToBounds=NO;
    //[self.view addSubview:companyLogo];
    
    ////self.navigationItem.titleView=companyLogo;
    
    //self.navigationItem.title=@"Account Summary";
    
    
    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(callHost)];
    
    self.navigationItem.rightBarButtonItem =rightNavButton ;
    
    
    //    UIImageView *companyLogo =[[UIImageView alloc] initWithFrame:CGRectMake(70,50,50,20)];
    //    companyLogo.image=[UIImage imageNamed:@"Mashreq_logo.png"];
    //    //companyLogo.contentMode=UIViewContentModeCenter;
    //    companyLogo.contentMode = UIViewContentModeScaleToFill;
    //    companyLogo.clipsToBounds = NO;
    //    //[self.view addSubview:companyLogo];
    //
    //    //self.navigationItem.titleView=companyLogo;
    
    
    
    //    CALayer *sublayerHeader = [CALayer layer];
    //    sublayerHeader.backgroundColor = [UIColor whiteColor].CGColor;
    //    sublayerHeader.shadowOffset = CGSizeMake(0, 3);
    //    sublayerHeader.shadowRadius = 10.0;
    //    sublayerHeader.shadowColor = [UIColor blackColor].CGColor;
    //    sublayerHeader.shadowOpacity = 0.8;
    //    sublayerHeader.cornerRadius = 30.0;
    //    //sublayerHeader.frame = CGRectMake(30, 80, 270, 100);
    //    sublayerHeader.bounds=headerView.bounds;
    //    [self.view.layer addSublayer:sublayerHeader];
    
    
    
    
    
    
    
    //UIImageView *card =[[UIImageView alloc] initWithFrame:CGRectMake(200,50,50,50)];
    //card.image=[UIImage imageNamed:@"Finance-Card-In-Use-icon.png"];
    //card.contentMode=UIViewContentModeCenter;
    //[self.view addSubview:card];
    
    //[self fetchonBoardData];
    
    
    UIView *screenView = [[UIView alloc] init];
    screenView.layer.borderWidth=1.0;
    screenView.layer.borderColor=[UIColor whiteColor].CGColor;
    screenView.layer.shadowRadius=10.0;
    screenView.backgroundColor = [UIColor whiteColor];
    screenView.layer.shadowOffset = CGSizeMake(0, 3);
    screenView.layer.shadowRadius = 10.0;
    screenView.layer.shadowColor = [UIColor blackColor].CGColor;
    screenView.layer.shadowOpacity = 0.8;
    screenView.layer.cornerRadius = 15.0;
    screenView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:screenView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.90 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.70 constant:0]];
    
    
    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tableView.delegate = self;
    tableView.dataSource = self;
    //tableView.frame = CGRectMake(30,200,270,300);
    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
    tableView.layer.borderWidth=1.0f;
    tableView.layer.borderColor=[UIColor whiteColor].CGColor;
    tableView.layer.cornerRadius=15.0f;
    //tableView.allowsSelection = NO;
    tableView.alwaysBounceVertical = NO;
    tableView.contentInset = UIEdgeInsetsMake(-70, 0, 0, 0);
    
    
    tableView.sectionHeaderHeight = 0.0;
    tableView.sectionFooterHeight = 0.0;
    tableView.rowHeight=UITableViewAutomaticDimension;
    
    
    //self.edgesForExtendedLayout = UIRectEdgeNone;
    
    //    CGRect titleRect = CGRectMake(0, 0, 100, 20);
    //    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
    //    tableTitle.textColor = [UIColor captionColor];
    //    tableTitle.backgroundColor = [tableView backgroundColor];
    //    tableTitle.opaque = YES;
    //    tableTitle.font = [UIFont boldSystemFontOfSize:14];
    //    tableTitle.textAlignment=NSTextAlignmentCenter;
    //    tableTitle.text = @"onBoardData";
    //    //tableTitle.translatesAutoresizingMaskIntoConstraints=NO;
    //    tableView.tableHeaderView = tableTitle;
    
    //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
    //[tableView setSeparatorColor:[UIColor whiteColor]];
    tableView.separatorInset=UIEdgeInsetsZero;
    //tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    
    
    // add to canvas
    tableView.translatesAutoresizingMaskIntoConstraints=NO;
    [screenView addSubview:tableView];
    
    
    
    //[self drawRect:titleRect];
    //
    
    // important! without this line it does not work!
    //[tableView setBackgroundView:[[UIView alloc] init]];
    // set plain background color
    //[tableView setBackgroundColor:[UIColor colorWithRed:0.69 green:0.81 blue:0.79 alpha:1.0]];
    // remove seperator color
    
    
    
    //tableView.contentInset = UIEdgeInsetsMake(-1.0f, 0.0f, 0.0f, 0.0);
    
    //    CGRect frame = tableView.tableHeaderView.frame;
    //    frame.size.height = 1;
    //    UIView *headerView = [[UIView alloc] initWithFrame:frame];
    //    [tableView setTableHeaderView:headerView];
    
    
    
    
    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:screenView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    
    
    //    labelNameArray=[[NSMutableArray alloc] initWithObjects:@"Existing Customer",@"Existing Relation",@"Relationship No",@"Title",@"Category Type",@"Customer Name",@"eName Check Flag",@"eName Performed By",@"eName Performed Date",@"Name Match",@"eName Performed Name",@"eName Result",@"eName Comment",@"Short Name",@"Branch",@"Joint Own",@"Nature of Relation",@"Residence Status",@"Nationality",@"Date of Birth",@"Education",@"Marital Status",@"Gender",@"Preferred Language",@"Family in UAE",@"Family Size",@"Car Ownership",@"Car Year",@"Media",@"Favourite City",@"Domicile",@"Passport No",@"Passport Issue Date",@"Passport Expiry Date",@"Passport Issue Place",@"Passport Issue Country",@"Immigration File Number",@"Visa Issue Place",@"Visa Issue Date",@"Visa Expiry Date",@"Driving License No",@"Driving Lic Exp Date",@"Labour Card No",@"Labour Card Exp Date",@"Emirates Id",@"EmiratesId Exp Date",@"Guardian Name",@"Intro Name",@"Intro Account No",@"Intro Customer Type",@"Intro Segment",@"Intro Industry",@"Intro Busi Group",@"Intro Branch",@"Intro Geography",@"Intro RMId",@"Intro SSO", nil];
    //
    //
    //    labelName2Array=[[NSMutableArray alloc] initWithObjects:@"Existing Customer",@"Existing Relation",@"Relationship No",@"Title",@"Category Type",@"Customer Name",@"eName Check Flag",@"eName Performed By",@"eName Performed Date",@"Name Match",@"eName Performed Name",@"eName Result",@"eName Comment",@"Short Name",@"Branch",@"Joint Own",@"Nature of Relation",@"Residence Status",@"Nationality",@"Date of Birth",@"Education",@"Marital Status",@"Gender",@"Preferred Language",@"Family in UAE",@"Family Size",@"Car Ownership",@"Car Year",@"Media",@"Favourite City",@"Domicile",@"Passport No",@"Passport Issue Date",@"Passport Expiry Date",@"Passport Issue Place",@"Passport Issue Country",@"Immigration File Number",@"Visa Issue Place",@"Visa Issue Date",@"Visa Expiry Date",@"Driving License No",@"Driving Lic Exp Date",@"Labour Card No",@"Labour Card Exp Date",@"Emirates Id",@"EmiratesId Exp Date",@"Guardian Name",@"Intro Name",@"Intro Account No",@"Intro Customer Type",@"Intro Segment",@"Intro Industry",@"Intro Busi Group",@"Intro Branch",@"Intro Geography",@"Intro RMId",@"Intro SSO", nil];
    //
    //    componentsNameArray=[[NSMutableArray alloc]initWithObjects:@"Existing Customer",@"Select Existing Relation",@"Enter Relationship No",@"Title",@"Category Type",@"Enter Customer Name",@"eName Check Flag",@"eName Performed By",@"eName Performed Date",@"Name Match",@"eName Performed Name",@"eName Result",@"eName Comment",@"Enter Short Name",@"Branch",@"Select Joint Own",@"Nature of Relation",@"Enter Residence Status",@"Nationality",@"Enter DOB",@"Education",@"Select Martial Status",@"Gender",@"Select Preferred Language",@"Family in UAE",@"Family Size",@"Car Ownership",@"Car Year",@"Media",@"Favourite City",@"Domicile",@"Passport No",@"Passport Issue Date",@"Passport Expiry Date",@"Passport Issue Place",@"Passport Issue Country",@"Immigration File Number",@"Visa Issue Place",@"Visa Issue Date",@"Visa Expiry Date",@"Driving License No",@"Driving Lic Exp Date",@"Labour Card No",@"Labour Card Exp Date",@"Emirates Id",@"EmiratesId Exp Date",@"Guardian Name",@"Intro Name",@"Intro Account No",@"Intro Customer Type",@"Intro Segment",@"Intro Industry",@"Intro Busi Group",@"Intro Branch",@"Intro Geography",@"Intro RMId",@"Intro SSO",  nil];
    //
    //
    //    componentsName2Array=[[NSMutableArray alloc]initWithObjects:@"Existing Customer",@"Select Existing Relation",@"Enter Relationship No",@"Title",@"Category Type",@"Enter Customer Name",@"eName Check Flag",@"eName Performed By",@"eName Performed Date",@"Name Match",@"eName Performed Name",@"eName Result",@"eName Comment",@"Enter Short Name",@"Branch",@"Select Joint Own",@"Nature of Relation",@"Enter Residence Status",@"Nationality",@"Enter DOB",@"Education",@"Select Martial Status",@"Gender",@"Select Preferred Language",@"Family in UAE",@"Family Size",@"Car Ownership",@"Car Year",@"Media",@"Favourite City",@"Domicile",@"Passport No",@"Passport Issue Date",@"Passport Expiry Date",@"Passport Issue Place",@"Passport Issue Country",@"Immigration File Number",@"Visa Issue Place",@"Visa Issue Date",@"Visa Expiry Date",@"Driving License No",@"Driving Lic Exp Date",@"Labour Card No",@"Labour Card Exp Date",@"Emirates Id",@"EmiratesId Exp Date",@"Guardian Name",@"Intro Name",@"Intro Account No",@"Intro Customer Type",@"Intro Segment",@"Intro Industry",@"Intro Busi Group",@"Intro Branch",@"Intro Geography",@"Intro RMId",@"Intro SSO",  nil];
    //
    
    switchFlag=@"N";
    
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
    //        CommonLabel *commonLabel=[[CommonLabel alloc]init];
    //        commonLabel.text=[labelNameArray objectAtIndex:i];
    //        //commonLabel.tag=i;
    //        //commonLabel.textColor=[UIColor blackColor];
    //        commonLabel.translatesAutoresizingMaskIntoConstraints=NO;
    //        [labelArray insertObject:commonLabel atIndex:i];
    //
    //
    //        CommonTextField *commonTextField = [[CommonTextField alloc] init];
    //        commonTextField.tag=100+i;
    //        commonTextField.delegate=self;
    //        commonTextField.placeholder=[componentsNameArray objectAtIndex:i];
    //        commonTextField.translatesAutoresizingMaskIntoConstraints=NO;
    //        [componentsArray insertObject:commonTextField atIndex:i];
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
    
    //dataArray =[[NSMutableArray alloc]initWithCapacity:500];
    
    timerView = [[UILabel alloc] init];
    timerView.layer.borderWidth=1.0;
    timerView.layer.borderColor=[UIColor whiteColor].CGColor;
    timerView.layer.shadowRadius=10.0;
    timerView.backgroundColor = [UIColor whiteColor];
    timerView.layer.shadowOffset = CGSizeMake(0, 3);
    timerView.layer.shadowRadius = 10.0;
    timerView.layer.shadowColor = [UIColor blackColor].CGColor;
    timerView.layer.shadowOpacity = 0.8;
    timerView.layer.cornerRadius = 15.0;
    timerView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:timerView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.35 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    secondsLeft = 16925;
    [self countdownTimer];
    
    
    UIButton *enameView = [[UIButton alloc] init];
    enameView.layer.borderWidth=1.0;
    enameView.layer.borderColor=[UIColor whiteColor].CGColor;
    enameView.layer.shadowRadius=10.0;
    enameView.backgroundColor = [UIColor whiteColor];
    enameView.layer.shadowOffset = CGSizeMake(0, 3);
    enameView.layer.shadowRadius = 10.0;
    enameView.layer.shadowColor = [UIColor blackColor].CGColor;
    enameView.layer.shadowOpacity = 0.8;
    enameView.layer.cornerRadius = 15.0;
    enameView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:enameView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    UIButton *dedupView = [[UIButton alloc] init];
    dedupView.layer.borderWidth=1.0;
    dedupView.layer.borderColor=[UIColor whiteColor].CGColor;
    dedupView.layer.shadowRadius=10.0;
    dedupView.backgroundColor = [UIColor whiteColor];
    dedupView.layer.shadowOffset = CGSizeMake(0, 3);
    dedupView.layer.shadowRadius = 10.0;
    dedupView.layer.shadowColor = [UIColor blackColor].CGColor;
    dedupView.layer.shadowOpacity = 0.8;
    dedupView.layer.cornerRadius = 15.0;
    dedupView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:dedupView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:dedupView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    [self displayGraph];
    
    
    
    
    
    
    
    
    //[self displayHeader];
    
    
    
    
    
    //self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", accountName.count];
    
    
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    //    if (textField == self.txtCustomerName) {
    //        [textField resignFirstResponder];
    //        return NO;
    //    }
    //
    //    if (textField == self.txtShortName) {
    //        [textField resignFirstResponder];
    //        return NO;
    //    }
    //    if (textField == self.txtJointOwn) {
    //        [textField resignFirstResponder];
    //        return NO;
    //    }
    //    if (textField == self.txtNationality) {
    //        [textField resignFirstResponder];
    //        return NO;
    //    }
    //    if (textField == self.txtDOB) {
    //        [textField resignFirstResponder];
    //        return NO;
    //    }
    
    [textField resignFirstResponder];
    
    if(textField.tag==7)
    {
        return NO;
    }
    else
        
        return YES;
}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    // Prevent crashing undo bug – see note below.
    if(range.length + range.location > textField.text.length)
    {
        return NO;
    }
    
    if (textField.tag == 0) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    
    //    if (textField == self.self.txtSalary) {
    //
    //        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    //
    //        // allow backspace
    //        if (range.length > 0 && [string length] == 0) {
    //            return YES;
    //        }
    //        // do not allow . at the beggining
    //        if (range.location == 0 && [string isEqualToString:@"."]) {
    //            return NO;
    //        }
    //        // set the text field value manually
    //        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
    //        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
    //        textField.text = newValue;
    //        // return NO because we're manually setting the value
    //        return NO;
    //    }
    //    return YES;
    
    return YES;
    
}


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    
    //    if ([textField isEqual: txtDOB])
    //    {
    //        [self setDate:txtDOB];
    //        return NO;
    //
    //    }
    //    else if([textField isEqual:txtNationality])
    //    {
    //        [self popoverData:txtNationality:@"NATIONALITY"];
    //        return NO; //to disable keyboard
    //    }
    //    else if([textField isEqual:txtJointOwn])
    //    {
    //        [self popoverData:txtJointOwn:@"JOINTOWN"];
    //        return NO; //to disable keyboard
    //    }
    
    //NSLog(@"fieldTag %ld", (long)textField.tag);
    
    
    //Passport Expiry Date
    if(textField.tag==3)
    {
        [self popoverData:textField :@"Y"];
        return NO; //to disable keyboard
    }
    //
    else if(textField.tag==4)
    {
        [self popoverData:textField :@"Y"];
        return NO; //to disable keyboard
    }
    else if(textField.tag==8)
    {
        [self popoverData:textField :@"Y"];
        return NO; //to disable keyboard
    }
    else if(textField.tag==9)
    {
        [self popoverData:textField :@"Y"];
        return NO; //to disable keyboard
    }
    else if(textField.tag==11)
    {
        [self popoverData:textField :@"Y"];
        return NO; //to disable keyboard
    }
    else if(textField.tag==13)
    {
        [self popoverData:textField :@"Y"];
        return NO; //to disable keyboard
    }
    else if(textField.tag==15)
    {
        [self popoverData:textField :@"Y"];
        return NO; //to disable keyboard
    }    else
        return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
    
    
}



-(void) setDate:(UITextField *)textField
{
    
    
    
    //UITextField *textField =(UITextField *)sender;
    NSLog(@"fieldTag1 %ld", (long)textField.tag);
    
    datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,44,0, 0)];
    textField.delegate=self;
    datePicker.hidden=NO;
    //[datePicker setDate:[NSDate date]];
    datePicker.datePickerMode = UIDatePickerModeDate;
    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
    [textField setInputView:datePicker];
    
    
    
    dateToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
    [dateToolBar setBarStyle:UIBarStyleDefault];
    [dateToolBar sizeToFit];
    
    
    UIBarButtonItem* flexButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace    target:self  action:nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self  action:@selector(donePicker)];
    NSArray* barItems = [NSArray arrayWithObjects:flexButton,doneButton, nil];
    [dateToolBar setItems:barItems animated:YES];
    
    textField.inputAccessoryView=dateToolBar;
    
    
    
}

-(void)donePicker
{
    
    [dateToolBar removeFromSuperview];
    [datePicker removeFromSuperview];
    
    
    
}

-(void) dateTextField:(UITextField *)sender
{
    
    NSLog(@"fieldTag2 %ld", (long)sender.tag);
    
    //UITextField *textField = (UITextField *)sender;
    UIDatePicker *picker = (UIDatePicker*)sender.inputView;
    [picker setMaximumDate:[NSDate date]];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    [dateFormat setDateFormat:@"dd/MM/yyyy"];
    
    NSString *dateString = [dateFormat stringFromDate:eventDate];
    sender.text = [NSString stringWithFormat:@"%@",dateString];
}


-(void) popoverData: (UITextField *)sender :(NSString *)dateField
{
    
    PopoverViewController *popoverViewController = [[PopoverViewController alloc]initWithNibName:nil bundle:nil];
    //popoverViewController.actionCode=actionCode;
    popoverViewController.dateField=dateField;
    popoverViewController.fieldTag=(int)sender.tag;
    popoverViewController.delegate=self;
    
    
    // Present the view controller using the popover style.
    popoverViewController.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:popoverViewController animated: YES completion: nil];
    
    // Get the popover presentation controller and configure it.
    UIPopoverPresentationController *presentationController =[popoverViewController popoverPresentationController];
    presentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    presentationController.sourceView = self.view;
    NSLog(@"x %f and y %f %@",sender.frame.origin.x,sender.frame.origin.y,sender.class);
    presentationController.sourceRect =  CGRectMake(0, sender.frame.origin.y, 1, 1);
    

    
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
    
}



- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
    
    [self animateTextField: textField up: NO];
    
    
    
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = textField.frame.origin.y / 2;//80; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return 20;//[componentsArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//
//    return 50;
//
//}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    
    if(section == 0)
    {
        
        return @" FATCA Details";
        
    }
    
    
    else
        
        return nil;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    if(section ==0)
//    {
//        return 0.00f;
//    }
//    return 10.0f;
//}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    return nil;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    
    return nil;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    /*if ((indexPath.row % 2) == 1) {
     cell.backgroundColor = [UIColor grayColor];
     //cell.textLabel.backgroundColor = [UIColor blackColor];
     cell.selectionStyle = UITableViewCellSelectionStyleGray;
     }
     else
     {
     cell.backgroundColor = [UIColor whiteColor];
     
     }*/
    
    cell.backgroundColor=[UIColor whiteColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor lightGrayColor];
    //cell.layer.borderWidth=0.5f;
    //cell.layer.cornerRadius=15.0f;
    cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    //cell.layer.borderColor=[UIColor borderColor].CGColor;
    //cell.layer.shadowRadius=3.0f;
    //cell.layer.shadowOffset = CGSizeMake(0, 3);
    //cell.layer.shadowColor = [UIColor blackColor].CGColor;
    //cell.layer.shadowOpacity = 0.8;
    
    
    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
    
    UIFont *myFont = [UIFont boldSystemFontOfSize:14.0f];//[ UIFont fontWithName: @"Arial-BoldMT" size: 14.0 ];
    cell.textLabel.font  = myFont;
    //cell.textLabel.textColor=[UIColor blueColor];
    UIFont *mySecondFont = [UIFont boldSystemFontOfSize:10.0f]; //[ UIFont fontWithName: @"Arial-BoldMT" size: 12.0 ];
    cell.detailTextLabel.font  = mySecondFont;
    //cell.detailTextLabel.textColor=[UIColor blueColor];
    
    
    //top shadow
    //UIView *topShadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 10)];
    //CAGradientLayer *topShadow = [CAGradientLayer layer];
    //topShadow.frame = CGRectMake(0, 0, tableView.bounds.size.width, 10);
    //topShadow.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithWhite:0.0 alpha:0.25f] CGColor], (id)[[UIColor clearColor] CGColor], nil];
    //[topShadowView.layer insertSublayer:topShadow atIndex:0];
    
    //[cell.contentView addSubview:topShadowView];
    
    
    
    //UIImageView *imv = [[UIImageView alloc]initWithFrame:CGRectMake(3,2, 20, 25)];
    //imv.image=[UIImage imageNamed:@"money-wallet-icon.png"];
    //    cell.imageView.image=[[UIImage imageNamed:@"account-sum-icon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    
    //    CAGradientLayer *gradient = [CAGradientLayer layer];
    //    gradient.frame = cell.bounds;
    //    gradient.layer.cornerRadius=10.0f;
    //    gradient.color=[UIColor whiteColor];
    //    //gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor whiteColor]CGColor], (id)[[UIColor redColor]CGColor], nil];
    //    [cell.layer addSublayer:gradient];
    
    
    //[cell addSubview:imv];
    
    
    //NSLog(@"table view%ldd",(long) indexPath.row);//[custKeyData objectAtIndex:indexPath.row]);
    //NSLog(@"table view%ldd",(long) indexPath.section);
    
    
    //    cell.textLabel.text =[NSString stringWithFormat:@"%@",[self.accountName objectAtIndex:indexPath.row]];
    //    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@         %@   %@",[self.accountNumber objectAtIndex:indexPath.row],[self.accountCurrency objectAtIndex:indexPath.row],[self.accountCurrentBalance objectAtIndex:indexPath.row]];
    
    //onBoardData = [onBoardArray objectAtIndex:indexPath.row];
    //onBoardData = [onBoardArray objectAtIndex:indexPath.section];
    
    onBoardData = [onBoardArray objectAtIndex:indexPath.section];
    
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];//]WithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.accessoryType = UITableViewCellAccessoryNone;
        //cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        
        if(indexPath.section==0)
        {
            
            CommonLabel *lblAccClassif=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAccClassif.text=@"Account Classification";
            lblAccClassif.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAccClassif];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccClassif attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccClassif attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccClassif attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccClassif attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            
            txtAccClassif=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtAccClassif.tag=1;
            txtAccClassif.delegate=self;
            txtAccClassif.placeholder=@"Account Classification";
            txtAccClassif.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAccClassif];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccClassif attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccClassif attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccClassif attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccClassif attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat1Height1 constant:0]];
            
            
            CommonLabel *lblOtherNationality=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOtherNationality.text=@"Other Nationality";
            lblOtherNationality.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOtherNationality];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOtherNationality attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOtherNationality attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFat2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOtherNationality attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOtherNationality attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFat2Height1 constant:0]];
            
            
            txtOtherNationality = [[CommonTextField alloc] init];
            txtOtherNationality.tag=2;
            txtOtherNationality.delegate=self;
            txtOtherNationality.placeholder=@"Other Nationality";
            txtOtherNationality.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOtherNationality];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOtherNationality attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOtherNationality attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOtherNationality attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOtherNationality attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
            
            
            
        }
        else if(indexPath.section==1)
        {
            
            CommonLabel *lblCountryOfBirth=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCountryOfBirth.text=@"Country Of Birth";
            lblCountryOfBirth.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCountryOfBirth];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCountryOfBirth attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCountryOfBirth attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCountryOfBirth attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCountryOfBirth attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            
            txtCountryOfBirth = [[CommonTextField alloc] init];
            txtCountryOfBirth.tag=3;
            txtCountryOfBirth.delegate=self;
            txtCountryOfBirth.placeholder=@"Country Of Birth";
            txtCountryOfBirth.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCountryOfBirth];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCountryOfBirth attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCountryOfBirth attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCountryOfBirth attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCountryOfBirth attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat1Height1 constant:0]];
            
            
            CommonLabel *lblUSTaxpayer=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUSTaxpayer.text=@"US Tax Payer";
            lblUSTaxpayer.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUSTaxpayer];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSTaxpayer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSTaxpayer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFat2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSTaxpayer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSTaxpayer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFat2Height1 constant:0]];
            
            
            txtUsTaxpayer = [[CommonTextField alloc] init];
            txtUsTaxpayer.tag=4;
            txtUsTaxpayer.delegate=self;
            txtUsTaxpayer.placeholder=@"US Taxpayer";
            txtUsTaxpayer.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUsTaxpayer];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsTaxpayer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsTaxpayer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsTaxpayer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsTaxpayer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
            
        }
        else if(indexPath.section==2){
            
            CommonLabel *lblResUSMailAdd=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblResUSMailAdd.text=@"American Res US Mailing Address";
            lblResUSMailAdd.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblResUSMailAdd];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResUSMailAdd attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResUSMailAdd attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResUSMailAdd attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResUSMailAdd attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            
            txtResUSMailAdd=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtResUSMailAdd.tag=5;
            txtResUSMailAdd.delegate=self;
            txtResUSMailAdd.placeholder=@"American Res US Mailing Address";
            txtResUSMailAdd.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtResUSMailAdd];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResUSMailAdd attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResUSMailAdd attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFatY1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResUSMailAdd attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResUSMailAdd attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFatHeight1 constant:0]];
            
            
            CommonLabel *lblUSMailAdd1=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUSMailAdd1.text=@"US Mailing Address";
            lblUSMailAdd1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUSMailAdd1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAdd1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAdd1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFat2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAdd1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAdd1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFat2Height1 constant:0]];
            
            
            txtUSMailAdd1 = [[CommonTextField alloc] init];
            txtUSMailAdd1.tag=4;
            txtUSMailAdd1.delegate=self;
            txtUSMailAdd1.placeholder=@"US Mailing Address";
            txtUSMailAdd1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUSMailAdd1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAdd1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAdd1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAdd1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAdd1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
            
            
        }
        else if(indexPath.section==3){
            CommonLabel *lblUSMailAddPOBox=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUSMailAddPOBox.text=@"US Mailing Address PO Box ";
            lblUSMailAddPOBox.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUSMailAddPOBox];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAddPOBox attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAddPOBox attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAddPOBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAddPOBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            
            txtUSMailAddPOBox=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtUSMailAddPOBox.tag=7;
            txtUSMailAddPOBox.delegate=self;
            txtUSMailAddPOBox.placeholder=@"US Mailing Address PO Box";
            txtUSMailAddPOBox.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUSMailAddPOBox];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAddPOBox attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAddPOBox attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAddPOBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAddPOBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat1Height1 constant:0]];
            
            
            
            CommonLabel *lblUSMailAddPhone=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUSMailAddPhone.text=@"US Mailing  Address Phone";
            lblUSMailAddPhone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUSMailAddPhone];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAddPhone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAddPhone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFat2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAddPhone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAddPhone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFat2Height1 constant:0]];
            
            
            txtUSMailAddPhone = [[CommonTextField alloc] init];
            txtUSMailAddPhone.tag=8;
            txtUSMailAddPhone.delegate=self;
            txtUSMailAddPhone.placeholder=@"US Mailing  Address Phone";
            txtUSMailAddPhone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUSMailAddPhone];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAddPhone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAddPhone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAddPhone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAddPhone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
            
        }
        else if(indexPath.section==4){
            CommonLabel *lblUSMailAdd2=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUSMailAdd2.text=@"US Mailing Address2";
            lblUSMailAdd2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUSMailAdd2];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAdd2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAdd2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAdd2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSMailAdd2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            
            txtUSMailAdd2=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtUSMailAdd2.tag=9;
            txtUSMailAdd2.delegate=self;
            txtUSMailAdd2.placeholder=@"US Mailing Address2";
            txtUSMailAdd2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUSMailAdd2];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAdd2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAdd2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAdd2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUSMailAdd2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat1Height1 constant:0]];
            
            
            
            CommonLabel *lblOwnerUSTelePhNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOwnerUSTelePhNo.text=@"Owner Of a US Telephone No";
            lblOwnerUSTelePhNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOwnerUSTelePhNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSTelePhNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSTelePhNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFat2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSTelePhNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSTelePhNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFat2Height1 constant:0]];
            
            
            txtOwnerUSTelePhNo = [[CommonTextField alloc] init];
            txtOwnerUSTelePhNo.tag=6;
            txtOwnerUSTelePhNo.delegate=self;
            txtOwnerUSTelePhNo.placeholder=@"Owner Of a US Telephone No";
            txtOwnerUSTelePhNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOwnerUSTelePhNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSTelePhNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSTelePhNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSTelePhNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSTelePhNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
            
            
            
            
            
        }
        else if(indexPath.section==5){
            
            
            
            CommonLabel *lblUSCountryCode=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUSCountryCode.text=@" US Country Area Code";
            lblUSCountryCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUSCountryCode];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSCountryCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSCountryCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSCountryCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUSCountryCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            
            
            
            txtUsCountryCode=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtUsCountryCode.tag=10;
            txtUsCountryCode.delegate=self;
            txtUsCountryCode.placeholder=@"Enter Driving License No";
            txtUsCountryCode.translatesAutoresizingMaskIntoConstraints=NO;
            
            [cell.contentView addSubview:txtUsCountryCode];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsCountryCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsCountryCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsCountryCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsCountryCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat1Height1 constant:0]];
            
            
            
            
            CommonLabel *lblPhoneNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPhoneNo.text=@"Phone Number";
            lblPhoneNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPhoneNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPhoneNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPhoneNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFat2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPhoneNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPhoneNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFat2Height1 constant:0]];
            
            
            
            txtPhoneNo=[[CommonTextField alloc] init];
            txtPhoneNo.tag=11;
            txtPhoneNo.delegate=self;
            txtPhoneNo.placeholder=@"Enter Phone Number";
            txtPhoneNo.translatesAutoresizingMaskIntoConstraints=NO;
            
            [cell.contentView addSubview:txtPhoneNo];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPhoneNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPhoneNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPhoneNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPhoneNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
            
        }

        else if(indexPath.section==6){
            
            
            CommonLabel *lblOwnerUSProp=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOwnerUSProp.text=@"Owner Of US Property";
            lblOwnerUSProp.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOwnerUSProp];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSProp attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSProp attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSProp attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSProp attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            
            txtOwnerUSProp=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtOwnerUSProp.tag=12;
            txtOwnerUSProp.delegate=self;
            txtOwnerUSProp.placeholder=@"Owner Of US Property";
            txtOwnerUSProp.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOwnerUSProp];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSProp attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSProp attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSProp attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSProp attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat1Height1 constant:0]];
            
            
            CommonLabel *lblOwnerUSPropPOBox=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOwnerUSPropPOBox.text=@"Owner Of US Property PoBox";
            lblOwnerUSPropPOBox.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOwnerUSPropPOBox];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSPropPOBox attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSPropPOBox attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFat2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSPropPOBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSPropPOBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFat2Height1 constant:0]];
            
            
            txtOwnerUSPropPOBox = [[CommonTextField alloc] init];
            txtOwnerUSPropPOBox.tag=13;
            txtOwnerUSPropPOBox.delegate=self;
            txtOwnerUSPropPOBox.placeholder=@"Owner Of US Property PoBox";
            txtOwnerUSPropPOBox.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOwnerUSPropPOBox];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSPropPOBox attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSPropPOBox attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSPropPOBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSPropPOBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
            
            
            
            
        }

        else if(indexPath.section==7){
            
            CommonLabel *lblOwnerUSPropPhoneNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOwnerUSPropPhoneNo.text=@"Owner Of UsProperty Phone";
            lblOwnerUSPropPhoneNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOwnerUSPropPhoneNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSPropPhoneNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSPropPhoneNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSPropPhoneNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOwnerUSPropPhoneNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            txtOwnerUSPropPhoneNo=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtOwnerUSPropPhoneNo.tag=14;
            txtOwnerUSPropPhoneNo.delegate=self;
            txtOwnerUSPropPhoneNo.placeholder=@"Owner Of UsProperty Phone";
            txtOwnerUSPropPhoneNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOwnerUSPropPhoneNo];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSPropPhoneNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSPropPhoneNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSPropPhoneNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOwnerUSPropPhoneNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat1Height1 constant:0]];
            
            
            CommonLabel *lblUsPropAdd1=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUsPropAdd1.text=@"US Property Address1";
            lblUsPropAdd1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUsPropAdd1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUsPropAdd1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUsPropAdd1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFat2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUsPropAdd1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUsPropAdd1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFat2Height1 constant:0]];
            
            txtUsPropAdd1 = [[CommonTextField alloc] init];
            txtUsPropAdd1.tag=15;
            txtUsPropAdd1.delegate=self;
            txtUsPropAdd1.placeholder=@"US Property Address1";
            txtUsPropAdd1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUsPropAdd1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsPropAdd1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsPropAdd1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsPropAdd1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsPropAdd1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
            
            
            
            
        }
        else if(indexPath.section==8){
            
            CommonLabel *lblUsPropAdd2=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUsPropAdd2.text=@"US Property Address2";
            lblUsPropAdd2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUsPropAdd2];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUsPropAdd2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUsPropAdd2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUsPropAdd2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUsPropAdd2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            txtUsPropAdd2=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtUsPropAdd2.tag=14;
            txtUsPropAdd2.delegate=self;
            txtUsPropAdd2.placeholder=@"US Property Address2";
            txtUsPropAdd2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUsPropAdd2];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsPropAdd2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsPropAdd2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsPropAdd2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsPropAdd2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat1Height1 constant:0]];
            
            
            CommonLabel *lblUsPropAdd3=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUsPropAdd3.text=@"US Property Address3";
            lblUsPropAdd3.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUsPropAdd3];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUsPropAdd3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUsPropAdd3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFat2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUsPropAdd3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUsPropAdd3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFat2Height1 constant:0]];
            
            txtUsPropAdd3 = [[CommonTextField alloc] init];
            txtUsPropAdd3.tag=15;
            txtUsPropAdd3.delegate=self;
            txtUsPropAdd3.placeholder=@"US Property Address3";
            txtUsPropAdd3.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUsPropAdd3];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsPropAdd3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsPropAdd3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsPropAdd3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUsPropAdd3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
            
            
            
            
        }
        else if(indexPath.section==9){
            
            CommonLabel *lblUBOAddUS=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUBOAddUS.text=@"UBO Address in US";
            lblUBOAddUS.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUBOAddUS];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUS attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUS attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUS attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUS attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            txtUBOAddUS=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtUBOAddUS.tag=14;
            txtUBOAddUS.delegate=self;
            txtUBOAddUS.placeholder=@"UBO Address in US";
            txtUBOAddUS.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUBOAddUS];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUS attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUS attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUS attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUS attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
   
            
            
        }
        else if(indexPath.section==10){
            
            CommonLabel *lblUBOAddUSAdd1=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUBOAddUSAdd1.text=@"UBO Address in US Address1";
            lblUBOAddUSAdd1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUBOAddUSAdd1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUSAdd1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUSAdd1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUSAdd1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUSAdd1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            txtUBOAddUSAdd1=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtUBOAddUSAdd1.tag=14;
            txtUBOAddUSAdd1.delegate=self;
            txtUBOAddUSAdd1.placeholder=@"UBO Address in US Address1";
            txtUBOAddUSAdd1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUBOAddUSAdd1];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUSAdd1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUSAdd1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUSAdd1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUSAdd1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
            
            
            
        }
        else if(indexPath.section==11){
            
            CommonLabel *lblUBOAddUSAdd2=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUBOAddUSAdd2.text=@"UBO Address in US Address2";
            lblUBOAddUSAdd2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUBOAddUSAdd2];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUSAdd2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUSAdd2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUSAdd2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUSAdd2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            txtUBOAddUSAdd2=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtUBOAddUSAdd2.tag=14;
            txtUBOAddUSAdd2.delegate=self;
            txtUBOAddUSAdd2.placeholder=@"UBO Address in US Address2";
            txtUBOAddUSAdd2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUBOAddUSAdd2];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUSAdd2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUSAdd2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUSAdd2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUSAdd2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
            
            
            
        }
        else if(indexPath.section==12){
            
            CommonLabel *lblUBOAddUSAdd3=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUBOAddUSAdd3.text=@"UBO Address in US Address3";
            lblUBOAddUSAdd3.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUBOAddUSAdd3];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUSAdd3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintFatX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUSAdd3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintFatY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUSAdd3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintFatWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUBOAddUSAdd3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintFatHeight1 constant:0]];
            
            txtUBOAddUSAdd3=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtUBOAddUSAdd3.tag=14;
            txtUBOAddUSAdd3.delegate=self;
            txtUBOAddUSAdd3.placeholder=@"UBO Address in US Address3";
            txtUBOAddUSAdd3.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUBOAddUSAdd3];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUSAdd3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintFat2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUSAdd3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintFat2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUSAdd3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintFat2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUBOAddUSAdd3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintFat2Height1 constant:0]];
            
            
            
            
        }
        
        
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
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[labelArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX1 constant:0]];
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[labelArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY1 constant:0]];
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[labelArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth1 constant:0]];
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[labelArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight1 constant:0]];
        //
        //
        //                [cell.contentView addSubview:[componentsArray objectAtIndex:indexPath.section]];
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[componentsArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X1 constant:0]];
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[componentsArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y1 constant:0]];
        //
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[componentsArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width1 constant:0]];
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[componentsArray objectAtIndex:indexPath.section] attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height1 constant:0]];
        //
        //
        //                //------------------
        //
        //
        //                [cell.contentView addSubview:[label2Array objectAtIndex:indexPath.section]];
        //
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[label2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X1 constant:0]];
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[label2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y1 constant:0]];
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[label2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width1 constant:0]];
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[label2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height1 constant:0]];
        //
        //
        //                [cell.contentView addSubview:[components2Array objectAtIndex:indexPath.section]];
        //
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[components2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X1 constant:0]];
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[components2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y1 constant:0]];
        //
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[components2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width1 constant:0]];
        //
        //                [cell addConstraint:[NSLayoutConstraint constraintWithItem:[components2Array objectAtIndex:indexPath.section] attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height1 constant:0]];
        //                //-----------------
        //
        //            }
        //
        //
        //        }
        
        
    }
    else{
        
        
        
        [cell.contentView viewWithTag:100+indexPath.section];
        [cell.contentView viewWithTag:indexPath.section];
        
        [cell.contentView viewWithTag:500+indexPath.section];
        [cell.contentView viewWithTag:600+indexPath.section];
        
    }
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    return cell;
}


// Implement something like this in your UITableViewController subclass
// or in the delegate object you use to manage your table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //    // Create a view controller with the title as its
    //    // navigation title and push it.
    //    NSUInteger row = indexPath.row;
    //    if (row != NSNotFound)
    //    {
    //        // Create the view controller and initialize it with the
    //        // next level of data.
    //        MyViewController *viewController = [[MyViewController alloc]
    //                                            initWithTable:tableView andDataAtIndexPath:indexPath];
    //        [[self navigationController] pushViewController:viewController
    //                                               animated:YES];
    //    }
    
    NSUInteger row = indexPath.section;//row;
    
    
    
    if (row != NSNotFound)
    {
        onBoardData = [onBoardArray objectAtIndex:indexPath.section];
        
        
        
        // NSLog(@"selected account %@",onBoardData.accountNumber);
        
        if([actionMode isEqualToString:@"TRNHISTORY"])
        {
            
            
            //            AccountTrnViewController *accountTrnViewController = [[AccountTrnViewController alloc]initWithNibName:nil bundle:nil];
            //
            //            //NSLog(@"selected account %@",[self.onBoardDataValueData objectAtIndex:indexPath.row]);
            //
            //            accountTrnViewController.cifNumber=onBoardData.cifNumber;
            //            accountTrnViewController.accountNumber=onBoardData.accountNumber;
            //            accountTrnViewController.sessionid=self.sessionid;
            //            accountTrnViewController.userid=self.userid;
            //
            //            [self.navigationController pushViewController:accountTrnViewController animated:YES];
            
        }
        
        
        
    }
    
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}


- (void) callHost {
    
    
    NSDictionary *jsonDictionary;
    
    
    //------validation starts---------
//    if([CommonUtils checkEmptyString:txtPassportNo.text]==YES)
//    {
//        
//        [self showMessage:@"Passport Number can't be blank"];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    
//    if([CommonUtils checkEmptyString:txtPassportIssuePlace.text]==YES)
//    {
//        
//        [self showMessage:@"Passport Number can't be blank"];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    
    
    //-------
//    
//    jsonDictionary= @{
//                      @"passportNo":self.txtPassportNo.text,
//                      @"passportIssueDate":self.txtPassportIssueDate.text,
//                      @"passportExpDate":self.txtPassportExpDate.text,
//                      @"passportIssuePlace":self.txtPassportIssuePlace.text,
//                      @"passportIssueCountry":self.txtPassportIssueCountry.text,
//                      @"immiFileNumber":self.txtImmigrationFile.text,
//                      @"visaIssuePlace":self.txtVisaIssuePlace.text,
//                      @"visaIssueDate":self.txtVisaIssueDate.text,
//                      @"visaExpDate":self.txtVisaExpDate.text,
//                      @"drivingLicenseNo":self.txtDrivingLicenseNo.text,
//                      @"drivingLicenseExpDate":self.txtDrivingExpDate.text,
//                      @"laborCardNo":self.txtLabourCardNo.text,
//                      @"laborCardExpDate":self.txtLabourCardExpDate.text,
//                      @"emiratesID":self.txtEmiratesId.text,
//                      @"emiratesIDExpDate":self.txtEmiratesIdExpDate.text
//                      
//                      };
//    
//    
//    
    
    
    
    //NSString *jsonString = [container JSONRepresentation];
    
    [self saveData:@"updatePassportDetails" :jsonDictionary];
    
}


- (void) saveData:(NSString *)methodAction :(NSDictionary *) jsonDictionary {
    
    
    @try {
        
        
        
        NSLog(@"saveData %@",userid);
        
        
        
        NSError *errorOut;
        NSString *jsonString;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                           options:NSJSONWritingPrettyPrinted // Pass 0 if you don't care about the readability of the generated string
                                                             error:&errorOut];
        
        if (! jsonData) {
            NSLog(@"Got an error in json creation: %@", errorOut);
        } else {
            jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        }
        
        NSLog(@"jsondata %@",jsonString);
        
        
        //string for the URL request
        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/onBoardDataServlet";
        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];//@"http://117.213.107.54:8081";
        //create string for parameters that we need to send in the HTTP POST body
        NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&methodAction=%@&message=%@",userid,sessionid,methodAction,jsonString];
        
        
        //create a NSURL object from the string data
        NSURL *myUrl = [NSURL URLWithString:myUrlString];
        
        //create a mutable HTTP request
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:myUrl];
        //sets the receiver’s timeout interval, in seconds
        [urlRequest setTimeoutInterval:120.0f];
        //sets the receiver’s HTTP request method
        [urlRequest setHTTPMethod:@"POST"];
        //sets the request body of the receiver to the specified data.
        [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
        
        //allocate a new operation queue
        //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        //Loads the data for a URL request and executes a handler block on an
        //operation queue when the request completes or fails.
        /*[NSURLConnection
         sendAsynchronousRequest:urlRequest
         queue:queue
         completionHandler:^(NSURLResponse *response,
         NSData *data,
         NSError *error) {
         if ([data length] >0 && error == nil){
         //process the JSON response
         //use the main queue so that we can interact with the screen
         dispatch_async(dispatch_get_main_queue(), ^{
         [self parseResponse:data];
         });
         }
         else if ([data length] == 0 && error == nil){
         NSLog(@"Empty Response, not sure why?");
         }
         else if (error != nil){
         NSLog(@"Not again, what is the error = %@", error);
         }
         }];*/
        
        
        NSURLResponse *response = nil;
        NSError *error = nil;
        //getting the data
        NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
        if ([newData length] >0 && error == nil){
            //process the JSON response
            //use the main queue so that we can interact with the screen
            
            [self parseResponse:newData];
            
        }
        else if ([newData length] == 0 && error == nil){
            NSLog(@"Empty Response, not sure why?");
            [self showMessage:@"No response from host system"];
        }
        else if (error != nil){
            NSLog(@"Not again, what is the error = %@", error);
            
            [self showError:error];
            
        }
        
        
        
        
        
        
        
        //
        //            //back to the main thread for the UI call
        //            dispatch_async(dispatch_get_main_queue(), ^{
        //                [spinner stopAnimating];
        //            });
        //            });
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in fetch onBoardData code %@ reason %@ " , [exception name], [exception reason]);
    }
    @finally {
        
        NSLog(@"finally in fetch onBoardData Code");
    }
    
    
    
    
    
    
}



- (void) fetchonBoardData  {
    
    
    @try {
        
        
        
        NSLog(@"fetch onBoardData %@",userid);
        
        
        
        //        //main thread
        //        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        //        [self.view addSubview:spinner];
        //
        //        //switch to background thread
        //        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        //
        //            //back to the main thread for the UI call
        //            dispatch_async(dispatch_get_main_queue(), ^{
        //                [spinner startAnimating];
        //            });
        
        
        
        //string for the URL request
        //NSString *myUrlString = @"http://192.168.2.8:8080/FinnoneWeb/onBoardDataServlet";
        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];//@"http://92.97.103.252:8081";
        //create string for parameters that we need to send in the HTTP POST body
        NSString *body =  [NSString stringWithFormat:@"userid=%@&sessionid=%@&methodAction=insertOnBoard",userid,sessionid];
        
        
        //create a NSURL object from the string data
        NSURL *myUrl = [NSURL URLWithString:myUrlString];
        
        //create a mutable HTTP request
        NSMutableURLRequest *urlRequest = [NSMutableURLRequest requestWithURL:myUrl];
        //sets the receiver’s timeout interval, in seconds
        [urlRequest setTimeoutInterval:120.0f];
        //sets the receiver’s HTTP request method
        [urlRequest setHTTPMethod:@"POST"];
        //sets the request body of the receiver to the specified data.
        [urlRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
        
        //allocate a new operation queue
        //NSOperationQueue *queue = [[NSOperationQueue alloc] init];
        //Loads the data for a URL request and executes a handler block on an
        //operation queue when the request completes or fails.
        /*[NSURLConnection
         sendAsynchronousRequest:urlRequest
         queue:queue
         completionHandler:^(NSURLResponse *response,
         NSData *data,
         NSError *error) {
         if ([data length] >0 && error == nil){
         //process the JSON response
         //use the main queue so that we can interact with the screen
         dispatch_async(dispatch_get_main_queue(), ^{
         [self parseResponse:data];
         });
         }
         else if ([data length] == 0 && error == nil){
         NSLog(@"Empty Response, not sure why?");
         }
         else if (error != nil){
         NSLog(@"Not again, what is the error = %@", error);
         }
         }];*/
        
        
        NSURLResponse *response = nil;
        NSError *error = nil;
        //getting the data
        NSData *newData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
        if ([newData length] >0 && error == nil){
            //process the JSON response
            //use the main queue so that we can interact with the screen
            
            [self parseResponse:newData];
            
        }
        else if ([newData length] == 0 && error == nil){
            NSLog(@"Empty Response, not sure why?");
            [self showMessage:@"No response from host system"];
        }
        else if (error != nil){
            NSLog(@"Not again, what is the error = %@", error);
            
            [self showError:error];
            
        }
        
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in fetch onBoardData code %@ reason %@ " , [exception name], [exception reason]);
    }
    @finally {
        
        NSLog(@"finally in fetch onBoardData Code");
    }
    
    
}


- (void) parseResponse:(NSData *) data {
    
    
    @try {
        
        
        
        NSLog(@"get customer info enterest %@",userid);
        
        
        
        NSString *myData = [[NSString alloc] initWithData:data
                                                 encoding:NSUTF8StringEncoding];
        NSLog(@"JSON data = %@", myData);
        NSError *error = nil;
        
        //parsing the JSON response
        id jsonObject = [NSJSONSerialization
                         JSONObjectWithData:data
                         options:NSJSONReadingAllowFragments
                         error:&error];
        if (jsonObject != nil && error == nil){
            NSLog(@"Successfully deserialized...");
            
            //check if the customer code was valid
            //userid = [jsonObject objectForKey:@"userid"];
            sessionid = [jsonObject objectForKey:@"sessionid"];
            
            NSLog(@"userid print :%@",userid);
            NSLog(@"sessionid print :%@",sessionid);
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                
                //set the customer object of the second view controller
                dataDictionary =[jsonObject objectForKey:@"fetchOnBoardData"];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                onBoardArray = [[NSMutableArray alloc] init];
                
                
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:@"onBoardDataWrapper"];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    onBoardData = [[OnBoardData alloc] initWithJSONDictionary:dict];
                    
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    // Add the Location object to the array
                    [onBoardArray addObject:onBoardData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)onBoardArray.count);
                
                
                
                //                NSDictionary *customerMasterData = [dataDictionary objectForKey:@"Customer Master Data"];
                //
                //                for(NSString *key in [customerMasterData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerMasterData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"Customer number"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSDictionary *customerDetailData = [dataDictionary objectForKey:@"onBoardDataWrapper"];
                
                //NSLog(@"customerDetailData: %@", [customerDetailData description]);
                
                
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //                    NSLog(@"value: %@",[customerDetailData valueForKey:key]);
                //
                //                }
                
                
                //                accountName = [customerDetailData objectForKey:@"customerName"];
                //                accountNumber= [customerDetailData objectForKey:@"accountNumber"];
                //                accountCurrency= [customerDetailData objectForKey:@"accountCurrency"];
                //                accountAvlBalance= [customerDetailData objectForKey:@"availableBalance"];
                //                accountCurrentBalance= [customerDetailData objectForKey:@"currentBalance"];
                //                onBoardDatatatus= [customerDetailData objectForKey:@"onBoardDatatatus"];
                
                
                //                for(NSString *key in [customerDetailData allKeys])
                //                {
                //                    NSLog(@"key code: %@",key);
                //                    NSLog(@"key: %@",[customerDetailData objectForKey:key]);
                //
                //                    if ([key isEqualToString:@"accountNumber"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer number"];
                //                    }
                //                    if ([key isEqualToString:@"Customer name"]) {
                //                        self.customerName=[customerMasterData objectForKey:@"Customer name"];
                //                    }
                //                    //if ([key isEqualToString:@"currentAccountBalance"]) {
                //                    //    self.availableBalance=[customerMasterData objectForKey:@"currentAccountBalance"];;
                //                    //}
                //
                //                }
                
                //NSMutableArray *custData = [[NSMutableArray alloc] initWithCapacity:0];
                //                onBoardDataKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
                //                onBoardDataValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
                
                
                //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                
                //                for (NSString *string in onBoardDataKeyData) {
                //                    NSLog(@" array key data:%@", string);
                //                }
                //
                //                for (NSString *string in onBoardDataValueData) {
                //                    NSLog(@" array value data:%@", string);
                //                }
                
                //for (NSDictionary *info in [customerInfo allValues])
                //{
                //   [custData addObject:[info valueForKey:@"custName"]];
                //}
                
                //NSArray * values = [dictionary allValues];
                //NSArray *keys = [dictionary allKeys];
                //NSArray *values = [dictionary allValues];
                //NSMutableArray *values = [[NSMutableArray alloc] initWithArray:[dictionary allValues]];
                //NSMutableArray *yourArray = [NSMutableArray arrayWithCapacity:6];
                //[yourDict enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
                //    [yourArray addObject:obj];
                //}];
                
                
            }
            else {
                NSLog(@"Success is invalid...");
                
                [self showMessage:@"Invalid userid or sessionid !"];
                
                
            }
            
        }
        else{
            
            [self showError:error];
            
            
            
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
    }
    @finally {
        
        NSLog(@"finally in parseResponse Code");
    }
    
}


//- (void) displayHeader{
//
//
//    if(onBoardArray.count >0)
//    {
//
//        onBoardData = [onBoardArray objectAtIndex:0];
//
//        //capture first account details
//        //customerName=[NSString stringWithFormat:@"%@",onBoardData.customerName ];
//        //customerSegment=[NSString stringWithFormat:@"%@",onBoardData.customerSegment];
//        //NSLog(@" custname %@",customerName);
//        //NSLog(@" custseg %@",customerSegment);
//    }
//
//
//    UIView *headerView = [[UIView alloc] init];
//    headerView.layer.borderWidth=1.0;
//    headerView.layer.borderColor=[UIColor borderBlueColor].CGColor;
//    headerView.layer.shadowRadius=10.0;
//    headerView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor whiteColor];
//    headerView.layer.shadowOffset = CGSizeMake(0, 3);
//    headerView.layer.shadowRadius = 10.0;
//    headerView.layer.shadowColor = [UIColor blackColor].CGColor;
//    headerView.layer.shadowOpacity = 0.8;
//    headerView.layer.cornerRadius = 15.0;
//    //headerView.layer.doubleSided=YES;
//    headerView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:headerView];
//
//    //create the frame that will contain our label
//    //CGRect labelFrame = CGRectMake(40, 60, 240, 80);
//
//    NSLog(@" frame width %lf",headerView.bounds.size.width);
//    NSLog(@" frame height %lf",headerView.bounds.size.height);
//
//
////    //CGRectMake(25, 90, 270, 100);
////    //labelFrame.size.height = 00.0f;
////    UILabel *lblCustomerName = [[UILabel alloc] init];//WithFrame:headerView.frame];
////    lblCustomerName.textColor = [UIColor blackColor];
////    //set the number of lines to contain a bigger text
////    //lblCustomerName.numberOfLines = 2;
////    //lblCustomerName.font = [UIFont italicSystemFontOfSize:12.0f];
////    lblCustomerName.font = [UIFont boldSystemFontOfSize:14.0f];
////    lblCustomerName.textAlignment =  NSTextAlignmentLeft;
////    //lblCustomerName.layer.borderColor = [UIColor blackColor].CGColor;
////    //lblCustomerName.layer.borderWidth = 1.0;
////    if(onBoardArray.count >0)
////    {
////        lblCustomerName.text =[NSString stringWithFormat:@"%@",onBoardData.customerName];
////    }
////    lblCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
////    [self.view addSubview:lblCustomerName];
//
//
//
//    //move the frame position
//    //labelFrame.origin.y += labelFrame.size.height + 0.1f;
//    //headerView.bounds.origin.y +=  15.0f;
//    UILabel *lblCustomerSegment = [[UILabel alloc] init];//WithFrame:headerView.frame];
//    lblCustomerSegment.font = [UIFont boldSystemFontOfSize:14.0f];
//    lblCustomerSegment.textAlignment =  NSTextAlignmentLeft;
//    lblCustomerSegment.textColor = [UIColor blackColor];
//    //lblCustomerNumber.layer.borderColor = [UIColor blackColor].CGColor;
//    //lblCustomerNumber.layer.borderWidth = 1.0;
//
////    if(onBoardArray.count >0)
////    {
////        lblCustomerSegment.text = [NSString stringWithFormat:@"%@",onBoardData.customerSegment];
////    }
//    lblCustomerSegment.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:lblCustomerSegment];
//
//
//    //---header UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.45 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
//
//
//    //----customer name
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.9 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
//    //-----customer segement
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerSegment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
//
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerSegment attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
//
//
//
//    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.80 constant:0]];
//    //
//
//    //    //labelFrame.origin.y += labelFrame.size.height + 1.0f;
//    //    labelFrame.origin.y +=  20.0f;
//    //    UILabel *lblavalBalance  = [[UILabel alloc] initWithFrame:labelFrame];
//    //    lblavalBalance.textColor = [UIColor blackColor];
//    //    lblavalBalance.text = [NSString stringWithFormat:@"Available Balance    %@",availableBalance];
//    //    //set the number of lines to 0, meaning use as many lines as needed
//    //    lblavalBalance.numberOfLines = 0;
//    //    //lblavalBalance.font = [UIFont fontWithName:@"Arial-Bold" size:12.0f];
//    //    lblavalBalance.font = [UIFont boldSystemFontOfSize:12.0f];
//    //    lblavalBalance.textAlignment =  NSTextAlignmentLeft;
//    //    //lblavalBalance.layer.borderColor = [UIColor blackColor].CGColor;
//    //    //lblavalBalance.layer.borderWidth = 1.0;
//    //    //Resizes and moves the receiver view so it just encloses its subviews.
//    //    //watch the border of the frame in this example
//    //    //[lblavalBalance sizeToFit];
//    //    [self.view addSubview:lblavalBalance];
//
//}
//
//
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


- (void)addItemViewController:(PopoverViewController *)controller didFinishEnteringItem:(NSString *)item  didFinishEnteringItem1:(NSString *)code didFinishEnteringItem2:(int)fieldTag
{
    //NSLog(@"This was returned from PopoverViewController %ld", (long)fieldTag);
    // NSArray *components = [item componentsSeparatedByString:@"\n"];
    //NSLog(@" popvalues %@", components[0]);
    
    
    id viewObj = [self.view viewWithTag:(long)fieldTag];
    
    if([viewObj isKindOfClass:[UITextField class]])
    {
        UITextField *textField =(UITextField *)viewObj;
        textField.text=item;
        //[dataArray insertObject:code atIndex:fieldTag];
    }
    
    
    
}

- (void)changeSwitch:(id)sender{
    if([sender isOn]){
        switchFlag=@"Y";
        NSLog(@"Switch is ON");
    } else{
        switchFlag=@"N";
        NSLog(@"Switch is OFF");
    }
}

-(void)countdownTimer{
    
    secondsLeft = hours = minutes = seconds = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
    
}

- (void)updateCounter:(NSTimer *)theTimer {
    if(secondsLeft > 0 ){
        secondsLeft -- ;
        hours = secondsLeft / 3600;
        minutes = (secondsLeft % 3600) / 60;
        seconds = (secondsLeft %3600) % 60;
        self.timerView.font=[UIFont systemFontOfSize:45.0f];
        self.timerView.textColor=[UIColor brownColor];
        self.timerView.textAlignment=NSTextAlignmentCenter;
        self.timerView.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
    }
    else{
        secondsLeft = 16925;
    }
}

-(void)displayGraph
{
    
    webView = [[UIWebView alloc] init];//]WithFrame:CGRectMake(0,0,self.view.frame.size.width, self.view.frame.size.height)];
    webView.tag=55;
    webView.delegate = self;
    webView.layer.borderWidth=1.0;
    webView.layer.borderColor=[UIColor whiteColor].CGColor;
    webView.layer.shadowRadius=10.0;
    webView.backgroundColor = [UIColor whiteColor];
    webView.layer.shadowOffset = CGSizeMake(0, 3);
    webView.layer.shadowRadius = 10.0;
    webView.layer.shadowColor = [UIColor blackColor].CGColor;
    webView.layer.shadowOpacity = 0.8;
    webView.layer.cornerRadius = 15.0;
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"index" ofType:@"html" inDirectory:@"www"]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    webView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:webView];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.6 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.25 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    NSString* json;
    
    
    //NSLog(@"array count %ld",(unsigned long)projectsSummaryArray.count);
    
    
    NSMutableDictionary *jsonDictionary = [[NSMutableDictionary alloc]init];
    
    //    for (int i=0; i<=projectsSummaryArray.count-1; i++) {
    //
    //        projectsSummary = [projectsSummaryArray objectAtIndex:i];
    //
    //        NSLog(@"business unit1 %@",projectsSummary.overallStatus);
    //
    //        [jsonDictionary setObject:projectsSummary.projectsByOverallStatus forKey:projectsSummary.overallStatus];
    //
    //
    //    }
    
    
    NSError *errorOut;
    NSString *jsonString;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&errorOut];
    
    if (! jsonData) {
        NSLog(@"Got an error in json creation chart: %@", errorOut);
    } else {
        jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSLog(@"jsondata %@",jsonString);
    
    //NSString *json = [NSString stringWithFormat:@"On Track:%@,Delayed:%@",projects.onTrackProjects,projects.delayedProjects];
    
    //NSLog(@"graph json %@",json);
    
    json = [NSString stringWithFormat:@ "loadDashboardChart(%@);",jsonString];
    
    NSLog(@"function json %@",json);
    [self.webView stringByEvaluatingJavaScriptFromString: json];
}


-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
{
    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
    return [sObj valueForKey:InstVar];
}

-(void) logout:(id) sender
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    return;
}


-(void) showMessage:(NSString *) msg{
    
    UIAlertController * alertController=   [UIAlertController
                                            alertControllerWithTitle:@"message"
                                            message:msg
                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Do some thing here
                                   //[self.navigationController popViewControllerAnimated:YES];
                                   
                               }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
}

-(void) showError:(NSError *) error{
    
    //[NSString stringWithFormat:@"%ld,%@",(long)error.code,error.description]
    
    UIAlertController * alertController=   [UIAlertController
                                            alertControllerWithTitle:@"error"
                                            message:error.debugDescription
                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okAction = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleDefault
                               handler:^(UIAlertAction * action)
                               {
                                   //Do some thing here
                                   //[self.navigationController popViewControllerAnimated:YES];
                                   
                               }];
    
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
    
}


-(void) loadActivityIndicator
{
    //----activity indicator
    activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.activityIndicator.center = CGPointMake(self.view.frame.size.width / 2, self.view.frame.size.height / 2);
    activityIndicator.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleBottomMargin;
    activityIndicator.hidden=NO;
    activityIndicator.color=[UIColor borderBlueColor];
    [activityIndicator setHidesWhenStopped:YES];
    
    
    
    //-----label loading----
    lblLoading = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height+30.0f)];
    lblLoading.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    lblLoading.font = [UIFont boldSystemFontOfSize:12.0f];
    lblLoading.numberOfLines = 1;
    lblLoading.textAlignment=NSTextAlignmentCenter;
    lblLoading.backgroundColor = [UIColor clearColor];
    lblLoading.textColor = [UIColor borderBlueColor];
    
    
    [self.view addSubview:lblLoading];
    [self.view bringSubviewToFront:lblLoading];
    [lblLoading addSubview:activityIndicator];
    
}

-(void)startActivityIndicator
{
    //    lblLoading.text = @"Loading...";
    //    activityIndicator.hidden=NO;
    //    [activityIndicator startAnimating];
    
    [CommonUtils startActivityIndicator:self];
    
    
}

-(void)stopActivityIndicator
{
    //    lblLoading.text = @"";
    //    [activityIndicator stopAnimating];
    //    activityIndicator.hidden=YES;
    
    [CommonUtils stopActivityIndicator:self];
    
}



@end


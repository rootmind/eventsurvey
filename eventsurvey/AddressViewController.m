//
//  AddressViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 21/08/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "AddressViewController.h"
#import "AddressData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "ProductViewController.h"
#import "PopoverData.h"
#import "SearchViewController.h"
#import "QueueViewController.h"





@interface AddressViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblConstraintX2=0.52f;
CGFloat lblConstraintY2=1.0f;
CGFloat lblConstraintWidth2=0.5f;
CGFloat lblConstraintHeight2=0.8f;

CGFloat constraintX2=1.19f;
CGFloat constraintY2=1.0f;
CGFloat constraintWidth2=0.80f;
CGFloat constraintHeight2=0.8f;

CGFloat constraint1X2=0.69f;
CGFloat constraint1Y2=1.0f;
CGFloat constraint1Width2=0.3f;
CGFloat constraint1Height2=0.8f;

CGFloat lblConstraint2X2=1.52f;
CGFloat lblConstraint2Y2=1.0f;
CGFloat lblConstraint2Width2=0.5f;
CGFloat lblConstraint2Height2=0.8f;

CGFloat constraint2X2=1.69f;
CGFloat constraint2Y2=1.0f;
CGFloat constraint2Width2=0.3f;
CGFloat constraint2Height2=0.8f;




@implementation AddressViewController




//@synthesize userid;
//@synthesize sessionid;
@synthesize actionMode;
//@synthesize viewMode;
@synthesize menuName;
//@synthesize onBoardDataKeyData;
//@synthesize onBoardDataValueData;
@synthesize dataDictionary;


@synthesize refNo;
//@synthesize onBoardArray;
//@synthesize onBoardData;


@synthesize addressArray;
@synthesize addressData;

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
//@synthesize activityIndicator;
//@synthesize lblLoading;

@synthesize timerView;
//@synthesize switchFlag;

int hours, minutes, seconds,secondsLeft;

@synthesize popoverCodeValue;

@synthesize txtDepartment;
@synthesize txtStreetName;
@synthesize txtBuildingName;
@synthesize txtNearestLandmark;
@synthesize txtFlatNo;
@synthesize txtPoBox;
@synthesize txtCity;
@synthesize txtTelePhone;
@synthesize txtExtension;
@synthesize txtFax;

@synthesize txtResStreetName;
@synthesize txtResBuildingName;
@synthesize txtResNearestLandmark;
@synthesize txtResFlatNo;
@synthesize txtResPoBox;
@synthesize txtResCity;
@synthesize txtResTelePhone;
@synthesize txtResidenceType;

@synthesize txtCountry;
@synthesize txtHCity;
@synthesize txtHMobile;
@synthesize txtHTelePhone;
@synthesize txtAddress1;
@synthesize txtAddress2;
@synthesize txtAddress3;

@synthesize recordStatus;
@synthesize accountType;
@synthesize existingCustomerFlag;
@synthesize existingRefNo;

@synthesize pathArray;
@synthesize pathData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    
    if([actionMode isEqualToString:@"UPDATE"])
    {
        [self.navigationItem setHidesBackButton:NO animated:YES];
    }
    else
    {
        self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        
    }
//    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
//    [self.splitViewController.displayModeButtonItem action];
    
//    self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"Address Details"];
    
    self.navigationItem.title=@"Address Details";
    [CommonUtils loadActivityIndicator:self];
    
    
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
    
    NSString *buttonLabel=@"Save";
    NSString *buttonLabelRej;
    
    
    if([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"])
    {
        buttonLabelRej=@"Reject";
    }
    
    if([self.actionMode isEqualToString:@"ENQUIRY"] || [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"])
    {
        buttonLabel=@"Next";
        
        
    }
    
    
    UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:buttonLabel style:UIBarButtonItemStylePlain target:self action:@selector(doValidate)];
    
    UIBarButtonItem *rejrightNavButton = [[UIBarButtonItem alloc]initWithTitle:buttonLabelRej style:UIBarButtonItemStylePlain target:self action:@selector(doReject)];
    
    //self.navigationItem.rightBarButtonItem =rightNavButton ;
    
    // create a spacer
    UIBarButtonItem *space = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    space.width = 30;
    
    NSArray *buttons = @[rightNavButton, space, rejrightNavButton ];
    
    self.navigationItem.rightBarButtonItems = buttons;
    
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
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.03 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.83 constant:0]];
    
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
    tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
    
    
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
    
    
    
    
    
    
    
    //---initialize during load
    popoverCodeValue = [[NSMutableDictionary alloc]init];
    
    
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
    
    [self viewPathStatus];
    
    [self displayGraph];
    
    
    
    
    
    
    //--when not new
    if([actionMode isEqualToString:@"UPDATE"] ||[actionMode isEqualToString:@"ENQUIRY"] || ([actionMode isEqualToString:@"NEW"] && [existingCustomerFlag isEqualToString:@"Y"] && [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])) // && [viewMode isEqualToString:@"Y"] )
    {
        
        [self viewData];
        
         //viewMode=@"N";
        
        
    }
    
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
    if (textField.tag == 1) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Off Street Name ,Res Street Name
    if (textField.tag == 2 || textField.tag==11) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 49;
        
    }
    //--Building Name
    if (textField.tag == 3) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    //--landmark
    if (textField.tag == 4) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    //--Flat
    if (textField.tag == 5) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 10;
        
    }
    //--Flat
    if (textField.tag == 14) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 10;
        
    }
    //--POBox
    if (textField.tag == 6 || textField.tag == 15 ) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        //        return newLength <= 20;
        
        
        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        
        // allow backspace
        if (range.length > 0 && [string length] == 0) {
            return YES;
        }
        //        // do not allow . at the beggining
        //        if (range.location == 0 && [string isEqualToString:@"."]) {
        //            return NO;
        //        }
        // set the text field value manually
        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
        
        if(newLength > 15)
        {
            return NO;
        }
        textField.text = newValue;
        // return NO because we're manually setting the value
        return NO;
        
    }
    //--Telephone Fax Extension
    if (textField.tag == 8 || textField.tag == 9 || textField.tag == 10 || textField.tag == 17 || textField.tag == 21 || textField.tag == 22) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        //        return newLength <= 20;
        
        
        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        
        // allow backspace
        if (range.length > 0 && [string length] == 0) {
            return YES;
        }
        //        // do not allow . at the beggining
        //        if (range.location == 0 && [string isEqualToString:@"."]) {
        //            return NO;
        //        }
        // set the text field value manually
        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
        
        if(newLength > 15)
        {
            return NO;
        }
        textField.text = newValue;
        // return NO because we're manually setting the value
        return NO;
        
    }
   
    //--Building
    if (textField.tag == 12) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    //--Landmark
    if (textField.tag == 13) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
    }
    
//    //--Telephone
//    if (textField.tag == 17) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 13;
//        
//    }
    //--Residence Type
    if (textField.tag == 18) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    //--city
    if (textField.tag == 20) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
//    //--Home Mobile
//    if (textField.tag == 20) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 13;
//        
//    }
//    //--Telephone
//    if (textField.tag == 21) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 13;
//        
//    }
    //--Add1
    if (textField.tag == 23) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 100;
        
    }
    //--Add2
    if (textField.tag == 24) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 100;
        
    }
    //--Add3
    if (textField.tag == 25) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 100;
        
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
    
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"] || [actionMode isEqualToString:@"ENQUIRY"])
    {
        return NO;
    }
    
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
    
    
   
    //--office city
     if(textField.tag==7)
    {
        [self popoverData:textField:@"FavouriteCity"];
        return NO; //to disable keyboard
    }
    //--residence city
    else if(textField.tag==16)
    {
        [self popoverData:textField:@"FavouriteCity"];
        return NO; //to disable keyboard
    }
    //--country
    else if(textField.tag==19)
    {
        [self popoverData:textField:@"NATIONALITY"];
        return NO; //to disable keyboard
    }

    else
        return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
    
    
}



//}



-(void) popoverDate: (UITextField *)sender :(NSString *)dateRange :(NSString *)dateFormat
{
    [self popoverData:sender :NULL:@"Y":dateRange:dateFormat];
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName
{
    [self popoverData:sender :tableName:@"N":NULL:NULL];
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName :(NSString *)dateField :(NSString *)dateRange :(NSString *)dateFormat
{
    @try
    {
        
        NSLog(@"dateField %@",dateField);
        
        PopoverViewController *popoverViewController = [[PopoverViewController alloc]initWithNibName:nil bundle:nil];
        //popoverViewController.actionCode=actionCode;
        popoverViewController.tableName=tableName;
        popoverViewController.fieldTag=(int)sender.tag;
        popoverViewController.dateField=dateField;
        popoverViewController.dateRange=dateRange;
        popoverViewController.dateFormat=dateFormat;
        popoverViewController.delegate=self;
        
        //        UIPopoverController *popoverController =[[UIPopoverController alloc] initWithContentViewController:popoverViewController];
        //        [popoverController setPopoverContentSize:CGSizeMake(self.view.frame.size.width/4, self.view.frame.size.height/4)];
        
        
        // Present the view controller using the popover style.
        popoverViewController.modalPresentationStyle = UIModalPresentationPopover;
        [self presentViewController:popoverViewController animated: YES completion: nil];
        
        // Get the popover presentation controller and configure it.
        UIPopoverPresentationController *presentationController =[popoverViewController popoverPresentationController];
        presentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
        presentationController.sourceView = self.view;
        NSLog(@"x %f and y %f %@",sender.frame.origin.x,sender.frame.origin.y,sender.class);
        presentationController.sourceRect =  CGRectMake(0, sender.frame.origin.y, 1, 1);
        
        
        
        
        //        if(popoverController.popoverVisible==NO){
        //
        //            //NSLog(@" test %lf",sender.frame.origin.x);
        //            //NSLog(@" test %lf",sender.frame.origin.y);
        //
        //            [popoverController presentPopoverFromRect:CGRectMake(0, sender.frame.origin.y, 1, 1)    inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
        //        }
        //        else{
        //            [popoverController dismissPopoverAnimated:YES];
        //        }
        //
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in popoverData code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in popoverData  Code");
    }
    
    
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
    
    
    return 13;//[componentsArray count];
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
        
        return @"Office Address";
        
    }
    if (section == 5) {
        
        
        return @"Residence Address";
    }
    if (section == 9) {
        
        
        return @"Home Country Address";
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
   // addressData = [addressArray objectAtIndex:indexPath.section];
    
    
    
    
    
    
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
            
            CommonLabel *lblDepartment=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDepartment.text=@"Department";
            lblDepartment.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDepartment];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepartment attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepartment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepartment attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDepartment attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
            
            
            txtDepartment=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtDepartment.tag=1;
            txtDepartment.delegate=self;
            txtDepartment.placeholder=@"Department";
            txtDepartment.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDepartment];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepartment attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepartment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepartment attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDepartment attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
            
            
            CommonLabel *lblStreetName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblStreetName.text=@"Street Name/No";
            lblStreetName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblStreetName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblStreetName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblStreetName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblStreetName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblStreetName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2 constant:0]];
            
            
            txtStreetName = [[CommonTextField alloc] init];
            txtStreetName.tag=2;
            txtStreetName.delegate=self;
            txtStreetName.placeholder=@"Street Name";
            txtStreetName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtStreetName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtStreetName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtStreetName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtStreetName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtStreetName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height2 constant:0]];
            
            
            
            
        }
        else if(indexPath.section==1)
        {
            
            CommonLabel *lblBuildingName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblBuildingName.text=@"Building Name";
            lblBuildingName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblBuildingName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBuildingName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBuildingName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBuildingName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBuildingName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
            
            
            txtBuildingName = [[CommonTextField alloc] init];
            txtBuildingName.tag=3;
            txtBuildingName.delegate=self;
            txtBuildingName.placeholder=@"Building Name";
            txtBuildingName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtBuildingName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBuildingName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBuildingName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBuildingName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBuildingName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
            
            
            CommonLabel *lblNearestLandmark=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNearestLandmark.text=@"Nearest Landmark";
            lblNearestLandmark.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNearestLandmark];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNearestLandmark attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNearestLandmark attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNearestLandmark attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNearestLandmark attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2 constant:0]];
            
            
            txtNearestLandmark = [[CommonTextField alloc] init];
            txtNearestLandmark.tag=4;
            txtNearestLandmark.delegate=self;
            txtNearestLandmark.placeholder=@"Nearest Landmark";
            txtNearestLandmark.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNearestLandmark];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNearestLandmark attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNearestLandmark attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNearestLandmark attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNearestLandmark attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height2 constant:0]];
            
            
        }
        else if(indexPath.section==2){
            
            CommonLabel *lblFlatNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblFlatNo.text=@"Flat/Villa No";
            lblFlatNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblFlatNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFlatNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFlatNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFlatNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFlatNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
            
            
            txtFlatNo=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtFlatNo.tag=5;
            txtFlatNo.delegate=self;
            txtFlatNo.placeholder=@"Flat/Villa No";
            txtFlatNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtFlatNo];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFlatNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFlatNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFlatNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFlatNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
            
            CommonLabel *lblPoBox=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPoBox.text=@"P.O.Box";
            lblPoBox.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPoBox];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPoBox attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPoBox attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPoBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPoBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2 constant:0]];
            
            
            txtPoBox=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtPoBox.tag=6;
            txtPoBox.delegate=self;
            txtPoBox.placeholder=@"P.O.Box";
            txtPoBox.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPoBox];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPoBox attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPoBox attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPoBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPoBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height2 constant:0]];
            
            
        }
        else if(indexPath.section==3){
            
            CommonLabel *lblCity=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCity.text=@"City/Emirate";
            lblCity.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCity];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
            
            
            txtCity=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtCity.tag=7;
            txtCity.delegate=self;
            txtCity.placeholder=@"City/Emirate";
            txtCity.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCity];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
            
            
            
            CommonLabel *lblTelePhone=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTelePhone.text=@"Telephone";
            lblTelePhone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTelePhone];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTelePhone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTelePhone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTelePhone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTelePhone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2 constant:0]];
            
            
            txtTelePhone = [[CommonTextField alloc] init];
            txtTelePhone.tag=8;
            txtTelePhone.delegate=self;
            txtTelePhone.placeholder=@"Telephone";
            txtTelePhone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTelePhone];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTelePhone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTelePhone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTelePhone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTelePhone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height2 constant:0]];
            
            
        }
        else if(indexPath.section==4){
            CommonLabel *lblExtension=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblExtension.text=@"Extension";
            lblExtension.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblExtension];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtension attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtension attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtension attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtension attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
            
            
            txtExtension=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtExtension.tag=9;
            txtExtension.delegate=self;
            txtExtension.placeholder=@"Extenion";
            txtExtension.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtExtension];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtension attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtension attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtension attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtension attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
            
            CommonLabel *lblFax=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblFax.text=@"Fax";
            lblFax.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblFax];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFax attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFax attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFax attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFax attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2 constant:0]];
            
            
            txtFax = [[CommonTextField alloc] init];
            txtFax.tag=10;
            txtFax.delegate=self;
            txtFax.placeholder=@"Fax";
            txtFax.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtFax];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFax attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFax attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFax attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFax attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height2 constant:0]];
            
            
            
            
            
            
        }
        else if(indexPath.section==5){
            
            
            
            CommonLabel *lblResStreetName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblResStreetName.text=@"Street Name";
            lblResStreetName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblResStreetName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResStreetName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResStreetName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResStreetName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResStreetName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
            
            
            
            
            txtResStreetName=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtResStreetName.tag=11;
            txtResStreetName.delegate=self;
            txtResStreetName.placeholder=@"Street Name";
            txtResStreetName.translatesAutoresizingMaskIntoConstraints=NO;
            
            [cell.contentView addSubview:txtResStreetName];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResStreetName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResStreetName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResStreetName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResStreetName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
            
            
            CommonLabel *lblResBuildingName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblResBuildingName.text=@"Building Name";
            lblResBuildingName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblResBuildingName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResBuildingName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResBuildingName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResBuildingName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResBuildingName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2 constant:0]];
            
            
            
            txtResBuildingName=[[CommonTextField alloc] init];
            txtResBuildingName.tag=12;
            txtResBuildingName.delegate=self;
            txtResBuildingName.placeholder=@"Building Name";
            txtResBuildingName.translatesAutoresizingMaskIntoConstraints=NO;
            
            [cell.contentView addSubview:txtResBuildingName];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResBuildingName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResBuildingName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResBuildingName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResBuildingName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height2 constant:0]];
            
            
        }
      else if(indexPath.section==6){
        
        CommonLabel *lblResNearestLandmark=[[CommonLabel alloc]initWithFrame:CGRectZero];
        lblResNearestLandmark.text=@"Nearest Landmark";
        lblResNearestLandmark.translatesAutoresizingMaskIntoConstraints=NO;
        [cell.contentView addSubview:lblResNearestLandmark];
        
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResNearestLandmark attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResNearestLandmark attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResNearestLandmark attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResNearestLandmark attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
        
        
        
        txtResNearestLandmark = [[CommonTextField alloc] init];
        txtResNearestLandmark.tag=13;
        txtResNearestLandmark.delegate=self;
        txtResNearestLandmark.placeholder=@"Nearest Landmark";
        txtResNearestLandmark.translatesAutoresizingMaskIntoConstraints=NO;
        [cell.contentView addSubview:txtResNearestLandmark];
        
          
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResNearestLandmark attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
          
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResNearestLandmark attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
          
          
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResNearestLandmark attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
          
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResNearestLandmark attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
        
          
        CommonLabel *lblResFlatNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
        lblResFlatNo.text=@"Flat/Villa No";
        lblResFlatNo.translatesAutoresizingMaskIntoConstraints=NO;
        [cell.contentView addSubview:lblResFlatNo];
          
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResFlatNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2 constant:0]];
          
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResFlatNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2 constant:0]];
          
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResFlatNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2 constant:0]];
          
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResFlatNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2 constant:0]];
        
        txtResFlatNo=[[CommonTextField alloc] initWithFrame:CGRectZero];
        txtResFlatNo.tag=14;
        txtResFlatNo.delegate=self;
        txtResFlatNo.placeholder=@"Flat/Villa No";
        txtResFlatNo.translatesAutoresizingMaskIntoConstraints=NO;
        [cell.contentView addSubview:txtResFlatNo];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResFlatNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResFlatNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y2 constant:0]];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResFlatNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResFlatNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height2 constant:0]];
        

            
            
            
            
        }
        
      else if(indexPath.section==7){
        
        CommonLabel *lblResPoBox=[[CommonLabel alloc]initWithFrame:CGRectZero];
        lblResPoBox.text=@"P.O.Box";
        lblResPoBox.translatesAutoresizingMaskIntoConstraints=NO;
        [cell.contentView addSubview:lblResPoBox];
    
        
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResPoBox attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResPoBox attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResPoBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResPoBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
        
        
        txtResPoBox=[[CommonTextField alloc] initWithFrame:CGRectZero];
        txtResPoBox.tag=15;
        txtResPoBox.delegate=self;
        txtResPoBox.placeholder=@"P.O.Box";
        txtResPoBox.translatesAutoresizingMaskIntoConstraints=NO;
        [cell.contentView addSubview:txtResPoBox];
        

        [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResPoBox attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
            
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResPoBox attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
            
            
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResPoBox attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
            
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResPoBox attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
        
        
        
        CommonLabel *lblResCity=[[CommonLabel alloc]initWithFrame:CGRectZero];
        lblResCity.text=@"City/Emirate";
        lblResCity.translatesAutoresizingMaskIntoConstraints=NO;
        [cell.contentView addSubview:lblResCity];
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2 constant:0]];
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2 constant:0]];
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2 constant:0]];
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2 constant:0]];
        
        
        
        txtResCity=[[CommonTextField alloc] initWithFrame:CGRectZero];
        txtResCity.tag=16;
        txtResCity.delegate=self;
        txtResCity.placeholder=@"City/Emirate";
        txtResCity.translatesAutoresizingMaskIntoConstraints=NO;
        [cell.contentView addSubview:txtResCity];
        
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X2 constant:0]];
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y2 constant:0]];
        
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width2 constant:0]];
        
        [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height2 constant:0]];

        
    
        
            
        }
        
      else if(indexPath.section==8){
          
          CommonLabel *lblResTelePhone=[[CommonLabel alloc]initWithFrame:CGRectZero];
          lblResTelePhone.text=@"Telephone";
          lblResTelePhone.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:lblResTelePhone];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResTelePhone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResTelePhone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResTelePhone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResTelePhone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
          
          
          txtResTelePhone = [[CommonTextField alloc] init];
          txtResTelePhone.tag=17;
          txtResTelePhone.delegate=self;
          txtResTelePhone.placeholder=@"Telephone";
          txtResTelePhone.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:txtResTelePhone];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResTelePhone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResTelePhone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResTelePhone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResTelePhone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
          
          
          
          
          
          CommonLabel *lblResidenceType=[[CommonLabel alloc]initWithFrame:CGRectZero];
          lblResidenceType.text=@"Residence Type";
          lblResidenceType.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:lblResidenceType];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResidenceType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResidenceType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResidenceType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResidenceType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2 constant:0]];
          
          
          
          txtResidenceType=[[CommonTextField alloc] initWithFrame:CGRectZero];
          txtResidenceType.tag=18;
          txtResidenceType.delegate=self;
          txtResidenceType.placeholder=@"Residence Type";
          txtResidenceType.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:txtResidenceType];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y2 constant:0]];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height2 constant:0]];
          
          
      }
      else if(indexPath.section==9){
          
          CommonLabel *lblCountry=[[CommonLabel alloc]initWithFrame:CGRectZero];
          lblCountry.text=@"Country";
          lblCountry.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:lblCountry];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCountry attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCountry attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCountry attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCountry attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
          
          
          txtCountry = [[CommonTextField alloc] init];
          txtCountry.tag=19;
          txtCountry.delegate=self;
          txtCountry.placeholder=@"Country";
          txtCountry.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:txtCountry];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCountry attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCountry attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCountry attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCountry attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
          
          
          
          
          CommonLabel *lblHCity=[[CommonLabel alloc]initWithFrame:CGRectZero];
          lblHCity.text=@"City";
          lblHCity.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:lblHCity];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2 constant:0]];
          
          
          
          txtHCity=[[CommonTextField alloc] initWithFrame:CGRectZero];
          txtHCity.tag=20;
          txtHCity.delegate=self;
          txtHCity.placeholder=@"City";
          txtHCity.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:txtHCity];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y2 constant:0]];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height2 constant:0]];
          
          
          
          
          
         
          
          
      }
    
      else if(indexPath.section==10){
          
          
          CommonLabel *lblHMobile=[[CommonLabel alloc]initWithFrame:CGRectZero];
          lblHMobile.text=@"Mobile";
          lblHMobile.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:lblHMobile];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHMobile attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHMobile attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHMobile attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHMobile attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
          
          
          
          txtHMobile=[[CommonTextField alloc] initWithFrame:CGRectZero];
          txtHMobile.tag=21;
          txtHMobile.delegate=self;
          txtHMobile.placeholder=@"Mobile";
          txtHMobile.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:txtHMobile];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHMobile attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHMobile attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHMobile attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHMobile attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
          
          
          
          
          CommonLabel *lblHTelePhone=[[CommonLabel alloc]initWithFrame:CGRectZero];
          lblHTelePhone.text=@"Telephone";
          lblHTelePhone.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:lblHTelePhone];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHTelePhone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHTelePhone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHTelePhone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHTelePhone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2 constant:0]];
          
          
          
          txtHTelePhone = [[CommonTextField alloc] init];
          txtHTelePhone.tag=22;
          txtHTelePhone.delegate=self;
          txtHTelePhone.placeholder=@"Telephone";
          txtHTelePhone.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:txtHTelePhone];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHTelePhone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHTelePhone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y2 constant:0]];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHTelePhone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHTelePhone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height2 constant:0]];
          
          
      }
    
        
      else if(indexPath.section==11){
          
          CommonLabel *lblAddress1=[[CommonLabel alloc]initWithFrame:CGRectZero];
          lblAddress1.text=@"Address Line 1";
          lblAddress1.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:lblAddress1];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAddress1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAddress1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAddress1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAddress1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
          
          
          txtAddress1 = [[CommonTextField alloc] init];
          txtAddress1.tag=23;
          txtAddress1.delegate=self;
          txtAddress1.placeholder=@"Address Line 1";
          txtAddress1.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:txtAddress1];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAddress1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAddress1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAddress1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAddress1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
          
          
          
          CommonLabel *lblAddress2=[[CommonLabel alloc]initWithFrame:CGRectZero];
          lblAddress2.text=@"Address Line 2";
          lblAddress2.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:lblAddress2];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAddress2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAddress2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAddress2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAddress2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2 constant:0]];
          
          
          txtAddress2 = [[CommonTextField alloc] init];
          txtAddress2.tag=24;
          txtAddress2.delegate=self;
          txtAddress2.placeholder=@"Address Line 2";
          txtAddress2.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:txtAddress2];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAddress2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAddress2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2Y2 constant:0]];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAddress2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAddress2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2Height2 constant:0]];
          
          
      }
    
      else if(indexPath.section==12){
          
          CommonLabel *lblAddress3=[[CommonLabel alloc]initWithFrame:CGRectZero];
          lblAddress3.text=@"Address Line 3";
          lblAddress3.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:lblAddress3];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAddress3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAddress3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAddress3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAddress3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2 constant:0]];
          
          
          txtAddress3 = [[CommonTextField alloc] init];
          txtAddress3.tag=25;
          txtAddress3.delegate=self;
          txtAddress3.placeholder=@"Address Line 3";
          txtAddress3.translatesAutoresizingMaskIntoConstraints=NO;
          [cell.contentView addSubview:txtAddress3];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAddress3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAddress3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2 constant:0]];
          
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAddress3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2 constant:0]];
          
          [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAddress3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2 constant:0]];
          
          
      }
    
      
        
        
    }
    else{
        
        
        
        [cell.contentView viewWithTag:100+indexPath.section];
        [cell.contentView viewWithTag:indexPath.section];
        
        [cell.contentView viewWithTag:500+indexPath.section];
        [cell.contentView viewWithTag:600+indexPath.section];
        
    }
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    if(([actionMode isEqualToString:@"UPDATE"] || [actionMode isEqualToString:@"ENQUIRY"]) && [addressArray count]>0)
    {
    
        [self loadData];
        
    
    }
    
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
    
//    NSUInteger row = indexPath.section;//row;
//    
//    
//    
//    if (row != NSNotFound)
//    {
//        addressData = [addressArray objectAtIndex:0]; //indexPath.section
//        
//        // NSLog(@"selected account %@",onBoardData.accountNumber);
//        
//        if([actionMode isEqualToString:@"TRNHISTORY"])
//        {
//            
//            
//            //            AccountTrnViewController *accountTrnViewController = [[AccountTrnViewController alloc]initWithNibName:nil bundle:nil];
//            //
//            //            //NSLog(@"selected account %@",[self.onBoardDataValueData objectAtIndex:indexPath.row]);
//            //
//            //            accountTrnViewController.cifNumber=onBoardData.cifNumber;
//            //            accountTrnViewController.accountNumber=onBoardData.accountNumber;
//            //            accountTrnViewController.sessionid=self.sessionid;
//            //            accountTrnViewController.userid=self.userid;
//            //
//            //            [self.navigationController pushViewController:accountTrnViewController animated:YES];
//            
//        }
//        
//        
//        
//    }
    
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}

- (void) doValidate {
    
    
        //------validation starts---------
    
        if([CommonUtils checkEmptyString:txtDepartment.text]==YES)
        {
            
            [CommonUtils showMessage:@"Department can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    
        if([CommonUtils checkEmptyString:txtStreetName.text]==YES)
        {
    
            [CommonUtils showMessage:@"Street Name can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtBuildingName.text]==YES)
        {
    
            [CommonUtils showMessage:@"Building Name can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtNearestLandmark.text]==YES)
        {
    
            [CommonUtils showMessage:@"Nearest Landmark can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtFlatNo.text]==YES)
        {
    
            [CommonUtils showMessage:@"Flat No can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtPoBox.text]==YES)
        {
    
            [CommonUtils showMessage:@"P.O. Box No can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtCity.text]==YES)
        {
    
            [CommonUtils showMessage:@"City can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtTelePhone.text]==YES)
        {
    
            [CommonUtils showMessage:@"Telephone No can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtResStreetName.text]==YES)
        {
            
            [CommonUtils showMessage:@"Residence Street Name can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtResBuildingName.text]==YES)
        {
            
            [CommonUtils showMessage:@"Residence Building Name can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtResNearestLandmark.text]==YES)
        {
            
            [CommonUtils showMessage:@"Residence Nearest Landmark can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtResFlatNo.text]==YES)
        {
            
            [CommonUtils showMessage:@"Flat No can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtResPoBox.text]==YES)
        {
            
            [CommonUtils showMessage:@"P.O. Box No can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtResCity.text]==YES)
        {
            
            [CommonUtils showMessage:@"City can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtResTelePhone.text]==YES)
        {
            
            [CommonUtils showMessage:@"Telephone No can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtResidenceType.text]==YES)
        {
            
            [CommonUtils showMessage:@"Residence Type can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        
        if([CommonUtils checkEmptyString:txtCountry.text]==YES)
        {
    
            [CommonUtils showMessage:@"Country can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtCity.text]==YES)
        {
            
            [CommonUtils showMessage:@"City can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtHMobile.text]==YES)
        {
            
            [CommonUtils showMessage:@"Mobile can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtHTelePhone.text]==YES)
        {
            
            [CommonUtils showMessage:@"Home Country Telephone No can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtAddress1.text]==YES)
        {
            
            [CommonUtils showMessage:@"Address Line 1 can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    
//
//    if([actionMode isEqualToString:@"FETCH"])
//    {
//        actionMode=@"UPDATE";
//        
//    }
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    
    [self buildJSON];
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}
- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    NSData *newData;
    
    
    @try{
    
//        if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
//        {
//            jsonDictionary= @{@"refNo":self.refNo};
//        }
//        else
//        {
//            
             NSLog(@"Address RefNo is %@",self.refNo);
            
            //-------
            
            jsonDictionary= @{
                                @"refNo":emptyStringIfNil(self.refNo),
                                @"department":emptyStringIfNil(self.txtDepartment.text),
                                @"offStreetName":emptyStringIfNil(self.txtStreetName.text),
                                @"offBuildingName":emptyStringIfNil(self.txtBuildingName.text),
                                @"offNearestLandmark":emptyStringIfNil(self.txtNearestLandmark.text),
                                @"offFlatNo":emptyStringIfNil(self.txtFlatNo.text),
                                @"offPOBox":emptyStringIfNil(self.txtPoBox.text),
                                @"offEmirate":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCity.tag]]),
                                @"offTelephone":emptyStringIfNil(self.txtTelePhone.text),
                                @"offExtension":emptyStringIfNil(self.txtExtension.text),
                                @"offFax":emptyStringIfNil(self.txtFax.text),
                                @"resStreetName":emptyStringIfNil(self.txtResStreetName.text),
                                @"resBuildingName":emptyStringIfNil(self.txtBuildingName.text),
                                @"resNearestLandmark":emptyStringIfNil(self.txtResNearestLandmark.text),
                                @"resFlatNo":emptyStringIfNil(self.txtResFlatNo.text ),
                                @"resPOBox":emptyStringIfNil(self.txtResPoBox.text),
                                @"resEmirate":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtResCity.tag]]),
                                @"resTelephone":emptyStringIfNil(self.txtResTelePhone.text),
                                @"resType":emptyStringIfNil(self.txtResidenceType.text),
                                @"homeCountry":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCountry.tag]]),
                                @"homeCity":emptyStringIfNil(self.txtHCity.text),
                                @"homeMobile":emptyStringIfNil(self.txtHMobile.text),
                                @"homeTelephone":emptyStringIfNil(self.txtHTelePhone.text),
                                @"homeAddress1":emptyStringIfNil(self.txtAddress1.text),
                                @"homeAddress2":emptyStringIfNil(self.txtAddress2.text),
                                @"homeAddress3":emptyStringIfNil(self.txtAddress3.text),
                                @"recordStatus":emptyStringIfNil(self.recordStatus)
                                };
            
            
         
            
            
        //}
        
        
        //        for (int i=0; i<=[componentsArray count]-1; i++) {
        //
        //            if([[componentsArray objectAtIndex:i] isKindOfClass:[UITextField class]])
        //            {
        //
        //                [jsonDictionary initWithObjects:<#(NSArray *)#> forKeys:<#(NSArray *)#>
        //
        //
        //            }
        //        }
        
        
        
        
        //NSString *jsonString = [container JSONRepresentation];
        
//        if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"] )
//        {
//            
//            newData=[CommonUtils connectHost :@"fetchAddressDetails" :jsonDictionary :self];
//            [self parseResponse:newData:@"fetchAddressDetails":@"addressDetailsWrapper"];
//            
//            
//        }
        if([actionMode isEqualToString:@"NEW"]) // && [viewMode isEqualToString:@"N"] )
       {
        
           newData=[CommonUtils connectHost :@"insertAddressDetails" :jsonDictionary :self];
           [self parseResponse:newData:@"insertAddressDetails":@"addressDetailsWrapper"];

           
           
        }
        if([actionMode isEqualToString:@"UPDATE"])// && [viewMode isEqualToString:@"N"])
        {
            
            newData=[CommonUtils connectHost :@"updateAddressDetails" :jsonDictionary :self];
            [self parseResponse:newData:@"updateAddressDetails":@"addressDetailsWrapper"];
            
            
        }
        
        self.refNo=addressData.refNo;
        
        NSLog(@"RefNo %@",self.refNo);
        

        //---invoke next screen---
//        if([viewMode isEqualToString:@"N"])
//        {
            NSLog(@"To invoke next screen");
//            
//            if([actionMode isEqualToString:@"NEW"])
//            {
//                viewMode=@"N";
//            }
//            if([actionMode isEqualToString:@"UPDATE"])
//            {
//                viewMode=@"Y";
//            }
//            
            //[CommonUtils showMessage:@"Account Created, pending approval" :self];
            
            
            
//            SearchViewController *searchViewController = [[SearchViewController alloc]initWithNibName:nil bundle:nil];
//            [self.navigationController pushViewController:searchViewController animated:YES];
            
            
            ProductViewController *productViewController = [[ProductViewController alloc]initWithNibName:nil bundle:nil];
            productViewController.actionMode=self.actionMode;
            productViewController.recordStatus=self.recordStatus;
            //productViewController.viewMode=self.viewMode;
            productViewController.refNo=self.refNo;
            productViewController.existingCustomerFlag=self.existingCustomerFlag;
            productViewController.accountType=self.accountType;
            productViewController.menuName=self.menuName;
            
            [self.navigationController pushViewController:productViewController animated:YES];
            
            
            
        //}
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSON code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in buildJSON  Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}
- (void) viewData {
    
    @try{
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //{
        NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
        //}
        
        //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //{
        
         NSData *newData=[CommonUtils connectHost :@"fetchAddressDetails" :jsonDictionary :self];
         [self parseResponse:newData:@"fetchAddressDetails":@"addressDetailsWrapper"];
        
       
        
        //}
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Address viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in  Address viewData Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}

-(void) loadData {
    
    
    @try{
        
        addressData = [addressArray objectAtIndex:0];
        
        txtDepartment.text=emptyStringIfNil(addressData.department);
        txtStreetName.text=emptyStringIfNil(addressData.offStreetName);
        txtBuildingName.text=emptyStringIfNil(addressData.offBuildingName);
        txtNearestLandmark.text=emptyStringIfNil(addressData.offNearestLandmark);
        txtFlatNo.text=emptyStringIfNil(addressData.offFlatNo);
        txtPoBox.text=emptyStringIfNil(addressData.offPOBox);
        txtCity.text=emptyStringIfNil(addressData.offEmirateValue);
        txtTelePhone.text=emptyStringIfNil(addressData.offTelephone);
        txtExtension.text=emptyStringIfNil(addressData.offExtension);
        txtFax.text=emptyStringIfNil(addressData.offFax);
        txtResStreetName.text=emptyStringIfNil(addressData.resStreetName);
        txtResBuildingName.text=emptyStringIfNil(addressData.resBuildingName);
        txtResNearestLandmark.text=emptyStringIfNil(addressData.resNearestLandmark);
        txtResFlatNo.text=emptyStringIfNil(addressData.resFlatNo);
        txtResPoBox.text=emptyStringIfNil(addressData.resPOBox);
        txtResCity.text=emptyStringIfNil(addressData.resEmirateValue);
        txtResTelePhone.text=emptyStringIfNil(addressData.resTelephone);
        txtResidenceType.text=emptyStringIfNil(addressData.resType);
        txtCountry.text=emptyStringIfNil(addressData.homeCountryValue);
        txtHCity.text=emptyStringIfNil(addressData.homeCity);
        txtHMobile.text=emptyStringIfNil(addressData.homeMobile);
        txtHTelePhone.text=emptyStringIfNil(addressData.homeTelephone);
        txtAddress1.text=emptyStringIfNil(addressData.homeAddress1);
        txtAddress2.text=emptyStringIfNil(addressData.homeAddress2);
        txtAddress3.text=emptyStringIfNil(addressData.homeAddress3);
        
        [popoverCodeValue setObject:emptyStringIfNil(self.addressData.offEmirate) forKey:[NSString stringWithFormat:@"%d", self.txtCity.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.addressData.resEmirate) forKey:[NSString stringWithFormat:@"%d", self.txtResCity.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.addressData.homeCountry) forKey:[NSString stringWithFormat:@"%d", self.txtCountry.tag]];
        
        
        
        NSLog(@"cell data loaded ");
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Load Data code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in Load Data Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
    
    
}


- (void) viewPathStatus {
    
    @try{
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
       
        NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
        
      
        
        
       
        NSData *newData=[CommonUtils connectHost :@"fetchPathStatus" :jsonDictionary:self];
        [self parseResponsePath:newData:@"fetchPathStatus":@"pathStatusWrapper"];
        
        
        
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Personal viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in PathStatus Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}

- (void) doReject {
    
    
    @try{
        
        
        UIAlertController *alertController=[UIAlertController
                                            alertControllerWithTitle:@"Confirmation"
                                            message:[NSString stringWithFormat:@"Do you want to send this Application %@ back to maker?",self.refNo]
                                            preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction* okAction = [UIAlertAction
                                   actionWithTitle:@"Proceed"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       
                                       
                                       
                                       
                                       [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
                                       
                                       //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
                                       //{
                                       NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo),
                                                                       @"recordStatus":@"INPROGRESS"
                                                                       };
                                       //}
                                       
                                       //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
                                       //{
                                       
                                       NSData *newData=[CommonUtils connectHost :@"updateApplicationStatus" :jsonDictionary:self];
                                       [self parseResponse:newData:@"updateApplicationStatus":@"personalDetailsWrapper"];
                                       
                                       
                                       
                                       
                                       QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
                                       queueViewController.actionMode=@"UPDATE";
                                       queueViewController.menuId=@"QUEUEAPPROVER";
                                       queueViewController.recordStatus=@"CREATE";
                                       [self.navigationController pushViewController:queueViewController animated:YES];
                                       
                                       
                                       //}
                                       [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                                       
                                       
                                       
                                   }];
        
        
        UIAlertAction* cancelAction = [UIAlertAction
                                       actionWithTitle:@"Cancel"
                                       style:UIAlertActionStyleDefault
                                       handler:^(UIAlertAction * action)
                                       {
                                           //[alert dismissViewControllerAnimated:YES completion:nil];
                                       }];
        
        [alertController addAction:okAction];
        [alertController addAction:cancelAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        
        
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Personal viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
            }
    @finally {
        
        NSLog(@"finally in doreject Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];

    }
    
}




//- (NSData *) connectHost:(NSString *)methodAction :(NSDictionary *) jsonDictionary {
//
//
//    @try {
//
//
//
//        NSLog(@"connectHost %@",userid);
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
//        NSString *myUrlString = [self ReadSingleTonInstanceVariable:@"hostServerURL"];//@"http://192.168.1.37:8083";
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
//            return newData;
//            
//        }
//        else if ([newData length] == 0 && error == nil){
//            NSLog(@"Empty Response, not sure why?");
//            [CommonUtils showMessage:@"No response from host system":self];
//        }
//        else if (error != nil){
//            NSLog(@"Not again, what is the error = %@", error);
//            
//            [CommonUtils showError:error:self:@"connectHost"];
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
//        NSLog(@"Exception in connectHost code %@ reason %@ " , [exception name], [exception reason]);
//        [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//        
//        NSLog(@"finally in connectHost  Code");
//    }
//    
//    
//    
//    
//    
//    
//}







- (void) parseResponse:(NSData *) data :(NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        //NSLog(@"get customer info enterest %@",userid);
        
        
        
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
            //sessionid = [jsonObject objectForKey:@"sessionid"];
            
            //NSLog(@"userid print :%@",userid);
            //NSLog(@"sessionid print :%@",sessionid);
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                
                //set the customer object of the second view controller
                dataDictionary =[jsonObject objectForKey:methodAction];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                addressArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    addressData = [[AddressData alloc] initWithJSONDictionary:dict];
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    // Add the Location object to the array
                    [addressArray addObject:addressData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)addressArray.count);
                
                
                
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
                
                [CommonUtils showMessage:@"Invalid userid or sessionid !":self];
                
                
            }
            
        }
        else{
            
            [CommonUtils showError:error:self:@"parseResponse"];
            
            
            
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponse Code");
    }
    
}

- (void) parseResponsePath:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        //NSLog(@"get customer info enterest %@",userid);
        
        
        
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
            //sessionid = [jsonObject objectForKey:@"sessionid"];
            
            //NSLog(@"userid print :%@",userid);
            //NSLog(@"sessionid print :%@",sessionid);
            
            
            NSNumber *success = [jsonObject objectForKey:@"success"];
            if([success boolValue] == YES){
                
                
                
                //set the customer object of the second view controller
                //dataDictionary =[jsonObject objectForKey:@"fetchPersonalDetails"];
                dataDictionary =[jsonObject objectForKey:methodAction];
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                pathArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    pathData = [[PathData alloc] initWithJSONDictionary:dict];
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    // Add the Location object to the array
                    [pathArray addObject:pathData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)pathArray.count);
                
                
                
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
                
                [CommonUtils showMessage:@"Invalid userid or sessionid !":self];
                
                
            }
            
        }
        else{
            
            [CommonUtils showError:error:self:@"parseResponse"];
            
            
            
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponse code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
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
        [popoverCodeValue setObject:code forKey:[NSString stringWithFormat:@"%d", fieldTag]];
        //[dataArray insertObject:code atIndex:fieldTag];
    }
    
    
    
}
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
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"pathstatus" ofType:@"html" inDirectory:@"www"]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    webView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:webView];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.78 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.58 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.23 constant:0]];
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
    NSString* json;
    
    @try
    {
        
        
        
        NSMutableDictionary *jsonDictionary = [[NSMutableDictionary alloc]init];
        
        
        for (int i=0; i<=pathArray.count-1; i++)
        {
            
            pathData = [pathArray objectAtIndex:i];
            
            NSLog(@"path screen %@",pathData.screen);
            
            [jsonDictionary setObject:pathStringIfNil(pathData.status) forKey:pathData.screen];
            
            
        }
        
        
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
        
        
        json = [NSString stringWithFormat:@ "loadDashboardChart(%@);",jsonString];
        
        NSLog(@"function json %@",json);
        [self.webView stringByEvaluatingJavaScriptFromString: json];
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in webViewDidFinishLoad code %@ reason %@ " , [exception name], [exception reason]);
        
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in webViewDidFinishLoad  Code");
    }
    
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

static inline NSString* emptyStringIfNil(NSString *value) {
    return value? value : @"";
}

static inline NSString* pathStringIfNil(NSString *value) {
    
    return ([value isEqualToString:@"Y"]? @"100" : @"0");
}

@end
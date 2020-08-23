//
//  AutoLoansViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 26/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "AutoLoansViewController.h"
#import "AutoLoans2ViewController.h"
#import "AutoLoansData.h"
#import "QueueViewController.h"






@interface AutoLoansViewController()

@end


#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblConstraintAutoX=0.52f;
CGFloat lblConstraintAutoY=1.0f;
CGFloat lblConstraintAutoWidth=0.5f;
CGFloat lblConstraintAutoHeight=0.8f;

CGFloat constraintAutoX=1.19f;
CGFloat constraintAutoY=1.0f;
CGFloat constraintAutoWidth=0.80f;
CGFloat constraintAutoHeight=0.8f;

//CGFloat constraintAuto1X=0.69f;
//CGFloat constraintAuto1Y=1.0f;
//CGFloat constraintAuto1Width=0.3f;
//CGFloat constraintAuto1Height=0.8f;

CGFloat constraintAuto1X2=0.69f;
CGFloat constraintAuto1Y2=1.0f;
CGFloat constraintAuto1Width2=0.3f;
CGFloat constraintAuto1Height2=0.8f;

CGFloat lblConstraintAuto2X=1.52f;
CGFloat lblConstraintAuto2Y=1.0f;
CGFloat lblConstraintAuto2Width=0.5f;
CGFloat lblConstraintAuto2Height=0.8f;

//CGFloat constraintAuto2X=1.69f;
//CGFloat constraintAuto2Y=1.0f;
//CGFloat constraintAuto2Width=0.3f;
//CGFloat constraintAuto2Height=0.8f;

CGFloat constraintAuto2X2=1.69f;
CGFloat constraintAuto2Y2=1.0f;
CGFloat constraintAuto2Width2=0.3f;
CGFloat constraintAuto2Height2=0.8f;


@implementation AutoLoansViewController


//@synthesize userid;
//@synthesize sessionid;
@synthesize menuName;
@synthesize actionMode;


@synthesize dataDictionary;

@synthesize  popoverCodeValue;



@synthesize txtSalesOfficerName;
@synthesize txtCode;
@synthesize txtCISNo ;
@synthesize txtNoYearsUAE;
@synthesize txtNameOfSponsor;
@synthesize txtAccountNumber;
@synthesize txtYCISNo;
@synthesize txtBankName;
@synthesize txtBranch;
@synthesize txtSalaryTransfer;
@synthesize txtMonthlyPayments;
@synthesize txtDealerOrsellerName;
@synthesize txtTelephone;
@synthesize txtFax;
@synthesize txtMakeOrModel;
@synthesize txtMileage;
@synthesize txtNused;
@synthesize txtNormalOrAlloy;
@synthesize txtTransmission;
@synthesize txtSunroof;
@synthesize txtDealerSalesRepName;


@synthesize autoLoansArray;
@synthesize autoLoansData;
@synthesize existingCustomerFlag;
@synthesize existingRefNo;
@synthesize dateToolBar;
@synthesize datePicker;
@synthesize accountType;

@synthesize dataArray;

@synthesize webView;
//@synthesize activityIndicator;
//@synthesize lblLoading;

@synthesize timerView;
//@synthesize switchFlag;

int hours, minutes, seconds,secondsLeft;

@synthesize refNo;



@synthesize recordStatus;


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
    
//    self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"Auto Loan"];
    self.navigationItem.title=@"Auto Loan";
    
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
    
    //---Screen UIView
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
    //popoverCodeValue = [[NSMutableDictionary alloc]init];
    
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
    
    //[self displayGraph];
    
    
    
    
    //---initialize during load
    popoverCodeValue = [[NSMutableDictionary alloc]init];
    
    
    //--when not new
    if([actionMode isEqualToString:@"UPDATE"] ||[actionMode isEqualToString:@"ENQUIRY"] || ([actionMode isEqualToString:@"NEW"] && [existingCustomerFlag isEqualToString:@"Y"] && [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]))// && [viewMode isEqualToString:@"Y"])
    {
        
        [self viewData];
        
        //viewMode=@"N";
        
        
    }
    
    
    
    //[self displayHeader];
    
    [self displayGraph];
    
    
    
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
    //--Sales Officer's Name
    if (textField.tag == 1) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 100;
        
    }
    //--Code
    if (textField.tag == 2) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
//    //--CIS No
//    if (textField.tag == 3) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
      //--CIS No ,Account No, Cis No
    if (textField.tag == 3 || textField.tag == 6 || textField.tag == 7) {
        
        
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
        
        if(newLength > 20)
        {
            return NO;
        }
        textField.text = newValue;
        // return NO because we're manually setting the value
        return NO;
        
    }
    
     //-- No of Years in UAE
    if (textField.tag == 4) {
        
        
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
        
        if(newLength > 2)
        {
            return NO;
        }
        textField.text = newValue;
        // return NO because we're manually setting the value
        return NO;
        
    }
    //-- Name of sponsor
    if (textField.tag == 5) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 100;
        
    }
//    //-- Account No
//    if (textField.tag == 6) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
//    //-- CIS No
//    if (textField.tag == 7) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
    //-- Bank Name
    if (textField.tag == 8) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    //-- Branch
    if (textField.tag == 9) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 19;
        
    }
    //-- Monthly Payments
    if (textField.tag == 11) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //-- Dealer/seller name
    if (textField.tag == 12) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
//    //-- Telephone, Fax
    
    if (textField.tag == 13 || textField.tag == 14) {
        
        
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
   
    //-- Make/Model
    if (textField.tag == 15) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    
    //-- Mileage
    if (textField.tag == 16) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 6;
        
    }
    //-- Dealer sales Rep Name
    if (textField.tag == 21) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 100;
        
    }

    return YES;

}


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"] || [actionMode isEqualToString:@"ENQUIRY"])
    {
        return NO;
    }

    //--Salary Transfer
    if(textField.tag==10)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--New/Used
    else if(textField.tag==17)
    {
        [self popoverData:textField:@"NEWORUSED"];
        return NO; //to disable keyboard
    }
    //--Normal/Alloy
    else if(textField.tag==18)
    {
        [self popoverData:textField:@"NORMALORALLOY"];
        return NO; //to disable keyboard
    }
    //--Transmission
    else if(textField.tag==19)
    {
        [self popoverData:textField:@"TRANSMISSION"];
        return NO; //to disable keyboard
    }
    //--SUNROOF
    else if(textField.tag==20)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }

    
    else
        return YES;
    
}






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

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
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
    
    
    return 11;
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
        
        return @" AutoLoans";
        
    }
    else if(section == 2)
    {
        
        return @" Additional Personal Data";
        
    }
    
    else if(section == 3)
    {
        
        return @" Your Bank/Details";
        
    }
    
    else if(section == 6)
    {
        
        return @"Vehicle/Insurance Details";
        
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
            
            CommonLabel *lblSalesOfficerName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSalesOfficerName.text=@"Sales Officer's Name";
            lblSalesOfficerName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSalesOfficerName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSalesOfficerName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSalesOfficerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSalesOfficerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSalesOfficerName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAutoHeight constant:0]];
            
            
            txtSalesOfficerName = [[CommonTextField alloc] init];
            txtSalesOfficerName.tag=1;
            txtSalesOfficerName.delegate=self;
            txtSalesOfficerName.placeholder=@"Sales Officer's Name";
            txtSalesOfficerName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSalesOfficerName];
            
   
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSalesOfficerName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSalesOfficerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSalesOfficerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSalesOfficerName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto1Height2 constant:0]];
            
       
        
            
            CommonLabel *lblCode=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCode.text=@"Code";
            lblCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCode];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAuto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAuto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAuto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAuto2Height constant:0]];
            
            
            txtCode = [[CommonTextField alloc] init];
            txtCode.tag=2;
            txtCode.delegate=self;
            txtCode.placeholder=@"Code";
            txtCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCode];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto2Height2 constant:0]];
            
            
        }
        
        if(indexPath.section==1)
        {
            
            CommonLabel *lblCISNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCISNo.text=@"CIS No";
            lblCISNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCISNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCISNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCISNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCISNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCISNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAutoHeight constant:0]];
            
            
            txtCISNo = [[CommonTextField alloc] init];
            txtCISNo.tag=3;
            txtCISNo.delegate=self;
            txtCISNo.placeholder=@"CIS No";
            txtCISNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCISNo];

            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCISNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCISNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCISNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCISNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto1Height2 constant:0]];
            
            
            
            
            
        }
        if(indexPath.section==2)
        {
            
            CommonLabel *lblNoYearsUAE=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNoYearsUAE.text=@"No Of Years in UAE";
            lblNoYearsUAE.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNoYearsUAE];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoYearsUAE attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoYearsUAE attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoYearsUAE attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoYearsUAE attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAutoHeight constant:0]];
            
            
            txtNoYearsUAE = [[CommonTextField alloc] init];
            txtNoYearsUAE.tag=4;
            txtNoYearsUAE.delegate=self;
            txtNoYearsUAE.placeholder=@"No Of Years in UAE";
            txtNoYearsUAE.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNoYearsUAE];
            
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoYearsUAE attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoYearsUAE attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoYearsUAE attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoYearsUAE attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblNameOfSponsor=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNameOfSponsor.text=@"Name Of Sponsor";
            lblNameOfSponsor.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNameOfSponsor];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameOfSponsor attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAuto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameOfSponsor attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAuto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameOfSponsor attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAuto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameOfSponsor attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAuto2Height constant:0]];
            
            
            txtNameOfSponsor = [[CommonTextField alloc] init];
            txtNameOfSponsor.tag=5;
            txtNameOfSponsor.delegate=self;
            txtNameOfSponsor.placeholder=@"No Of Sponsor";
            txtNameOfSponsor.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNameOfSponsor];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameOfSponsor attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameOfSponsor attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameOfSponsor attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameOfSponsor attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto2Height2 constant:0]];
            
            
        }
        if(indexPath.section==3)
        {
            
            CommonLabel *lblAccountNumber=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAccountNumber.text=@"Account Number";
            lblAccountNumber.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAccountNumber];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNumber attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNumber attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNumber attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNumber attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAutoHeight constant:0]];
            
            
            txtAccountNumber = [[CommonTextField alloc] init];
            txtAccountNumber.tag=6;
            txtAccountNumber.delegate=self;
            txtAccountNumber.placeholder=@"Account Number";
            txtAccountNumber.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAccountNumber];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNumber attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNumber attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNumber attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNumber attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblYCISNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblYCISNo.text=@"CIS No";
            lblYCISNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblYCISNo];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblYCISNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAuto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblYCISNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAuto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblYCISNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAuto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblYCISNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAuto2Height constant:0]];
            
            
            txtYCISNo = [[CommonTextField alloc] init];
            txtYCISNo.tag=7;
            txtYCISNo.delegate=self;
            txtYCISNo.placeholder=@"CIS No";
            txtYCISNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtYCISNo];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtYCISNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtYCISNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtYCISNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtYCISNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto2Height2 constant:0]];
            
            
        }
        if(indexPath.section==4)
        {
            
            CommonLabel *lblBankName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblBankName.text=@"Bank Name";
            lblBankName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblBankName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBankName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBankName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBankName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBankName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAutoHeight constant:0]];
            
            
            txtBankName = [[CommonTextField alloc] init];
            txtBankName.tag=8;
            txtBankName.delegate=self;
            txtBankName.placeholder=@"Bank Name";
            txtBankName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtBankName];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBankName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBankName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBankName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBankName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblBranch=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblBranch.text=@"Branch";
            lblBranch.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblBranch];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBranch attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAuto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBranch attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAuto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBranch attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAuto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBranch attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAuto2Height constant:0]];
            
            
            txtBranch = [[CommonTextField alloc] init];
            txtBranch.tag=9;
            txtBranch.delegate=self;
            txtBranch.placeholder=@"Branch";
            txtBranch.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtBranch];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBranch attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBranch attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBranch attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBranch attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto2Height2 constant:0]];
            
            
        }
        
        if(indexPath.section==5)
        {
            
            CommonLabel *lblSalaryTransfer=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSalaryTransfer.text=@"Salary Transfer";
            lblSalaryTransfer.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSalaryTransfer];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSalaryTransfer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSalaryTransfer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSalaryTransfer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSalaryTransfer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAutoHeight constant:0]];
            
            
            txtSalaryTransfer = [[CommonTextField alloc] init];
            txtSalaryTransfer.tag=10;
            txtSalaryTransfer.delegate=self;
            txtSalaryTransfer.placeholder=@"Salary Transfer";
            txtSalaryTransfer.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSalaryTransfer];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSalaryTransfer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSalaryTransfer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSalaryTransfer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSalaryTransfer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblMonthlyPayments=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblMonthlyPayments.text=@"Monthly Payments";
            lblMonthlyPayments.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblMonthlyPayments];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMonthlyPayments attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAuto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMonthlyPayments attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAuto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMonthlyPayments attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAuto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMonthlyPayments attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAuto2Height constant:0]];
            
            
            txtMonthlyPayments = [[CommonTextField alloc] init];
            txtMonthlyPayments.tag=11;
            txtMonthlyPayments.delegate=self;
            txtMonthlyPayments.placeholder=@"Monthly Payments";
            txtMonthlyPayments.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtMonthlyPayments];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMonthlyPayments attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMonthlyPayments attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMonthlyPayments attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMonthlyPayments attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto2Height2 constant:0]];
            
            
        }
        if(indexPath.section==6)
        {
            
            CommonLabel *lblDealerOrsellerName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDealerOrsellerName.text=@"Dealer/Seller Name";
            lblDealerOrsellerName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDealerOrsellerName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDealerOrsellerName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDealerOrsellerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDealerOrsellerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDealerOrsellerName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAutoHeight constant:0]];
            
            
            txtDealerOrsellerName = [[CommonTextField alloc] init];
            txtDealerOrsellerName.tag=12;
            txtDealerOrsellerName.delegate=self;
            txtDealerOrsellerName.placeholder=@"Dealer/Seller Name";
            txtDealerOrsellerName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDealerOrsellerName];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDealerOrsellerName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDealerOrsellerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDealerOrsellerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDealerOrsellerName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblTelephone=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTelephone.text=@"Telephone";
            lblTelephone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTelephone];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTelephone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAuto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTelephone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAuto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTelephone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAuto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTelephone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAuto2Height constant:0]];
            
            
            txtTelephone = [[CommonTextField alloc] init];
            txtTelephone.tag=13;
            txtTelephone.delegate=self;
            txtTelephone.placeholder=@"Telephone";
            txtTelephone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTelephone];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTelephone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTelephone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTelephone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTelephone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto2Height2 constant:0]];
            
            
        }
        if(indexPath.section==7)
        {
            
            CommonLabel *lblFax=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblFax.text=@"Fax";
            lblFax.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblFax];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFax attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFax attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFax attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFax attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAutoHeight constant:0]];
            
            
            txtFax = [[CommonTextField alloc] init];
            txtFax.tag=14;
            txtFax.delegate=self;
            txtFax.placeholder=@"Fax";
            txtFax.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtFax];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFax attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFax attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFax attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFax attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblMakeOrModel=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblMakeOrModel.text=@"Make/Model";
            lblMakeOrModel.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblMakeOrModel];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMakeOrModel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAuto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMakeOrModel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAuto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMakeOrModel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAuto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMakeOrModel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAuto2Height constant:0]];
            
            
            txtMakeOrModel = [[CommonTextField alloc] init];
            txtMakeOrModel.tag=15;
            txtMakeOrModel.delegate=self;
            txtMakeOrModel.placeholder=@"Make/Model";
            txtMakeOrModel.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtMakeOrModel];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMakeOrModel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMakeOrModel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMakeOrModel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMakeOrModel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto2Height2 constant:0]];
            
            
        }
        if(indexPath.section==8)
        {
            
            CommonLabel *lblMileage=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblMileage.text=@"Mileage";
            lblMileage.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblMileage];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMileage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMileage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMileage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMileage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAutoHeight constant:0]];
            
            
            txtMileage = [[CommonTextField alloc] init];
            txtMileage.tag=16;
            txtMileage.delegate=self;
            txtMileage.placeholder=@"Mileage";
            txtMileage.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtMileage];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMileage attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMileage attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMileage attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMileage attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto1Height2 constant:0]];
            
            
            
            
            
            CommonLabel *lblNused=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNused.text=@"New/Used";
            lblNused.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNused];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNused attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAuto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNused attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAuto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNused attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAuto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNused attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAuto2Height constant:0]];
            
            
            txtNused = [[CommonTextField alloc] init];
            txtNused.tag=17;
            txtNused.delegate=self;
            txtNused.placeholder=@"New/Used";
            txtNused.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNused];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNused attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNused attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNused attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNused attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto2Height2 constant:0]];
            
            
        }
        if(indexPath.section==9)
        {
            
            CommonLabel *lblNormalOrAlloy=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNormalOrAlloy.text=@"Normal/Alloy";
            lblNormalOrAlloy.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNormalOrAlloy];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNormalOrAlloy attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNormalOrAlloy attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNormalOrAlloy attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNormalOrAlloy attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAutoHeight constant:0]];
            
            
            txtNormalOrAlloy = [[CommonTextField alloc] init];
            txtNormalOrAlloy.tag=18;
            txtNormalOrAlloy.delegate=self;
            txtNormalOrAlloy.placeholder=@"Normal/Alloy";
            txtNormalOrAlloy.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNormalOrAlloy];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNormalOrAlloy attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNormalOrAlloy attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNormalOrAlloy attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNormalOrAlloy attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblTransmission=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTransmission.text=@"Transmission";
            lblTransmission.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTransmission];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTransmission attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAuto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTransmission attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAuto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTransmission attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAuto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTransmission attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAuto2Height constant:0]];
            
            
            txtTransmission = [[CommonTextField alloc] init];
            txtTransmission.tag=19;
            txtTransmission.delegate=self;
            txtTransmission.placeholder=@"Transmission";
            txtTransmission.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTransmission];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTransmission attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTransmission attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTransmission attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTransmission attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto2Height2 constant:0]];
            
            
        }
        
        if(indexPath.section==10)
        {
            
            CommonLabel *lblSunroof=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSunroof.text=@"Sunroof";
            lblSunroof.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSunroof];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSunroof attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSunroof attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSunroof attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSunroof attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAutoHeight constant:0]];
            
            
            txtSunroof = [[CommonTextField alloc] init];
            txtSunroof.tag=20;
            txtSunroof.delegate=self;
            txtSunroof.placeholder=@"Sunroof";
            txtSunroof.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSunroof];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSunroof attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSunroof attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSunroof attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSunroof attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblDealerSalesRepName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDealerSalesRepName.text=@"Dealer Sales Rep Name";
            lblDealerSalesRepName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDealerSalesRepName];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDealerSalesRepName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintAuto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDealerSalesRepName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintAuto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDealerSalesRepName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintAuto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDealerSalesRepName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintAuto2Height constant:0]];
            
            
            txtDealerSalesRepName = [[CommonTextField alloc] init];
            txtDealerSalesRepName.tag=21;
            txtDealerSalesRepName.delegate=self;
            txtDealerSalesRepName.placeholder=@"Dealer Sales Rep Name";
            txtDealerSalesRepName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDealerSalesRepName];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDealerSalesRepName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintAuto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDealerSalesRepName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintAuto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDealerSalesRepName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintAuto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDealerSalesRepName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintAuto2Height2 constant:0]];
            
            
        }

        
        
        
        
    }
    else{
        
        
        
        [cell.contentView viewWithTag:100+indexPath.section];
        [cell.contentView viewWithTag:indexPath.section];
        
        [cell.contentView viewWithTag:500+indexPath.section];
        [cell.contentView viewWithTag:600+indexPath.section];
        
    }
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    if(([actionMode isEqualToString:@"UPDATE"] || [actionMode isEqualToString:@"ENQUIRY"]) && [autoLoansArray count]>0) //
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
//        autoLoansData = [autoLoansArray objectAtIndex:0];
//        
//        
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
//    
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}

- (void) doValidate {
    
    
    //------validation starts---------
    
    
    if([CommonUtils checkEmptyString:txtSalesOfficerName.text]==YES)
    {
        
        [CommonUtils showMessage:@"Sales Officer Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtCode.text]==YES)
    {
        
        [CommonUtils showMessage:@"Code can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtCISNo.text]==YES)
    {
        
        [CommonUtils showMessage:@"CIS No can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtNoYearsUAE.text]==YES)
    {
        
        [CommonUtils showMessage:@"No Of Years in UAE can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtNameOfSponsor.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name Of Sponsor can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtAccountNumber.text]==YES)
    {
        
        [CommonUtils showMessage:@"Account No can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtYCISNo.text]==YES)
    {
        
        [CommonUtils showMessage:@"Your CIS No can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtBankName.text]==YES)
    {
        
        [CommonUtils showMessage:@"Bank Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtBranch.text]==YES)
    {
        
        [CommonUtils showMessage:@"Branch can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtSalaryTransfer.text]==YES)
    {
        
        [CommonUtils showMessage:@"Salary Transfer can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtMonthlyPayments.text]==YES)
    {
        
        [CommonUtils showMessage:@"Monthly Payments can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtDealerOrsellerName.text]==YES)
    {
        
        [CommonUtils showMessage:@"Dealer/sellerName  can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtTelephone.text]==YES)
    {
        
        [CommonUtils showMessage:@"Telephone No can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtMakeOrModel.text]==YES)
    {
        
        [CommonUtils showMessage:@"Make / Model can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtMileage.text]==YES)
    {
        
        [CommonUtils showMessage:@"Mileage can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtNused.text]==YES)
    {
        
        [CommonUtils showMessage:@"New/Used can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtNormalOrAlloy.text]==YES)
    {
        
        [CommonUtils showMessage:@"Normal / Alloy can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtTransmission.text]==YES)
    {
        
        [CommonUtils showMessage:@"Transmission can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtSunroof.text]==YES)
    {
        
        [CommonUtils showMessage:@"Sunroof can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtDealerSalesRepName.text]==YES)
    {
        
        [CommonUtils showMessage:@"Dealer Sales Representative Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    

    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    [self buildJSON];
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}
- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    NSData * newData;
    
    
    NSLog(@"AutoLoans action mode %@",actionMode);
    NSLog(@"AutoLoans Ref no %@",self.refNo);
    
    @try{
        //
        //            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //            {
        //                jsonDictionary= @{@"refNo":self.refNo};
        //            }
        //            else
        //            {
        
        
        
        //-------
        
       
        
        
        
        
        jsonDictionary= @{
                          @"refNo":emptyStringIfNil(self.refNo),
                          @"salesOfficerName":emptyStringIfNil(self.txtSalesOfficerName.text),
                          @"code":emptyStringIfNil(self.txtCode.text),
                          @"cisNo":emptyStringIfNil(self.txtCISNo.text),
                          @"noYearsUAE":emptyStringIfNil(self.txtNoYearsUAE.text),
                          @"nameOfSponsor":emptyStringIfNil(self.txtNameOfSponsor.text),
                          @"accountNumber":emptyStringIfNil(self.txtAccountNumber.text),
                          @"ycisNo":emptyStringIfNil(self.txtYCISNo.text),
                          @"bankName":emptyStringIfNil(self.txtBankName.text),
                          @"branch":emptyStringIfNil(self.txtBranch.text),
                          @"salaryTransfer":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtSalaryTransfer.tag]]),
                          @"monthlyPayments":emptyStringIfNil(self.txtMonthlyPayments.text),
                          @"dealerOrsellerName":emptyStringIfNil(self.txtDealerOrsellerName.text),
                          @"telephone":emptyStringIfNil(self.txtTelephone.text),
                          @"fax":emptyStringIfNil(self.txtFax.text),
                          @"makeOrModel":emptyStringIfNil(self.txtMakeOrModel.text),
                          @"mileage":emptyStringIfNil(self.txtMileage.text),
                          @"neworUsed":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtNused.tag]]),
                          @"normalOrAlloy":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtNormalOrAlloy.tag]]),
                          @"transmission":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtTransmission.tag]]),
                          @"sunroof":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtSunroof.tag]]),
                          @"dealerSalesRepName":emptyStringIfNil(self.txtDealerSalesRepName.text),
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
        
        //            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //            {
        //
        //                newData=[CommonUtils connectHost :@"fetchOccupationDetails" :jsonDictionary :self];
        //                [self parseResponse:newData:@"fetchOccupationDetails":@"occupationDetailsWrapper"];
        //
        //            }
        //            else
        //            {
        if([actionMode isEqualToString:@"NEW"])// && [viewMode isEqualToString:@"N"])
        {
            
            newData=[CommonUtils connectHost :@"insertAutoLoans" :jsonDictionary :self];
            [self parseResponse:newData:@"insertAutoLoans":@"autoLoansWrapper"];
            //viewMode=@"N";
        }
        if([actionMode isEqualToString:@"UPDATE"])// && [viewMode isEqualToString:@"N"])
        {
            
            newData=[CommonUtils connectHost :@"updateAutoLoans" :jsonDictionary :self];
            [self parseResponse:newData:@"updateAutoLoans":@"autoLoansWrapper"];
            //viewMode=@"Y";
        }
        
       
        //}
        
        
        
        //---invoke next screen---
        //        if([viewMode isEqualToString:@"N"])
        //        {
        //            NSLog(@"To invoke Contact screen");
        //
        //            if([actionMode isEqualToString:@"NEW"])
        //            {
        //                viewMode=@"N";
        //            }
        //            if([actionMode isEqualToString:@"UPDATE"])
        //            {
        //                viewMode=@"Y";
        //            }
        
        AutoLoans2ViewController *autoLoans2ViewController = [[AutoLoans2ViewController alloc]initWithNibName:nil bundle:nil];
        //autoLoans2ViewController.userid=self.userid;
        //autoLoans2ViewController.sessionid=self.sessionid;
        autoLoans2ViewController.actionMode=self.actionMode;
        //contactViewController.viewMode=self.viewMode;
        autoLoans2ViewController.refNo=self.refNo;
        autoLoans2ViewController.existingCustomerFlag=self.existingCustomerFlag;
        autoLoans2ViewController.menuName=self.menuName;
        
        [self.navigationController pushViewController:autoLoans2ViewController animated:YES];
        //}
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSON code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
        
    }
    @finally {
        
        NSLog(@"finally in fetch buildJSON Code");
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
    
    
}

- (void) viewData {
    
     //refNo=@"AL30OCT20150030";
    
    NSLog(@"AutoLoans action mode %@",actionMode);
    NSLog(@"AutoLoans Ref no %@",self.refNo);
    
    @try{
        
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        NSDictionary *jsonDictionary= @{@"refNo":self.refNo};
        
        
        
        NSData * newData=[CommonUtils connectHost :@"fetchAutoLoans" :jsonDictionary :self];
        [self parseResponse:newData:@"fetchAutoLoans":@"autoLoansWrapper"];
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in AutoLoans viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
        
    }
    @finally {
        
        NSLog(@"finally in AutoLoans fetch viewData Code");
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
    
    
}

-(void) loadData {
    
    
    @try{
        
        autoLoansData = [autoLoansArray objectAtIndex:0];
        
        
        txtSalesOfficerName.text=emptyStringIfNil(autoLoansData.salesOfficerName);
        txtCode.text=emptyStringIfNil(autoLoansData.code);
        txtCISNo.text=emptyStringIfNil(autoLoansData.cisNo);
        txtNoYearsUAE.text=emptyStringIfNil(autoLoansData.noYearsUAE);
        txtNameOfSponsor.text=emptyStringIfNil(autoLoansData.nameOfSponsor);
        txtAccountNumber.text=emptyStringIfNil(autoLoansData.accountNumber);
        txtYCISNo.text=emptyStringIfNil(autoLoansData.ycisNo);
        txtBankName.text=emptyStringIfNil(autoLoansData.bankName);
        txtBranch.text=emptyStringIfNil(autoLoansData.branch);
        txtSalaryTransfer.text=emptyStringIfNil(autoLoansData.salaryTransferValue);
        txtMonthlyPayments.text=emptyStringIfNil(autoLoansData.monthlyPayments);
        txtDealerOrsellerName.text=emptyStringIfNil(autoLoansData.dealerOrsellerName);
        txtTelephone.text=emptyStringIfNil(autoLoansData.telephone);
        txtFax.text=emptyStringIfNil(autoLoansData.fax);
        txtMakeOrModel.text=emptyStringIfNil(autoLoansData.makeOrModel);
        txtMileage.text=emptyStringIfNil(autoLoansData.mileage);
        txtNused.text=emptyStringIfNil(autoLoansData.neworUsedValue);
        txtNormalOrAlloy.text=emptyStringIfNil(autoLoansData.normalOrAlloyValue);
        txtTransmission.text=emptyStringIfNil(autoLoansData.transmissionValue);
        txtSunroof.text=emptyStringIfNil(autoLoansData.sunroofValue);
        txtDealerSalesRepName.text=emptyStringIfNil(autoLoansData.dealerSalesRepName);
        
        
        
        
        
        [popoverCodeValue setObject:emptyStringIfNil(self.autoLoansData.salaryTransfer) forKey:[NSString stringWithFormat:@"%d", self.txtSalaryTransfer.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.autoLoansData.neworUsed) forKey:[NSString stringWithFormat:@"%d", self.txtNused.tag]];
        
        
        [popoverCodeValue setObject:emptyStringIfNil(self.autoLoansData.normalOrAlloy) forKey:[NSString stringWithFormat:@"%d", self.txtNormalOrAlloy.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.autoLoansData.transmission) forKey:[NSString stringWithFormat:@"%d", self.txtTransmission.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.autoLoansData.sunroof) forKey:[NSString stringWithFormat:@"%d", self.txtSunroof.tag]];
        
        
        
        
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


- (void) parseResponse:(NSData *) data : (NSString *)methodAction :(NSString *)dataFile{
    
    
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
                //dataDictionary =[jsonObject objectForKey:@"fetchonBoardData"];
                dataDictionary =[jsonObject objectForKey:methodAction];
                
                
                NSLog(@"Dictionary: %@", [dataDictionary description]);
                
                
                for(NSString *key in [dataDictionary allKeys]) {
                    NSLog(@"key code: %@",key);
                    NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                    
                    //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                    
                }
                
                // Create a new array to hold the locations
                autoLoansArray = [[NSMutableArray alloc] init];
                
                
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    autoLoansData = [[AutoLoansData alloc] initWithJSONDictionary:dict];
                    
                    NSLog(@" autoLoansData %@",autoLoansData.code);
                    
                    // Add the Location object to the array
                    [autoLoansArray addObject:autoLoansData];
                    
                }
                
                
                NSLog(@"data count %lu",(unsigned long)autoLoansArray.count);
                
                
                
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
    
    @try
    {
        
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

@end


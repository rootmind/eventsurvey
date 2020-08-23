//
//  AutoLoans2ViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 30/10/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "AutoLoans2ViewController.h"
#import "AutoLoans3ViewController.h"
#import "AutoLoansData.h"
#import "QueueViewController.h"






@interface AutoLoans2ViewController()

@end


#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblConstraint2AutoX=0.52f;
CGFloat lblConstraint2AutoY=1.0f;
CGFloat lblConstraint2AutoWidth=0.5f;
CGFloat lblConstraint2AutoHeight=0.8f;

CGFloat Constraint2AutoX=1.19f;
CGFloat Constraint2AutoY=1.0f;
CGFloat Constraint2AutoWidth=0.80f;
CGFloat Constraint2AutoHeight=0.8f;

//CGFloat Constraint2Auto1X=0.69f;
//CGFloat Constraint2Auto1Y=1.0f;
//CGFloat Constraint2Auto1Width=0.3f;
//CGFloat Constraint2Auto1Height=0.8f;

CGFloat Constraint2Auto1X2=0.69f;
CGFloat Constraint2Auto1Y2=1.0f;
CGFloat Constraint2Auto1Width2=0.3f;
CGFloat Constraint2Auto1Height2=0.8f;

CGFloat lblConstraint2Auto2X=1.52f;
CGFloat lblConstraint2Auto2Y=1.0f;
CGFloat lblConstraint2Auto2Width=0.5f;
CGFloat lblConstraint2Auto2Height=0.8f;

//CGFloat Constraint2Auto2X=1.69f;
//CGFloat Constraint2Auto2Y=1.0f;
//CGFloat Constraint2Auto2Width=0.3f;
//CGFloat Constraint2Auto2Height=0.8f;

CGFloat Constraint2Auto2X2=1.69f;
CGFloat Constraint2Auto2Y2=1.0f;
CGFloat Constraint2Auto2Width2=0.3f;
CGFloat Constraint2Auto2Height2=0.8f;


@implementation AutoLoans2ViewController


//@synthesize userid;
//@synthesize sessionid;

@synthesize menuName;
@synthesize actionMode;


@synthesize dataDictionary;

@synthesize  popoverCodeValue;




@synthesize txtYearOfManufacture;
@synthesize txtColor;
@synthesize txtEngineNo;
@synthesize txtChassisNo;
@synthesize txtRegistrationEmirate;
@synthesize txtPriceOfVehicle;
@synthesize txtVehicleInsurance;
@synthesize txtOtherCharges;
//txtPersonalRefTelephone1
@synthesize txtTotalCost;
@synthesize txtDownPayment;
@synthesize txtTradeinValue;
@synthesize txtTotalFinancedAmount;
@synthesize txtInterestRate;
@synthesize txtRepaymentAmount;
@synthesize txtProcessingFee;
@synthesize txtTenor;
@synthesize txtEMI;
@synthesize txtInsuranceCompanyName;
@synthesize txtDueDate;
@synthesize txtRenewalDate;
@synthesize txtPolicyNo;
//@synthesize txtGuarantorName;
//@synthesize txtGuarantorAddress;
//@synthesize txtGuarantorTelephone;
//@synthesize txtGuarantorMonthlyIncome;
//@synthesize txtGuarantorBankName;
//@synthesize txtGuarantorAccountNo;
//@synthesize txtPersonalRefName1;
//@synthesize txtPersonalRefAddress1;
//@synthesize txtPersonalRefTelephone1;
//@synthesize txtPersonalRefName2;
//@synthesize txtPersonalRefAddress2;
//@synthesize txtPersonalRefTelephone2;
//@synthesize txtCaseOutcome;

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
    
    [self displayGraph];
    
    
    
    
    
    //---initialize during load
    popoverCodeValue = [[NSMutableDictionary alloc]init];
    
    
    //--when not new
    if([actionMode isEqualToString:@"UPDATE"] ||[actionMode isEqualToString:@"ENQUIRY"] || ([actionMode isEqualToString:@"NEW"] && [existingCustomerFlag isEqualToString:@"Y"] && [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]))// && [viewMode isEqualToString:@"Y"])
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
    // year of manufacture
    if (textField.tag == 1) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 10;
        
    }
    //--Color
    if (textField.tag == 2) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    } //--Engine No
    if (textField.tag == 3) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Chassis No
    if (textField.tag == 4) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    
    if (textField.tag == 6 || textField.tag == 8 || textField.tag == 9 || textField.tag == 10 || textField.tag == 11 || textField.tag == 12 || textField.tag == 14 || textField.tag == 15 ) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        //        return newLength <= 20;
        
        
        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
        
        // allow backspace
        if (range.length > 0 && [string length] == 0) {
            return YES;
        }
        // do not allow . at the beggining
        if (range.location == 0 && [string isEqualToString:@"."]) {
            return NO;
        }
        // set the text field value manually
        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
        
        if(newLength > 10)
        {
            return NO;
        }
        textField.text = newValue;
        // return NO because we're manually setting the value
        return NO;
        
    }
    
    if (textField.tag == 13 || textField.tag == 16 ) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        //        return newLength <= 20;
        
        
        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        
        // allow backspace
        if (range.length > 0 && [string length] == 0) {
            return YES;
        }
        // do not allow . at the beggining
//        if (range.location == 0 && [string isEqualToString:@"."]) {
//            return NO;
//        }
        // set the text field value manually
        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
        
        if(newLength > 4)
        {
            return NO;
        }
        textField.text = newValue;
        // return NO because we're manually setting the value
        return NO;
        
    }


//  
//    //-- Price of vehicle
//    if (textField.tag == 6) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
    //-- Vehicle Insusrance
    if (textField.tag == 7) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
//    //-- Other charges
//    if (textField.tag == 8) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 10;
//        
//    }
    //-- Total Cost
//    if (textField.tag == 9) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <=20;
//        
//    }
//    //-- Down Payment
//    if (textField.tag == 10) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
    //--Trade in value
//    if (textField.tag == 11) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
    //-- Total Financed
//    if (textField.tag == 12) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
//    //-- Interest Rate
//    if (textField.tag == 13) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 5;
//        
//    }
//    //-- Repayment Amount
//    if (textField.tag == 14) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
//    //-- Processing Fee
//    if (textField.tag == 15) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
//    
//    //--Tenor
//    if (textField.tag == 16) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 5;
//        
//    }
    //--EMI
    if (textField.tag == 17) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Insurance Company Name
    if (textField.tag == 18) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    //--Policy No
    if (textField.tag == 21) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    
    
    
    return YES;
    
}


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"] || [actionMode isEqualToString:@"ENQUIRY"])
    {
        return NO;
    }
    
    
    //Year of Manufacture
   if(textField.tag==1)
    {
        [self popoverDate:textField:NULL:@"YYYY"];
        return NO; //to disable keyboard
    }
    //--Color
     else if(textField.tag==2)
    {
        [self popoverData:textField:@"COLOR"];
        return NO; //to disable keyboard
    }
    //--Registration Emirate
    else if(textField.tag==5)
    {
        [self popoverData:textField:@"FavouriteCity"];
        return NO; //to disable keyboard
    }
        //--Due date
    else if(textField.tag==19)
    {
        [self popoverDate:textField :@"GT":NULL];
        return NO; //to disable keyboard
    }
    //--Renewal date
    else if(textField.tag==20)
    {
        [self popoverDate:textField :@"GT":NULL];
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
        
        return @"   AutoLoans";
        
    }
    else if(section == 3)
    {
        
        return @" Finance Details";
        
    }
    
    else if(section == 3)
    {
        
        return @" Your Bank/Details";
        
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
            
            CommonLabel *lblYearOfManufacture=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblYearOfManufacture.text=@"Year Of Manufacture";
            lblYearOfManufacture.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblYearOfManufacture];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblYearOfManufacture attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2AutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblYearOfManufacture attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2AutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblYearOfManufacture attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2AutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblYearOfManufacture attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2AutoHeight constant:0]];
            
            
            txtYearOfManufacture = [[CommonTextField alloc] init];
            txtYearOfManufacture.tag=1;
            txtYearOfManufacture.delegate=self;
            txtYearOfManufacture.placeholder=@"Year Of Manufacture";
            txtYearOfManufacture.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtYearOfManufacture];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtYearOfManufacture attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtYearOfManufacture attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtYearOfManufacture attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtYearOfManufacture attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblColor=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblColor.text=@"Color";
            lblColor.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblColor];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblColor attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2Auto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblColor attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Auto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblColor attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Auto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblColor attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Auto2Height constant:0]];
            
            
            txtColor = [[CommonTextField alloc] init];
            txtColor.tag=2;
            txtColor.delegate=self;
            txtColor.placeholder=@"Color";
            txtColor.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtColor];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtColor attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtColor attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtColor attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtColor attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto2Height2 constant:0]];
            
            
        }
        
        if(indexPath.section==1)
        {
            
            CommonLabel *lblEngineNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblEngineNo.text=@"Engine No";
            lblEngineNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblEngineNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEngineNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2AutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEngineNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2AutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEngineNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2AutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEngineNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2AutoHeight constant:0]];
            
            
            txtEngineNo = [[CommonTextField alloc] init];
            txtEngineNo.tag=3;
            txtEngineNo.delegate=self;
            txtEngineNo.placeholder=@"Engine No";
            txtEngineNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtEngineNo];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEngineNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEngineNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEngineNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEngineNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblChassisNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblChassisNo.text=@"Chassis No";
            lblChassisNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblChassisNo];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblChassisNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2Auto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblChassisNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Auto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblChassisNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Auto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblChassisNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Auto2Height constant:0]];
            
            
            txtChassisNo = [[CommonTextField alloc] init];
            txtChassisNo.tag=4;
            txtChassisNo.delegate=self;
            txtChassisNo.placeholder=@"Chassis No";
            txtChassisNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtChassisNo];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtChassisNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtChassisNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtChassisNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtChassisNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto2Height2 constant:0]];
            
            
        }

        if(indexPath.section==2)
        {
            
            CommonLabel *lblRegistrationEmirate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblRegistrationEmirate.text=@"Registration Emirate";
            lblRegistrationEmirate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblRegistrationEmirate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRegistrationEmirate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2AutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRegistrationEmirate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2AutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRegistrationEmirate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2AutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRegistrationEmirate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2AutoHeight constant:0]];
            
            
            txtRegistrationEmirate = [[CommonTextField alloc] init];
            txtRegistrationEmirate.tag=5;
            txtRegistrationEmirate.delegate=self;
            txtRegistrationEmirate.placeholder=@"Registration Emirate";
            txtRegistrationEmirate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtRegistrationEmirate];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRegistrationEmirate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRegistrationEmirate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRegistrationEmirate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRegistrationEmirate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto1Height2 constant:0]];
            
            
            
            
            
        }
        
        if(indexPath.section==3)
        {
            
            CommonLabel *lblPriceOfVehicle=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPriceOfVehicle.text=@"Price Of Vehicle";
            lblPriceOfVehicle.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPriceOfVehicle];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPriceOfVehicle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2AutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPriceOfVehicle attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2AutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPriceOfVehicle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2AutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPriceOfVehicle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2AutoHeight constant:0]];
            
            
            txtPriceOfVehicle = [[CommonTextField alloc] init];
            txtPriceOfVehicle.tag=6;
            txtPriceOfVehicle.delegate=self;
            txtPriceOfVehicle.placeholder=@"Price Of Vehicle";
            txtVehicleInsurance.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPriceOfVehicle];
            
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPriceOfVehicle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPriceOfVehicle attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPriceOfVehicle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPriceOfVehicle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblVehicleInsurance=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblVehicleInsurance.text=@"Vehicle Insurance";
            lblVehicleInsurance.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblVehicleInsurance];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblVehicleInsurance attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2Auto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblVehicleInsurance attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Auto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblVehicleInsurance attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Auto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblVehicleInsurance attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Auto2Height constant:0]];
            
            
            txtVehicleInsurance = [[CommonTextField alloc] init];
            txtVehicleInsurance.tag=7;
            txtVehicleInsurance.delegate=self;
            txtVehicleInsurance.placeholder=@"Vehicle Insurance";
            txtVehicleInsurance.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtVehicleInsurance];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVehicleInsurance attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVehicleInsurance attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVehicleInsurance attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtVehicleInsurance attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto2Height2 constant:0]];
            
            
        }
        if(indexPath.section==4)
        {
            
            CommonLabel *lblOtherCharges=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOtherCharges.text=@"Other Charges";
            lblOtherCharges.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOtherCharges];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOtherCharges attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2AutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOtherCharges attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2AutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOtherCharges attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2AutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOtherCharges attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2AutoHeight constant:0]];
            
            
            txtOtherCharges = [[CommonTextField alloc] init];
            txtOtherCharges.tag=8;
            txtOtherCharges.delegate=self;
            txtOtherCharges.placeholder=@"Other Charges";
            txtOtherCharges.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOtherCharges];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOtherCharges attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOtherCharges attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOtherCharges attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOtherCharges attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblTotalCost=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTotalCost.text=@"Total Cost";
            lblTotalCost.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTotalCost];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotalCost attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2Auto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotalCost attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Auto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotalCost attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Auto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotalCost attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Auto2Height constant:0]];
            
            
            txtTotalCost = [[CommonTextField alloc] init];
            txtTotalCost.tag=9;
            txtTotalCost.delegate=self;
            txtTotalCost.placeholder=@"Total Cost";
            txtTotalCost.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTotalCost];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotalCost attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotalCost attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotalCost attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotalCost attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto2Height2 constant:0]];
            
            
        }
        if(indexPath.section==5)
        {
            
            CommonLabel *lblDownPayment=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDownPayment.text=@"Down Payment";
            lblDownPayment.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDownPayment];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDownPayment attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2AutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDownPayment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2AutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDownPayment attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2AutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDownPayment attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2AutoHeight constant:0]];
            
            
            txtDownPayment = [[CommonTextField alloc] init];
            txtDownPayment.tag=10;
            txtDownPayment.delegate=self;
            txtDownPayment.placeholder=@"Down Payment";
            txtDownPayment.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDownPayment];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDownPayment attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDownPayment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDownPayment attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDownPayment attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblTradeinValue=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTradeinValue.text=@"Trade in Value";
            lblTradeinValue.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTradeinValue];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTradeinValue attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2Auto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTradeinValue attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Auto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTradeinValue attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Auto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTradeinValue attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Auto2Height constant:0]];
            
            
            txtTradeinValue = [[CommonTextField alloc] init];
            txtTradeinValue.tag=11;
            txtTradeinValue.delegate=self;
            txtTradeinValue.placeholder=@"Trade in Value";
            txtTradeinValue.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTradeinValue];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTradeinValue attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTradeinValue attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTradeinValue attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTradeinValue attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto2Height2 constant:0]];
            
            
        }

        if(indexPath.section==6)
        {
            
            CommonLabel *lblTotalFinancedAmount=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTotalFinancedAmount.text=@"Total Financed Amount";
            lblTotalFinancedAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTotalFinancedAmount];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotalFinancedAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2AutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotalFinancedAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2AutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotalFinancedAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2AutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotalFinancedAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2AutoHeight constant:0]];
            
            
            txtTotalFinancedAmount = [[CommonTextField alloc] init];
            txtTotalFinancedAmount.tag=12;
            txtTotalFinancedAmount.delegate=self;
            txtTotalFinancedAmount.placeholder=@"Total Financed Amount";
            txtTotalFinancedAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTotalFinancedAmount];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotalFinancedAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotalFinancedAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotalFinancedAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotalFinancedAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblInterestRate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInterestRate.text=@"Interest Rate";
            lblInterestRate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInterestRate];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterestRate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2Auto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterestRate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Auto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterestRate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Auto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterestRate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Auto2Height constant:0]];
            
            
            txtInterestRate = [[CommonTextField alloc] init];
            txtInterestRate.tag=13;
            txtInterestRate.delegate=self;
            txtInterestRate.placeholder=@"Interest Rate";
            txtInterestRate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInterestRate];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestRate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestRate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestRate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestRate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto2Height2 constant:0]];
            
            
        }
        if(indexPath.section==7)
        {
            
            CommonLabel *lblRepaymentAmount=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblRepaymentAmount.text=@"Repayment Amount";
            lblRepaymentAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblRepaymentAmount];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRepaymentAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2AutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRepaymentAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2AutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRepaymentAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2AutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRepaymentAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2AutoHeight constant:0]];
            
            
            txtRepaymentAmount = [[CommonTextField alloc] init];
            txtRepaymentAmount.tag=14;
            txtRepaymentAmount.delegate=self;
            txtRepaymentAmount.placeholder=@"Repayment Amount";
            txtRepaymentAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtRepaymentAmount];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRepaymentAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRepaymentAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRepaymentAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRepaymentAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblProcessingFee=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblProcessingFee.text=@"Processing Fee";
            lblProcessingFee.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblProcessingFee];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblProcessingFee attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2Auto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblProcessingFee attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Auto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblProcessingFee attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Auto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblProcessingFee attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Auto2Height constant:0]];
            
            
            txtProcessingFee = [[CommonTextField alloc] init];
            txtProcessingFee.tag=15;
            txtProcessingFee.delegate=self;
            txtProcessingFee.placeholder=@"Processing Fee";
            txtProcessingFee.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtProcessingFee];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtProcessingFee attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtProcessingFee attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtProcessingFee attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtProcessingFee attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto2Height2 constant:0]];
            
            
        }
        if(indexPath.section==8)
        {
            
            CommonLabel *lblTenor=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTenor.text=@"Tenor";
            lblTenor.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTenor];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTenor attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2AutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTenor attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2AutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTenor attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2AutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTenor attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2AutoHeight constant:0]];
            
            
            txtTenor = [[CommonTextField alloc] init];
            txtTenor.tag=16;
            txtTenor.delegate=self;
            txtTenor.placeholder=@"Tenor";
            txtTenor.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTenor];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTenor attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTenor attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTenor attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTenor attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblEMI=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblEMI.text=@"EMI (SIO/PDC)";
            lblEMI.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblEMI];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEMI attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2Auto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEMI attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Auto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEMI attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Auto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEMI attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Auto2Height constant:0]];
            
            
            txtEMI = [[CommonTextField alloc] init];
            txtEMI.tag=17;
            txtEMI.delegate=self;
            txtEMI.placeholder=@"EMI (SIO/PDC)";
            txtEMI.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtEMI];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEMI attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEMI attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEMI attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEMI attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto2Height2 constant:0]];
            
            
        }
        if(indexPath.section==9)
        {
            
            CommonLabel *lblInsuranceCompanyName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInsuranceCompanyName.text=@"Insurance Company Name";
            lblInsuranceCompanyName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInsuranceCompanyName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInsuranceCompanyName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2AutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInsuranceCompanyName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2AutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInsuranceCompanyName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2AutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInsuranceCompanyName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2AutoHeight constant:0]];
            
            
            txtInsuranceCompanyName = [[CommonTextField alloc] init];
            txtInsuranceCompanyName.tag=18;
            txtInsuranceCompanyName.delegate=self;
            txtInsuranceCompanyName.placeholder=@"Insurance Company Name";
            txtInsuranceCompanyName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInsuranceCompanyName];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInsuranceCompanyName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInsuranceCompanyName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInsuranceCompanyName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInsuranceCompanyName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblDueDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDueDate.text=@"Due Date";
            lblDueDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDueDate];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDueDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2Auto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDueDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Auto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDueDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Auto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDueDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Auto2Height constant:0]];
            
            
            txtDueDate = [[CommonTextField alloc] init];
            txtDueDate.tag=19;
            txtDueDate.delegate=self;
            txtDueDate.placeholder=@"Due Date";
            txtDueDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDueDate];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDueDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDueDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDueDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDueDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto2Height2 constant:0]];
            
            
        }
        if(indexPath.section==10)
        {
            
            CommonLabel *lblRenewalDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblRenewalDate.text=@"Renewal Date";
            lblRenewalDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblRenewalDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRenewalDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2AutoX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRenewalDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2AutoY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRenewalDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2AutoWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRenewalDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2AutoHeight constant:0]];
            
            
            txtRenewalDate = [[CommonTextField alloc] init];
            txtRenewalDate.tag=20;
            txtRenewalDate.delegate=self;
            txtRenewalDate.placeholder=@"Renewal Date";
            txtRenewalDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtRenewalDate];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRenewalDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRenewalDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRenewalDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRenewalDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblPolicyNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPolicyNo.text=@"Policy No";
            lblPolicyNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPolicyNo];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPolicyNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2Auto2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPolicyNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Auto2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPolicyNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Auto2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPolicyNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Auto2Height constant:0]];
            
            
            txtPolicyNo = [[CommonTextField alloc] init];
            txtPolicyNo.tag=21;
            txtPolicyNo.delegate=self;
            txtPolicyNo.placeholder=@"Policy No";
            txtPolicyNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPolicyNo];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPolicyNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2Auto2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPolicyNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Auto2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPolicyNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Auto2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPolicyNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Auto2Height2 constant:0]];
            
            
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
//    
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
    
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}

- (void) doValidate {
    
    
    //------validation starts---------
    
    
        if([CommonUtils checkEmptyString:txtYearOfManufacture.text]==YES)
        {
    
            [CommonUtils showMessage:@"Year of Manufacture can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtColor.text]==YES)
        {
            
            [CommonUtils showMessage:@"color can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        

        if([CommonUtils checkEmptyString:txtEngineNo.text]==YES)
        {
            
            [CommonUtils showMessage:@"Engine No can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        

        if([CommonUtils checkEmptyString:txtChassisNo.text]==YES)
        {
            
            [CommonUtils showMessage:@"Chassis No can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        

        if([CommonUtils checkEmptyString:txtRegistrationEmirate.text]==YES)
        {
            
            [CommonUtils showMessage:@"Registration Emirate can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        

        if([CommonUtils checkEmptyString:txtPriceOfVehicle.text]==YES)
        {
            
            [CommonUtils showMessage:@"Price of vehicle can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        

        if([CommonUtils checkEmptyString:txtVehicleInsurance.text]==YES)
        {
            
            [CommonUtils showMessage:@"Vehicle Insurance  can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        

        if([CommonUtils checkEmptyString:txtOtherCharges.text]==YES)
        {
            
            [CommonUtils showMessage:@"Other Charges can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        

        if([CommonUtils checkEmptyString:txtTotalCost.text]==YES)
        {
            
            [CommonUtils showMessage:@"Total Cost can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        
        if([CommonUtils checkEmptyString:txtDownPayment.text]==YES)
        {
            
            [CommonUtils showMessage:@"Down Payment can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        

        if([CommonUtils checkEmptyString:txtTradeinValue.text]==YES)
        {
            
            [CommonUtils showMessage:@"Trade in Value can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        

        if([CommonUtils checkEmptyString:txtTotalFinancedAmount.text]==YES)
        {
            
            [CommonUtils showMessage:@"Total Financed Amount can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtInterestRate.text]==YES)
        {
            
            [CommonUtils showMessage:@"Interest Rate can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtRepaymentAmount.text]==YES)
        {
            
            [CommonUtils showMessage:@"Repayment Amount can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtProcessingFee.text]==YES)
        {
            
            [CommonUtils showMessage:@"Processing Fee can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtTenor.text]==YES)
        {
            
            [CommonUtils showMessage:@"Tenor can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtEMI.text]==YES)
        {
            
            [CommonUtils showMessage:@"EMI can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        
        if([CommonUtils checkEmptyString:txtInsuranceCompanyName.text]==YES)
        {
            
            [CommonUtils showMessage:@"Insurance Company Name can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtDueDate.text]==YES)
        {
            
            [CommonUtils showMessage:@"Due Date can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtRenewalDate.text]==YES)
        {
            
            [CommonUtils showMessage:@"Renewal Date can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtPolicyNo.text]==YES)
        {
            
            [CommonUtils showMessage:@"Policy No can't be blank":self];
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
    //recordStatus=@"INPROGRESS";
    
    //refNo=@"AL31OCT20150031";
    
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
                          @"yearOfManufacture":emptyStringIfNil(self.txtYearOfManufacture.text),
                          @"color":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtColor.tag]]),
                          @"engineNo":emptyStringIfNil(self.txtEngineNo.text),
                          @"chassisNo":emptyStringIfNil(self.txtChassisNo.text),
                          @"registrationEmirate":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtRegistrationEmirate.tag]]),
                          @"priceOfVehicle":emptyStringIfNil(self.txtPriceOfVehicle.text),
                          @"vehicleInsurance":emptyStringIfNil(self.txtVehicleInsurance.text),
                          @"otherCharges":emptyStringIfNil(self.txtOtherCharges.text),
                          @"totalCost":emptyStringIfNil(self.txtTotalCost.text),
                          @"downPayment":emptyStringIfNil(self.txtDownPayment.text),
                          @"tradeinValue":emptyStringIfNil(self.txtTradeinValue.text),
                          @"totalFinancedAmount":emptyStringIfNil(self.txtTotalFinancedAmount.text),
                          @"interestRate":emptyStringIfNil(self.txtInterestRate.text),
                          @"repaymentAmount":emptyStringIfNil(self.txtRepaymentAmount.text),
                          @"processingFee":emptyStringIfNil(self.txtProcessingFee.text),
                          @"tenor":emptyStringIfNil(self.txtTenor.text),
                          @"emi":emptyStringIfNil(self.txtEMI.text),
                          @"insuranceCompanyName":emptyStringIfNil(self.txtInsuranceCompanyName.text),
                          @"dueDate":emptyStringIfNil(self.txtDueDate.text),
                          @"renewalDate":emptyStringIfNil(self.txtRenewalDate.text),
                          @"policyNo":emptyStringIfNil(self.txtPolicyNo.text),
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
        
        newData=[CommonUtils connectHost :@"updateAutoLoans2" :jsonDictionary :self];
        [self parseResponse:newData:@"updateAutoLoans2":@"autoLoansWrapper"];
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
        //
        AutoLoans3ViewController *autoLoans3ViewController = [[AutoLoans3ViewController alloc]initWithNibName:nil bundle:nil];
        autoLoans3ViewController.actionMode=self.actionMode;
        
        autoLoans3ViewController.refNo=self.refNo;
        autoLoans3ViewController.existingCustomerFlag=self.existingCustomerFlag;
        autoLoans3ViewController.menuName=self.menuName;
        
        [self.navigationController pushViewController:autoLoans3ViewController animated:YES];        //}
        
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
    
    
    
    NSLog(@"AutoLoans action mode %@",actionMode);
    NSLog(@"AutoLoans Ref no %@",self.refNo);
    
    @try{
        
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        NSDictionary *jsonDictionary= @{@"refNo":self.refNo};
        
        
        
        NSData * newData=[CommonUtils connectHost :@"fetchAutoLoans2" :jsonDictionary :self];
        [self parseResponse:newData:@"fetchAutoLoans2":@"autoLoansWrapper"];
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in AutoLoans viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
        
    }
    @finally {
        
        NSLog(@"finally in AutoLoans2 fetch viewData Code");
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
    
    
}

-(void) loadData {
    
    
    @try{
        
        autoLoansData = [autoLoansArray objectAtIndex:0];
        
        
        txtYearOfManufacture.text=emptyStringIfNil(autoLoansData.yearOfManufacture);
        txtColor.text=emptyStringIfNil(autoLoansData.colorValue);
        txtEngineNo.text=emptyStringIfNil(autoLoansData.engineNo);
        txtChassisNo.text=emptyStringIfNil(autoLoansData.chassisNo);
        txtRegistrationEmirate.text=emptyStringIfNil(autoLoansData.registrationEmirateValue);
        txtPriceOfVehicle.text=emptyStringIfNil(autoLoansData.priceOfVehicle);
        txtVehicleInsurance.text=emptyStringIfNil(autoLoansData.vehicleInsurance);
        txtOtherCharges.text=emptyStringIfNil(autoLoansData.otherCharges);
        txtTotalCost.text=emptyStringIfNil(autoLoansData.totalCost);
        txtDownPayment.text=emptyStringIfNil(autoLoansData.downPayment);
        txtTradeinValue.text=emptyStringIfNil(autoLoansData.tradeinValue);
        txtTotalFinancedAmount.text=emptyStringIfNil(autoLoansData.totalFinancedAmount);
        txtInterestRate.text=emptyStringIfNil(autoLoansData.interestRate);
        txtRepaymentAmount.text=emptyStringIfNil(autoLoansData.repaymentAmount);
        txtProcessingFee.text=emptyStringIfNil(autoLoansData.processingFee);
        txtTenor.text=emptyStringIfNil(autoLoansData.tenor);
        txtEMI.text=emptyStringIfNil(autoLoansData.emi);
        txtInsuranceCompanyName.text=emptyStringIfNil(autoLoansData.insuranceCompanyName);
        txtDueDate.text=emptyStringIfNil(autoLoansData.dueDate);
        txtRenewalDate.text=emptyStringIfNil(autoLoansData.renewalDate);
        txtPolicyNo.text=emptyStringIfNil(autoLoansData.policyNo);
        
        
        
        [popoverCodeValue setObject:emptyStringIfNil(self.autoLoansData.color) forKey:[NSString stringWithFormat:@"%d", self.txtColor.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.autoLoansData.registrationEmirate) forKey:[NSString stringWithFormat:@"%d", self.txtRegistrationEmirate.tag]];
        
        
        
        
        
        
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
//    webView.translatesAutoresizingMaskIntoConstraint2Autos=NO;
//    [self.view addSubview:webView];
//
//
//    [self.view addConstraint2Auto:[NSLayoutConstraint WithItem:webView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.6 constant:0]];
//
//    [self.view addConstraint2Auto:[NSLayoutConstraintConstraint2AutoWithItem:webView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.70 constant:0]];
//
//    [self.view addConstraint2Auto:[NSLayoutConstraintConstraint2AutoWithItem:webView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.25 constant:0]];
//
//    [self.view addConstraint2Auto:[NSLayoutConstraintConstraint2AutoWithItem:webView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//
//
//}

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


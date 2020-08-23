//
//  CreditCardViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 12/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//
//
//  AddressViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 21/08/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CreditCardViewController.h"
#import "CreditCardData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "CreditCard2ViewController.h"
#import "PopoverData.h"
#import "QueueViewController.h"
//#import "SearchViewController.h"



@interface CreditCardViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblConstraintX2Cre=0.52f;
CGFloat lblConstraintY2Cre=1.0f;
CGFloat lblConstraintWidth2Cre=0.5f;
CGFloat lblConstraintHeight2Cre=0.8f;

CGFloat ConstraintX2Cre=1.19f;
CGFloat ConstraintY2Cre=1.0f;
CGFloat ConstraintWidth2Cre=0.80f;
CGFloat ConstraintHeight2Cre=0.8f;

CGFloat constraint1X2Cre=0.69f;
CGFloat constraint1Y2Cre=1.0f;
CGFloat constraint1Width2Cre=0.3f;
CGFloat constraint1Height2Cre=0.8f;

CGFloat lblConstraint2X2Cre=1.52f;
CGFloat lblConstraint2Y2Cre=1.0f;
CGFloat lblConstraint2Width2Cre=0.5f;
CGFloat lblConstraint2Height2Cre=0.8f;

CGFloat Constraint2X2Cre=1.69f;
CGFloat Constraint2Y2Cre=1.0f;
CGFloat Constraint2Width2Cre=0.3f;
CGFloat Constraint2Height2Cre=0.8f;




@implementation CreditCardViewController




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


@synthesize creditCardArray;
@synthesize creditCardData;

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
@synthesize existingCustomerFlag;
@synthesize existingRefNo;
@synthesize txtCardType;
@synthesize txtBpmSubProduct;
@synthesize txtDeliveryOption;
@synthesize txtYearsInUAE;
@synthesize txtPerRefHomeCountryName;
@synthesize txtPerRefHomeCountryTelephone;
@synthesize txtPerRefUAEName1;
@synthesize txtPerRefUAETelephone1;
@synthesize txtPerRefUAEName2;
@synthesize txtPerRefUAETelephone2;
@synthesize txtSuppTitle;
@synthesize txtSuppName;
@synthesize txtSuppRelationship;
@synthesize txtSuppDOB;
@synthesize txtAccountNumber;
@synthesize txtAccDtlsAccountType;
@synthesize txtAutoPaymentAmount;


@synthesize recordStatus;
@synthesize accountType;

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
    
//    self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"Credit Card Details"];
    
    
    self.navigationItem.title=@"Credit Card Details";
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
    
//    if (textField.tag == 0) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 50;
//        
//    }
    
    
    //-- BPM Sub Product
    if (textField.tag == 2 ) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    //--Delivery Option
    if (textField.tag == 3 ) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    //--Years In UAE
        if (textField.tag == 4  ) {
        
        
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
    //--Name
    if (textField.tag == 5) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    // Tel No
    if (textField.tag == 6 || textField.tag == 8 || textField.tag == 10 || textField.tag == 15 ) {
        
        
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
    //--Name
    if (textField.tag == 7) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    
    //--Name
    if (textField.tag == 9) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
   
    // Title
    if (textField.tag == 11) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Name
    if (textField.tag == 12) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    // Relationship
    if (textField.tag == 13) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    
    //--Account Type
    if (textField.tag == 16) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 10;
        
    }
    //--Auto Payment Option
    if (textField.tag == 17) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
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

    
    //CardType
     if(textField.tag==1)
     {
         [self popoverData:textField:@"CardType"];
         return NO; //to disable keyboard
     }
    //Delivery Channel
     else if(textField.tag==3)
     {
         [self popoverData:textField:@"DebitCardDeliveryChnl"];
         return NO; //to disable keyboard
     }
    //Autopayment
     else if(textField.tag==17)
     {
         [self popoverData:textField:@"Decision"];
         return NO; //to disable keyboard
     }
    
 
    //--date of birth
     else if(textField.tag==14)
    {
        [self popoverDate:textField :@"LT":NULL];
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
    
    
    return 9;//[componentsArray count];
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
        
        return @" Credit Cards";
        
    }
    if (section == 2) {
        
        
        return @" Personal Reference In Home Country";
    }
    if (section == 3) {
        
        
        return @" Personal Reference ( Non Blood Relation )";
    }
    if (section == 5) {
        
        
        return @" Supplementary Card  Details";
    }
    if (section == 7) {
        
        
        return @"Account Details";
    }
//    if (section == 9) {
//        
//        
//        return @"Relationship With Other Financial Institutions";
//    }
//    if (section == 10) {
//        
//        
//        return @"Bill Payment For Outstanding Amount";
//    }

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
    // creditCardData = [addressArray objectAtIndex:indexPath.section];
    
    
    
    
    
    
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
            
            CommonLabel *lblCardType=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCardType.text=@"Card Type";
            lblCardType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCardType];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCardType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCardType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCardType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCardType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre constant:0]];
            
            
            txtCardType=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtCardType.tag=1;
            txtCardType.delegate=self;
            txtCardType.placeholder=@"Card Type";
            txtCardType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCardType];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCardType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCardType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCardType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCardType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre constant:0]];
            
            
//            CommonLabel *lblBpmSubProduct=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblBpmSubProduct.text=@"Bpm Land Sub Product";
//            lblBpmSubProduct.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblBpmSubProduct];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBpmSubProduct attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBpmSubProduct attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBpmSubProduct attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBpmSubProduct attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre constant:0]];
//            
//            
//            txtBpmSubProduct = [[CommonTextField alloc] init];
//            txtBpmSubProduct.tag=2;
//            txtBpmSubProduct.delegate=self;
//            txtBpmSubProduct.placeholder=@"Bpm Land Sub Product";
//            txtBpmSubProduct.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtBpmSubProduct];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBpmSubProduct attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBpmSubProduct attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBpmSubProduct attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBpmSubProduct attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre constant:0]];
            
            
            
            
        }
        else if(indexPath.section==1)
        {
            
            CommonLabel *lblDeliveryOption=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDeliveryOption.text=@"Delivery Option";
            lblDeliveryOption.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDeliveryOption];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDeliveryOption attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDeliveryOption attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDeliveryOption attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDeliveryOption attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre constant:0]];
            
            
            txtDeliveryOption=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtDeliveryOption.tag=3;
            txtDeliveryOption.delegate=self;
            txtDeliveryOption.placeholder=@"Delivery Option";
            txtDeliveryOption.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDeliveryOption];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDeliveryOption attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDeliveryOption attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDeliveryOption attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDeliveryOption attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre constant:0]];
            
            
            CommonLabel *lblYearsInUAE=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblYearsInUAE.text=@"Years In UAE";
            lblYearsInUAE.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblYearsInUAE];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblYearsInUAE attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblYearsInUAE attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblYearsInUAE attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblYearsInUAE attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre constant:0]];
            
            
            txtYearsInUAE = [[CommonTextField alloc] init];
            txtYearsInUAE.tag=4;
            txtYearsInUAE.delegate=self;
            txtYearsInUAE.placeholder=@"Years In UAE";
            txtYearsInUAE.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtYearsInUAE];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtYearsInUAE attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtYearsInUAE attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtYearsInUAE attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtYearsInUAE attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre constant:0]];
            

            
        }
        else if(indexPath.section==2){
            
            CommonLabel *lblPerRefHomeCountryName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPerRefHomeCountryName.text=@"Name";
            lblPerRefHomeCountryName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPerRefHomeCountryName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefHomeCountryName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefHomeCountryName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefHomeCountryName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefHomeCountryName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre constant:0]];
            
            
            txtPerRefHomeCountryName=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtPerRefHomeCountryName.tag=5;
            txtPerRefHomeCountryName.delegate=self;
            txtPerRefHomeCountryName.placeholder=@"Name";
            txtPerRefHomeCountryName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPerRefHomeCountryName];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefHomeCountryName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefHomeCountryName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefHomeCountryName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefHomeCountryName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre constant:0]];
            
            CommonLabel *lblPerRefHomeCountryTelephone=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPerRefHomeCountryTelephone.text=@"Telephone";
            lblPerRefHomeCountryTelephone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPerRefHomeCountryTelephone];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefHomeCountryTelephone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefHomeCountryTelephone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefHomeCountryTelephone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefHomeCountryTelephone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre constant:0]];
            
            
            txtPerRefHomeCountryTelephone=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtPerRefHomeCountryTelephone.tag=6;
            txtPerRefHomeCountryTelephone.delegate=self;
            txtPerRefHomeCountryTelephone.placeholder=@"Telephone";
            txtPerRefHomeCountryTelephone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPerRefHomeCountryTelephone];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefHomeCountryTelephone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefHomeCountryTelephone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefHomeCountryTelephone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefHomeCountryTelephone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre constant:0]];
            
            
        }
        else if(indexPath.section==3){
            
            CommonLabel *lblPerRefUAEName1=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPerRefUAEName1.text=@"Name";
            lblPerRefUAEName1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPerRefUAEName1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAEName1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAEName1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAEName1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAEName1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre constant:0]];
            
            
            txtPerRefUAEName1=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtPerRefUAEName1.tag=7;
            txtPerRefUAEName1.delegate=self;
            txtPerRefUAEName1.placeholder=@"Name";
            txtPerRefUAEName1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPerRefUAEName1];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAEName1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAEName1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAEName1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAEName1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre constant:0]];
            
            
            
            CommonLabel *lblPerRefUAETelephone1=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPerRefUAETelephone1.text=@"Telephone";
            lblPerRefUAETelephone1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPerRefUAETelephone1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAETelephone1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAETelephone1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAETelephone1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAETelephone1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre constant:0]];
            
            
            txtPerRefUAETelephone1 = [[CommonTextField alloc] init];
            txtPerRefUAETelephone1.tag=8;
            txtPerRefUAETelephone1.delegate=self;
            txtPerRefUAETelephone1.placeholder=@"Telephone";
            txtPerRefUAETelephone1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPerRefUAETelephone1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAETelephone1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAETelephone1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAETelephone1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAETelephone1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre constant:0]];
            
            
        }
        
       
        else if(indexPath.section==4){
            CommonLabel *lblPerRefUAEName2=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPerRefUAEName2.text=@"Name";
            lblPerRefUAEName2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPerRefUAEName2];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAEName2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAEName2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAEName2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAEName2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre constant:0]];
            
            
            txtPerRefUAEName2=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtPerRefUAEName2.tag=9;
            txtPerRefUAEName2.delegate=self;
            txtPerRefUAEName2.placeholder=@"Name";
            txtPerRefUAEName2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPerRefUAEName2];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAEName2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAEName2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAEName2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAEName2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre constant:0]];
            
            CommonLabel *lblPerRefUAETelephone2=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPerRefUAETelephone2.text=@"Telephone";
            lblPerRefUAETelephone2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPerRefUAETelephone2];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAETelephone2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAETelephone2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAETelephone2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefUAETelephone2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre constant:0]];
            
            
            txtPerRefUAETelephone2 = [[CommonTextField alloc] init];
            txtPerRefUAETelephone2.tag=10;
            txtPerRefUAETelephone2.delegate=self;
            txtPerRefUAETelephone2.placeholder=@"Telephone";
            txtPerRefUAETelephone2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPerRefUAETelephone2];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAETelephone2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAETelephone2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAETelephone2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPerRefUAETelephone2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre constant:0]];
            
            
            
            
            
            
        }
        else if(indexPath.section==5){
            
            
            
            CommonLabel *lblSuppTitle=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSuppTitle.text=@"Title";
            lblSuppTitle.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSuppTitle];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppTitle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppTitle attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppTitle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppTitle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre constant:0]];
            
            
            
            
            txtSuppTitle=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtSuppTitle.tag=11;
            txtSuppTitle.delegate=self;
            txtSuppTitle.placeholder=@"Title";
            txtSuppTitle.translatesAutoresizingMaskIntoConstraints=NO;
            
            [cell.contentView addSubview:txtSuppTitle];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppTitle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppTitle attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppTitle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppTitle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre constant:0]];
            
            
            CommonLabel *lblSuppName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSuppName.text=@"Name";
            lblSuppName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSuppName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre constant:0]];
            
            
            
            txtSuppName=[[CommonTextField alloc] init];
            txtSuppName.tag=12;
            txtSuppName.delegate=self;
            txtSuppName.placeholder=@"Name";
            txtSuppName.translatesAutoresizingMaskIntoConstraints=NO;
            
            [cell.contentView addSubview:txtSuppName];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre constant:0]];
            
            
        }
        else if(indexPath.section==6){
            
            CommonLabel *lblSuppRelationship=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSuppRelationship.text=@"Relationship";
            lblSuppRelationship.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSuppRelationship];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppRelationship attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppRelationship attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppRelationship attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppRelationship attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre constant:0]];
            
            
            
            txtSuppRelationship = [[CommonTextField alloc] init];
            txtSuppRelationship.tag=13;
            txtSuppRelationship.delegate=self;
            txtSuppRelationship.placeholder=@"Relationship";
            txtSuppRelationship.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSuppRelationship];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppRelationship attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppRelationship attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppRelationship attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppRelationship attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre constant:0]];
            
            
            CommonLabel *lblSuppDOB=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSuppDOB.text=@"Date Of Birth";
            lblSuppDOB.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSuppDOB];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppDOB attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppDOB attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppDOB attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSuppDOB attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre constant:0]];
            
            txtSuppDOB=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtSuppDOB.tag=14;
            txtSuppDOB.delegate=self;
            txtSuppDOB.placeholder=@"Date Of Birth";
            txtSuppDOB.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSuppDOB];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppDOB attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppDOB attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppDOB attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSuppDOB attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre constant:0]];
            
            
            
            
            
            
        }

        else if(indexPath.section==7){
            
            CommonLabel *lblAccountNumber=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAccountNumber.text=@"Account Number";
            lblAccountNumber.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAccountNumber];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNumber attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNumber attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNumber attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNumber attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre constant:0]];
            
            
            txtAccountNumber=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtAccountNumber.tag=15;
            txtAccountNumber.delegate=self;
            txtAccountNumber.placeholder=@"Account Number";
            txtAccountNumber.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAccountNumber];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNumber attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNumber attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNumber attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNumber attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre constant:0]];
            
            
            
            CommonLabel *lblAccDtlsAccountType=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAccDtlsAccountType.text=@"Account Type";
            lblAccDtlsAccountType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAccDtlsAccountType];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccDtlsAccountType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccDtlsAccountType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccDtlsAccountType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccDtlsAccountType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre constant:0]];
            
            
            
            txtAccDtlsAccountType=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtAccDtlsAccountType.tag=16;
            txtAccDtlsAccountType.delegate=self;
            txtAccDtlsAccountType.placeholder=@"Account Type";
            txtAccDtlsAccountType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAccDtlsAccountType];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccDtlsAccountType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccDtlsAccountType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccDtlsAccountType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccDtlsAccountType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre constant:0]];
            
            
            
            
            
        }

        else if(indexPath.section==8){
            
            CommonLabel *lblAutoPayment=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAutoPayment.text=@"Auto Payment";
            lblAutoPayment.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAutoPayment];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAutoPayment attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAutoPayment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAutoPayment attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAutoPayment attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre constant:0]];
            
            
            txtAutoPaymentAmount = [[CommonTextField alloc] init];
            txtAutoPaymentAmount.tag=17;
            txtAutoPaymentAmount.delegate=self;
            txtAutoPaymentAmount.placeholder=@"Auto Payment";
            txtAutoPaymentAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAutoPaymentAmount];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAutoPaymentAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAutoPaymentAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAutoPaymentAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAutoPaymentAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre constant:0]];
            
            
            
        }
        
        
        
    }
    else{
        
        
        
        [cell.contentView viewWithTag:100+indexPath.section];
        [cell.contentView viewWithTag:indexPath.section];
        
        [cell.contentView viewWithTag:500+indexPath.section];
        [cell.contentView viewWithTag:600+indexPath.section];
        
    }
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    if(([actionMode isEqualToString:@"UPDATE"] || [actionMode isEqualToString:@"ENQUIRY"]) && [creditCardArray count]>0)
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
    //        creditCardData = [addressArray objectAtIndex:0]; //indexPath.section
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
    
    if([CommonUtils checkEmptyString:txtCardType.text]==YES)
    {
        
        [CommonUtils showMessage:@"Card Type can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
//    if([CommonUtils checkEmptyString:txtBpmSubProduct.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"BPM Land Sub Product can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
    if([CommonUtils checkEmptyString:txtDeliveryOption.text]==YES)
    {
        
        [CommonUtils showMessage:@"Delivery Option can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtYearsInUAE.text]==YES)
    {
        
        [CommonUtils showMessage:@"Years In UAE can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtPerRefHomeCountryName.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtPerRefHomeCountryTelephone.text]==YES)
    {
        
        [CommonUtils showMessage:@"Telephone can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtPerRefUAEName1.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtPerRefUAETelephone1.text]==YES)
    {
        
        [CommonUtils showMessage:@"Telephone can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtPerRefUAEName2.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtPerRefUAETelephone2.text]==YES)
    {
        
        [CommonUtils showMessage:@"Telephone can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }

    if([CommonUtils checkEmptyString:txtSuppTitle.text]==YES)
    {
        
        [CommonUtils showMessage:@"Title can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtSuppName.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtSuppRelationship.text]==YES)
    {
        
        [CommonUtils showMessage:@"Relationship can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtSuppDOB.text]==YES)
    {
        
        [CommonUtils showMessage:@"Date Of Birth can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtAccountNumber.text]==YES)
    {
        
        [CommonUtils showMessage:@"Account Number can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtAccDtlsAccountType.text]==YES)
    {
        
        [CommonUtils showMessage:@"Account Type can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtAutoPaymentAmount.text]==YES)
    {
        
        [CommonUtils showMessage:@"Auto Payment Amount can't be blank":self];
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
        NSLog(@"CreditCard RefNo is %@",self.refNo);
        
        
        //-------
        
        jsonDictionary= @{
                          @"refNo":emptyStringIfNil(self.refNo),
                          @"cardType":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCardType.tag]]),
                          @"bpmSubProduct":emptyStringIfNil(self.txtBpmSubProduct.text),
                          @"deliveryOption":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtDeliveryOption.tag]]),
                          @"yearsInUAE":emptyStringIfNil(self.txtYearsInUAE.text),
                          @"perRefHomeCountryName":emptyStringIfNil(self.txtPerRefHomeCountryName.text),
                          @"perRefHomeCountryTelephone":emptyStringIfNil(self.txtPerRefHomeCountryTelephone.text),
                          @"perRefUAEName1":emptyStringIfNil(self.txtPerRefUAEName1.text),
                          @"perRefUAETelephone1":emptyStringIfNil(self.txtPerRefUAETelephone1.text),
                          @"perRefUAEName2":emptyStringIfNil(self.txtPerRefUAEName2.text),
                          @"perRefUAETelephone2":emptyStringIfNil(self.txtPerRefUAETelephone2.text),
                          @"suppTitle":emptyStringIfNil(self.txtSuppTitle.text),
                          @"suppName":emptyStringIfNil(self.txtSuppName.text),
                          @"suppRelationship":emptyStringIfNil(self.txtSuppRelationship.text ),
                          @"suppDOB":emptyStringIfNil(self.txtSuppDOB.text),
                          @"accountNumber":emptyStringIfNil(self.txtAccountNumber.text),
                          @"accDtlsAccountType":emptyStringIfNil(self.txtAccDtlsAccountType.text),
                          @"autoPaymentAmount":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtAutoPaymentAmount.tag]]),
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
            
            newData=[CommonUtils connectHost :@"insertCreditCard" :jsonDictionary :self];
            [self parseResponse:newData:@"insertCreditCard":@"creditCardWrapper"];
            
            
            
        }
        if([actionMode isEqualToString:@"UPDATE"])// && [viewMode isEqualToString:@"N"])
        {
            
            newData=[CommonUtils connectHost :@"updateCreditCard" :jsonDictionary :self];
            [self parseResponse:newData:@"updateCreditCard":@"creditCardWrapper"];
            
            
        }
        
        self.refNo=creditCardData.refNo;
        
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
        
//        
        CreditCard2ViewController *creditCard2ViewController = [[CreditCard2ViewController alloc]initWithNibName:nil bundle:nil];
        creditCard2ViewController.actionMode=self.actionMode;
        creditCard2ViewController.recordStatus=self.recordStatus;
        //productViewController.viewMode=self.viewMode;
        creditCard2ViewController.refNo=self.refNo;
        creditCard2ViewController.existingCustomerFlag=self.existingCustomerFlag;
        creditCard2ViewController.accountType=self.accountType;
        creditCard2ViewController.menuName=self.menuName;
        
        [self.navigationController pushViewController:creditCard2ViewController animated:YES];
        
        
        
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
        
        NSData *newData=[CommonUtils connectHost :@"fetchCreditCard" :jsonDictionary :self];
        [self parseResponse:newData:@"fetchCreditCard":@"creditCardWrapper"];
        
        
        
        //}
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Creditcard viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in  Creditcard viewData Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}

//- (void) viewPathStatus {
//    
//    @try{
//        
//        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
//        
//        
//        NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
//        
//
//        
//        NSData *newData=[CommonUtils connectHost :@"fetchPathStatus" :jsonDictionary:self];
//        [self parseResponsePath:newData:@"fetchPathStatus":@"pathStatusWrapper"];
//        
//        
//        
//        
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//    }
//    
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in Personal viewData code %@ reason %@ " , [exception name], [exception reason]);
//        [CommonUtils showMessage:[exception reason] :self];
//        
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//    }
//    @finally {
//        
//        NSLog(@"finally in PathStatus Code");
//    }
//    
//}



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



-(void) loadData {
    
    
    @try{
        
        creditCardData = [creditCardArray objectAtIndex:0];
        
        txtCardType.text=emptyStringIfNil(creditCardData.cardTypeValue);
        txtBpmSubProduct.text=emptyStringIfNil(creditCardData.bpmSubProduct);
        txtDeliveryOption.text=emptyStringIfNil(creditCardData.deliveryOptionValue);
        txtYearsInUAE.text=emptyStringIfNil(creditCardData.yearsInUAE);
        txtPerRefHomeCountryName.text=emptyStringIfNil(creditCardData.perRefHomeCountryName);
        txtPerRefHomeCountryTelephone.text=emptyStringIfNil(creditCardData.perRefHomeCountryTelephone);
        txtPerRefUAEName1.text=emptyStringIfNil(creditCardData.perRefUAEName1);
        txtPerRefUAETelephone1.text=emptyStringIfNil(creditCardData.perRefUAETelephone1);
        txtPerRefUAEName2.text=emptyStringIfNil(creditCardData.perRefUAEName2);
        txtPerRefUAETelephone2.text=emptyStringIfNil(creditCardData.perRefUAETelephone2);
        txtSuppTitle.text=emptyStringIfNil(creditCardData.suppTitle);
        txtSuppName.text=emptyStringIfNil(creditCardData.suppName);
        txtSuppRelationship.text=emptyStringIfNil(creditCardData.suppRelationship);
        txtSuppDOB.text=emptyStringIfNil(creditCardData.suppDOB);
        txtAccountNumber.text=emptyStringIfNil(creditCardData.accountNumber);
        txtAccDtlsAccountType.text=emptyStringIfNil(creditCardData.accDtlsAccountType);
        txtAutoPaymentAmount.text=emptyStringIfNil(creditCardData.autoPaymentAmountValue);
        
        
        
        [popoverCodeValue setObject:emptyStringIfNil(self.creditCardData.cardType) forKey:[NSString stringWithFormat:@"%d", self.txtCardType.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.creditCardData.deliveryOption) forKey:[NSString stringWithFormat:@"%d", self.txtDeliveryOption.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.creditCardData.autoPaymentAmount) forKey:[NSString stringWithFormat:@"%d", self.txtAutoPaymentAmount.tag]];
        
        
        
        
        
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
            
            ///NSLog(@"userid print :%@",userid);
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
                creditCardArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                  creditCardData = [[CreditCardData alloc] initWithJSONDictionary:dict];
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    // Add the Location object to the array
                  [creditCardArray addObject:creditCardData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)creditCardArray.count);
                
                
                
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

- (void) viewPathStatus {
    
    @try{
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        
        NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
        
        
         NSLog(@"Creditcard fetchPathStatus");
        
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

//- (void) parseResponsePath:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
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
//                //dataDictionary =[jsonObject objectForKey:@"fetchPersonalDetails"];
//                dataDictionary =[jsonObject objectForKey:methodAction];
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
//                pathArray = [[NSMutableArray alloc] init];
//                
//                // Get an array of dictionaries with the key "locations"
//                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
//                NSArray *array = [dataDictionary objectForKey:dataFile];
//                // Iterate through the array of dictionaries
//                for(NSDictionary *dict in array) {
//                    // Create a new Location object for each one and initialise it with information in the dictionary
//                    pathData = [[PathData alloc] initWithJSONDictionary:dict];
//                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
//                    
//                    // Add the Location object to the array
//                    [pathArray addObject:pathData];
//                }
//                
//                
//                NSLog(@"data count %lu",(unsigned long)pathArray.count);
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
//                [CommonUtils showMessage:@"Invalid userid or sessionid !":self];
//                
//                
//            }
//            
//        }
//        else{
//            
//            [CommonUtils showError:error:self:@"parseResponse"];
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
//        [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//        
//        NSLog(@"finally in parseResponse Code");
//    }
//    
//}


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
        
        
        //NSLog(@"array count %ld",(unsigned long)projectsSummaryArray.count);
        
        
        
        
        NSMutableDictionary *jsonDictionary = [[NSMutableDictionary alloc]init];
        
        //for (int i=0; i<=pathArray.count-1; i++) {
        
       pathData = [pathArray objectAtIndex:0];
        
       // NSLog(@"path refno %@",pathData.refNo);
        
                
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

//static inline NSString* pathStringIfNil(NSString *value) {
//    
//    return ([value isEqualToString:@"Y"]? @"100" : @"0");
//}

@end
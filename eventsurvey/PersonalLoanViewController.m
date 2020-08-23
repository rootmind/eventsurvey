//
//  PersonalLoanViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 04/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "PersonalLoanViewController.h"
#import "PersonalLoan2ViewController.h"
#import "PersonalLoanData.h"
#import "QueueViewController.h"






@interface PersonalLoanViewController()

@end


#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblconstraintPLX=0.52f;
CGFloat lblconstraintPLY=1.0f;
CGFloat lblconstraintPLWidth=0.5f;
CGFloat lblconstraintPLHeight=0.8f;

CGFloat constraintPLX=1.19f;
CGFloat constraintPLY=1.0f;
CGFloat constraintPLWidth=0.80f;
CGFloat constraintPLHeight=0.8f;

//CGFloat constraintPL1X=0.69f;
//CGFloat constraintPL1Y=1.0f;
//CGFloat constraintPL1Width=0.3f;
//CGFloat constraintPL1Height=0.8f;

CGFloat constraintPL1X2=0.69f;
CGFloat constraintPL1Y2=1.0f;
CGFloat constraintPL1Width2=0.3f;
CGFloat constraintPL1Height2=0.8f;

CGFloat lblconstraintPL2X=1.52f;
CGFloat lblconstraintPL2Y=1.0f;
CGFloat lblconstraintPL2Width=0.5f;
CGFloat lblconstraintPL2Height=0.8f;

//CGFloat constraintPL2X=1.69f;
//CGFloat constraintPL2Y=1.0f;
//CGFloat constraintPL2Width=0.3f;
//CGFloat constraintPL2Height=0.8f;

CGFloat constraintPL2X2=1.69f;
CGFloat constraintPL2Y2=1.0f;
CGFloat constraintPL2Width2=0.3f;
CGFloat constraintPL2Height2=0.8f;


@implementation PersonalLoanViewController


//@synthesize userid;
//@synthesize sessionid;
@synthesize actionMode;
@synthesize menuName;

@synthesize dataDictionary;

@synthesize  popoverCodeValue;
@synthesize existingCustomerFlag;
@synthesize existingRefNo;

@synthesize personalLoanArray;
@synthesize personalLoanData;


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


@synthesize txtAccountNo;
@synthesize txtFinanceAccountNo;
@synthesize txtCampaignCode;
@synthesize txtWifeOrHusbandEmployed;
@synthesize txtNoOfChildren;
@synthesize txtEducation;
@synthesize txtIWantApplyFor;
@synthesize txtPurposeOfLoan;
@synthesize txtPersonalRName;
@synthesize txtPersonalRTelephone;
@synthesize txtHealthQA1;
@synthesize txtHealthQA2;
@synthesize txtHealthQB1;
@synthesize txtHealthQB2;
@synthesize txtHealthAddress;
@synthesize txtNameBeneficiary1;
@synthesize txtNameBeneficiary2;




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
    
//    self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"Personal Loan"];
    
    self.navigationItem.title=@"Personal Loan";
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
    //--Account No
    if (textField.tag == 1) {
        
        
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
    //--Finance Account No
    if (textField.tag == 2) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Campaign Code
    if (textField.tag == 3) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 10;
        
    } //--Wife Husband Employed
    if (textField.tag == 4) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 10;
        
    }
    //-- No of children
    if (textField.tag == 5) {
        
        
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
        
    }    //-- Education
    if (textField.tag == 6) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    
    //-- Name
    if (textField.tag == 9) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    //-- Telephone
    if (textField.tag == 10) {
        
        
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
    //-- if no,please give details
    
    if (textField.tag == 12) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    
    //-- if yes,please give details

    if (textField.tag == 14) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    //-- Give Name And Address
    if (textField.tag == 15) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    
    //-- Name Of beneficiary1
    if (textField.tag == 16) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //-- Name Of beneficiary2
    if (textField.tag == 17) {
        
        
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
    
    
    //--I Want Apply For
    if(textField.tag==7)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--Purpose Of Loan
    else if(textField.tag==8)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }

    
    
    //--Are You In Good Health
    else if(textField.tag==11)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--Are You Currently Under Medical  Care
    else if(textField.tag==13)
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
    
    
    return 10;
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
        
        return @" Bank Use Only";
        
    }
    else if(section == 4)
    {
        
        return @" Personal Borrowings ( including any / all types of cc )";
        
    }
    
    else if(section == 5)
    {
        
        return @" Personal Reference In The UAE";
        
    }
    
    else if(section == 6)
    {
        
        return @" Health Declaration For Insurance";
        
    }
    else if(section == 9)
    {
        
        return @" Nomination";
        
    }
//    else if(section == 11)
//    {
//        
//        return @"Financial Details";
//        
//    }
//    else if(section == 20)
//    {
//        
//        return @"Fees And Charges";
//        
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
            
            CommonLabel *lblAccountNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAccountNo.text=@"Account No";
            lblAccountNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAccountNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPLHeight constant:0]];
            
            
            txtAccountNo = [[CommonTextField alloc] init];
            txtAccountNo.tag=1;
            txtAccountNo.delegate=self;
            txtAccountNo.placeholder=@"Account No";
            txtAccountNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAccountNo];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblFinanceAccountNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblFinanceAccountNo.text=@"Finance Account No";
            lblFinanceAccountNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblFinanceAccountNo];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFinanceAccountNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFinanceAccountNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFinanceAccountNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFinanceAccountNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPL2Height constant:0]];
            
            
            txtFinanceAccountNo = [[CommonTextField alloc] init];
            txtFinanceAccountNo.tag=2;
            txtFinanceAccountNo.delegate=self;
            txtFinanceAccountNo.placeholder=@"Finance Account No";
            txtFinanceAccountNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtFinanceAccountNo];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFinanceAccountNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFinanceAccountNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFinanceAccountNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFinanceAccountNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL2Height2 constant:0]];
            
            
        }

        if(indexPath.section==1)
        {
            
            CommonLabel *lblCampaignCode=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCampaignCode.text=@"Campaign Code";
            lblCampaignCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCampaignCode];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCampaignCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCampaignCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCampaignCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCampaignCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPLHeight constant:0]];
            
            
            txtCampaignCode = [[CommonTextField alloc] init];
            txtCampaignCode.tag=3;
            txtCampaignCode.delegate=self;
            txtCampaignCode.placeholder=@"Campaign Code";
            txtCampaignCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCampaignCode];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCampaignCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCampaignCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCampaignCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCampaignCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblWifeOrHusbandEmployed=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblWifeOrHusbandEmployed.text=@"Wife/Husband Employed";
            lblWifeOrHusbandEmployed.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblWifeOrHusbandEmployed];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWifeOrHusbandEmployed attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWifeOrHusbandEmployed attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWifeOrHusbandEmployed attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWifeOrHusbandEmployed attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPL2Height constant:0]];
            
            
            txtWifeOrHusbandEmployed = [[CommonTextField alloc] init];
            txtWifeOrHusbandEmployed.tag=4;
            txtWifeOrHusbandEmployed.delegate=self;
            txtWifeOrHusbandEmployed.placeholder=@"Wife/Husband Employed";
            txtWifeOrHusbandEmployed.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtWifeOrHusbandEmployed];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWifeOrHusbandEmployed attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWifeOrHusbandEmployed attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWifeOrHusbandEmployed attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWifeOrHusbandEmployed attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL2Height2 constant:0]];
            

            
            
            
        }
        if(indexPath.section==2)
        {
            
            CommonLabel *lblNoOfChildren=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNoOfChildren.text=@"No Of Children";
            lblNoOfChildren.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNoOfChildren];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoOfChildren attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoOfChildren attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoOfChildren attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoOfChildren attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPLHeight constant:0]];
            
            
            txtNoOfChildren = [[CommonTextField alloc] init];
            txtNoOfChildren.tag=5;
            txtNoOfChildren.delegate=self;
            txtNoOfChildren.placeholder=@"No Of Children";
            txtNoOfChildren.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNoOfChildren];
            
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfChildren attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfChildren attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfChildren attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfChildren attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblEducation=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblEducation.text=@"Education";
            lblEducation.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblEducation];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEducation attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEducation attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEducation attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEducation attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPL2Height constant:0]];
            
            
            txtEducation = [[CommonTextField alloc] init];
            txtEducation.tag=6;
            txtEducation.delegate=self;
            txtEducation.placeholder=@"Education";
            txtEducation.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtEducation];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEducation attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEducation attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEducation attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEducation attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL2Height2 constant:0]];
            
            
        }
        if(indexPath.section==3)
        {
            
            CommonLabel *lblIWantApplyFor=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblIWantApplyFor.text=@"I Want Apply For";
            lblIWantApplyFor.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblIWantApplyFor];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblIWantApplyFor attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblIWantApplyFor attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblIWantApplyFor attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblIWantApplyFor attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPLHeight constant:0]];
            
            
            txtIWantApplyFor = [[CommonTextField alloc] init];
            txtIWantApplyFor.tag=7;
            txtIWantApplyFor.delegate=self;
            txtIWantApplyFor.placeholder=@"I Want Apply For";
            txtIWantApplyFor.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtIWantApplyFor];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtIWantApplyFor attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtIWantApplyFor attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtIWantApplyFor attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtIWantApplyFor attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL1Height2 constant:0]];
            
            
        }
        if(indexPath.section==4)
        {
            
            CommonLabel *lblPurposeOfLoan=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPurposeOfLoan.text=@"Purpose Of Loan";
            lblPurposeOfLoan.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPurposeOfLoan];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPurposeOfLoan attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPurposeOfLoan attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPurposeOfLoan attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPurposeOfLoan attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPLHeight constant:0]];
            
            
            txtPurposeOfLoan = [[CommonTextField alloc] init];
            txtPurposeOfLoan.tag=8;
            txtPurposeOfLoan.delegate=self;
            txtPurposeOfLoan.placeholder=@"Purpose Of Loan";
            txtPurposeOfLoan.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPurposeOfLoan];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurposeOfLoan attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurposeOfLoan attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurposeOfLoan attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurposeOfLoan attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL1Height2 constant:0]];
            
            
        }
        
        if(indexPath.section==5)
        {
            
            CommonLabel *lblPersonalRName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPersonalRName.text=@"Name";
            lblPersonalRName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPersonalRName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPersonalRName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPersonalRName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPersonalRName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPersonalRName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPLHeight constant:0]];
            
            
            txtPersonalRName = [[CommonTextField alloc] init];
            txtPersonalRName.tag=9;
            txtPersonalRName.delegate=self;
            txtPersonalRName.placeholder=@"Name";
            txtPersonalRName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPersonalRName];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPersonalRName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPersonalRName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPersonalRName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPersonalRName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblPersonalRTelephone=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPersonalRTelephone.text=@"Telephone";
            lblPersonalRTelephone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPersonalRTelephone];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPersonalRTelephone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPersonalRTelephone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPersonalRTelephone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPersonalRTelephone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPL2Height constant:0]];
            
            
            txtPersonalRTelephone = [[CommonTextField alloc] init];
            txtPersonalRTelephone.tag=10;
            txtPersonalRTelephone.delegate=self;
            txtPersonalRTelephone.placeholder=@"Telephone";
            txtPersonalRTelephone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPersonalRTelephone];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPersonalRTelephone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPersonalRTelephone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPersonalRTelephone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPersonalRTelephone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL2Height2 constant:0]];
            
            
        }
        if(indexPath.section==6)
        {
            
            CommonLabel *lblHealthQA1=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblHealthQA1.text=@"Are You In Good Health ?";
            lblHealthQA1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblHealthQA1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQA1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQA1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQA1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQA1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPLHeight constant:0]];
            
            
            txtHealthQA1 = [[CommonTextField alloc] init];
            txtHealthQA1.tag=11;
            txtHealthQA1.delegate=self;
            txtHealthQA1.placeholder=@"Are You In Good Health ?";
            txtHealthQA1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtHealthQA1];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQA1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQA1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQA1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQA1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblHealthQA2=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblHealthQA2.text=@"If No, Please Give Details";
            lblHealthQA2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblHealthQA2];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQA2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQA2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQA2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQA2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPL2Height constant:0]];
            
            
            txtHealthQA2 = [[CommonTextField alloc] init];
            txtHealthQA2.tag=12;
            txtHealthQA2.delegate=self;
            txtHealthQA2.placeholder=@"If No, Please Give Details";
            txtHealthQA2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtHealthQA2];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQA2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQA2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQA2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQA2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL2Height2 constant:0]];
            
            
        }
        if(indexPath.section==7)
        {
            
            CommonLabel *lblHealthQB1=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblHealthQB1.text=@"Are You Currently Under Medical Care ?";
            lblHealthQB1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblHealthQB1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQB1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQB1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQB1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQB1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPLHeight constant:0]];
            
            
            txtHealthQB1 = [[CommonTextField alloc] init];
            txtHealthQB1.tag=13;
            txtHealthQB1.delegate=self;
            txtHealthQB1.placeholder=@"Are You Currently Under Medical Care ?";
            txtHealthQB1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtHealthQB1];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQB1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQB1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQB1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQB1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblHealthQB2=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblHealthQB2.text=@"If Yes, Please Give Details";
            lblHealthQB2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblHealthQB2];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQB2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQB2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQB2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthQB2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPL2Height constant:0]];
            
            
            txtHealthQB2 = [[CommonTextField alloc] init];
            txtHealthQB2.tag=14;
            txtHealthQB2.delegate=self;
            txtHealthQB2.placeholder=@"If Yes, Please Give Details";
            txtHealthQB2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtHealthQB2];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQB2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQB2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQB2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthQB2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL2Height2 constant:0]];
            
            
        }
        if(indexPath.section==8)
        {
            
            CommonLabel *lblHealthAddress=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblHealthAddress.text=@"Give Name And Address Of Your Family And/Or Employer's Doctor";
            lblHealthAddress.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblHealthAddress];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthAddress attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthAddress attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthAddress attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblHealthAddress attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPLHeight constant:0]];
            
            
            txtHealthAddress = [[CommonTextField alloc] init];
            txtHealthAddress.tag=15;
            txtHealthAddress.delegate=self;
            txtHealthAddress.placeholder=@"Give Name And Address Of Your Family And/Or Employer's Doctor";
            txtHealthAddress.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtHealthAddress];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthAddress attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthAddress attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthAddress attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtHealthAddress attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL1Height2 constant:0]];
            
            
        }
        if(indexPath.section==9)
        {
            
            CommonLabel *lblNameBeneficiary1=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNameBeneficiary1.text=@"Name Of Beneficiary1";
            lblNameBeneficiary1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNameBeneficiary1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameBeneficiary1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameBeneficiary1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameBeneficiary1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameBeneficiary1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPLHeight constant:0]];
            
            
            txtNameBeneficiary1 = [[CommonTextField alloc] init];
            txtNameBeneficiary1.tag=16;
            txtNameBeneficiary1.delegate=self;
            txtNameBeneficiary1.placeholder=@"Name Of Beneficiary1";
            txtNameBeneficiary1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNameBeneficiary1];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameBeneficiary1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameBeneficiary1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameBeneficiary1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameBeneficiary1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblNameBeneficiary2=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNameBeneficiary2.text=@"Name Of Beneficiary2";
            lblNameBeneficiary2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNameBeneficiary2];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameBeneficiary2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraintPL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameBeneficiary2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraintPL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameBeneficiary2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraintPL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameBeneficiary2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraintPL2Height constant:0]];
            
            
            txtNameBeneficiary2 = [[CommonTextField alloc] init];
            txtNameBeneficiary2.tag=17;
            txtNameBeneficiary2.delegate=self;
            txtNameBeneficiary2.placeholder=@"Name Of Beneficiary2";
            txtNameBeneficiary2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNameBeneficiary2];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameBeneficiary2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameBeneficiary2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameBeneficiary2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameBeneficiary2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPL2Height2 constant:0]];
            
            
        }

        
        
        
    }
    else{
        
        
        
        [cell.contentView viewWithTag:100+indexPath.section];
        [cell.contentView viewWithTag:indexPath.section];
        
        [cell.contentView viewWithTag:500+indexPath.section];
        [cell.contentView viewWithTag:600+indexPath.section];
        
    }
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    if(([actionMode isEqualToString:@"UPDATE"] || [actionMode isEqualToString:@"ENQUIRY"]) && [personalLoanArray count]>0) //
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
    
    
    if([CommonUtils checkEmptyString:txtAccountNo.text]==YES)
    {
        
        [CommonUtils showMessage:@"Account No can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtFinanceAccountNo.text]==YES)
    {
        
        [CommonUtils showMessage:@"Finance Account No can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtCampaignCode.text]==YES)
    {
        
        [CommonUtils showMessage:@"Campaign Code can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtWifeOrHusbandEmployed.text]==YES)
    {
        
        [CommonUtils showMessage:@"Wife/Husband Employed can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtNoOfChildren.text]==YES)
    {
        
        [CommonUtils showMessage:@"No Of Children can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtEducation.text]==YES)
    {
        
        [CommonUtils showMessage:@"Education can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtIWantApplyFor.text]==YES)
    {
        
        [CommonUtils showMessage:@"I Want Apply For can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtPurposeOfLoan.text]==YES)
    {
        
        [CommonUtils showMessage:@"Purpose Of Loan can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtPersonalRName.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtPersonalRTelephone.text]==YES)
    {
        
        [CommonUtils showMessage:@"Telephone can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtHealthQA1.text]==YES)
    {
        
        [CommonUtils showMessage:@"Are You In Good Health can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtHealthQA2.text]==YES)
    {
        
        [CommonUtils showMessage:@"If No, Please Give Details  can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtHealthQB1.text]==YES)
    {
        
        [CommonUtils showMessage:@"Are You Currently Under Medical Care ? can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtHealthQB2.text]==YES)
    {
        
        [CommonUtils showMessage:@"If Yes, Please Give Details can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtHealthAddress.text]==YES)
    {
        
        [CommonUtils showMessage:@"Give Name And Address Of Your Family And/Or Employer's Doctor can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtNameBeneficiary1.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name Of Beneficiary1 can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtNameBeneficiary2.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name Of Beneficiary2 can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
//    if([CommonUtils checkEmptyString:txtTransmission.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Transmission can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtSunroof.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Sunroof can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtDealerSalesRepName.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Dealer Sales Representative Name can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
    
    
    
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    [self buildJSON];
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}
- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    NSData * newData;
    //refNo=@"PL04NOV20150002";
    //recordStatus=@"INPROGRESS";
    
    NSLog(@"PersonalLoan action mode %@",actionMode);
    NSLog(@"PersonalLoan Ref no %@",self.refNo);
    
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
                                  @"accountNo":emptyStringIfNil(self.txtAccountNo.text),
                                  @"financeAccountNo":emptyStringIfNil(self.txtFinanceAccountNo.text),
                                  @"campaignCode":emptyStringIfNil(self.txtCampaignCode.text),
                                  @"wifeOrHusbandEmployed":emptyStringIfNil(self.txtWifeOrHusbandEmployed.text),
                                  @"noOfChildren":emptyStringIfNil(self.txtNoOfChildren.text),
                                  @"education":emptyStringIfNil(self.txtEducation.text),
                                  @"iWantApplyFor":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtIWantApplyFor.tag]]),
                                  @"purposeOfLoan":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtPurposeOfLoan.tag]]),
                                  @"personalRName":emptyStringIfNil(self.txtPersonalRName.text),
                                  @"personalRTelephone":emptyStringIfNil(self.txtPersonalRTelephone.text),
                                  @"healthQA1":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtHealthQA1.tag]]),
                                  @"healthQA2":emptyStringIfNil(self.txtHealthQA2.text),
                                  @"healthQB1":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtHealthQB1.tag]]),
                                  @"healthQB2":emptyStringIfNil(self.txtHealthQB2.text),
                                  @"healthAddress":emptyStringIfNil(self.txtHealthAddress.text),
                                  @"nameBeneficiary1":emptyStringIfNil(self.txtNameBeneficiary1.text),
                                  @"nameBeneficiary2":emptyStringIfNil(self.txtNameBeneficiary2.text),
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
            
            newData=[CommonUtils connectHost :@"insertPersonalLoan" :jsonDictionary :self];
            [self parseResponse:newData:@"insertPersonalLoan":@"personalLoanWrapper"];
            //viewMode=@"N";
        }
        if([actionMode isEqualToString:@"UPDATE"])// && [viewMode isEqualToString:@"N"])
        {
            
            newData=[CommonUtils connectHost :@"updatePersonalLoan" :jsonDictionary :self];
            [self parseResponse:newData:@"updatePersonalLoan":@"personalLoanWrapper"];
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
//        
        PersonalLoan2ViewController *personalLoan2ViewController = [[PersonalLoan2ViewController alloc]initWithNibName:nil bundle:nil];
        personalLoan2ViewController.actionMode=self.actionMode;
        //contactViewController.viewMode=self.viewMode;
        personalLoan2ViewController.refNo=self.refNo;
        personalLoan2ViewController.existingCustomerFlag=self.existingCustomerFlag;
        personalLoan2ViewController.menuName=self.menuName;
        
        [self.navigationController pushViewController:personalLoan2ViewController animated:YES];
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
    
    
    
    NSLog(@"PersonalLoan action mode %@",actionMode);
    NSLog(@"PersonalLoan Ref no %@",self.refNo);
    
    @try{
        
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        NSDictionary *jsonDictionary= @{@"refNo":self.refNo};
        
        
        
        NSData * newData=[CommonUtils connectHost :@"fetchPersonalLoan" :jsonDictionary :self];
        [self parseResponse:newData:@"fetchPersonalLoan":@"personalLoanWrapper"];
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in PersonalLoan viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
        
    }
    @finally {
        
        NSLog(@"finally in PersonalLoan fetch viewData Code");
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
    
    
}

-(void) loadData {
    
    
    @try{
        
        personalLoanData = [personalLoanArray objectAtIndex:0];
        
        
        txtAccountNo.text=emptyStringIfNil(personalLoanData.accountNo);
        txtFinanceAccountNo.text=emptyStringIfNil(personalLoanData.financeAccountNo);
        txtCampaignCode.text=emptyStringIfNil(personalLoanData.campaignCode);
        txtWifeOrHusbandEmployed.text=emptyStringIfNil(personalLoanData.wifeOrHusbandEmployed);
        txtNoOfChildren.text=emptyStringIfNil(personalLoanData.noOfChildren);
        txtEducation.text=emptyStringIfNil(personalLoanData.education);
        txtIWantApplyFor.text=emptyStringIfNil(personalLoanData.iWantApplyFor);
        txtPurposeOfLoan.text=emptyStringIfNil(personalLoanData.purposeOfLoan);
        txtPersonalRName.text=emptyStringIfNil(personalLoanData.personalRName);
        txtPersonalRTelephone.text=emptyStringIfNil(personalLoanData.personalRTelephone);
        txtHealthQA1.text=emptyStringIfNil(personalLoanData.healthQA1);
        txtHealthQA2.text=emptyStringIfNil(personalLoanData.healthQA2);
        txtHealthQB1.text=emptyStringIfNil(personalLoanData.healthQB1);
        txtHealthQB2.text=emptyStringIfNil(personalLoanData.healthQB2);
        txtHealthAddress.text=emptyStringIfNil(personalLoanData.healthAddress);
        txtNameBeneficiary1.text=emptyStringIfNil(personalLoanData.nameBeneficiary1);
        txtNameBeneficiary2.text=emptyStringIfNil(personalLoanData.nameBeneficiary2);
        
        
        
        
        
        [popoverCodeValue setObject:emptyStringIfNil(self.personalLoanData.iWantApplyFor) forKey:[NSString stringWithFormat:@"%d", self.txtIWantApplyFor.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.personalLoanData.purposeOfLoan) forKey:[NSString stringWithFormat:@"%d", self.txtPurposeOfLoan.tag]];
        
        
        [popoverCodeValue setObject:emptyStringIfNil(self.personalLoanData.healthQA1) forKey:[NSString stringWithFormat:@"%d", self.txtHealthQA1.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.personalLoanData.healthQB1) forKey:[NSString stringWithFormat:@"%d", self.txtHealthQB1.tag]];
        

        
        
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
            
           // NSLog(@"userid print :%@",userid);
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
                personalLoanArray = [[NSMutableArray alloc] init];
                
                
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    personalLoanData = [[PersonalLoanData alloc] initWithJSONDictionary:dict];
                    
                    NSLog(@" personalLoanData %@",personalLoanData.refNo);
                    
                    // Add the Location object to the array
                    [personalLoanArray addObject:personalLoanData];
                    
                }
                
                
                NSLog(@"data count %lu",(unsigned long)personalLoanArray.count);
                
                
                
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


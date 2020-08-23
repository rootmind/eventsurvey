//
//////  KYCViewController.m
//////  Onboard
//////
//////  Created by Rootmind TechSoft Private Limited on 20/08/15.
//////  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "KYCViewController.h"
#import "KycData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "KYC2ViewController.h"
#import "QueueViewController.h"





@interface KYCViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

//CGFloat lblConstraintKycX2=0.52f;
//CGFloat lblConstraintKycY2=1.0f;
//CGFloat lblConstraintKycWidth2=0.5f;
//CGFloat lblConstraintKycHeight2=0.8f;

CGFloat lblConstraintKycX2=0.72f;
CGFloat lblConstraintKycY2=1.0f;
//CGFloat lblConstraintKycWidth2=1.0f;
CGFloat lblConstraintKycWidth2=0.7f;
CGFloat lblConstraintKycHeight2=0.8f;


CGFloat constraintKycX2=1.19f;
CGFloat constraintKycY2=1.0f;
CGFloat constraintKycWidth2=0.80f;
CGFloat constraintKycHeight2=0.8f;

CGFloat constraintKyc1X2=0.69f;
CGFloat constraintKyc1Y2=1.0f;
CGFloat constraintKyc1Width2=0.3f;
CGFloat constraintKyc1Height2=0.8f;

CGFloat lblConstraintKyc2X2=1.52f;
CGFloat lblConstraintKyc2Y2=1.0f;
CGFloat lblConstraintKyc2Width2=0.5f;
CGFloat lblConstraintKyc2Height2=0.8f;

CGFloat constraintKyc2X2=1.69f;
CGFloat constraintKyc2Y2=1.0f;
CGFloat constraintKyc2Width2=0.3f;
CGFloat constraintKyc2Height2=0.8f;




@implementation KYCViewController




//@synthesize userid;
//@synthesize sessionid;
@synthesize menuName;
@synthesize actionMode;


@synthesize dataDictionary;



@synthesize popoverData;
@synthesize popoverArray;
@synthesize refNo;
@synthesize popoverCodeValue;

@synthesize kycArray;
@synthesize kycData;

@synthesize dateToolBar;
@synthesize datePicker;



@synthesize webView;
//@synthesize activityIndicator;
//@synthesize lblLoading;

@synthesize timerView;


int hours, minutes, seconds,secondsLeft;

@synthesize existingRefNo;
@synthesize existingCustomerFlag;
@synthesize txtCustomerName;
@synthesize txtUAEResident;
@synthesize txtKYCType;
@synthesize txtCISNoforexistingrelationship;
@synthesize txtPoaGiven;
@synthesize txtKYCPreparedon;
@synthesize txtNextKYcRiviewDate;
@synthesize txtKYcComments;
@synthesize txtQA1Exposedperson;
@synthesize txtQA2NonResident;
@synthesize txtQA3Individuals;
@synthesize txtQA4SelectCountries;
@synthesize txtQA5CustHRBusiness;
@synthesize txtQA6HoldMailCustomer;
@synthesize txtQA7ReputationAspects;
@synthesize recordStatus;


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
    
        //[self.navigationItem setHidesBackButton:NO animated:YES];
    
//    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
//    [self.splitViewController.displayModeButtonItem action];
//    
    
//    self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"KYC Details"];  
    self.navigationItem.title=@"KYC Details";

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
    
    
    
    
    //---initialize during load
    popoverCodeValue = [[NSMutableDictionary alloc]init];
    
    
    
    //--when not new
    if([actionMode isEqualToString:@"UPDATE"] ||[actionMode isEqualToString:@"ENQUIRY"] || ([actionMode isEqualToString:@"NEW"] && [existingCustomerFlag isEqualToString:@"Y"] && [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]))// && [viewMode isEqualToString:@"Y"])
    {
        
        [self viewData];
        
        //viewMode=@"N";
        
        
    }
    
    
    
    //[self displayHeader];
    

}


- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
  
    
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
    //--Customer Name
    if (textField.tag == 1) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    //--CIS No
    if (textField.tag == 4) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        //        return newLength <= 20;
        
        
        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet];
        
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
        
        if(newLength > 20)
        {
            return NO;
        }
        textField.text = newValue;
        // return NO because we're manually setting the value
        return NO;
        
    }
    //--KYC comments
    if (textField.tag == 8) {
        
        
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
    
    
    
    //--UAE Resident
    if(textField.tag==2)
    {
        [self popoverData:textField:@"Residence"];
        return NO; //to disable keyboard
    }
    //--KYC Type
    else if(textField.tag==3)
    {
        [self popoverData:textField:@"KYCTYPE"];
        return NO; //to disable keyboard
    }
    
    //--POA
    else if(textField.tag==5)
    {
        [self popoverData:textField:@"DECISION"];
        return NO; //to disable keyboard
    }
    
    //--KYC prepared on
    else if (textField.tag ==6)
    {
        [self popoverDate:textField:@"LT":NULL];
        return NO;
        
    }
    //--KYC next Review
    else if (textField.tag ==7)
    {
        [self popoverDate:textField:@"GT":NULL];
        return NO;
        
    }
    //--Relationship Involving
    else if(textField.tag==9)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--Non Resident
    else if(textField.tag==10)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--Individuals
    else if(textField.tag==11)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--Select The Countries
    else if(textField.tag==12)
    {
        [self popoverData:textField:@"NATIONALITY"];
        return NO; //to disable keyboard
    }
    //--Customer Deals
    else if(textField.tag==13)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--Hold Mail
    else if(textField.tag==14)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--Other Assets
    else if(textField.tag==15)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    
    
 
    return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField: textField up: YES];
    
    
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
    
    
    return 12;//[componentsArray count];
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
        
        return @" KYC DEtails";
        
    }
    if (section == 4) {
        
        
        return @" KYC Risk Profiling";
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
    
    //popoverData = [popoverArray objectAtIndex:indexPath.section];
    
    
    
    
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
            
            CommonLabel *lblCustomerName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCustomerName.text=@"CustomerName";
            lblCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCustomerName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKycX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKycY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKycWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKycHeight2 constant:0]];
            

            
            txtCustomerName = [[CommonTextField alloc] init];
            txtCustomerName.tag=1;
            txtCustomerName.delegate=self;
            txtCustomerName.placeholder=@"CustomerName";
            txtCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCustomerName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc1Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc1Height2 constant:0]];

            
            
            
            CommonLabel *lblUAEResident=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblUAEResident.text=@"UAE Resident";
            lblUAEResident.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblUAEResident];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUAEResident attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUAEResident attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKyc2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUAEResident attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblUAEResident attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKyc2Height2 constant:0]];
            
            
            txtUAEResident = [[CommonTextField alloc] init];
            txtUAEResident.tag=2;
            txtUAEResident.delegate=self;
            txtUAEResident.placeholder=@"UAE Resident";
            txtUAEResident.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtUAEResident];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUAEResident attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUAEResident attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUAEResident attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtUAEResident attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Height2 constant:0]];
            
            
            
            
        }
        else if(indexPath.section==1)
        {
            
            CommonLabel *lblKYCType=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblKYCType.text=@"KYC Type";
            lblKYCType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblKYCType];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblKYCType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKycX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblKYCType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKycY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblKYCType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKycWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblKYCType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKycHeight2 constant:0]];
            
            
            txtKYCType = [[CommonTextField alloc] init];
            txtKYCType.tag=3;
            txtKYCType.delegate=self;
            txtKYCType.placeholder=@"KYC Type";
            txtKYCType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtKYCType];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtKYCType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtKYCType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc1Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtKYCType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtKYCType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc1Height2 constant:0]];
            
            
            CommonLabel *lblCISNoforexrel=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCISNoforexrel.text=@"CIS No Ext Rel-ship";
            lblCISNoforexrel.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCISNoforexrel];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCISNoforexrel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCISNoforexrel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKyc2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCISNoforexrel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCISNoforexrel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKyc2Height2 constant:0]];
            
            
            txtCISNoforexistingrelationship = [[CommonTextField alloc] init];
            txtCISNoforexistingrelationship.tag=4;
            txtCISNoforexistingrelationship.delegate=self;
            txtCISNoforexistingrelationship.placeholder=@"CIS NO For Existing Relationship";
            txtCISNoforexistingrelationship.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCISNoforexistingrelationship];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCISNoforexistingrelationship attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCISNoforexistingrelationship attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCISNoforexistingrelationship attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCISNoforexistingrelationship attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Height2 constant:0]];
            
            
        }
        else if(indexPath.section==2){
            
            CommonLabel *lblPOAGiven=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPOAGiven.text=@"POA Given";
            lblPOAGiven.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPOAGiven];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPOAGiven attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKycX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPOAGiven attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKycY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPOAGiven attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKycWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPOAGiven attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKycHeight2 constant:0]];
            
            
            txtPoaGiven=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtPoaGiven.tag=5;
            txtPoaGiven.delegate=self;
            txtPoaGiven.placeholder=@"POA Given";
            txtPoaGiven.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPoaGiven];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPoaGiven attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPoaGiven attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc1Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPoaGiven attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPoaGiven attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc1Height2 constant:0]];
            
            
            
            CommonLabel *lblKYCPreparedon=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblKYCPreparedon.text=@"KYC Prepared On";
            lblKYCPreparedon.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblKYCPreparedon];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblKYCPreparedon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblKYCPreparedon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKyc2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblKYCPreparedon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblKYCPreparedon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKyc2Height2 constant:0]];
            
            
            txtKYCPreparedon=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtKYCPreparedon.tag=6;
            txtKYCPreparedon.delegate=self;
            txtKYCPreparedon.placeholder=@"KYC Prepared On";
            txtKYCPreparedon.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtKYCPreparedon];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtKYCPreparedon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtKYCPreparedon attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtKYCPreparedon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtKYCPreparedon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Height2 constant:0]];
            
            
        }
        else if(indexPath.section==3){
            
            CommonLabel *lblNextRivewDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNextRivewDate.text=@"Next KYC Review Dt";
            lblNextRivewDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNextRivewDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNextRivewDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKycX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNextRivewDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKycY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNextRivewDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKycWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNextRivewDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKycHeight2 constant:0]];
            
            
            txtNextKYcRiviewDate=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtNextKYcRiviewDate.tag=7;
            txtNextKYcRiviewDate.delegate=self;
            txtNextKYcRiviewDate.placeholder=@" Next KYC Review Date";
            txtNextKYcRiviewDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNextKYcRiviewDate];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNextKYcRiviewDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNextKYcRiviewDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc1Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNextKYcRiviewDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNextKYcRiviewDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc1Height2 constant:0]];
            
            
            
            CommonLabel *lblKYcComments=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblKYcComments.text=@" KYC Comments";
            lblKYcComments.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblKYcComments];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblKYcComments attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblKYcComments attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKyc2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblKYcComments attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblKYcComments attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKyc2Height2 constant:0]];
            
            
            
            
            
            
            txtKYcComments=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtKYcComments.tag=8;
            txtKYcComments.delegate=self;
            txtKYcComments.placeholder=@" KYC Comments";
            txtKYcComments.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtKYcComments];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtKYcComments attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtKYcComments attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtKYcComments attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtKYcComments attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Height2 constant:0]];
            

            
           
       }
        else if(indexPath.section==4){
            
            CommonLabel *lblSectionA=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSectionA.text=@"Section A    ";
            lblSectionA.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSectionA];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSectionA attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKycX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSectionA attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKycY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSectionA attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKycWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSectionA attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKycHeight2 constant:0]];
            
            
        }
        else if(indexPath.section==5){
            CommonLabel *lblQA1Exposedperson=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblQA1Exposedperson.text=@"Relationship Involving Foreign Politically Exposed Person";
            lblQA1Exposedperson.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblQA1Exposedperson];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA1Exposedperson attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKycX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA1Exposedperson attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKycY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA1Exposedperson attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKycWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA1Exposedperson attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKycHeight2 constant:0]];
            
            
            txtQA1Exposedperson=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtQA1Exposedperson.tag=9;
            txtQA1Exposedperson.delegate=self;
            txtQA1Exposedperson.placeholder=@"Relationship Involving Foreign Politically Exposed Person";
            txtQA1Exposedperson.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtQA1Exposedperson];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA1Exposedperson attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA1Exposedperson attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA1Exposedperson attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA1Exposedperson attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Height2 constant:0]];
            
  
            
            
            
            
        }
        else if(indexPath.section==6){
            
            
            
            CommonLabel *lblQA2NonResident=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblQA2NonResident.text=@"Non Resident Customer operating/residing in High-Risk Jurisdiction or other jurisdiction where funding is sourced frequently from high risk jurisdiction";
            lblQA2NonResident.numberOfLines = 2;
            lblQA2NonResident.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblQA2NonResident];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA2NonResident attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKycX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA2NonResident attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKycY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA2NonResident attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKycWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA2NonResident attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKycHeight2 constant:0]];
            
            
            
            
            txtQA2NonResident=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtQA2NonResident.tag=10;
            txtQA2NonResident.delegate=self;
            txtQA2NonResident.placeholder=@"Non Resident Customer operating/residing in High-Risk Jurisdiction or other jurisdiction where funding is sourced frequently from high risk jurisdiction";
            txtQA2NonResident.translatesAutoresizingMaskIntoConstraints=NO;
            
            [cell.contentView addSubview:txtQA2NonResident];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA2NonResident attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA2NonResident attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA2NonResident attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA2NonResident attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Height2 constant:0]];
            
          
       }
        else if(indexPath.section==7){
            
            CommonLabel *lblQA3Individuals=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblQA3Individuals.text=@"Individuals Linked with Iran,Syria,Sudan,Nigeria,Russia,CIS Countries  Whether UAE-Resident or Non-Resident";
            lblQA3Individuals.numberOfLines = 2;
            lblQA3Individuals.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblQA3Individuals];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA3Individuals attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKycX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA3Individuals attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKycY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA3Individuals attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKycWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA3Individuals attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKycHeight2 constant:0]];
            
            
            
            txtQA3Individuals = [[CommonTextField alloc] init];
            txtQA3Individuals.tag=11;
            txtQA3Individuals.delegate=self;
            txtQA3Individuals.placeholder=@"Individuals Linked with Iran,Syria,Sudan,Nigeria,Russia,CIS Countries  Whether UAE-Resident or Non-Resident";
            txtQA3Individuals.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtQA3Individuals];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA3Individuals attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA3Individuals attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA3Individuals attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA3Individuals attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Height2 constant:0]];
          
        }
      
        else if(indexPath.section==8){
            
            CommonLabel *lblQA4SelectCountries=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblQA4SelectCountries.text=@"Select The Countries";
            lblQA4SelectCountries.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblQA4SelectCountries];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA4SelectCountries attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKycX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA4SelectCountries attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKycY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA4SelectCountries attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKycWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA4SelectCountries attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKycHeight2 constant:0]];
            
            
            txtQA4SelectCountries=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtQA4SelectCountries.tag=12;
            txtQA4SelectCountries.delegate=self;
            txtQA4SelectCountries.placeholder=@"Select The Countries";
            txtQA4SelectCountries.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtQA4SelectCountries];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA4SelectCountries attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA4SelectCountries attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA4SelectCountries attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA4SelectCountries attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Height2 constant:0]];
            
       }
        
        else if(indexPath.section==9){
            
            CommonLabel *lblQA5CustHRBusiness=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblQA5CustHRBusiness.text=@"Customer Deals In High Risk Business";
            lblQA5CustHRBusiness.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblQA5CustHRBusiness];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA5CustHRBusiness attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKycX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA5CustHRBusiness attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKycY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA5CustHRBusiness attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKycWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA5CustHRBusiness attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKycHeight2 constant:0]];
            
            
            txtQA5CustHRBusiness = [[CommonTextField alloc] init];
            txtQA5CustHRBusiness.tag=13;
            txtQA5CustHRBusiness.delegate=self;
            txtQA5CustHRBusiness.placeholder=@"Customer Deals In High Risk Business";
            txtQA5CustHRBusiness.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtQA5CustHRBusiness];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA5CustHRBusiness attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA5CustHRBusiness attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA5CustHRBusiness attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA5CustHRBusiness attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Height2 constant:0]];

            
            
            
            
            
      }
        else if(indexPath.section==10){
            
            CommonLabel *lblQA6HoldMailCustomer=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblQA6HoldMailCustomer.text=@"Hold Mail Customer  ";
            lblQA6HoldMailCustomer.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblQA6HoldMailCustomer];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA6HoldMailCustomer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKycX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA6HoldMailCustomer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKycY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA6HoldMailCustomer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKycWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA6HoldMailCustomer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKycHeight2 constant:0]];
            
            
            txtQA6HoldMailCustomer = [[CommonTextField alloc] init];
            txtQA6HoldMailCustomer.tag=14;
            txtQA6HoldMailCustomer.delegate=self;
            txtQA6HoldMailCustomer.placeholder=@"Hold Mail Customer";
            txtQA6HoldMailCustomer.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtQA6HoldMailCustomer];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA6HoldMailCustomer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA6HoldMailCustomer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA6HoldMailCustomer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA6HoldMailCustomer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Height2 constant:0]];


        }
        
        else if(indexPath.section==11){
            
            CommonLabel *lblQA7ReputationAspects =[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblQA7ReputationAspects.text=@"Other AML/Reputational Aspets That May Pose Risk To The Bank";
            lblQA7ReputationAspects.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblQA7ReputationAspects];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA7ReputationAspects attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintKycX2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA7ReputationAspects attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintKycY2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA7ReputationAspects attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintKycWidth2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblQA7ReputationAspects attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintKycHeight2 constant:0]];
            
            
            txtQA7ReputationAspects = [[CommonTextField alloc] init];
            txtQA7ReputationAspects.tag=15;
            txtQA7ReputationAspects.delegate=self;
            txtQA7ReputationAspects.placeholder=@"Other AML/Reputational Aspets That May Pose Risk To The Bank";
            txtQA7ReputationAspects.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtQA7ReputationAspects];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA7ReputationAspects attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintKyc2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA7ReputationAspects attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintKyc2Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA7ReputationAspects attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintKyc2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtQA7ReputationAspects attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintKyc2Height2 constant:0]];
            
            
        }

        
        
    }
    else{
        
        
        
        [cell.contentView viewWithTag:100+indexPath.section];
        [cell.contentView viewWithTag:indexPath.section];
        
        [cell.contentView viewWithTag:500+indexPath.section];
        [cell.contentView viewWithTag:600+indexPath.section];
        
    }
    

    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    if(([actionMode isEqualToString:@"UPDATE"] || [actionMode isEqualToString:@"ENQUIRY"]) && [kycArray count]>0)
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
//        //onBoardData = [onBoardArray objectAtIndex:indexPath.section];
//        //popoverData =[popoverArray objectAtIndex:indexPath.section];
//        
//         kycData = [kycArray objectAtIndex:0];
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
   
        if([CommonUtils checkEmptyString:txtCustomerName.text]==YES)
        {
            [CommonUtils showMessage:@"Customer Name can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtUAEResident.text]==YES)
        {
            [CommonUtils showMessage:@"UAE Resident can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
    
        if([CommonUtils checkEmptyString:txtKYCType.text]==YES)
        {
            [CommonUtils showMessage:@"KYC Type can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtCISNoforexistingrelationship.text]==YES)
        {
            [CommonUtils showMessage:@"CIS Number can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtPoaGiven.text]==YES)
        {
            [CommonUtils showMessage:@"POA Given can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    
        if([CommonUtils checkEmptyString:txtKYCPreparedon.text]==YES)
        {
            [CommonUtils showMessage:@"KYC Prepared On can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtNextKYcRiviewDate.text]==YES)
        {
            [CommonUtils showMessage:@"Next KYC Review Date can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    
    
    
    
        if([CommonUtils checkEmptyString:txtQA1Exposedperson.text]==YES)
        {
            [CommonUtils showMessage:@"Relationship Involving Foregin Politically Exposed Person can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtQA2NonResident.text]==YES)
        {
            [CommonUtils showMessage:@"Non Resident Customer can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtQA3Individuals.text]==YES)
        {
            [CommonUtils showMessage:@"Individuals Linked With Iran,.......Can't be Blanked":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        
        if([CommonUtils checkEmptyString:txtQA4SelectCountries.text]==YES)
        {
            [CommonUtils showMessage:@"Select The Countries Can't be Blanked":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    
        if([CommonUtils checkEmptyString:txtQA5CustHRBusiness.text]==YES)
        {
            [CommonUtils showMessage:@"Customer Deals In High Risk Business Can't be Blanked":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }

    
        if([CommonUtils checkEmptyString:txtQA6HoldMailCustomer.text]==YES)
        {
            [CommonUtils showMessage:@"Hold Mail Customer Can't be Blanked":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtQA7ReputationAspects.text]==YES)
        {
            [CommonUtils showMessage:@"Other AML/Reputational.......Can't be Blanked":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }

    
    //actionMode=@"INSERT";
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    [self buildJSON];
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}
- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    NSData *newData;
    
    
    //actionMode=@"NEW";
    //refNo=@"SA21OCT2015156";
    
    
    NSLog(@"action mode in KYC %@",actionMode);

    
    @try{
        
        
        //            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //            {
        //                jsonDictionary= @{@"refNo":self.refNo};
        //            }
        //            else
        //            {
        
        
        NSLog(@"RefNo %@",self.refNo);
        
        
        
        //-------
        
        jsonDictionary= @{
                          @"refNo":emptyStringIfNil(self.refNo),
                          @"customerName":emptyStringIfNil(self.txtCustomerName.text),
                          @"uAEResident":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtUAEResident.tag]]),
                          @"kYCType":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtKYCType.tag]]),
                          @"cisNoForExistingCustomer":emptyStringIfNil(self.txtCISNoforexistingrelationship.text),
                          @"pOAGiven":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtPoaGiven.tag]]),
                          @"kYCPreparedOn":emptyStringIfNil(self.txtKYCPreparedon.text),
                          @"nextKYCReviewDate":emptyStringIfNil(self.txtNextKYcRiviewDate.text),
                          @"kYCComments":emptyStringIfNil(self.txtKYcComments.text),
                          @"qA1ExposedPerson":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtQA1Exposedperson.tag]]),
                          @"qA2NonResident":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtQA2NonResident.tag]]),
                          @"qA3Individuals":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtQA3Individuals.tag]]),
                          @"qA4SelectCountries":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtQA4SelectCountries.tag]]),
                          @"qA5CustHRBusiness":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtQA5CustHRBusiness.tag]]),
                          @"qA6HoldMailCustomer":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtQA6HoldMailCustomer.tag]]),
                          @"qA7ReputationalAspects":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtQA7ReputationAspects.tag]]),
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
        NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
        
        //            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //            {
        //
        //                newData=[CommonUtils connectHost :@"fetchPersonalDetails" :jsonDictionary:self];
        //                [self parseResponse:newData:@"fetchPersonalDetails":@"personalDetailsWrapper"];
        //
        //            }
        if([actionMode isEqualToString:@"NEW"])// && [viewMode isEqualToString:@"N"])
        {
        
            newData=[CommonUtils connectHost :@"insertKycDetails" :jsonDictionary:self];
            [self parseResponse:newData:@"insertKycDetails":@"kycDetailsWrapper"];
            //viewMode=@"N";
        }
        if([actionMode isEqualToString:@"UPDATE"])// && [viewMode isEqualToString:@"N"])
        {
            
            newData=[CommonUtils connectHost :@"updateKycDetails" :jsonDictionary:self];
            [self parseResponse:newData:@"updateKycDetails":@"kycDetailsWrapper"];
            //viewMode=@"Y";
        }
        
        self.refNo=kycData.refNo;
        
        NSLog(@"RefNo %@",self.refNo);
        
        //NSLog(@"ViewMode %@",self.viewMode);
        
        //---invoke next screen---
        //if([viewMode isEqualToString:@"N"])
        //{
        NSLog(@"To invoke next screen");
        
        //                   if([actionMode isEqualToString:@"NEW"])
        //                   {
        //                       viewMode=@"N";
        //                   }
        //                   if([actionMode isEqualToString:@"UPDATE"])
        //                   {
        //                       viewMode=@"Y";
        //                   }
        
     
        
        
        KYC2ViewController *kyc2ViewController = [[KYC2ViewController alloc]initWithNibName:nil bundle:nil];
        //kyc2ViewController.userid=self.userid;
        //kyc2ViewController.sessionid=self.sessionid;
        kyc2ViewController.actionMode=self.actionMode;
        //identificationViewController.viewMode=self.viewMode;
        kyc2ViewController.refNo=self.refNo;
        kyc2ViewController.existingCustomerFlag=self.existingCustomerFlag;
        kyc2ViewController.recordStatus=self.recordStatus;
        kyc2ViewController.menuName=self.menuName;
        
        
        [self.navigationController pushViewController:kyc2ViewController animated:YES];
        
        //}
        
        
        
        //----------
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSON code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in buildJSON Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}



- (void) viewData {
    
    @try{
        
        
            //refNo=@"SA21OCT2015156";
            
            [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
            
            //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
            //{
            NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
            //}
            
            //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
            //{
            
            NSData *newData=[CommonUtils connectHost :@"fetchKycDetails" :jsonDictionary:self];
            [self parseResponse:newData:@"fetchKycDetails":@"kycDetailsWrapper"];
        
        

            
            //}
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in KYC viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in KYC viewData Code");
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


-(void) loadData {
    
    
    @try{
        
        kycData = [kycArray objectAtIndex:0];
        
        
        txtCustomerName.text=emptyStringIfNil(kycData.customerName);
        txtUAEResident.text=emptyStringIfNil(kycData.uAEResidentValue);
        txtKYCType.text=emptyStringIfNil(kycData.kYCTypeValue);
        txtCISNoforexistingrelationship.text=emptyStringIfNil(kycData.cisNoForExistingCustomer);
        txtPoaGiven.text=emptyStringIfNil(kycData.pOAGivenValue);
        txtKYCPreparedon.text=emptyStringIfNil(kycData.kYCPreparedOn);
        txtNextKYcRiviewDate.text=emptyStringIfNil(kycData.nextKYCReviewDate);
        txtKYcComments.text=emptyStringIfNil(kycData.kYCComments);
        txtQA1Exposedperson.text=emptyStringIfNil(kycData.qA1ExposedPersonValue);
        txtQA2NonResident.text=emptyStringIfNil(kycData.qA2NonResidentValue);
        txtQA3Individuals.text=emptyStringIfNil(kycData.qA3IndividualsValue);
        txtQA4SelectCountries.text=emptyStringIfNil(kycData.qA4SelectCountriesValue);
        txtQA5CustHRBusiness.text=emptyStringIfNil(kycData.qA5CustHRBusinessValue);
        txtQA6HoldMailCustomer.text=emptyStringIfNil(kycData.qA6HoldMailCustomerValue);
        txtQA7ReputationAspects.text=emptyStringIfNil(kycData.qA7ReputationalAspectsValue);
        
        
        
        
        
        [popoverCodeValue setObject:emptyStringIfNil(self.kycData.uAEResident) forKey:[NSString stringWithFormat:@"%d", self.txtUAEResident.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.kycData.kYCType) forKey:[NSString stringWithFormat:@"%d", self.txtKYCType.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.kycData.pOAGiven) forKey:[NSString stringWithFormat:@"%d", self.txtPoaGiven.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.kycData.qA1ExposedPerson) forKey:[NSString stringWithFormat:@"%d", self.txtQA1Exposedperson.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.kycData.qA2NonResident) forKey:[NSString stringWithFormat:@"%d", self.txtQA2NonResident.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.kycData.qA3Individuals) forKey:[NSString stringWithFormat:@"%d", self.txtQA3Individuals.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.kycData.qA4SelectCountries) forKey:[NSString stringWithFormat:@"%d", self.txtQA4SelectCountries.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.kycData.qA5CustHRBusiness) forKey:[NSString stringWithFormat:@"%d", self.txtQA5CustHRBusiness.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.kycData.qA6HoldMailCustomer) forKey:[NSString stringWithFormat:@"%d", self.txtQA6HoldMailCustomer.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.kycData.qA7ReputationalAspects) forKey:[NSString stringWithFormat:@"%d", self.txtQA7ReputationAspects.tag]];
        
        
        
        
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


- (void) parseResponse:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
       // NSLog(@"get customer info enterest %@",userid);
        
        
        
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
                kycArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    kycData = [[KycData alloc] initWithJSONDictionary:dict];
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    // Add the Location object to the array
                    [kycArray addObject:kycData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)kycArray.count);
                
                
                
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

//
//  CreditCard2ViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 13/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CreditCard2ViewController.h"
#import "CreditCardData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "PopoverData.h"
#import "CreditCard3ViewController.h"
#import "QueueViewController.h"




@interface CreditCard2ViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblConstraintX2Cre2=0.52f;
CGFloat lblConstraintY2Cre2=1.0f;
CGFloat lblConstraintWidth2Cre2=0.5f;
CGFloat lblConstraintHeight2Cre2=0.8f;

CGFloat ConstraintX2Cre2=1.19f;
CGFloat ConstraintY2Cre2=1.0f;
CGFloat ConstraintWidth2Cre2=0.80f;
CGFloat ConstraintHeight2Cre2=0.8f;

CGFloat constraint1X2Cre2=0.69f;
CGFloat constraint1Y2Cre2=1.0f;
CGFloat constraint1Width2Cre2=0.3f;
CGFloat constraint1Height2Cre2=0.8f;

CGFloat lblConstraint2X2Cre2=1.52f;
CGFloat lblConstraint2Y2Cre2=1.0f;
CGFloat lblConstraint2Width2Cre2=0.5f;
CGFloat lblConstraint2Height2Cre2=0.8f;

CGFloat Constraint2X2Cre2=1.69f;
CGFloat Constraint2Y2Cre2=1.0f;
CGFloat Constraint2Width2Cre2=0.3f;
CGFloat Constraint2Height2Cre2=0.8f;




@implementation CreditCard2ViewController




//@synthesize userid;
//@synthesize sessionid;
@synthesize actionMode;
//@synthesize viewMode;

@synthesize menuName;
@synthesize dataDictionary;


@synthesize refNo;


@synthesize creditCardArray;
@synthesize creditCardData;

@synthesize dateToolBar;
@synthesize datePicker;



@synthesize dataArray;

@synthesize webView;


@synthesize timerView;
//@synthesize switchFlag;

int hours, minutes, seconds,secondsLeft;

@synthesize popoverCodeValue;


@synthesize txtProduct;
@synthesize txtNameOfBank;
@synthesize txtAccountCCNo;
@synthesize txtCreditLmtMonthPayments;
@synthesize txtCreditShield;
@synthesize txtAccidentCare;
@synthesize txtOsaName1;
@synthesize txtOsaTelephone;
@synthesize txtOsaName2;
@synthesize txtOsaGSM;
@synthesize txtOsaName3;
@synthesize txtOsaAlShamil;
@synthesize txtWaselName;
@synthesize txtWaselAccountNumber;
@synthesize txtWaselAmount;
@synthesize txtWaselWeeklyDay;
@synthesize txtWaselMonthlyAmount;
@synthesize txtWaselMonthlyDate;
@synthesize txtRenewalOption;

@synthesize recordStatus;
@synthesize accountType;
@synthesize existingCustomerFlag;
@synthesize existingRefNo;
//@synthesize pathArray;
//@synthesize pathData;

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
    
//     self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"Credit Card Details"];
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
    
    //[self viewPathStatus];
    
    [self displayGraph];
    
    
    
    
    
    
    //--when not new
    if([actionMode isEqualToString:@"UPDATE"] ||[actionMode isEqualToString:@"ENQUIRY"] || ([actionMode isEqualToString:@"NEW"] && [existingCustomerFlag isEqualToString:@"Y"] && [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"]))// && [viewMode isEqualToString:@"Y"] )
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
    
    //--Delivery Option
    if (textField.tag == 2 ) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
        // Tel No
    if (textField.tag == 3 || textField.tag == 4 || textField.tag == 8 || textField.tag == 10 || textField.tag == 14 || textField.tag == 15 || textField.tag == 16 || textField.tag == 17) {
        
        
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
    
    
    //--Name
    if (textField.tag == 11) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    // Alshamil
    if (textField.tag == 12) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Name
    if (textField.tag == 13) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Renewal option
    if (textField.tag == 19) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 10;
        
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
    
    
    //Product
    if(textField.tag==1)
    {
        [self popoverData:textField:@"CardType"];
        return NO; //to disable keyboard
    }
    //Bank Name
    else if(textField.tag==2)
    {
        [self popoverData:textField:@"NameOfBank"];
        return NO; //to disable keyboard
    }
    //txtCreditShield
    else if(textField.tag==5)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //txtAccidentCare
    else if(textField.tag==6)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //txtAccidentCare
    else if(textField.tag==6)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    
    //Week
    else if(textField.tag==16)
    {
        [self popoverData:textField:@"Week"];
        return NO; //to disable keyboard
    }

    //--date of birth
    if(textField.tag==18)
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
    
    
    return 10;//[componentsArray count];
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
        
        return @" Relationship With Other Financial Institutions";
        
    }
    if (section == 3) {
        
        
        return @" Bill Payment For Outstanding Amount";
    }
    if (section == 6) {
        
        
        return @" Wasel Recharge / Renewal";
    }
//    if (section == 5) {
//        
//        
//        return @" Supplementary Card(s) Details)";
//    }
//    if (section == 7) {
//        
//        
//        return @" Mashreq Account Details";
//    }
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
            
            CommonLabel *lblProduct=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblProduct.text=@"Product";
            lblProduct.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblProduct];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblProduct attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblProduct attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblProduct attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblProduct attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre2 constant:0]];
            
            
            txtProduct=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtProduct.tag=1;
            txtProduct.delegate=self;
            txtProduct.placeholder=@"Product";
            txtProduct.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtProduct];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtProduct attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtProduct attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtProduct attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtProduct attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre2 constant:0]];
            
            
            CommonLabel *lblNameOfBank=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNameOfBank.text=@"Name Of Bank";
            lblNameOfBank.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNameOfBank];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameOfBank attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameOfBank attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameOfBank attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameOfBank attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre2 constant:0]];
            
            
            txtNameOfBank = [[CommonTextField alloc] init];
            txtNameOfBank.tag=2;
            txtNameOfBank.delegate=self;
            txtNameOfBank.placeholder=@"Name Of Bank";
            txtNameOfBank.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNameOfBank];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameOfBank attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameOfBank attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameOfBank attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameOfBank attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre2 constant:0]];
            
            
            
            
        }
        else if(indexPath.section==1)
        {
            
            CommonLabel *lblAccountCCNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAccountCCNo.text=@"Credit Card No";
            lblAccountCCNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAccountCCNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountCCNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountCCNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountCCNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountCCNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre2 constant:0]];
            
            
            txtAccountCCNo = [[CommonTextField alloc] init];
            txtAccountCCNo.tag=3;
            txtAccountCCNo.delegate=self;
            txtAccountCCNo.placeholder=@"Credit Card No";
            txtAccountCCNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAccountCCNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountCCNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountCCNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountCCNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountCCNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre2 constant:0]];
            
            CommonLabel *lblPerRefHomeCountryTelephone=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPerRefHomeCountryTelephone.text=@"Credit Limit Monthly Payment";
            lblPerRefHomeCountryTelephone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPerRefHomeCountryTelephone];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefHomeCountryTelephone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefHomeCountryTelephone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefHomeCountryTelephone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPerRefHomeCountryTelephone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre2 constant:0]];
            
            
            txtCreditLmtMonthPayments=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtCreditLmtMonthPayments.tag=4;
            txtCreditLmtMonthPayments.delegate=self;
            txtCreditLmtMonthPayments.placeholder=@"Credit Limit Monthly Payment";
            txtCreditLmtMonthPayments.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCreditLmtMonthPayments];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditLmtMonthPayments attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditLmtMonthPayments attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditLmtMonthPayments attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditLmtMonthPayments attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre2 constant:0]];
            
        }
        else if(indexPath.section==2){
            
            CommonLabel *lblCreditShield=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCreditShield.text=@"Credit Shield";
            lblCreditShield.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCreditShield];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCreditShield attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCreditShield attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCreditShield attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCreditShield attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre2 constant:0]];
            
            
            txtCreditShield=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtCreditShield.tag=5;
            txtCreditShield.delegate=self;
            txtCreditShield.placeholder=@"Credit Shield";
            txtCreditShield.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCreditShield];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditShield attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditShield attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditShield attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditShield attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre2 constant:0]];
            
            CommonLabel *lblAccidentCare=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAccidentCare.text=@"Accident Care";
            lblAccidentCare.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAccidentCare];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccidentCare attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccidentCare attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccidentCare attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccidentCare attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre2 constant:0]];
            
            
            txtAccidentCare=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtAccidentCare.tag=6;
            txtAccidentCare.delegate=self;
            txtAccidentCare.placeholder=@"Accident Care";
            txtAccidentCare.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAccidentCare];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccidentCare attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccidentCare attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccidentCare attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccidentCare attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre2 constant:0]];
            
            
        }
        else if(indexPath.section==3){
            
            CommonLabel *lblOsaName1=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOsaName1.text=@"Name";
            lblOsaName1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOsaName1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaName1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaName1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaName1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaName1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre2 constant:0]];
            
            
            txtOsaName1=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtOsaName1.tag=7;
            txtOsaName1.delegate=self;
            txtOsaName1.placeholder=@"Name";
            txtOsaName1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOsaName1];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaName1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaName1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaName1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaName1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre2 constant:0]];
            
            
            
            CommonLabel *lblOsaTelephone=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOsaTelephone.text=@"Telephone";
            lblOsaTelephone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOsaTelephone];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaTelephone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaTelephone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaTelephone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaTelephone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre2 constant:0]];
            
            
            txtOsaTelephone = [[CommonTextField alloc] init];
            txtOsaTelephone.tag=8;
            txtOsaTelephone.delegate=self;
            txtOsaTelephone.placeholder=@"Telephone";
            txtOsaTelephone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOsaTelephone];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaTelephone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaTelephone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaTelephone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaTelephone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre2 constant:0]];
            
            
        }
        
        
        else if(indexPath.section==4){
            CommonLabel *lblOsaName2=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOsaName2.text=@"Name";
            lblOsaName2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOsaName2];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaName2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaName2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaName2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaName2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre2 constant:0]];
            
            
            txtOsaName2=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtOsaName2.tag=9;
            txtOsaName2.delegate=self;
            txtOsaName2.placeholder=@"Name";
            txtOsaName2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOsaName2];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaName2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaName2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaName2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaName2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre2 constant:0]];
            
            CommonLabel *lblOsaGSM=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOsaGSM.text=@"Etisalat";
            lblOsaGSM.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOsaGSM];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaGSM attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaGSM attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaGSM attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaGSM attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre2 constant:0]];
            
            
            txtOsaGSM = [[CommonTextField alloc] init];
            txtOsaGSM.tag=10;
            txtOsaGSM.delegate=self;
            txtOsaGSM.placeholder=@"Etisalat";
            txtOsaGSM.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOsaGSM];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaGSM attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaGSM attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaGSM attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaGSM attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre2 constant:0]];
            
            
            
            
            
            
        }
        else if(indexPath.section==5){
            
            
            
            CommonLabel *lblOsaName3=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOsaName3.text=@"Name";
            lblOsaName3.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOsaName3];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaName3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaName3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaName3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaName3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre2 constant:0]];
            
            
            
            
            txtOsaName3=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtOsaName3.tag=11;
            txtOsaName3.delegate=self;
            txtOsaName3.placeholder=@"Name";
            txtOsaName3.translatesAutoresizingMaskIntoConstraints=NO;
            
            [cell.contentView addSubview:txtOsaName3];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaName3 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaName3 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaName3 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaName3 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre2 constant:0]];
            
            
            CommonLabel *lblOsaAlShamil=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOsaAlShamil.text=@"Du";
            lblOsaAlShamil.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOsaAlShamil];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaAlShamil attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaAlShamil attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaAlShamil attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOsaAlShamil attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre2 constant:0]];
            
            
            
            txtOsaAlShamil=[[CommonTextField alloc] init];
            txtOsaAlShamil.tag=12;
            txtOsaAlShamil.delegate=self;
            txtOsaAlShamil.placeholder=@"Du";
            txtOsaAlShamil.translatesAutoresizingMaskIntoConstraints=NO;
            
            [cell.contentView addSubview:txtOsaAlShamil];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaAlShamil attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaAlShamil attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaAlShamil attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOsaAlShamil attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre2 constant:0]];
            
            
        }
        else if(indexPath.section==6){
            
            CommonLabel *lblWaselName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblWaselName.text=@"Name";
            lblWaselName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblWaselName];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre2 constant:0]];
            
            
            
            txtWaselName = [[CommonTextField alloc] init];
            txtWaselName.tag=13;
            txtWaselName.delegate=self;
            txtWaselName.placeholder=@"Name";
            txtWaselName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtWaselName];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre2 constant:0]];
            
            
            CommonLabel *lblWaselAccountNumber=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblWaselAccountNumber.text=@"Account No";
            lblWaselAccountNumber.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblWaselAccountNumber];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselAccountNumber attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselAccountNumber attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselAccountNumber attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselAccountNumber attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre2 constant:0]];
            
            txtWaselAccountNumber=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtWaselAccountNumber.tag=14;
            txtWaselAccountNumber.delegate=self;
            txtWaselAccountNumber.placeholder=@"Account No";
            txtWaselAccountNumber.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtWaselAccountNumber];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselAccountNumber attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselAccountNumber attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselAccountNumber attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselAccountNumber attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre2 constant:0]];
            
            
            
            
            
            
        }
        
        else if(indexPath.section==7){
            
            CommonLabel *lblWaselAmount=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblWaselAmount.text=@"Amount";
            lblWaselAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblWaselAmount];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre2 constant:0]];
            
            
            txtWaselAmount=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtWaselAmount.tag=15;
            txtWaselAmount.delegate=self;
            txtWaselAmount.placeholder=@"Amount";
            txtWaselAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtWaselAmount];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre2 constant:0]];
            
            
            
            CommonLabel *lblWaselWeeklyDay=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblWaselWeeklyDay.text=@"Rchg Weekly Day";
            lblWaselWeeklyDay.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblWaselWeeklyDay];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselWeeklyDay attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselWeeklyDay attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselWeeklyDay attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselWeeklyDay attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre2 constant:0]];
            
            
            
            txtWaselWeeklyDay=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtWaselWeeklyDay.tag=16;
            txtWaselWeeklyDay.delegate=self;
            txtWaselWeeklyDay.placeholder=@"Rchg Weekly Day";
            txtWaselWeeklyDay.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtWaselWeeklyDay];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselWeeklyDay attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselWeeklyDay attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselWeeklyDay attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselWeeklyDay attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre2 constant:0]];
            
            
            
            
            
        }
        
        else if(indexPath.section==8){
            
            CommonLabel *lblWaselMonthlyAmount=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblWaselMonthlyAmount.text=@"Rchg Monthly Amount";
            lblWaselMonthlyAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblWaselMonthlyAmount];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselMonthlyAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselMonthlyAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselMonthlyAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselMonthlyAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre2 constant:0]];
            
            
            txtWaselMonthlyAmount = [[CommonTextField alloc] init];
            txtWaselMonthlyAmount.tag=17;
            txtWaselMonthlyAmount.delegate=self;
            txtWaselMonthlyAmount.placeholder=@"Rchg Monthly Amount";
            txtWaselMonthlyAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtWaselMonthlyAmount];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselMonthlyAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselMonthlyAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselMonthlyAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselMonthlyAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre2 constant:0]];
            
            CommonLabel *lblWaselMonthlyDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblWaselMonthlyDate.text=@"Rchg Monthly Date";
            lblWaselMonthlyDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblWaselMonthlyDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselMonthlyDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselMonthlyDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraint2Y2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselMonthlyDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblWaselMonthlyDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraint2Height2Cre2 constant:0]];
            
            
            
            txtWaselMonthlyDate=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtWaselMonthlyDate.tag=18;
            txtWaselMonthlyDate.delegate=self;
            txtWaselMonthlyDate.placeholder=@"Rchg Monthly Date";
            txtWaselMonthlyDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtWaselMonthlyDate];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselMonthlyDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:Constraint2X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselMonthlyDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:Constraint2Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselMonthlyDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:Constraint2Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtWaselMonthlyDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:Constraint2Height2Cre2 constant:0]];
            

            
        }
        
        else if(indexPath.section==9){
            
            CommonLabel *lblRenewalOption=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblRenewalOption.text=@"Renewal Option";
            lblRenewalOption.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblRenewalOption];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRenewalOption attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintX2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRenewalOption attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintY2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRenewalOption attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintWidth2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRenewalOption attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintHeight2Cre2 constant:0]];
            
            
            txtRenewalOption = [[CommonTextField alloc] init];
            txtRenewalOption.tag=19;
            txtRenewalOption.delegate=self;
            txtRenewalOption.placeholder=@"Renewal Option";
            txtRenewalOption.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtRenewalOption];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRenewalOption attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint1X2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRenewalOption attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint1Y2Cre2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRenewalOption attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint1Width2Cre2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRenewalOption attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint1Height2Cre2 constant:0]];
            
            
            
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
    
    if([CommonUtils checkEmptyString:txtProduct.text]==YES)
    {
        
        [CommonUtils showMessage:@"Product can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtNameOfBank.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name Of Bank can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtAccountCCNo.text]==YES)
    {
        
        [CommonUtils showMessage:@"Account Credit Card No can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtCreditLmtMonthPayments.text]==YES)
    {
        
        [CommonUtils showMessage:@"Credit Limit Monthly Payments can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtCreditShield.text]==YES)
    {
        
        [CommonUtils showMessage:@"I Want To Apply For Credit Shield can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtAccidentCare.text]==YES)
    {
        
        [CommonUtils showMessage:@"I Want To Apply For Accident Care can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtOsaName1.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtOsaTelephone.text]==YES)
    {
        
        [CommonUtils showMessage:@"Telephone can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtOsaName2.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtOsaGSM.text]==YES)
    {
        
        [CommonUtils showMessage:@"GSM can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtOsaName3.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtOsaAlShamil.text]==YES)
    {
        
        [CommonUtils showMessage:@"Alshamil can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtWaselName.text]==YES)
    {
        
        [CommonUtils showMessage:@"Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtWaselAccountNumber.text]==YES)
    {
        
        [CommonUtils showMessage:@"Account Number can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtWaselAmount.text]==YES)
    {
        
        [CommonUtils showMessage:@"Amount can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtWaselWeeklyDay.text]==YES)
    {
        
        [CommonUtils showMessage:@"Recharge Weekly Day can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtWaselMonthlyAmount.text]==YES)
    {
        
        [CommonUtils showMessage:@"Recharge Monthly Amount can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtWaselMonthlyDate.text]==YES)
    {
        
        [CommonUtils showMessage:@"Recharge Monthly Date can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtRenewalOption.text]==YES)
    {
        
        [CommonUtils showMessage:@"Renewal Option can't be blank":self];
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
        NSLog(@"CreditCard2 RefNo is %@",self.refNo);
        
        //-------
        
        jsonDictionary= @{
                          @"refNo":emptyStringIfNil(self.refNo),
                          @"product":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtProduct.tag]]),
                          @"nameOfBank":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtNameOfBank.tag]]),
                          @"accountCCNo":emptyStringIfNil(self.txtAccountCCNo.text),
                          @"creditLmtMonthPayments":emptyStringIfNil(self.txtCreditLmtMonthPayments.text),
                          @"creditShield":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCreditShield.tag]]),
                          @"accidentCare":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtAccidentCare.tag]]),
                          @"osaName1":emptyStringIfNil(self.txtOsaName1.text),
                          @"osaTelephone":emptyStringIfNil(self.txtOsaTelephone.text),
                          @"osaName2":emptyStringIfNil(self.txtOsaName2.text),
                          @"osaGSM":emptyStringIfNil(self.txtOsaGSM.text),
                          @"osaName3":emptyStringIfNil(self.txtOsaName3.text),
                          @"osaAlShamil":emptyStringIfNil(self.txtOsaAlShamil.text),
                          @"waselName":emptyStringIfNil(self.txtWaselName.text ),
                          @"waselAccountNumber":emptyStringIfNil(self.txtWaselAccountNumber.text),
                          @"waselAmount":emptyStringIfNil(self.txtWaselAmount.text),
                          @"waselWeeklyDay":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtWaselWeeklyDay.tag]]),
                          @"waselMonthlyAmount":emptyStringIfNil(self.txtWaselMonthlyAmount.text),
                          @"waselMonthlyDate":emptyStringIfNil(self.txtWaselMonthlyDate.text),
                          @"renewalOption":emptyStringIfNil(self.txtRenewalOption.text),
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
        
            newData=[CommonUtils connectHost :@"updateCreditCard2" :jsonDictionary :self];
            [self parseResponse:newData:@"updateCreditCard2":@"creditCardWrapper"];
            
            
        
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
        //        ProductViewController *productViewController = [[ProductViewController alloc]initWithNibName:nil bundle:nil];
      
        CreditCard3ViewController *creditCard3ViewController = [[CreditCard3ViewController alloc]initWithNibName:nil bundle:nil];
       
        creditCard3ViewController.actionMode=self.actionMode;
        creditCard3ViewController.recordStatus=self.recordStatus;
        //productViewController.viewMode=self.viewMode;
        creditCard3ViewController.refNo=self.refNo;
        creditCard3ViewController.existingCustomerFlag=self.existingCustomerFlag;
        creditCard3ViewController.accountType=self.accountType;
        creditCard3ViewController.menuName=self.menuName;
        
        [self.navigationController pushViewController:creditCard3ViewController animated:YES];
        
        
        
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
        
        NSData *newData=[CommonUtils connectHost :@"fetchCreditCard2" :jsonDictionary :self];
        [self parseResponse:newData:@"fetchCreditCard2":@"creditCardWrapper"];
        
        
        
        //}
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Creditcard2 viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in  Creditcard2 viewData Code");
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
//
//

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
        
        txtProduct.text=emptyStringIfNil(creditCardData.productValue);
        txtNameOfBank.text=emptyStringIfNil(creditCardData.nameOfBankValue);
        txtAccountCCNo.text=emptyStringIfNil(creditCardData.accountCCNo);
        txtCreditLmtMonthPayments.text=emptyStringIfNil(creditCardData.creditLmtMonthPayments);
        txtCreditShield.text=emptyStringIfNil(creditCardData.creditShieldValue);
        txtAccidentCare.text=emptyStringIfNil(creditCardData.accidentCareValue);
        txtOsaName1.text=emptyStringIfNil(creditCardData.osaName1);
        txtOsaTelephone.text=emptyStringIfNil(creditCardData.osaTelephone);
        txtOsaName2.text=emptyStringIfNil(creditCardData.osaName2);
        txtOsaGSM.text=emptyStringIfNil(creditCardData.osaGSM);
        txtOsaName3.text=emptyStringIfNil(creditCardData.osaName3);
        txtOsaAlShamil.text=emptyStringIfNil(creditCardData.osaAlShamil);
        txtWaselName.text=emptyStringIfNil(creditCardData.waselName);
        txtWaselAccountNumber.text=emptyStringIfNil(creditCardData.waselAccountNumber);
        txtWaselAmount.text=emptyStringIfNil(creditCardData.waselAmount);
        txtWaselWeeklyDay.text=emptyStringIfNil(creditCardData.waselWeeklyDayValue);
        txtWaselMonthlyAmount.text=emptyStringIfNil(creditCardData.waselMonthlyAmount);
        txtWaselMonthlyDate.text=emptyStringIfNil(creditCardData.waselMonthlyDate);
        txtRenewalOption.text=emptyStringIfNil(creditCardData.renewalOption);
        
        
        
        [popoverCodeValue setObject:emptyStringIfNil(self.creditCardData.product) forKey:[NSString stringWithFormat:@"%d", self.txtProduct.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.creditCardData.nameOfBank) forKey:[NSString stringWithFormat:@"%d", self.txtNameOfBank.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.creditCardData.creditShield) forKey:[NSString stringWithFormat:@"%d", self.txtCreditShield.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.creditCardData.waselWeeklyDay) forKey:[NSString stringWithFormat:@"%d", self.txtWaselWeeklyDay.tag]];
        [popoverCodeValue setObject:emptyStringIfNil(self.creditCardData.accidentCare) forKey:[NSString stringWithFormat:@"%d", self.txtAccidentCare.tag]];
        
        
        
        
        
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
        
       // pathData = [pathArray objectAtIndex:0];
        
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



@end
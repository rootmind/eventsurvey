//
//  PersonalLoan2ViewController.m
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
#import "PersonalLoan2ViewController.h"
#import "PersonalLoanData.h"
#import "KYCViewController.h"
#import "QueueViewController.h"






@interface PersonalLoan2ViewController()

@end


#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblconstraint2PLX=0.52f;
CGFloat lblconstraint2PLY=1.0f;
CGFloat lblconstraint2PLWidth=0.5f;
CGFloat lblconstraint2PLHeight=0.8f;

CGFloat constraint2PLX=1.19f;
CGFloat constraint2PLY=1.0f;
CGFloat constraint2PLWidth=0.80f;
CGFloat constraint2PLHeight=0.8f;

//CGFloat constraint2PL1X=0.69f;
//CGFloat constraint2PL1Y=1.0f;
//CGFloat constraint2PL1Width=0.3f;
//CGFloat constraint2PL1Height=0.8f;

CGFloat constraint2PL1X2=0.69f;
CGFloat constraint2PL1Y2=1.0f;
CGFloat constraint2PL1Width2=0.3f;
CGFloat constraint2PL1Height2=0.8f;

CGFloat lblconstraint2PL2X=1.52f;
CGFloat lblconstraint2PL2Y=1.0f;
CGFloat lblconstraint2PL2Width=0.5f;
CGFloat lblconstraint2PL2Height=0.8f;

//CGFloat constraint2PL2X=1.69f;
//CGFloat constraint2PL2Y=1.0f;
//CGFloat constraint2PL2Width=0.3f;
//CGFloat constraint2PL2Height=0.8f;

CGFloat constraint2PL2X2=1.69f;
CGFloat constraint2PL2Y2=1.0f;
CGFloat constraint2PL2Width2=0.3f;
CGFloat constraint2PL2Height2=0.8f;


@implementation PersonalLoan2ViewController


//@synthesize userid;
//@synthesize sessionid;
@synthesize actionMode;
@synthesize menuName;

@synthesize dataDictionary;

@synthesize  popoverCodeValue;







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
@synthesize existingCustomerFlag;
@synthesize existingRefNo;

@synthesize txtTotalFinance;
@synthesize txtInterestRate;
@synthesize txtTenor;
@synthesize txtInstallmentAmount;
@synthesize txtStartingDate;
@synthesize txtLastInstallmentAmount;
@synthesize txtNoOfInstallments;
@synthesize txtProcessingFee;
@synthesize txtInsuranceAmount;
@synthesize txtSettlementOwnResoures;
@synthesize txtSettlementRepeatLoan;
@synthesize txtSettlementOtherBank;
@synthesize txtOtherFees;



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
    //--Total Finance
    if (textField.tag == 1|| textField.tag==2|| textField.tag==4 || textField.tag==6 || textField.tag==8 || textField.tag==9 || textField.tag==13) {
        
        
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
    //--Tenor
    if (textField.tag == 3) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }     //-- Starting Date
    if (textField.tag == 5) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 10;
        
    }
    
    //-- Number Of Installments
    if (textField.tag == 7) {
        
        
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
    //-- Settlement From Own Resources
    if (textField.tag == 10) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    //-- Settlement From repeat Loan
    if (textField.tag == 11) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    //-- Settlement From Other Bank
    if (textField.tag == 12) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    
    return YES;
    
}


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"] || [actionMode isEqualToString:@"ENQUIRY"])
    {
        return NO;
    }
    

    else if(textField.tag==5)
    {
        [self popoverDate:textField :@"LT":NULL];
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
    
    
    return 7;
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
        
        return @" Financial Details";
        
    }
    else if(section == 4)
    {
        
        return @" Fees And Charges";
        
    }
//    

    
    
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
            
            CommonLabel *lblTotalFinance=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTotalFinance.text=@"Total Finance";
            lblTotalFinance.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTotalFinance];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotalFinance attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotalFinance attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotalFinance attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTotalFinance attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PLHeight constant:0]];
            
            
            txtTotalFinance = [[CommonTextField alloc] init];
            txtTotalFinance.tag=1;
            txtTotalFinance.delegate=self;
            txtTotalFinance.placeholder=@"Total Finance";
            txtTotalFinance.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTotalFinance];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotalFinance attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotalFinance attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotalFinance attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTotalFinance attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblInterestRate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInterestRate.text=@"Interest Rate";
            lblInterestRate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInterestRate];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterestRate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterestRate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterestRate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterestRate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PL2Height constant:0]];
            
            
            txtInterestRate = [[CommonTextField alloc] init];
            txtInterestRate.tag=2;
            txtInterestRate.delegate=self;
            txtInterestRate.placeholder=@"Interest Rate";
            txtInterestRate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInterestRate];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestRate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestRate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestRate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestRate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL2Height2 constant:0]];
            
            
        }
        
        if(indexPath.section==1)
        {
            
            CommonLabel *lblTenor=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTenor.text=@"Tenor";
            lblTenor.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTenor];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTenor attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTenor attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTenor attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTenor attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PLHeight constant:0]];
            
            
            txtTenor = [[CommonTextField alloc] init];
            txtTenor.tag=3;
            txtTenor.delegate=self;
            txtTenor.placeholder=@"Tenor";
            txtTenor.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTenor];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTenor attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTenor attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTenor attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTenor attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblInstallmentAmount=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInstallmentAmount.text=@"Installment Amount";
            lblInstallmentAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInstallmentAmount];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInstallmentAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInstallmentAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInstallmentAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInstallmentAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PL2Height constant:0]];
            
            
            txtInstallmentAmount = [[CommonTextField alloc] init];
            txtInstallmentAmount.tag=4;
            txtInstallmentAmount.delegate=self;
            txtInstallmentAmount.placeholder=@"Installment Amount";
            txtInstallmentAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInstallmentAmount];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInstallmentAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInstallmentAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInstallmentAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInstallmentAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL2Height2 constant:0]];
            
            
            
            
            
        }
        if(indexPath.section==2)
        {
            
            CommonLabel *lblStartingDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblStartingDate.text=@"Starting Date";
            lblStartingDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblStartingDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblStartingDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblStartingDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblStartingDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblStartingDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PLHeight constant:0]];
            
            
            txtStartingDate = [[CommonTextField alloc] init];
            txtStartingDate.tag=5;
            txtStartingDate.delegate=self;
            txtStartingDate.placeholder=@"Starting Date";
            txtStartingDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtStartingDate];
            
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtStartingDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtStartingDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtStartingDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtStartingDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblLastInstallmentAmount=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblLastInstallmentAmount.text=@"Last Installment Amount";
            lblLastInstallmentAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblLastInstallmentAmount];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLastInstallmentAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLastInstallmentAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLastInstallmentAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblLastInstallmentAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PL2Height constant:0]];
            
            
            txtLastInstallmentAmount = [[CommonTextField alloc] init];
            txtLastInstallmentAmount.tag=6;
            txtLastInstallmentAmount.delegate=self;
            txtLastInstallmentAmount.placeholder=@"Last Installment Amount";
            txtLastInstallmentAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtLastInstallmentAmount];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtLastInstallmentAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtLastInstallmentAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtLastInstallmentAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtLastInstallmentAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL2Height2 constant:0]];
            
            
        }
        if(indexPath.section==3)
        {
            
            CommonLabel *lblNoOfInstallments=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNoOfInstallments.text=@"No Of Installments";
            lblNoOfInstallments.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNoOfInstallments];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoOfInstallments attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoOfInstallments attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoOfInstallments attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNoOfInstallments attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PLHeight constant:0]];
            
            
            txtNoOfInstallments = [[CommonTextField alloc] init];
            txtNoOfInstallments.tag=7;
            txtNoOfInstallments.delegate=self;
            txtNoOfInstallments.placeholder=@"No Of Installments";
            txtNoOfInstallments.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNoOfInstallments];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfInstallments attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfInstallments attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfInstallments attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNoOfInstallments attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL1Height2 constant:0]];
            
            
        }
        if(indexPath.section==4)
        {
            
            CommonLabel *lblProcessingFee=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblProcessingFee.text=@"Processing Fees";
            lblProcessingFee.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblProcessingFee];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblProcessingFee attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblProcessingFee attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblProcessingFee attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblProcessingFee attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PLHeight constant:0]];
            
            
            txtProcessingFee = [[CommonTextField alloc] init];
            txtProcessingFee.tag=8;
            txtProcessingFee.delegate=self;
            txtProcessingFee.placeholder=@"Processing Fees";
            txtProcessingFee.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtProcessingFee];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtProcessingFee attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtProcessingFee attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtProcessingFee attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtProcessingFee attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL1Height2 constant:0]];
            
            
            
            CommonLabel *lblInsuranceAmount=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInsuranceAmount.text=@"Insurance Amount";
            lblInsuranceAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInsuranceAmount];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInsuranceAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInsuranceAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInsuranceAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInsuranceAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PL2Height constant:0]];
            
            
            txtInsuranceAmount = [[CommonTextField alloc] init];
            txtInsuranceAmount.tag=9;
            txtInsuranceAmount.delegate=self;
            txtInsuranceAmount.placeholder=@"Insurance Amount";
            txtInsuranceAmount.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInsuranceAmount];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInsuranceAmount attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInsuranceAmount attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInsuranceAmount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInsuranceAmount attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL2Height2 constant:0]];
            
        }
        
        if(indexPath.section==5)
        {
            
            CommonLabel *lblSettlementOwnResoures=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSettlementOwnResoures.text=@"Settlement From Own Resources";
            lblSettlementOwnResoures.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSettlementOwnResoures];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSettlementOwnResoures attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSettlementOwnResoures attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSettlementOwnResoures attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSettlementOwnResoures attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PLHeight constant:0]];
            
            
            txtSettlementOwnResoures = [[CommonTextField alloc] init];
            txtSettlementOwnResoures.tag=10;
            txtSettlementOwnResoures.delegate=self;
            txtSettlementOwnResoures.placeholder=@"Settlement From Own Resources";
            txtSettlementOwnResoures.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSettlementOwnResoures];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSettlementOwnResoures attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSettlementOwnResoures attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSettlementOwnResoures attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSettlementOwnResoures attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblSettlementRepeatLoan=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSettlementRepeatLoan.text=@"Settlement From Repeat Loan";
            lblSettlementRepeatLoan.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSettlementRepeatLoan];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSettlementRepeatLoan attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSettlementRepeatLoan attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSettlementRepeatLoan attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSettlementRepeatLoan attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PL2Height constant:0]];
            
            
            txtSettlementRepeatLoan = [[CommonTextField alloc] init];
            txtSettlementRepeatLoan.tag=11;
            txtSettlementRepeatLoan.delegate=self;
            txtSettlementRepeatLoan.placeholder=@"Settlement From Repeat Loan";
            txtSettlementRepeatLoan.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSettlementRepeatLoan];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSettlementRepeatLoan attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSettlementRepeatLoan attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSettlementRepeatLoan attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSettlementRepeatLoan attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL2Height2 constant:0]];
            
            
        }
        if(indexPath.section==6)
        {
            
            CommonLabel *lblSettlementOtherBank=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSettlementOtherBank.text=@"Settlement From Other Bank";
            lblSettlementOtherBank.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSettlementOtherBank];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSettlementOtherBank attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PLX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSettlementOtherBank attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PLY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSettlementOtherBank attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PLWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSettlementOtherBank attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PLHeight constant:0]];
            
            
            txtSettlementOtherBank = [[CommonTextField alloc] init];
            txtSettlementOtherBank.tag=12;
            txtSettlementOtherBank.delegate=self;
            txtSettlementOtherBank.placeholder=@"Settlement From Other Bank";
            txtSettlementOtherBank.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSettlementOtherBank];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSettlementOtherBank attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL1X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSettlementOtherBank attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL1Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSettlementOtherBank attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL1Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSettlementOtherBank attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL1Height2 constant:0]];
            
            
            
            
            CommonLabel *lblOtherFees=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOtherFees.text=@"Other Fees";
            lblOtherFees.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOtherFees];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOtherFees attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblconstraint2PL2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOtherFees attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblconstraint2PL2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOtherFees attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblconstraint2PL2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOtherFees attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblconstraint2PL2Height constant:0]];
            
            
            txtOtherFees = [[CommonTextField alloc] init];
            txtOtherFees.tag=13;
            txtOtherFees.delegate=self;
            txtOtherFees.placeholder=@"Other Fees";
            txtOtherFees.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOtherFees];
            
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOtherFees attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraint2PL2X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOtherFees attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraint2PL2Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOtherFees attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraint2PL2Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOtherFees attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraint2PL2Height2 constant:0]];
            
            
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
        
        //
        //
        //        [popoverCodeValue setObject:emptyStringIfNil(self.autoLoansData.salaryTransfer) forKey:[NSString stringWithFormat:@"%d", self.txtSalaryTransfer.tag]];
        //        [popoverCodeValue setObject:emptyStringIfNil(self.autoLoansData.neworUsed) forKey:[NSString stringWithFormat:@"%d", self.txtNused.tag]];
        //
        //
        //        [popoverCodeValue setObject:emptyStringIfNil(self.autoLoansData.normalOrAlloy) forKey:[NSString stringWithFormat:@"%d", self.txtNormalOrAlloy.tag]];
        //        [popoverCodeValue setObject:emptyStringIfNil(self.autoLoansData.transmission) forKey:[NSString stringWithFormat:@"%d", self.txtTransmission.tag]];
        //
        //        [popoverCodeValue setObject:emptyStringIfNil(self.autoLoansData.sunroof) forKey:[NSString stringWithFormat:@"%d", self.txtSunroof.tag]];
        //
        //
        //
        //
    }
    //
    
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
    
    
    if([CommonUtils checkEmptyString:txtTotalFinance.text]==YES)
    {
        
        [CommonUtils showMessage:@"Total Finance can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtInterestRate.text]==YES)
    {
        
        [CommonUtils showMessage:@"Interest Rate can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtTenor.text]==YES)
    {
        
        [CommonUtils showMessage:@"Tenor can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtInstallmentAmount.text]==YES)
    {
        
        [CommonUtils showMessage:@"Installment Amount can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtStartingDate.text]==YES)
    {
        
        [CommonUtils showMessage:@"Starting Date can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtLastInstallmentAmount.text]==YES)
    {
        
        [CommonUtils showMessage:@"Last Installment Amount can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtNoOfInstallments.text]==YES)
    {
        
        [CommonUtils showMessage:@"No Of Installments can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtProcessingFee.text]==YES)
    {
        
        [CommonUtils showMessage:@"Processing Fees can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtInsuranceAmount.text]==YES)
    {
        
        [CommonUtils showMessage:@"Insurance Amount can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtSettlementOwnResoures.text]==YES)
    {
        
        [CommonUtils showMessage:@"Settlement From Own Resources can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtSettlementRepeatLoan.text]==YES)
    {
        
        [CommonUtils showMessage:@"Settlement From Repeat Loan can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtSettlementOtherBank.text]==YES)
    {
        
        [CommonUtils showMessage:@"Settelement From Other Bank  can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtOtherFees.text]==YES)
    {
        
        [CommonUtils showMessage:@"Other Fees can't be blank":self];
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
    
    NSLog(@"PersonalLoan 2 action mode %@",actionMode);
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
                          @"totalFinance":emptyStringIfNil(self.txtTotalFinance.text),
                          @"interestRate":emptyStringIfNil(self.txtInterestRate.text),
                          @"tenor":emptyStringIfNil(self.txtTenor.text),
                          @"installmentAmount":emptyStringIfNil(self.txtInsuranceAmount.text),
                          @"startingDate":emptyStringIfNil(self.txtStartingDate.text),
                          @"lastInstallmentAmount":emptyStringIfNil(self.txtLastInstallmentAmount.text),
                          @"noOfInstallments":emptyStringIfNil(self.txtNoOfInstallments.text),
                          @"processingFee":emptyStringIfNil(self.txtProcessingFee.text),
                          @"insuranceAmount":emptyStringIfNil(self.txtInsuranceAmount.text),
                          @"settlementOwnResoures":emptyStringIfNil(self.txtSettlementOwnResoures.text),
                          @"settlementRepeatLoan":emptyStringIfNil(self.txtSettlementRepeatLoan.text),
                          @"settlementOtherBank":emptyStringIfNil(self.txtSettlementOtherBank.text),
                          @"otherFees":emptyStringIfNil(self.txtOtherFees.text),
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
//        if([actionMode isEqualToString:@"NEW"])// && [viewMode isEqualToString:@"N"])
//        {
//            
//            newData=[CommonUtils connectHost :@"insertPersonalLoan" :jsonDictionary :self];
//            [self parseResponse:newData:@"insertPersonalLoan":@"personalLoanWrapper"];
//            //viewMode=@"N";
//        }
//        if([actionMode isEqualToString:@"UPDATE"])// && [viewMode isEqualToString:@"N"])
//        {
        
            newData=[CommonUtils connectHost :@"updatePersonalLoan2" :jsonDictionary :self];
            [self parseResponse:newData:@"updatePersonalLoan2":@"personalLoanWrapper"];
            //viewMode=@"Y";
       //}
        
        
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
//                PersonalLoanViewController *autoLoans2ViewController = [[PersonalLoanViewController alloc]initWithNibName:nil bundle:nil];
//                autoLoans2ViewController.userid=self.userid;
//                autoLoans2ViewController.sessionid=self.sessionid;
//                autoLoans2ViewController.actionMode=self.actionMode;
//                //contactViewController.viewMode=self.viewMode;
//                autoLoans2ViewController.refNo=self.refNo;
//        
//                [self.navigationController pushViewController:autoLoans2ViewController animated:YES];
        
        
                        KYCViewController *kycViewController = [[KYCViewController alloc]initWithNibName:nil bundle:nil];
                        kycViewController.actionMode=self.actionMode;
                        //contactViewController.viewMode=self.viewMode;
                        kycViewController.refNo=self.refNo;
                        kycViewController.existingCustomerFlag=self.existingCustomerFlag;
                        kycViewController.menuName=self.menuName;
        
                        [self.navigationController pushViewController:kycViewController animated:YES];
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
    
    NSLog(@"PersonalLoan action mode %@",actionMode);
    NSLog(@"PersonalLoan Ref no %@",self.refNo);
    
    @try{
        
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        NSDictionary *jsonDictionary= @{@"refNo":self.refNo};
        
        
        
        NSData * newData=[CommonUtils connectHost :@"fetchPersonalLoan2" :jsonDictionary :self];
        [self parseResponse:newData:@"fetchPersonalLoan2":@"personalLoanWrapper"];
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in PersonalLoan2 viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
        
    }
    @finally {
        
        NSLog(@"finally in PersonalLoan2 fetch viewData Code");
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
    
    
}

-(void) loadData {
    
    
    @try{
        
        personalLoanData = [personalLoanArray objectAtIndex:0];
        
        
        txtTotalFinance.text=emptyStringIfNil(personalLoanData.totalFinance);
        txtInterestRate.text=emptyStringIfNil(personalLoanData.interestRate);
        txtTenor.text=emptyStringIfNil(personalLoanData.tenor);
        txtInstallmentAmount.text=emptyStringIfNil(personalLoanData.installmentAmount);
        txtStartingDate.text=emptyStringIfNil(personalLoanData.startingDate);
        txtLastInstallmentAmount.text=emptyStringIfNil(personalLoanData.lastInstallmentAmount);
        txtNoOfInstallments.text=emptyStringIfNil(personalLoanData.noOfInstallments);
        txtProcessingFee.text=emptyStringIfNil(personalLoanData.processingFee);
        txtInsuranceAmount.text=emptyStringIfNil(personalLoanData.insuranceAmount);
        txtSettlementOwnResoures.text=emptyStringIfNil(personalLoanData.settlementOwnResoures);
        txtSettlementRepeatLoan.text=emptyStringIfNil(personalLoanData.settlementRepeatLoan);
        txtSettlementOtherBank.text=emptyStringIfNil(personalLoanData.settlementOtherBank);
        txtOtherFees.text=emptyStringIfNil(personalLoanData.otherFees);
        
        
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



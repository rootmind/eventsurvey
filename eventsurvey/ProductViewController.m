//
//  ProductViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 07/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ProductViewController.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "ProductData.h"
#import "DocChecklistViewController.h"
#import "QueueViewController.h"
//#import "KYCViewController.h"
//#import "SearchViewController.h"




@interface ProductViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblConstraintProdX1=0.52f;
CGFloat lblConstraintProdY1=1.0f;
CGFloat lblConstraintProdWidth1=0.5f;
CGFloat lblConstraintProdHeight1=0.8f;

CGFloat constraintProdX1=1.19f;
CGFloat constraintProdY1=1.0f;
CGFloat constraintProdWidth1=0.80f;
CGFloat constraintProdHeight1=0.8f;

CGFloat constraintProd1X1=0.69f;
CGFloat constraintProd1Y1=1.0f;
CGFloat constraintProd1Width1=0.3f;
CGFloat constraintProd1Height1=0.8f;

CGFloat lblConstraintProd2X1=1.52f;
CGFloat lblConstraintProd2Y1=1.0f;
CGFloat lblConstraintProd2Width1=0.5f;
CGFloat lblConstraintProd2Height1=0.8f;

CGFloat constraintProd2X1=1.69f;
CGFloat constraintProd2Y1=1.0f;
CGFloat constraintProd2Width1=0.3f;
CGFloat constraintProd2Height1=0.8f;




@implementation ProductViewController




//@synthesize userid;
//@synthesize sessionid;

@synthesize menuName;
@synthesize actionMode;
//@synthesize viewMode;

//@synthesize onBoardDataKeyData;
//@synthesize onBoardDataValueData;
@synthesize dataDictionary;



@synthesize productArray;
@synthesize productData;
@synthesize refNo;

@synthesize popoverCodeValue;

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


@synthesize recordStatus;
@synthesize accountType;
@synthesize existingCustomerFlag;
@synthesize existingRefNo;
@synthesize txtAccountNo;
@synthesize txtAccountIBAN;
@synthesize txtAccountType;
@synthesize txtCurrency;
@synthesize txtStmtCycle;
@synthesize txtOnlineBankTrans;
@synthesize txtAccountOperInstrs;
@synthesize txtAccountTitle;
@synthesize txtDebitCardReq;
@synthesize txtNameCard;
@synthesize txtFavoriteCity;


@synthesize txtDebitCardDelvChnl;
@synthesize txtPinMailerDelvChnl;
@synthesize txtTransferSalary;
@synthesize txtChequeBookReq;
@synthesize txtOverDraftType;
@synthesize txtInterestOption;
@synthesize txtInterestRate;
@synthesize txtSupplCardReq;

@synthesize txtPurposeCode;
@synthesize txtBusinessCode;
@synthesize txtInsuranceCode;
@synthesize txtCampaignCode;
@synthesize txtSellerID;
@synthesize txtSellerChnl;
@synthesize txtSchemeID;


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
    
    
//    self.navigationItem.title=[NSString stringWithFormat:@"%@ - %@",self.menuName,@"Product Details"];
    self.navigationItem.title=@"Product Details";
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
    
//    //--Account No
//    if (textField.tag == 1) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
//  
    //--IBAN
    if (textField.tag == 2) {
        
        
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
    //--Title
    if (textField.tag == 8) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //--Name On Card
    if (textField.tag == 10) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //-Overdraft Type
    if (textField.tag == 16) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
    //-Interest rate
    if (textField.tag == 18) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        //return newLength <= 4;
        
        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
        
        // allow backspace
        if (range.length > 0 && [string length] == 0) {
            return YES;
        }
        //        // do not allow . at the beggining
                if (range.location == 0 && [string isEqualToString:@"."]) {
                    return NO;
                }
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
    //--Business Code
    if (textField.tag == 21) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    //--Insurance Code
    if (textField.tag == 22) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    //--Campaign Code
    if (textField.tag == 23) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    //--Seller ID
    if (textField.tag == 24) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    //--Seller Channel
    if (textField.tag == 25) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    //--Scheme ID
    if (textField.tag == 26) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
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
    
    //--Account Type
    if(textField.tag==3)
    {
        [self popoverData:textField:@"AccountType":self.accountType];
        return NO; //to disable keyboard
    }
    //--Currency
    else if(textField.tag==4)
    {
        [self popoverData:textField:@"Currency"];
        return NO; //to disable keyboard
    }
    //--Statement Cycle
    else if(textField.tag==5)
    {
        [self popoverData:textField:@"StatementCycle"];
        return NO; //to disable keyboard
    }
    //--Online Banking
    else if(textField.tag==6)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--ACCOUNT Oper Instr
    else if(textField.tag==7)
    {
        [self popoverData:textField:@"AccountOperationInstr"];
        return NO; //to disable keyboard
    }
    //--Debitcard Req
    else if(textField.tag==9)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--Favourite city
    else if(textField.tag==11)
    {
        [self popoverData:textField:@"FavouriteCity"];
        return NO; //to disable keyboard
    }
    //--Debitcard Delivery Channel
    else if(textField.tag==12)
    {
        [self popoverData:textField:@"DebitCardDeliveryChnl"];
        return NO; //to disable keyboard
    }
    //--PIN  Delivery Channel
    else if(textField.tag==13)
    {
        [self popoverData:textField:@"PinMailer"];
        return NO; //to disable keyboard
    }
    //--Transfer Salary
    else if(textField.tag==14)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--ChequeBook Req
    else if(textField.tag==15)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--Interest Option
    else if(textField.tag==17)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--Interest rate
//    else if(textField.tag==18)
//    {
//        [self popoverData:textField:@"DECISION"];
//        return NO; //to disable keyboard
//    }
    //--Supplementry Card Req
    else if(textField.tag==19)
    {
        [self popoverData:textField:@"Decision"];
        return NO; //to disable keyboard
    }
    //--Purpose Code
    else if(textField.tag==20)
    {
        [self popoverData:textField:@"PurposeCode"];
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
    [self popoverData:sender :NULL:@"Y":dateRange:dateFormat:NULL];
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName
{
    [self popoverData:sender :tableName:@"N":NULL:NULL:NULL];
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName:(NSString *)filter
{
    [self popoverData:sender :tableName:@"N":NULL:NULL:filter];
}

-(void) popoverData: (UITextField *)sender :(NSString *)tableName :(NSString *)dateField :(NSString *)dateRange :(NSString *)dateFormat :(NSString *)filter
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
        popoverViewController.filter=filter;
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
    
    
    return 14; //[componentsArray count];
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
        
        return @" Current / Savings Account Details";
        
    }
    if (section == 6) {
        
        
        return @" Account Specific";
    }
    if (section == 10) {
        
        
        return @" Bank Use Only";
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
    //productData = [productArray objectAtIndex:indexPath.section];
    
    
    
    
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //static NSString *MyIdentifier = @"MyReuseIdentifier";
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    NSString *MyIdentifier = [NSString stringWithFormat:@"Cell %d",indexPath.row];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.accessoryType = UITableViewCellAccessoryNone;
        //cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        
        if(indexPath.section==0)
        {
            
            CommonLabel *lblAccountNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAccountNo.text=@"Account No";
            lblAccountNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAccountNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            
            txtAccountNo=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtAccountNo.tag=1;
            txtAccountNo.enabled=NO;
            txtAccountNo.delegate=self;
            txtAccountNo.placeholder=@"Account No";
            txtAccountNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAccountNo];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            CommonLabel *lblAccountIBAN=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAccountIBAN.text=@"Account IBAN";
            lblAccountIBAN.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAccountIBAN];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountIBAN attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountIBAN attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProd2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountIBAN attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountIBAN attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProd2Height1 constant:0]];
            
            
            txtAccountIBAN = [[CommonTextField alloc] init];
            txtAccountIBAN.tag=2;
            //txtAccountIBAN.enabled=NO;
            txtAccountIBAN.delegate=self;
            txtAccountIBAN.placeholder=@"Account IBAN";
            txtAccountIBAN.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAccountIBAN];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountIBAN attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountIBAN attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountIBAN attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountIBAN attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd2Height1 constant:0]];
            
            
            
            
        }
        else if(indexPath.section==1)
        {
            
            CommonLabel *lblAccountType=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAccountType.text=@"Account Type";
            lblAccountType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAccountType];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            
            txtAccountType = [[CommonTextField alloc] init];
            txtAccountType.tag=3;
            txtAccountType.delegate=self;
            txtAccountType.placeholder=@"Account Type";
            txtAccountType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAccountType];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            CommonLabel *lblCurrency=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCurrency.text=@"Currency";
            lblCurrency.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCurrency];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCurrency attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCurrency attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProd2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCurrency attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCurrency attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProd2Height1 constant:0]];
            
            
            txtCurrency = [[CommonTextField alloc] init];
            txtCurrency.tag=4;
            txtCurrency.delegate=self;
            txtCurrency.placeholder=@"Currency";
            txtCurrency.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCurrency];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCurrency attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCurrency attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCurrency attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCurrency attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd2Height1 constant:0]];
            
            
        }
        else if(indexPath.section==2){
            
            CommonLabel *lblStmtCycle=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblStmtCycle.text=@"Statement Cycle";
            lblStmtCycle.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblStmtCycle];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblStmtCycle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblStmtCycle attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblStmtCycle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblStmtCycle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            
            txtStmtCycle=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtStmtCycle.tag=5;
            txtStmtCycle.delegate=self;
            txtStmtCycle.placeholder=@"Statement Cycle";
            txtStmtCycle.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtStmtCycle];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtStmtCycle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtStmtCycle attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtStmtCycle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtStmtCycle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            
            
            
            
            CommonLabel *lblOnlineBankTrans=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOnlineBankTrans.text=@"Online Bank Trans";
            lblOnlineBankTrans.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOnlineBankTrans];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOnlineBankTrans attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOnlineBankTrans attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProd2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOnlineBankTrans attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOnlineBankTrans attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProd2Height1 constant:0]];
            
            
            txtOnlineBankTrans= [[CommonTextField alloc] init];
            txtOnlineBankTrans.tag=6;
            txtOnlineBankTrans.delegate=self;
            txtOnlineBankTrans.placeholder=@"Online Bank Transaction";
            txtOnlineBankTrans.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOnlineBankTrans];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOnlineBankTrans attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOnlineBankTrans attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOnlineBankTrans attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOnlineBankTrans attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd2Height1 constant:0]];
            
            
        }
        else if(indexPath.section==3){
            CommonLabel *lblAccountOperInstrs=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAccountOperInstrs.text=@"Account Oper Instr";
            lblAccountOperInstrs.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAccountOperInstrs];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountOperInstrs attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountOperInstrs attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountOperInstrs attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountOperInstrs attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            
            txtAccountOperInstrs=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtAccountOperInstrs.tag=7;
            txtAccountOperInstrs.delegate=self;
            txtAccountOperInstrs.placeholder=@"Account Operation Instructions";
            txtAccountOperInstrs.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAccountOperInstrs];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountOperInstrs attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountOperInstrs attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountOperInstrs attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountOperInstrs attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            
            CommonLabel *lblAccountTitle=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblAccountTitle.text=@"Account Title";
            lblAccountTitle.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblAccountTitle];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountTitle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountTitle attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProd2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountTitle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountTitle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProd2Height1 constant:0]];
            
            
            txtAccountTitle = [[CommonTextField alloc] init];
            txtAccountTitle.tag=8;
            txtAccountTitle.delegate=self;
            txtAccountTitle.placeholder=@"Account Title";
            txtAccountTitle.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtAccountTitle];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountTitle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountTitle attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountTitle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountTitle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd2Height1 constant:0]];
            
            
        }
        else if(indexPath.section==4){
            CommonLabel *lblDebitCardReq=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDebitCardReq.text=@"Debit Card Required";
            lblDebitCardReq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDebitCardReq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDebitCardReq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDebitCardReq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDebitCardReq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDebitCardReq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            
            txtDebitCardReq=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtDebitCardReq.tag=9;
            txtDebitCardReq.delegate=self;
            txtDebitCardReq.placeholder=@"Debit Card Required";
            txtDebitCardReq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDebitCardReq];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDebitCardReq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDebitCardReq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDebitCardReq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDebitCardReq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            CommonLabel *lblNameCard=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNameCard.text=@"Name On Card";
            lblNameCard.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNameCard];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameCard attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameCard attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProd2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameCard attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNameCard attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProd2Height1 constant:0]];
            
            
            txtNameCard = [[CommonTextField alloc] init];
            txtNameCard.tag=10;
            txtNameCard.delegate=self;
            txtNameCard.placeholder=@"Name On Card";
            txtNameCard.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNameCard];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameCard attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameCard attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameCard attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNameCard attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd2Height1 constant:0]];
            
            
            
            
            
            
        }
        else if(indexPath.section==5){
            
            
            
            CommonLabel *lblFavoriteCity=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblFavoriteCity.text=@"Favourite Emirate";
            lblFavoriteCity.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblFavoriteCity];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFavoriteCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFavoriteCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFavoriteCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFavoriteCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            
            
            
            txtFavoriteCity=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtFavoriteCity.tag=11;
            txtFavoriteCity.delegate=self;
            txtFavoriteCity.placeholder=@"Favourite Emirate";
            txtFavoriteCity.translatesAutoresizingMaskIntoConstraints=NO;
            
            [cell.contentView addSubview:txtFavoriteCity];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavoriteCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavoriteCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavoriteCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavoriteCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            
        }
        
        else if(indexPath.section==6){
            
            
            CommonLabel *lblDebitCardDelvChnl=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDebitCardDelvChnl.text=@"Debit Card Delv Chnl";
            lblDebitCardDelvChnl.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDebitCardDelvChnl];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDebitCardDelvChnl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDebitCardDelvChnl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDebitCardDelvChnl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDebitCardDelvChnl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            
            txtDebitCardDelvChnl=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtDebitCardDelvChnl.tag=12;
            txtDebitCardDelvChnl.delegate=self;
            txtDebitCardDelvChnl.placeholder=@"Debit Card Delivery Channel";
            txtDebitCardDelvChnl.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDebitCardDelvChnl];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDebitCardDelvChnl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDebitCardDelvChnl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDebitCardDelvChnl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDebitCardDelvChnl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            CommonLabel *lblPinMailerDelvChnl=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPinMailerDelvChnl.text=@"Pin Mailer Delv Chnl";
            lblPinMailerDelvChnl.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPinMailerDelvChnl];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPinMailerDelvChnl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPinMailerDelvChnl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProd2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPinMailerDelvChnl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPinMailerDelvChnl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProd2Height1 constant:0]];
            
            
            txtPinMailerDelvChnl = [[CommonTextField alloc] init];
            txtPinMailerDelvChnl.tag=13;
            txtPinMailerDelvChnl.delegate=self;
            txtPinMailerDelvChnl.placeholder=@"Pin Mailer Delivery Channel";
            txtPinMailerDelvChnl.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPinMailerDelvChnl];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPinMailerDelvChnl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPinMailerDelvChnl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPinMailerDelvChnl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPinMailerDelvChnl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd2Height1 constant:0]];
            
            
            
            
            
        }
        
        else if(indexPath.section==7){
            
            CommonLabel *lblTransferSalary=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTransferSalary.text=@"Transfer Salary";
            lblTransferSalary.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTransferSalary];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTransferSalary attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTransferSalary attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTransferSalary attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTransferSalary attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            txtTransferSalary=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtTransferSalary.tag=14;
            txtTransferSalary.delegate=self;
            txtTransferSalary.placeholder=@"Transfer Salary";
            txtTransferSalary.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTransferSalary];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTransferSalary attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTransferSalary attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTransferSalary attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTransferSalary attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            CommonLabel *lblCheckBookReq=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCheckBookReq.text=@"Cheque Book Req";
            lblCheckBookReq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCheckBookReq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCheckBookReq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCheckBookReq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProd2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCheckBookReq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCheckBookReq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProd2Height1 constant:0]];
            
            txtChequeBookReq = [[CommonTextField alloc] init];
            txtChequeBookReq.tag=15;
            txtChequeBookReq.delegate=self;
            txtChequeBookReq.placeholder=@"Cheque Book Required";
            txtChequeBookReq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtChequeBookReq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtChequeBookReq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtChequeBookReq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtChequeBookReq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtChequeBookReq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd2Height1 constant:0]];
            
            
            
            
            
        }
        else if(indexPath.section==8){
            
            CommonLabel *lblOverDraftType=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblOverDraftType.text=@"Overdraft Type";
            lblOverDraftType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblOverDraftType];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOverDraftType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOverDraftType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOverDraftType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblOverDraftType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            txtOverDraftType=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtOverDraftType.tag=16;
            txtOverDraftType.delegate=self;
            txtOverDraftType.placeholder=@"Overdraft Type";
            txtOverDraftType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtOverDraftType];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOverDraftType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOverDraftType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOverDraftType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtOverDraftType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            CommonLabel *lblInterestOption=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInterestOption.text=@"Interest Option";
            lblInterestOption.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInterestOption];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterestOption attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterestOption attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProd2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterestOption attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInterestOption attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProd2Height1 constant:0]];
            
            txtInterestOption = [[CommonTextField alloc] init];
            txtInterestOption.tag=17;
            txtInterestOption.delegate=self;
            txtInterestOption.placeholder=@"Interest Option";
            txtInterestOption.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInterestOption];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestOption attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestOption attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestOption attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestOption attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd2Height1 constant:0]];
            
            
            
            
            
        }
        else if(indexPath.section==9){
            
            CommonLabel *lblInerestRate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInerestRate.text=@"Interest Rate";
            lblInerestRate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInerestRate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInerestRate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInerestRate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInerestRate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInerestRate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            txtInterestRate=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtInterestRate.tag=18;
            txtInterestRate.delegate=self;
            txtInterestRate.placeholder=@"Interest Rate";
            txtInterestRate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInterestRate];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestRate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestRate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestRate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInterestRate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            CommonLabel *lblSupplCardReq=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSupplCardReq.text=@"Supp Card Req";
            lblSupplCardReq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSupplCardReq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSupplCardReq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSupplCardReq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProd2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSupplCardReq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSupplCardReq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProd2Height1 constant:0]];
            
            txtSupplCardReq = [[CommonTextField alloc] init];
            txtSupplCardReq.tag=19;
            txtSupplCardReq.delegate=self;
            txtSupplCardReq.placeholder=@"Supplementary Card Required";
            txtSupplCardReq.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSupplCardReq];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSupplCardReq attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSupplCardReq attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSupplCardReq attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSupplCardReq attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd2Height1 constant:0]];
            
            
            
            
            
        }
        else if(indexPath.section==10){
            
            CommonLabel *lblPurposeCode=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPurposeCode.text=@"Purpose Code";
            lblPurposeCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPurposeCode];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPurposeCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPurposeCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPurposeCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPurposeCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            txtPurposeCode=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtPurposeCode.tag=20;
            txtPurposeCode.delegate=self;
            txtPurposeCode.placeholder=@"Purpose Code";
            txtPurposeCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPurposeCode];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurposeCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurposeCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurposeCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPurposeCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            CommonLabel *lblBusinessCode=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblBusinessCode.text=@"Business Code";
            lblBusinessCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblBusinessCode];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBusinessCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBusinessCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProd2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBusinessCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBusinessCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProd2Height1 constant:0]];
            
            txtBusinessCode = [[CommonTextField alloc] init];
            txtBusinessCode.tag=21;
            txtBusinessCode.delegate=self;
            txtBusinessCode.placeholder=@"Business Code";
            txtBusinessCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtBusinessCode];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBusinessCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBusinessCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBusinessCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBusinessCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd2Height1 constant:0]];
            
            
            
            
            
        }
        else if(indexPath.section==11){
            
            CommonLabel *lblInsuranceCode=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblInsuranceCode.text=@"Insurance Code";
            lblInsuranceCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblInsuranceCode];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInsuranceCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInsuranceCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInsuranceCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblInsuranceCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            txtInsuranceCode=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtInsuranceCode.tag=22;
            txtInsuranceCode.delegate=self;
            txtInsuranceCode.placeholder=@"Insurance Code";
            txtInsuranceCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtInsuranceCode];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInsuranceCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInsuranceCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInsuranceCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtInsuranceCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            CommonLabel *lblCampaignCode=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCampaignCode.text=@"Campaign Code";
            lblCampaignCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCampaignCode];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCampaignCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCampaignCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProd2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCampaignCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCampaignCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProd2Height1 constant:0]];
            
            txtCampaignCode = [[CommonTextField alloc] init];
            txtCampaignCode.tag=23;
            txtCampaignCode.delegate=self;
            txtCampaignCode.placeholder=@"Campaign Code";
            txtCampaignCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCampaignCode];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCampaignCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCampaignCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCampaignCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCampaignCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd2Height1 constant:0]];
            
            
            
            
            
        }
        else if(indexPath.section==12){
            
            CommonLabel *lblSellerID=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSellerID.text=@"Seller ID";
            lblSellerID.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSellerID];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSellerID attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSellerID attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSellerID attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSellerID attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            txtSellerID=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtSellerID.tag=24;
            txtSellerID.delegate=self;
            txtSellerID.placeholder=@" Seller ID";
            txtSellerID.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSellerID];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSellerID attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSellerID attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSellerID attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSellerID attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            CommonLabel *lblSellerChannel=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSellerChannel.text=@"Seller Channel";
            lblSellerChannel.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSellerChannel];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSellerChannel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSellerChannel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProd2Y1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSellerChannel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSellerChannel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProd2Height1 constant:0]];
            
            txtSellerChnl = [[CommonTextField alloc] init];
            txtSellerChnl.tag=25;
            txtSellerChnl.delegate=self;
            txtSellerChnl.placeholder=@"Seller Channel";
            txtSellerChnl.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSellerChnl];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSellerChnl attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd2X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSellerChnl attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd2Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSellerChnl attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd2Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSellerChnl attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd2Height1 constant:0]];
            
            
            
            
            
        }    else if(indexPath.section==13){
            
            CommonLabel *lblSchemeID=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblSchemeID.text=@"Scheme ID";
            lblSchemeID.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblSchemeID];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSchemeID attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintProdX1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSchemeID attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintProdY1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSchemeID attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintProdWidth1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblSchemeID attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintProdHeight1 constant:0]];
            
            txtSchemeID=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtSchemeID.tag=26;
            txtSchemeID.delegate=self;
            txtSchemeID.placeholder=@" Scheme ID";
            txtSchemeID.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtSchemeID];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSchemeID attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintProd1X1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSchemeID attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintProd1Y1 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSchemeID attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintProd1Width1 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtSchemeID attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintProd1Height1 constant:0]];
            
            
            
        }
        
        
        
        
        
    }
    else{
        
        
        
        [cell.contentView viewWithTag:100+indexPath.section];
        [cell.contentView viewWithTag:indexPath.section];
        
        [cell.contentView viewWithTag:500+indexPath.section];
        [cell.contentView viewWithTag:600+indexPath.section];
        
    }
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    if(([actionMode isEqualToString:@"UPDATE"] || [actionMode isEqualToString:@"ENQUIRY"]) && [productArray count]>0)
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
//        productData = [productArray objectAtIndex:0];    //indexPath.section
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
    
   // ------validation starts---------
    
        if([CommonUtils checkEmptyString:txtAccountIBAN.text]==YES)
        {
            
            [CommonUtils showMessage:@"Account IBAN can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    
        if([CommonUtils checkEmptyString:txtAccountType.text]==YES)
        {
    
            [CommonUtils showMessage:@"Account Type can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtCurrency.text]==YES)
        {
    
            [CommonUtils showMessage:@"Currency can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        } if([CommonUtils checkEmptyString:txtStmtCycle.text]==YES)
        {
    
            [CommonUtils showMessage:@"Statement Cycle can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtOnlineBankTrans.text]==YES)
        {
    
            [CommonUtils showMessage:@"Online Bank Transactions can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtAccountOperInstrs.text]==YES)
        {
    
            [CommonUtils showMessage:@"Account Operation Instructions can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtAccountTitle.text]==YES)
        {
    
            [CommonUtils showMessage:@"Account Title can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtDebitCardReq.text]==YES)
        {
            
            [CommonUtils showMessage:@"Debit Card Required can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtNameCard.text]==YES)
        {
    
            [CommonUtils showMessage:@"Name On Card can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtFavoriteCity.text]==YES)
        {
            
            [CommonUtils showMessage:@"Favourite Emirate can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    
        if([CommonUtils checkEmptyString:txtDebitCardDelvChnl.text]==YES)
        {
    
            [CommonUtils showMessage:@"Debit Card Delivery Channel can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtPinMailerDelvChnl.text]==YES)
        {
    
            [CommonUtils showMessage:@"Pin Mailer Delivery Channel can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtTransferSalary.text]==YES)
        {
            
            [CommonUtils showMessage:@"Transfer Salary can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtChequeBookReq.text]==YES)
        {
            
            [CommonUtils showMessage:@"Cheque Book Required can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    
        if([CommonUtils checkEmptyString:txtOverDraftType.text]==YES)
        {
    
            [CommonUtils showMessage:@"Overdraft Type can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtInterestOption.text]==YES)
        {
            
            [CommonUtils showMessage:@"Interest Option can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtInterestRate.text]==YES)
        {
            
            [CommonUtils showMessage:@"Interest Rate can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtSupplCardReq.text]==YES)
        {
            
            [CommonUtils showMessage:@"Supplementry Card Required can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    
        if([CommonUtils checkEmptyString:txtPurposeCode.text]==YES)
        {
    
            [CommonUtils showMessage:@"Purpose Code can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtBusinessCode.text]==YES)
        {
    
            [CommonUtils showMessage:@"Business Code can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
        if([CommonUtils checkEmptyString:txtInsuranceCode.text]==YES)
        {
    
            [CommonUtils showMessage:@"Insurance Code can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
    
        if([CommonUtils checkEmptyString:txtCampaignCode.text]==YES)
        {
    
            [CommonUtils showMessage:@"Campaign Code can't be blank":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
            return;
    
        }
//        if([CommonUtils checkEmptyString:txtSellerID.text]==YES)
//        {
//    
//            [CommonUtils showMessage:@"Seller ID can't be blank":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//    
//            return;
//    
//        }
//    
//        if([CommonUtils checkEmptyString:txtSellerChnl.text]==YES)
//        {
//            
//            [CommonUtils showMessage:@"Seller Channel can't be blank":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//            
//            return;
//            
//        }
//        if([CommonUtils checkEmptyString:txtSchemeID.text]==YES)
//        {
//            
//            [CommonUtils showMessage:@"Scheme ID can't be blank":self];
//            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//            
//            return;
//            
//        }
//    
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    [self buildJSON];
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}
- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    NSData *newData;
    
    
    @try{
    
 
//        
//           if([actionMode isEqualToString:@"UPDATE"] && [productArray count]>0)
//            {
//                jsonDictionary= @{@"refNo":self.refNo};
//            }
//            else
//            {
        
                
                
                
                jsonDictionary= @{
                                    @"refNo":emptyStringIfNil(self.refNo),
                                    @"accountNo":emptyStringIfNil(self.txtAccountNo.text),
                                    @"accountIBAN":emptyStringIfNil(self.txtAccountIBAN.text),
                                    @"accountType":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtAccountType.tag]]),
                                    @"currency":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCurrency.tag]]),
                                    @"statementCycle":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtStmtCycle.tag]]),
                                    @"onlineBankTrans":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtOnlineBankTrans.tag]]),
                                    @"accOperInstrs":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtAccountOperInstrs.tag]]),
                                    @"accountTitle":emptyStringIfNil(self.txtAccountTitle.text),
                                    @"debitCardRequired":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtDebitCardReq.tag]]),
                                    @"nameCard":emptyStringIfNil(self.txtNameCard.text),
                                    @"favEmirate":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtFavoriteCity.tag]]),
                                    @"debitCardDelvChnl":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtDebitCardDelvChnl.tag]]),
                                    @"pinMailerDelvChnl":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtPinMailerDelvChnl.tag]]),
                                    @"transferSalary":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtTransferSalary.tag]]),
                                    @"chequeBookRequired":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtChequeBookReq.tag]]),
                                    @"overDraftType":emptyStringIfNil(self.txtOverDraftType.text),
                                    @"interestOption":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtInterestOption.tag]]),
                                    @"interestRate":emptyStringIfNil(self.txtInterestRate.text),
                                    @"supplCardReq":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtSupplCardReq.tag]]),
                                    @"purposeCode":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtPurposeCode.tag]]),
                                    @"businessCode":emptyStringIfNil(self.txtBusinessCode.text),
                                    @"insuranceCode":emptyStringIfNil(self.txtInsuranceCode.text),
                                    @"campaignCode":emptyStringIfNil(self.txtCampaignCode.text),
                                    @"sellerID":emptyStringIfNil(self.txtSellerID.text),
                                    @"sellerChannel":emptyStringIfNil(self.txtSellerChnl.text),
                                    @"schemeID":emptyStringIfNil(self.txtSchemeID.text),
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
            
//             if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
//            {
//                
//                newData=[CommonUtils connectHost :@"fetchAccountDetails" :jsonDictionary :self];
//                [self parseResponse:newData :@"fetchAccountDetails":@"accountDetailsWrapper"];
//                
//            }
    
            if([actionMode isEqualToString:@"NEW"])
            {
                
                newData=[CommonUtils connectHost :@"insertAccountDetails" :jsonDictionary :self];
                [self parseResponse:newData :@"insertAccountDetails":@"accountDetailsWrapper"];
            }
            if([actionMode isEqualToString:@"UPDATE"])// && [viewMode isEqualToString:@"Y"])
            {
                
                newData=[CommonUtils connectHost :@"updateAccountDetails" :jsonDictionary :self];
                [self parseResponse:newData :@"updateAccountDetails":@"accountDetailsWrapper"];
            }

        
        
        
//        
//        //---invoke next screen---
//        if([viewMode isEqualToString:@"N"])
//        {
//            NSLog(@"To invoke next screen");
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
            
//            KYCViewController *kYCViewController = [[KYCViewController alloc]initWithNibName:nil bundle:nil];
//            kYCViewController.userid=self.userid;
//            kYCViewController.sessionid=self.sessionid;
//            kYCViewController.actionMode= self.actionMode;       //@"UPDATE";
//            kYCViewController.refNo=self.refNo;
//            kYCViewController.recordStatus=self.recordStatus;
//            
//            [self.navigationController pushViewController:kYCViewController animated:YES];
        
        
            DocChecklistViewController *docChecklistViewController = [[DocChecklistViewController alloc]initWithNibName:nil bundle:nil];
            docChecklistViewController.actionMode= self.actionMode;       
            docChecklistViewController.refNo=self.refNo;
            docChecklistViewController.existingCustomerFlag=self.existingCustomerFlag;
            docChecklistViewController.recordStatus=self.recordStatus;
            docChecklistViewController.accountType=self.accountType;
            docChecklistViewController.menuName=self.menuName;
            
            [self.navigationController pushViewController:docChecklistViewController animated:YES];
        
        
        
        
        
        
        //}
        
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
        
        
        

            NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
        
        
            NSData *newData=[CommonUtils connectHost :@"fetchAccountDetails" :jsonDictionary :self];
            [self parseResponse:newData :@"fetchAccountDetails":@"accountDetailsWrapper"];
        
                   
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in viewData code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in viewData Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
    
}


- (void) viewPathStatus {
    
    @try{
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        
        NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
        
      
        
        
        
        NSData *newData=[CommonUtils connectHost :@"fetchPathStatus" :jsonDictionary:self];
        [self parseResponsePath:newData:@"fetchPathStatus":@"pathStatusWrapper"];
        
        
        
        //}
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
        
        productData = [productArray objectAtIndex:0];
        
        txtAccountNo.text=emptyStringIfNil(productData.accountNo);
        txtAccountIBAN.text=emptyStringIfNil(productData.accountIBAN);
        txtAccountType.text=emptyStringIfNil(productData.accountTypeValue);
        txtCurrency.text=emptyStringIfNil(productData.currencyValue);
        txtStmtCycle.text=emptyStringIfNil(productData.statementCycleValue);
        txtOnlineBankTrans.text=emptyStringIfNil(productData.onlineBankTransValue);
        txtAccountOperInstrs.text=emptyStringIfNil(productData.accOperInstrsValue);
        txtAccountTitle.text=emptyStringIfNil(productData.accountTitle);
        txtDebitCardReq.text=emptyStringIfNil(productData.debitCardRequiredValue);
        txtNameCard.text=emptyStringIfNil(productData.nameCard);
        txtFavoriteCity.text=emptyStringIfNil(productData.favEmirateValue);
        txtDebitCardDelvChnl.text=emptyStringIfNil(productData.debitCardDelvChnlValue);
        txtPinMailerDelvChnl.text=emptyStringIfNil(productData.pinMailerDelvChnlValue);
        txtTransferSalary.text=emptyStringIfNil(productData.transferSalaryValue);
        txtChequeBookReq.text=emptyStringIfNil(productData.chequeBookRequiredValue);
        txtOverDraftType.text=emptyStringIfNil(productData.overDraftType);
        txtInterestOption.text=emptyStringIfNil(productData.interestOptionValue);
        txtInterestRate.text=emptyStringIfNil(productData.interestRate);
        txtSupplCardReq.text=emptyStringIfNil(productData.supplCardReqValue);
        txtPurposeCode.text=emptyStringIfNil(productData.purposeCodeValue);
        txtBusinessCode.text=emptyStringIfNil(productData.businessCode);
        txtInsuranceCode.text=emptyStringIfNil(productData.insuranceCode);
        txtCampaignCode.text=emptyStringIfNil(productData.campaignCode);
        txtSellerID.text=emptyStringIfNil(productData.sellerID);
        txtSellerChnl.text=emptyStringIfNil(productData.sellerChannel);
        txtSchemeID.text=emptyStringIfNil(productData.schemeID);
        
        
        
        
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.accountType) forKey:[NSString stringWithFormat:@"%d", self.txtAccountType.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.currency) forKey:[NSString stringWithFormat:@"%d", self.txtCurrency.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.statementCycle) forKey:[NSString stringWithFormat:@"%d", self.txtStmtCycle.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.onlineBankTrans) forKey:[NSString stringWithFormat:@"%d", self.txtOnlineBankTrans.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.debitCardRequired) forKey:[NSString stringWithFormat:@"%d", self.txtDebitCardReq.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.favEmirate) forKey:[NSString stringWithFormat:@"%d", self.txtFavoriteCity.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.debitCardDelvChnl) forKey:[NSString stringWithFormat:@"%d", self.txtDebitCardDelvChnl.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.pinMailerDelvChnl) forKey:[NSString stringWithFormat:@"%d", self.txtPinMailerDelvChnl.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.transferSalary) forKey:[NSString stringWithFormat:@"%d", self.txtTransferSalary.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.chequeBookRequired) forKey:[NSString stringWithFormat:@"%d", self.txtChequeBookReq.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.interestOption) forKey:[NSString stringWithFormat:@"%d", self.txtInterestOption.tag]];
        
        //[popoverCodeValue setObject:emptyStringIfNil(self.productData.interestRate) forKey:[NSString stringWithFormat:@"%d", self.txtInterestRate.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.supplCardReq) forKey:[NSString stringWithFormat:@"%d", self.txtSupplCardReq.tag]];
        
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.accOperInstrs) forKey:[NSString stringWithFormat:@"%d", self.txtAccountOperInstrs.tag]];
        
        [popoverCodeValue setObject:emptyStringIfNil(self.productData.purposeCode) forKey:[NSString stringWithFormat:@"%d", self.txtPurposeCode.tag]];
        
        
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
//        NSLog(@"finally in connectHost Code");
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
                productArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    productData = [[ProductData alloc] initWithJSONDictionary:dict];
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    // Add the Location object to the array
                    [productArray addObject:productData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)productArray.count);
                
                
                
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
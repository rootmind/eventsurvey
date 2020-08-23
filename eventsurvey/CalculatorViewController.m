//
//  CalculatorController.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 7/14/16.
//  Copyright © 2016 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "CalculatorViewController.h"
#import "CalculatorData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"






@interface CalculatorViewController ()


@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

//#define kOFFSET_FOR_KEYBOARD 80.0




@implementation CalculatorViewController


//@synthesize userid;
//@synthesize sessionid;
@synthesize actionMode;
@synthesize menuName;
//@synthesize viewMode;

//@synthesize onBoardDataKeyData;
//@synthesize onBoardDataValueData;
@synthesize dataDictionary;



//@synthesize personalArray;
@synthesize calculatorData;

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
@synthesize lblLoading;

@synthesize timerView;
@synthesize switchFlag;

//int hours, minutes, seconds,secondsLeft;




@synthesize refNo;

@synthesize txtRefNo;
@synthesize txtCustomerName;
@synthesize txtDateOfBirth;

@synthesize txtNationality;
@synthesize txtEmployer;
@synthesize txtDesignation;
@synthesize txtResidenceStatus;


@synthesize txtSalary;
@synthesize txtLoanOutstanding;
@synthesize txtCreditCardLimit;
@synthesize txtAmountRequest;
@synthesize txtApprovedStatus;
@synthesize txtPassportNo;
@synthesize txtEmiratesID;

@synthesize lblApprovedStatus;

//@synthesize lblCustomerName;
//@synthesize lblDateOfBirth;
//
//@synthesize lblNationality;
//@synthesize lblEmployer;
//@synthesize lblDesignation;
//@synthesize lblResidenceStatus;
//
//
//@synthesize lblSalary;
//@synthesize lblLoanOutStanding;
//@synthesize lblCreditCardLimit;
//@synthesize lblAmountRequest;
//@synthesize lblApprovedStatus;
//@synthesize lblPassportNo;
//@synthesize lblEmiratesId;

@synthesize btnCalculate;

@synthesize errorArray;
@synthesize errorData;

@synthesize swtSalaryTransfer;

@synthesize recordStatus;
@synthesize popoverCodeValue;


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
    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
    [self.splitViewController.displayModeButtonItem action];
    
    
    //    self.navigationItem.title= [NSString stringWithFormat:@"%@ - %@",self.menuName,@"Personal Details"];//@"Personal Detaills";
    self.navigationItem.title= @"Calculator";
    
    
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

    
    
    
    //self.navigationItem.rightBarButtonItem =rightNavButton ;
    

    
    
    
    
    
    
    
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
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.83 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
    
    
    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
//    // must set delegate & dataSource, otherwise the the table will be empty and not responsive
//    //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    //tableView.frame = CGRectMake(30,200,270,300);
//    tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
//    tableView.layer.borderWidth=1.0f;
//    tableView.layer.borderColor=[UIColor whiteColor].CGColor;
//    tableView.layer.cornerRadius=15.0f;
//    //tableView.allowsSelection = NO;
//    tableView.alwaysBounceVertical = NO;
//    tableView.contentInset = UIEdgeInsetsMake(-30, 0, 0, 0);
//    
//    
//    tableView.sectionHeaderHeight = 0.0;
//    tableView.sectionFooterHeight = 0.0;
//    tableView.rowHeight=UITableViewAutomaticDimension;
    
    
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
//    tableView.separatorInset=UIEdgeInsetsZero;
//    //tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
//    
//    
//    // add to canvas
//    tableView.translatesAutoresizingMaskIntoConstraints=NO;
//    [screenView addSubview:tableView];
    
    
    
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
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:screenView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:screenView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    
    
    switchFlag=@"N";
    
    
    //---initialize during load
    popoverCodeValue = [[NSMutableDictionary alloc]init];
    
    
    
    UILabel *lblCustomerName = [[UILabel alloc] init];
    lblCustomerName.font = [UIFont systemFontOfSize:18];
    lblCustomerName.text=@"Customer Name";
    lblCustomerName.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblCustomerName];
    
    
    UILabel *lblDateOfBirth = [[UILabel alloc] init];
    lblDateOfBirth.font = [UIFont systemFontOfSize:18];
    lblDateOfBirth.text=@"Date Of Birth";
    lblDateOfBirth.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblDateOfBirth.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblDateOfBirth];
    
    UILabel *lblNationality = [[UILabel alloc] init];
    lblNationality.font = [UIFont systemFontOfSize:18];
    lblNationality.text=@"Nationality";
    lblNationality.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblNationality.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblNationality];

    
    UILabel *lblEmployer = [[UILabel alloc] init];
    lblEmployer.font = [UIFont systemFontOfSize:18];
    lblEmployer.text=@"Employer";
    lblEmployer.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblEmployer.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblEmployer];
    

    UILabel *lblDesignation = [[UILabel alloc] init];
    lblDesignation.font = [UIFont systemFontOfSize:18];
    lblDesignation.text=@"Designation";
    lblDesignation.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblDesignation.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblDesignation];
    

    UILabel *lblResidenceStatus = [[UILabel alloc] init];
    lblResidenceStatus.font = [UIFont systemFontOfSize:18];
    lblResidenceStatus.text=@"Residence Status";
    lblResidenceStatus.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblResidenceStatus.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblResidenceStatus];
    
    
    UILabel *lblSalaryTransfer = [[UILabel alloc] init];
    lblSalaryTransfer.font = [UIFont systemFontOfSize:18];
    lblSalaryTransfer.text=@"Salary Transfer";
    lblSalaryTransfer.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblSalaryTransfer.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblSalaryTransfer];
    

    UILabel *lblSalary = [[UILabel alloc] init];
    lblSalary.font = [UIFont systemFontOfSize:18];
    lblSalary.text=@"Salary";
    lblSalary.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblSalary.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblSalary];
    

    UILabel *lblLoanOutstanding = [[UILabel alloc] init];
    lblLoanOutstanding.font = [UIFont systemFontOfSize:18];
    lblLoanOutstanding.text=@"Loan Outstanding";
    lblLoanOutstanding.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblLoanOutstanding.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblLoanOutstanding];
    

    UILabel *lblCreditCardLimit = [[UILabel alloc] init];
    lblCreditCardLimit.font = [UIFont systemFontOfSize:18];
    lblCreditCardLimit.text=@"Credit Card Limit";
    lblCreditCardLimit.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblCreditCardLimit.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblCreditCardLimit];
    
 
    UILabel *lblAmountRequest = [[UILabel alloc] init];
    lblAmountRequest.font = [UIFont systemFontOfSize:18];
    lblAmountRequest.text=@"Request Amount";
    lblAmountRequest.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblAmountRequest.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblAmountRequest];

    UILabel *lblPassportNo = [[UILabel alloc] init];
    lblPassportNo.font = [UIFont systemFontOfSize:18];
    lblPassportNo.text=@"Passport No";
    lblPassportNo.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblPassportNo.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblPassportNo];
    
    UILabel *lblEmiratesID = [[UILabel alloc] init];
    lblEmiratesID.font = [UIFont systemFontOfSize:18];
    lblEmiratesID.text=@"Emirates ID";
    lblEmiratesID.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblEmiratesID.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblEmiratesID];
    
    lblApprovedStatus = [[UILabel alloc] init];
    lblApprovedStatus.font = [UIFont systemFontOfSize:18];
    lblApprovedStatus.text=@"";
    lblApprovedStatus.contentMode=UIControlContentHorizontalAlignmentLeft;
    lblApprovedStatus.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblApprovedStatus];
    
    
    txtCustomerName = [[UITextField alloc] init];
    txtCustomerName.borderStyle = UITextBorderStyleRoundedRect;
    txtCustomerName.layer.borderWidth=0.5;
    txtCustomerName.layer.borderColor=[UIColor blackColor].CGColor;
    txtCustomerName.layer.cornerRadius=5.0;
    txtCustomerName.font = [UIFont systemFontOfSize:18];
    txtCustomerName.placeholder = @"Enter Customer Name";
    txtCustomerName.autocorrectionType = UITextAutocorrectionTypeNo;
    txtCustomerName.keyboardType = UIKeyboardTypeDefault;
    txtCustomerName.returnKeyType = UIReturnKeyDone;
    txtCustomerName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtCustomerName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtCustomerName.delegate = self;
    txtCustomerName.tag=1;
    txtCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtCustomerName];
    
    
    txtDateOfBirth = [[UITextField alloc] init];
    txtDateOfBirth.borderStyle = UITextBorderStyleRoundedRect;
    txtDateOfBirth.layer.borderWidth=0.5;
    txtDateOfBirth.layer.borderColor=[UIColor blackColor].CGColor;
    txtDateOfBirth.layer.cornerRadius=5.0;
    txtDateOfBirth.font = [UIFont systemFontOfSize:18];
    txtDateOfBirth.placeholder = @"Enter Date Of Birth";
    txtDateOfBirth.autocorrectionType = UITextAutocorrectionTypeNo;
    txtDateOfBirth.keyboardType = UIKeyboardTypeDefault;
    txtDateOfBirth.returnKeyType = UIReturnKeyDone;
    txtDateOfBirth.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtDateOfBirth.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtDateOfBirth.delegate=self;
    txtDateOfBirth.tag=2;
    txtDateOfBirth.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtDateOfBirth];
    
    
    txtNationality = [[UITextField alloc] init];
    txtNationality.borderStyle = UITextBorderStyleRoundedRect;
    txtNationality.layer.borderWidth=0.5;
    txtNationality.layer.borderColor=[UIColor blackColor].CGColor;
    txtNationality.layer.cornerRadius=5.0;
    txtNationality.font = [UIFont systemFontOfSize:18];
    txtNationality.placeholder = @"Select Nationality";
    txtNationality.autocorrectionType = UITextAutocorrectionTypeNo;
    txtNationality.keyboardType = UIKeyboardTypeDefault;
    txtNationality.returnKeyType = UIReturnKeyDone;
    txtNationality.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtNationality.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtNationality.delegate = self;
    txtNationality.tag=3;
    txtNationality.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtNationality];
    
    
    
    txtEmployer = [[UITextField alloc] init];
    txtEmployer.borderStyle = UITextBorderStyleRoundedRect;
    txtEmployer.layer.borderWidth=0.5;
    txtEmployer.layer.borderColor=[UIColor blackColor].CGColor;
    txtEmployer.layer.cornerRadius=5.0;
    txtEmployer.font = [UIFont systemFontOfSize:18];
    txtEmployer.placeholder = @"Enter Employer";
    txtEmployer.autocorrectionType = UITextAutocorrectionTypeNo;
    txtEmployer.keyboardType = UIKeyboardTypeDefault;
    txtEmployer.returnKeyType = UIReturnKeyDone;
    txtEmployer.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtEmployer.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtEmployer.delegate = self;
    txtEmployer.tag=4;
    txtEmployer.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtEmployer];
    
    
    txtDesignation = [[UITextField alloc] init];
    txtDesignation.borderStyle = UITextBorderStyleRoundedRect;
    txtDesignation.layer.borderWidth=0.5;
    txtDesignation.layer.borderColor=[UIColor blackColor].CGColor;
    txtDesignation.layer.cornerRadius=5.0;
    txtDesignation.font = [UIFont systemFontOfSize:18];
    txtDesignation.placeholder = @"Enter Designation";
    txtDesignation.autocorrectionType = UITextAutocorrectionTypeNo;
    txtDesignation.keyboardType = UIKeyboardTypeDefault;
    txtDesignation.returnKeyType = UIReturnKeyDone;
    txtDesignation.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtDesignation.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtDesignation.delegate = self;
    txtDesignation.tag=5;
    txtDesignation.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtDesignation];
    
    
    txtResidenceStatus = [[UITextField alloc] init];
    txtResidenceStatus.borderStyle = UITextBorderStyleRoundedRect;
    txtResidenceStatus.layer.borderWidth=0.5;
    txtResidenceStatus.layer.borderColor=[UIColor blackColor].CGColor;
    txtResidenceStatus.layer.cornerRadius=5.0;
    txtResidenceStatus.font = [UIFont systemFontOfSize:18];
    txtResidenceStatus.placeholder = @"Select Residence Status";
    txtResidenceStatus.autocorrectionType = UITextAutocorrectionTypeNo;
    txtResidenceStatus.keyboardType = UIKeyboardTypeDefault;
    txtResidenceStatus.returnKeyType = UIReturnKeyDone;
    txtResidenceStatus.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtResidenceStatus.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtResidenceStatus.delegate = self;
    txtResidenceStatus.tag=6;
    txtResidenceStatus.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtResidenceStatus];
    
    
    swtSalaryTransfer = [[UISwitch alloc] init];
    swtSalaryTransfer.tag=1;
    [swtSalaryTransfer addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
    swtSalaryTransfer.tag=13;
    swtSalaryTransfer.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:swtSalaryTransfer];
    
    
    txtSalary = [[UITextField alloc] init];
    txtSalary.borderStyle = UITextBorderStyleRoundedRect;
    txtSalary.layer.borderWidth=0.5;
    txtSalary.layer.borderColor=[UIColor blackColor].CGColor;
    txtSalary.layer.cornerRadius=5.0;
    txtSalary.font = [UIFont systemFontOfSize:18];
    txtSalary.placeholder = @"Enter Salary";
    txtSalary.autocorrectionType = UITextAutocorrectionTypeNo;
    txtSalary.keyboardType = UIKeyboardTypeDefault;
    txtSalary.returnKeyType = UIReturnKeyDone;
    txtSalary.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtSalary.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtSalary.delegate = self;
    txtSalary.tag=7;
    txtSalary.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtSalary];
    
    
    txtLoanOutstanding = [[UITextField alloc] init];
    txtLoanOutstanding.borderStyle = UITextBorderStyleRoundedRect;
    txtLoanOutstanding.layer.borderWidth=0.5;
    txtLoanOutstanding.layer.borderColor=[UIColor blackColor].CGColor;
    txtLoanOutstanding.layer.cornerRadius=5.0;
    txtLoanOutstanding.font = [UIFont systemFontOfSize:18];
    txtLoanOutstanding.placeholder = @"Enter Loan Outstanding";
    txtLoanOutstanding.autocorrectionType = UITextAutocorrectionTypeNo;
    txtLoanOutstanding.keyboardType = UIKeyboardTypeDefault;
    txtLoanOutstanding.returnKeyType = UIReturnKeyDone;
    txtLoanOutstanding.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtLoanOutstanding.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtLoanOutstanding.delegate = self;
    txtLoanOutstanding.tag=8;
    txtLoanOutstanding.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtLoanOutstanding];
    
    
    txtCreditCardLimit = [[UITextField alloc] init];
    txtCreditCardLimit.borderStyle = UITextBorderStyleRoundedRect;
    txtCreditCardLimit.layer.borderWidth=0.5;
    txtCreditCardLimit.layer.borderColor=[UIColor blackColor].CGColor;
    txtCreditCardLimit.layer.cornerRadius=5.0;
    txtCreditCardLimit.font = [UIFont systemFontOfSize:18];
    txtCreditCardLimit.placeholder = @"Enter Credit Card Limit";
    txtCreditCardLimit.autocorrectionType = UITextAutocorrectionTypeNo;
    txtCreditCardLimit.keyboardType = UIKeyboardTypeDefault;
    txtCreditCardLimit.returnKeyType = UIReturnKeyDone;
    txtCreditCardLimit.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtCreditCardLimit.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtCreditCardLimit.delegate = self;
    txtCreditCardLimit.tag=9;
    txtCreditCardLimit.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtCreditCardLimit];
    
    
    txtAmountRequest = [[UITextField alloc] init];
    txtAmountRequest.borderStyle = UITextBorderStyleRoundedRect;
    txtAmountRequest.layer.borderWidth=0.5;
    txtAmountRequest.layer.borderColor=[UIColor blackColor].CGColor;
    txtAmountRequest.layer.cornerRadius=5.0;
    txtAmountRequest.font = [UIFont systemFontOfSize:18];
    txtAmountRequest.placeholder = @"Enter Amount Requested";
    txtAmountRequest.autocorrectionType = UITextAutocorrectionTypeNo;
    txtAmountRequest.keyboardType = UIKeyboardTypeDefault;
    txtAmountRequest.returnKeyType = UIReturnKeyDone;
    txtAmountRequest.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtAmountRequest.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtAmountRequest.delegate = self;
    txtAmountRequest.tag=10;
    txtAmountRequest.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtAmountRequest];
    
    
    txtPassportNo = [[UITextField alloc] init];
    txtPassportNo.borderStyle = UITextBorderStyleRoundedRect;
    txtPassportNo.layer.borderWidth=0.5;
    txtPassportNo.layer.borderColor=[UIColor blackColor].CGColor;
    txtPassportNo.layer.cornerRadius=5.0;
    txtPassportNo.font = [UIFont systemFontOfSize:18];
    txtPassportNo.placeholder = @"Enter Passport No";
    txtPassportNo.autocorrectionType = UITextAutocorrectionTypeNo;
    txtPassportNo.keyboardType = UIKeyboardTypeDefault;
    txtPassportNo.returnKeyType = UIReturnKeyDone;
    txtPassportNo.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtPassportNo.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtPassportNo.delegate = self;
    txtPassportNo.tag=11;
    txtPassportNo.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtPassportNo];
    
    
    txtEmiratesID = [[UITextField alloc] init];
    txtEmiratesID.borderStyle = UITextBorderStyleRoundedRect;
    txtEmiratesID.layer.borderWidth=0.5;
    txtEmiratesID.layer.borderColor=[UIColor blackColor].CGColor;
    txtEmiratesID.layer.cornerRadius=5.0;
    txtEmiratesID.font = [UIFont systemFontOfSize:18];
    txtEmiratesID.placeholder = @"Enter Emirates ID";
    txtEmiratesID.autocorrectionType = UITextAutocorrectionTypeNo;
    txtEmiratesID.keyboardType = UIKeyboardTypeDefault;
    txtEmiratesID.returnKeyType = UIReturnKeyDone;
    txtEmiratesID.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtEmiratesID.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtEmiratesID.delegate = self;
    txtEmiratesID.tag=12;
    txtEmiratesID.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtEmiratesID];
    
    
    


    
    
    btnCalculate = [[UIButton alloc ] init];//WithFrame:CGRectMake(120, 200, 60, 30) ];
    [btnCalculate setTitle:@"Calculate" forState:UIControlStateNormal];
    //btnLogin.titleLabel.text=@"Login";
    //[btnLogin setTitleColor:[UIColor grayColor] forState: UIControlStateNormal];
    //btnLogin.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    btnCalculate.layer.borderColor=[UIColor grayColor].CGColor;
    btnCalculate.layer.borderWidth=0.5f;
    [btnCalculate setBackgroundColor:[UIColor whiteColor]];
    [btnCalculate setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //btnLogin.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    btnCalculate.titleLabel.font = [UIFont systemFontOfSize:18];
    btnCalculate.layer.cornerRadius=5.0f;
    //btnLogin.layer.masksToBounds=YES;
    //btnLogin.clipsToBounds=YES;
    [btnCalculate addTarget:self action:@selector(doValidate) forControlEvents:UIControlEventTouchUpInside];
    btnCalculate.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnCalculate];
    
    
    
    //------customerName
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.40 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    //[self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
    //
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtUserid attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    //
    //-------Date of birth
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblDateOfBirth attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.55 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblDateOfBirth attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtDateOfBirth attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.55 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtDateOfBirth attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtDateOfBirth attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    //[self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtPassword attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.4 constant:0]];
    
    //-------Nationality
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblNationality attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblNationality attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtNationality attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtNationality attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtNationality attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    //-------Employer
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblEmployer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.85 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblEmployer attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtEmployer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.85 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtEmployer attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtEmployer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];

    
    //-------Designation
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblDesignation attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblDesignation attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtDesignation attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtDesignation attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtDesignation attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    //-------Residence Status
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblResidenceStatus attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblResidenceStatus attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceStatus attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceStatus attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceStatus attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    //-------Residence Status
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblResidenceStatus attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblResidenceStatus attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceStatus attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceStatus attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceStatus attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    //-------Salary Transfer
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSalaryTransfer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.30 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSalaryTransfer attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:swtSalaryTransfer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.30 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:swtSalaryTransfer attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.5 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:swtSalaryTransfer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    //-------Salary
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSalary attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.4 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblSalary attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtSalary attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.4 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtSalary attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.3 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtSalary attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    //-------Loan Outstanding
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblLoanOutstanding attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.55 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblLoanOutstanding attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtLoanOutstanding attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.55 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtLoanOutstanding attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.3 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtLoanOutstanding attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    //-------Credit Card Limit
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCreditCardLimit attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCreditCardLimit attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditCardLimit attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditCardLimit attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.3 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditCardLimit attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    //-------Amount Requested
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblAmountRequest attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.85 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblAmountRequest attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtAmountRequest attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.85 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtAmountRequest attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.3 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtAmountRequest attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    
    //-------Passport No
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportNo attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportNo attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.3 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    
    //-------Emirates ID
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesID attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesID attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtEmiratesID attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtEmiratesID attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.3 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtEmiratesID attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    //-------Approved Status
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblApprovedStatus attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.30 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblApprovedStatus attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    
    
    //-----Password Creation button
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCalculate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.45 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCalculate attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCalculate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnCalculate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    

    

    
    //-----------
    
    
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
    
    if (textField.tag == 1 || textField.tag==4 || textField.tag==5 || textField.tag==11 || textField.tag==12) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 50;
        
    }
    
    //Salary
    if (textField.tag == 7 || textField.tag==8 || textField.tag==9 || textField.tag==10) {
        
        
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
//    //--Customer Name
//    if (textField.tag == 4) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 35;
//        
//    }
//    
//    //--Passport No
//    if (textField.tag == 15) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 15;
//        
//    }
//    //--Passport Issue Place
//    if (textField.tag == 16) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 20;
//        
//    }
//    
//    
//    //--Emirates id
//    if (textField.tag == 20) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 15;
//        
//    }
//    
    
    
   
    
    return YES;
    
}


-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"] || [actionMode isEqualToString:@"ENQUIRY"])
    {
        return NO;
    }
    
    
    //--DOB
    else if(textField.tag==2)
    {
        [self popoverDate:textField:@"LT":NULL];
        return NO;
    }
    //--Relationship No
    else if (textField.tag ==3)
    {
        [self popoverData:textField:@"NATIONALITY"];
        return NO; //to disable keyboard

        
    }
//    //--Title
//    else if (textField.tag ==5)
//    {
//        [self popoverData:textField:@"Title"];
//        return NO;
//        
//    }
    //--Residence
    else if (textField.tag ==6)
    {
        [self popoverData:textField:@"Residence"];
        return NO;
        
    }
//    //--Branch
//    else if (textField.tag ==7)
//    {
//        [self popoverData:textField:@"Branch"];
//        return NO;
//        
//    }
//    //Joint Own
//    else if (textField.tag ==8)
//    {
//        [self popoverData:textField:@"Decision"];
//        return NO;
//        
//    }
//    
//    //Gender
//    else if(textField.tag==9)
//    {
//        [self popoverData:textField:@"Gender"];
//        return NO; //to disable keyboard
//    }
//    
//    //Residence Status
//    else if (textField.tag ==10)
//    {
//        [self popoverData:textField:@"Residence"];
//        return NO;
//        
//    }
//    //Nationality
//    else if(textField.tag==11)
//    {
//        [self popoverData:textField:@"NATIONALITY"];
//        return NO; //to disable keyboard
//    }
//    //DOB
//    else if (textField.tag ==12)
//    {
//        [self popoverDate:textField:@"LT":NULL];
//        return NO;
//        
//    }
//    
//    //Education
//    else if(textField.tag==13)
//    {
//        [self popoverData:textField:@"Education"];
//        return NO; //to disable keyboard
//    }
//    //Marital Status
//    else if (textField.tag ==14)
//    {
//        [self popoverData:textField:@"MaritalStatus"];
//        return NO;
//        
//    }
//    
//    
//    //Passport issue Date
//    else if(textField.tag==17)
//    {
//        [self popoverDate:textField :@"LT":NULL];
//        return NO; //to disable keyboard
//    }
//    //Passport Expiry Date
//    else if(textField.tag==18)
//    {
//        [self popoverDate:textField :@"GT":NULL];
//        return NO; //to disable keyboard
//    }
//    //--passport issue country
//    else if(textField.tag==19)
//    {
//        [self popoverData:textField:@"NATIONALITY"];
//        return NO; //to disable keyboard
//    }
//    
//    //--emirates id expiry date
//    else if(textField.tag==21)
//    {
//        [self popoverDate:textField :@"GT":NULL];
//        return NO; //to disable keyboard
//    }
    
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
//15JUL2016
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
    
    
    return 12;
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
        
        return @" Customer Details";
        
    }
    else if(section == 3)
    {
        
        return @" ID Details";
        
    }
    else if(section == 8)
    {
        
        return @" Passport Details";
        
    }
    else if(section == 15)
    {
        
        return @" ID Details";
        
    }
    else if(section == 25)
    {
        
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
    return 0.0f;
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
        
        

            
        
        
        
            
            
        }
        

    

    
    
    return cell;
}


// Implement something like this in your UITableViewController subclass
// or in the delegate object you use to manage your table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    
    
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
    if([CommonUtils checkEmptyString:txtDateOfBirth.text]==YES)
    {
        
        [CommonUtils showMessage:@"Date Of Birth can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtNationality.text]==YES)
    {
        
        [CommonUtils showMessage:@"Nationality can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtEmployer.text]==YES)
    {
        
        [CommonUtils showMessage:@"Employer can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtDesignation.text]==YES)
    {
        
        [CommonUtils showMessage:@"Designation can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtResidenceStatus.text]==YES)
    {
        
        [CommonUtils showMessage:@"Residence Status can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtSalary.text]==YES)
    {
        
        [CommonUtils showMessage:@"Salary can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtAmountRequest.text]==YES)
    {
        
        [CommonUtils showMessage:@"Request Amount can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }

//    if([CommonUtils checkEmptyString:txtPassportNo.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Passport Number can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    
//     if([CommonUtils checkEmptyString:txtEmiratesID.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Emirates Id can't be blank":self];
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
    //NSData *newData;
  
    
    
    
    
    
    NSLog(@"action mode in personal %@",actionMode);
    
        //--
    

    
    
    @try{
        
        

        
        NSLog(@"RefNo %@",self.refNo);
        
        
        //-------
        
        jsonDictionary= @{
                   
                          @"customerName":emptyStringIfNil(self.txtCustomerName.text),
                          @"dateOfBirth":emptyStringIfNil(self.txtDateOfBirth.text),
                          @"nationality":emptyStringIfNil(self.txtNationality.text),
                          //@"nationality":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtNationality.tag]]),
                          @"employer":emptyStringIfNil(self.txtEmployer.text),
                          @"designation":emptyStringIfNil(self.txtDesignation.text),
                          @"residenceStatus":emptyStringIfNil(self.txtResidenceStatus.text),
                          @"salaryTransfer":emptyStringIfNil(switchFlag),
                          @"salary":emptyStringIfNil(self.txtSalary.text),
                          @"loanOutstanding":emptyStringIfNil(self.txtLoanOutstanding.text),
                          @"creditCardLimit":emptyStringIfNil(self.txtCreditCardLimit.text),
                          @"amountRequest":emptyStringIfNil(self.txtAmountRequest.text),
                          @"passportNo":emptyStringIfNil(self.txtPassportNo.text),
                          @"emiratesID":emptyStringIfNil(self.txtEmiratesID.text)
                  
                          };
        
        
        
        //NSString *jsonString = [container JSONRepresentation];
        NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
        
        //            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //            {
        //
        //                newData=[CommonUtils connectHost :@"fetchPersonalDetails" :jsonDictionary:self];
        //                [self parseResponse:newData:@"fetchPersonalDetails":@"personalDetailsWrapper"];
        //
        //            }
        //if([actionMode isEqualToString:@"NEW"])// && [viewMode isEqualToString:@"N"])
        //{
        
        
        //newData=[CommonUtils connectHost :@"loanCalculator" :jsonDictionary:self];
        //[self parseResponse:newData:@"loanCalculator":@"loanCalculatorWrapper"];
        
            
            
            //viewMode=@"N";
        //}
 
        
        
        
        
        //------Business Error Validation
        
        if([errorArray count]>0)
        {
            NSString *errorString=@"";
            
            for (int i=0; i<=errorArray.count-1; i++)
            {
                
                errorData = [errorArray objectAtIndex:i];
                
                
                NSString *errString=[NSString stringWithFormat:@"%@ - %@\n",errorData.errorCode,errorData.errorDesc];
                
                
                errorString =[errorString stringByAppendingString:errString];
                
            }
            
            [CommonUtils showMessage:errorString :self];
            
            return;
        }
        
        
        //--------------
        
        self.refNo=calculatorData.refNo;
        
        NSLog(@"RefNo %@",self.refNo);
        
        //NSLog(@"ViewMode %@",self.viewMode);
        
        //---invoke next screen---
        //if([viewMode isEqualToString:@"N"])
        //{
        NSLog(@"To invoke next screen");
        
        
        
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
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //{
        //NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
        //}
        
        //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
        //{
        
        //NSData *newData=[CommonUtils connectHost :@"fetchPersonalDetails" :jsonDictionary:self];
        //[self parseResponse:newData:@"fetchPersonalDetails":@"personalDetailsWrapper"];
        
        
        //}
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Personal viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in Personal viewData Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}







//-(void) loadData {
//    
//    
//    @try{
//        
//        
//        
//        
//        
//        
//        calculatorData = [personalArray objectAtIndex:0];
//        NSLog(@"switchflag %@",switchFlag);
//        [self operateSwitch:switchFlag];
//        txtRefNo.text=emptyStringIfNil(calculatorData.refNo);
//        txtCustomerName.text=emptyStringIfNil(calculatorData.customerName);
//        
//        txtResidenceStatus.text=emptyStringIfNil(calculatorData.residenceStatusValue);
//        txtNationality.text=emptyStringIfNil(calculatorData.nationalityValue);
//        //    txtSegment.text=emptyStringIfNil(calculatorData.segment);
//        
//        
//        txtPassportNo.text=emptyStringIfNil(calculatorData.passportNo);
//        txtEmiratesID.text=emptyStringIfNil(calculatorData.emiratesID);
//        
//        
//        [popoverCodeValue setObject:emptyStringIfNil(self.calculatorData.residenceStatus) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtResidenceStatus.tag]];
//        [popoverCodeValue setObject:emptyStringIfNil(self.calculatorData.nationality) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtNationality.tag]];
//        
//        NSLog(@"cell data loaded ");
//        
//    }
//    
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in Load Data code %@ reason %@ " , [exception name], [exception reason]);
//        [CommonUtils showMessage:[exception reason] :self];
//        
//        
//    }
//    @finally {
//        
//        NSLog(@"finally in Load Data Code");
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//    }
//    
//    
//    
//}






- (void) parseResponse:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
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
                dataArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    calculatorData = [[CalculatorData alloc] initWithJSONDictionary:dict];
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    
                    
                    // Add the Location object to the array
                    [dataArray addObject:calculatorData];
                    
                    
                    if([calculatorData.responseStatus boolValue] == YES)
                    {
                        
                        if([calculatorData.approved boolValue] == YES)
                            
                        {
                            lblApprovedStatus.textColor=[UIColor greenColor];
                            lblApprovedStatus.text=@"Approved";
                            

                        }
                        else{
                            
                            lblApprovedStatus.textColor=[UIColor redColor];
                            lblApprovedStatus.text=@"Rejected";
                        }
                    }
                    else{
                        
                        lblApprovedStatus.textColor=[UIColor redColor];
                        lblApprovedStatus.text=@"FAILURE response from Rule Engine";
                    }
                }
                
                
                NSLog(@"data count %lu",(unsigned long)dataArray.count);
                
                
                // Create a new array to hold the locations
                errorArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *subArray = [dataDictionary objectForKey:@"errorWrapper"];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in subArray) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    errorData = [[ErrorData alloc] initWithJSONDictionary:dict];
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    
                    
                    // Add the Location object to the array
                    [errorArray addObject:errorData];
                    
                    
                }
                
                
                
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
    NSLog(@"This was returned from PopoverViewController %ld", (long)fieldTag);
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

- (void)changeSwitch:(id)sender{
    if([sender isOn]){
        switchFlag=@"Y";
        NSLog(@"Switch is ON");

        
    } else{
        switchFlag=@"N";
        
    }
}

- (void)operateSwitch:(NSString*)sender{
    if([sender isEqualToString:@"Y"]){
        [swtSalaryTransfer setOn:YES animated:YES];
        NSLog(@"Switch is ON");
    } else{
        [swtSalaryTransfer setOn:NO animated:YES];
        NSLog(@"Switch is OFF");
    }
}



-(void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//static inline NSString* pathStringIfNil(NSString *value) {
//    
//    return ([value isEqualToString:@"Y"]? @"100" : @"0");
//}



@end



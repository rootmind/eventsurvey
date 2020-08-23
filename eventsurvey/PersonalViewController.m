//
//  PersonalViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 22/08/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#import "PersonalViewController.h"
#import "PersonalData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
//#import "IdentificationViewController.h"
//#import "DedupViewController.h"
#import "QueueViewController.h"






@interface PersonalViewController ()


@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

//#define kOFFSET_FOR_KEYBOARD 80.0

CGFloat lblConstraintPerX=0.52f;
CGFloat lblConstraintPerY=1.0f;
CGFloat lblConstraintPerWidth=0.5f;
CGFloat lblConstraintPerHeight=0.8f;

CGFloat constraintPerX=1.19f;
CGFloat constraintPerY=1.0f;
CGFloat constraintPerWidth=0.80f;
CGFloat constraintPerHeight=0.8f;

CGFloat constraintPer1X=0.69f;
CGFloat constraintPer1Y=1.0f;
CGFloat constraintPer1Width=0.3f;
CGFloat constraintPer1Height=0.8f;

CGFloat lblConstraintPer2X=1.52f;
CGFloat lblConstraintPer2Y=1.0f;
CGFloat lblConstraintPer2Width=0.5f;
CGFloat lblConstraintPer2Height=0.8f;

CGFloat constraintPer2X=1.69f;
CGFloat constraintPer2Y=1.0f;
CGFloat constraintPer2Width=0.3f;
CGFloat constraintPer2Height=0.8f;


@implementation PersonalViewController


//@synthesize userid;
//@synthesize sessionid;
@synthesize actionMode;
@synthesize menuName;
//@synthesize viewMode;

//@synthesize onBoardDataKeyData;
//@synthesize onBoardDataValueData;
@synthesize dataDictionary;



@synthesize personalArray;
@synthesize personalData;

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



@synthesize accountType;
@synthesize refNo;
@synthesize existingCustomerFlag;
@synthesize existingRefNo;
@synthesize txtRefNo;
@synthesize swtExistingCustomer;
@synthesize txtExtRelation;
@synthesize txtExtRelationNo;

@synthesize txtCustomerName;
@synthesize txtFirstName;
@synthesize txtMiddleName;
@synthesize txtLastName;


@synthesize txtTitle;
@synthesize txtCategoryType;
@synthesize txtBranch;
@synthesize txtJointOwn;
@synthesize txtNatureOfRelation;
@synthesize txtResidenceStatus;
@synthesize txtNationality;
@synthesize txtDateOfBirth;
@synthesize txtEducation;
@synthesize txtMaritalStatus;
@synthesize txtGender;

//@synthesize txtMotherMaidenName;
//@synthesize txtSegment;
//@synthesize txtPreferredLang;
//@synthesize txtFamilyUAE;
//@synthesize txtFamilySize;
//@synthesize txtCarOwnership;
//@synthesize txtCarYear;
//@synthesize txtMedia;
//@synthesize txtFavCity;
//@synthesize txtDomicile;

@synthesize txtPassportNo;
@synthesize txtPassportExpDate;
@synthesize txtPassportIssueDate;
@synthesize txtPassportIssuePlace;
@synthesize txtPassportIssueCountry;
@synthesize txtEmiratesId;
@synthesize txtEmiratesIdExpDate;

@synthesize errorArray;
@synthesize errorData;


@synthesize recordStatus;
@synthesize btnExtRelationshipNo;

@synthesize popoverCodeValue;
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
    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
    [self.splitViewController.displayModeButtonItem action];
    
    
//    self.navigationItem.title= [NSString stringWithFormat:@"%@ - %@",self.menuName,@"Personal Details"];//@"Personal Detaills";
    self.navigationItem.title= @"Personal Details";
    
    
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
    
    
    
    
    switchFlag=@"N";
    
    
    
//    timerView = [[UILabel alloc] init];
//    timerView.layer.borderWidth=1.0;
//    timerView.layer.borderColor=[UIColor whiteColor].CGColor;
//    timerView.layer.shadowRadius=10.0;
//    timerView.backgroundColor = [UIColor whiteColor];
//    timerView.layer.shadowOffset = CGSizeMake(0, 3);
//    timerView.layer.shadowRadius = 10.0;
//    timerView.layer.shadowColor = [UIColor blackColor].CGColor;
//    timerView.layer.shadowOpacity = 0.8;
//    timerView.layer.cornerRadius = 15.0;
//    timerView.translatesAutoresizingMaskIntoConstraints=NO;
//    [self.view addSubview:timerView];
//    
//    //---timer UIView
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.35 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
//    
//    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:timerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
//    
//    secondsLeft = 16925;
//    [self countdownTimer];

    
    UIButton *enameView = [[UIButton alloc] init];
    [enameView setTitle:@"eName Check" forState:UIControlStateNormal];
    [enameView setTitleColor:[UIColor gambogeColor] forState:UIControlStateNormal];
    enameView.titleLabel.font = [UIFont systemFontOfSize:30];
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
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.75 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:enameView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];

    UIButton *btnDedup = [[UIButton alloc] init];
    [btnDedup setTitle:@"Dedup" forState:UIControlStateNormal];
    [btnDedup setTitleColor:[UIColor deepvermilionColor] forState:UIControlStateNormal];
    btnDedup.titleLabel.font = [UIFont systemFontOfSize:30];
    btnDedup.layer.borderWidth=1.0;
    btnDedup.layer.borderColor=[UIColor whiteColor].CGColor;
    btnDedup.layer.shadowRadius=10.0;
    btnDedup.backgroundColor = [UIColor whiteColor];
    btnDedup.layer.shadowOffset = CGSizeMake(0, 3);
    btnDedup.layer.shadowRadius = 10.0;
    btnDedup.layer.shadowColor = [UIColor blackColor].CGColor;
    btnDedup.layer.shadowOpacity = 0.8;
    btnDedup.layer.cornerRadius = 15.0;
    
    [btnDedup addTarget:self action:@selector(doDedup:) forControlEvents:UIControlEventTouchUpInside];
    btnDedup.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnDedup];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDedup attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.50 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDedup attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.7 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDedup attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnDedup attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    

    
    
    [self viewPathStatus];
    

    [self displayGraph];
    
    
    
    //---initialize during load
    popoverCodeValue = [[NSMutableDictionary alloc]init];
    
    
    
    //--when not new
    if([actionMode isEqualToString:@"UPDATE"] || [actionMode isEqualToString:@"ENQUIRY"])// && [viewMode isEqualToString:@"Y"])
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
    
     //Relationship Number
    if (textField.tag == 3) {
        
        
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
    //--Customer Name
    if (textField.tag == 4) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 35;
        
    }
    
    //--Passport No
    if (textField.tag == 15) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    //--Passport Issue Place
    if (textField.tag == 16) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 20;
        
    }
  
    
    //--Emirates id
    if (textField.tag == 20) {
        
        
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
    //        if ([textField isEqual: txtDOB])
    //        {
    //            [self setDate:txtDOB];
    //            return NO;
    //
    //        }
    //        else if([textField isEqual:txtNationality])
    //        {
    //            [self popoverData:txtNationality:@"NATIONALITY"];
    //            return NO; //to disable keyboard
    //        }
    //        else if([textField isEqual:txtJointOwn])
    //        {
    //            [self popoverData:txtJointOwn:@"JOINTOWN"];
    //            return NO; //to disable keyboard
    //        }
    
    //NSLog(@"fieldTag %ld", (long)textField.tag);
    
    
    
    
    //--Existing Relationship
    else if(textField.tag==2)
    {
         //-- Restrict User To Enter Text
        if ([switchFlag isEqualToString:@"Y"])
        {
            [self popoverData:textField:@"ExistingRelationship"];
            
            return NO; //to disable keyboard
        }
        else
            return NO;
     }
    //--Relationship No
    else if (textField.tag ==3)
    {
        
        if ([switchFlag isEqualToString:@"N"])
        {
            
            return NO;
        }
  
        else
        
            return YES;
       
        
    }
    //--Title
    else if (textField.tag ==5)
    {
        [self popoverData:textField:@"Title"];
        return NO;
        
    }
    //--Category Type
    else if (textField.tag ==6)
    {
        [self popoverData:textField:@"CategoryType"];
        return NO;
        
    }
    //--Branch
    else if (textField.tag ==7)
    {
        [self popoverData:textField:@"Branch"];
        return NO;
        
    }
    //Joint Own
    else if (textField.tag ==8)
    {
        [self popoverData:textField:@"Decision"];
        return NO;
        
    }
//    //Nature of Relation
//    else if (textField.tag ==9)
//    {
//        [self popoverData:textField:@"NATUREOFRELATION"];
//        return NO;
//        
//    }
    //Gender
    else if(textField.tag==9)
    {
        [self popoverData:textField:@"Gender"];
        return NO; //to disable keyboard
    }
   
    //Residence Status
    else if (textField.tag ==10)
    {
        [self popoverData:textField:@"Residence"];
        return NO;
        
    }
    //Nationality
    else if(textField.tag==11)
    {
        [self popoverData:textField:@"NATIONALITY"];
        return NO; //to disable keyboard
    }
    //DOB
    else if (textField.tag ==12)
    {
        [self popoverDate:textField:@"LT":NULL];
        return NO;
        
    }

       //Education
    else if(textField.tag==13)
    {
        [self popoverData:textField:@"Education"];
        return NO; //to disable keyboard
    }
    //Marital Status
    else if (textField.tag ==14)
    {
        [self popoverData:textField:@"MaritalStatus"];
        return NO;
        
    }
  
//    //Preferred Language
//    else if (textField.tag ==16)
//    {
//        [self popoverData:textField:@"PREFERREDLANGUAGE"];
//        return NO;
//        
//    }
//    //Family In UAE
//    else if(textField.tag==17)
//    {
//        [self popoverData:textField:@"DECISION"];
//        return NO; //to disable keyboard
//    }
//    //Family Size In UAE
//    else if(textField.tag==18)
//    {
//        [self popoverData:textField:@"NUMBER"];
//        return NO; //to disable keyboard
//    }
//    //Car Ownership
//    else if(textField.tag==19)
//    {
//        [self popoverData:textField:@"DECISION"];
//        return NO; //to disable keyboard
//    }
//    //Car Year
//    else if(textField.tag==20)
//    {
//        [self popoverDate:textField:NULL:@"YYYY"];
//        return NO; //to disable keyboard
//    }
//    //--Media
//    else if(textField.tag==21)
//    {
//        [self popoverData:textField:@"MEDIA"];
//        return NO; //to disable keyboard
//    }
//    //Favourite City
//    else if(textField.tag==22)
//    {
//        [self popoverData:textField:@"FAVOURITECITY"];
//        return NO; //to disable keyboard
//    }
//    
    
    //Passport issue Date
    else if(textField.tag==17)
    {
        [self popoverDate:textField :@"LT":NULL];
        return NO; //to disable keyboard
    }
    //Passport Expiry Date
    else if(textField.tag==18)
    {
        [self popoverDate:textField :@"GT":NULL];
        return NO; //to disable keyboard
    }
    //--passport issue country
    else if(textField.tag==19)
    {
        [self popoverData:textField:@"NATIONALITY"];
        return NO; //to disable keyboard
    }
    
    //--emirates id expiry date
    else if(textField.tag==21)
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
            
            CommonLabel *lblExtCustomerFlag=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblExtCustomerFlag.text=@"Existing Customer";
            lblExtCustomerFlag.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblExtCustomerFlag];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtCustomerFlag attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtCustomerFlag attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtCustomerFlag attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtCustomerFlag attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
            
            
            swtExistingCustomer = [[UISwitch alloc] init];
            swtExistingCustomer.tag=1;
            [swtExistingCustomer addTarget:self action:@selector(changeSwitch:) forControlEvents:UIControlEventValueChanged];
            swtExistingCustomer.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:swtExistingCustomer];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:swtExistingCustomer attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:swtExistingCustomer attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:swtExistingCustomer attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:swtExistingCustomer attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
            
            
            CommonLabel *lblRefNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblRefNo.text=@"Ref No";
            lblRefNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblRefNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRefNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRefNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRefNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblRefNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
            
            
            txtRefNo = [[CommonTextField alloc] init];
            //txtRefNo.tag=3;
            txtRefNo.delegate=self;
            txtRefNo.placeholder=@"Ref No";
            txtRefNo.enabled=NO;
            txtRefNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtRefNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRefNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRefNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRefNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtRefNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
            
            
        }
        else if(indexPath.section==1)
        {
            
            CommonLabel *lblExtRelation=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblExtRelation.text=@"Existing Relationship";
            lblExtRelation.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblExtRelation];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelation attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelation attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelation attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelation attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
            
            
            txtExtRelation = [[CommonTextField alloc] init];
            txtExtRelation.tag=2;
            txtExtRelation.delegate=self;
            txtExtRelation.placeholder=@"Select Existing Relationship";
            txtExtRelation.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtExtRelation];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelation attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelation attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelation attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelation attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
            
            
            CommonLabel *lblExtRelationNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblExtRelationNo.text=@"Relationship No";
            lblExtRelationNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblExtRelationNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelationNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelationNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelationNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblExtRelationNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
            
            
            txtExtRelationNo = [[CommonTextField alloc] init];
            txtExtRelationNo.tag=3;
            txtExtRelationNo.delegate=self;
            txtExtRelationNo.placeholder=@"Relationship No";
            txtExtRelationNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtExtRelationNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelationNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:1.6 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelationNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelationNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtExtRelationNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
            
            
            
            
            btnExtRelationshipNo =  [[UIButton alloc] init];
            //[btnExtRelationshipNo setTitle:@"Relation" forState:UIControlStateNormal];
            [btnExtRelationshipNo setImage:[[UIImage imageNamed:@"backpack.png" ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
            [btnExtRelationshipNo setTintColor:[UIColor redColor]];
            //btnExtRelationshipNo.tintColor=[UIColor blueColor];
            //[btnExtRelationshipNo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            //btnExtRelationshipNo.titleLabel.font = [UIFont systemFontOfSize:10];
            btnExtRelationshipNo.layer.borderWidth=1.0;
            
            btnExtRelationshipNo.layer.borderColor=[UIColor lightBlueColor].CGColor;
            //btnExtRelationshipNo.layer.shadowRadius=10.0;
            btnExtRelationshipNo.backgroundColor = [UIColor whiteColor];
            
           
            //btnExtRelationshipNo.layer.shadowOffset = CGSizeMake(0, 3);
            //btnExtRelationshipNo.layer.shadowRadius = 10.0;
            //btnExtRelationshipNo.layer.shadowColor = [UIColor blackColor].CGColor;
            //btnExtRelationshipNo.layer.shadowOpacity = 0.8;
            btnExtRelationshipNo.layer.cornerRadius = 15.0;
            
            [btnExtRelationshipNo addTarget:self action:@selector(doValidateExistingCustomer) forControlEvents:UIControlEventTouchUpInside];
            btnExtRelationshipNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell addSubview:btnExtRelationshipNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:btnExtRelationshipNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:1.9 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:btnExtRelationshipNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:btnExtRelationshipNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:0.05 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:btnExtRelationshipNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
            
   
            
        }
        else if(indexPath.section==2)
        {
            
            CommonLabel *lblCustomerName=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCustomerName.text=@"Customer Name";
            lblCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCustomerName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
            
            
            txtCustomerName = [[CommonTextField alloc] init];
            txtCustomerName.tag=4;
            txtCustomerName.delegate=self;
            txtCustomerName.placeholder=@"Customer Name";
            txtCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCustomerName];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPerY constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPerHeight constant:0]];
            
            
            
        }
//        else if(indexPath.section==2)
//        {
//            
//            CommonLabel *lblFirstName=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblFirstName.text=@"First Name";
//            lblFirstName.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblFirstName];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFirstName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFirstName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFirstName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFirstName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
//            
//            
//            txtFirstName = [[CommonTextField alloc] init];
//            txtFirstName.tag=52;
//            txtFirstName.delegate=self;
//            txtFirstName.placeholder=@"First Name";
//            txtFirstName.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtFirstName];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFirstName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFirstName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFirstName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFirstName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
//            
//            
//            
//            CommonLabel *lblMiddleName=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblMiddleName.text=@"Middle Name";
//            lblMiddleName.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblMiddleName];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMiddleName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMiddleName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMiddleName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMiddleName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
//            
//            
//            txtMiddleName = [[CommonTextField alloc] init];
//            txtMiddleName.tag=51;
//            txtMiddleName.delegate=self;
//            txtMiddleName.placeholder=@"Middle Name";
//            txtMiddleName.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtMiddleName];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMiddleName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMiddleName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMiddleName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMiddleName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
//            
//            
//        }
        else if(indexPath.section==3)
        {
            
            CommonLabel *lblTitle=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblTitle.text=@"Title";
            lblTitle.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblTitle];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTitle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTitle attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTitle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblTitle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
            
            
            txtTitle= [[CommonTextField alloc] init];
            txtTitle.tag=5;
            txtTitle.delegate=self;
            txtTitle.placeholder=@"Title";
            txtTitle.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtTitle];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTitle attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTitle attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTitle attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtTitle attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
            
            
            CommonLabel *lblCategoryType=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCategoryType.text=@"Category Type";
            lblCategoryType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCategoryType];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCategoryType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCategoryType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCategoryType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCategoryType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
            
            
            txtCategoryType = [[CommonTextField alloc] init];
            txtCategoryType.tag=6;
            txtCategoryType.delegate=self;
            txtCategoryType.placeholder=@"Category Type";
            txtCategoryType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCategoryType];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCategoryType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCategoryType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCategoryType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCategoryType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
            
            
        }
        else if(indexPath.section==4)
        {
            
            CommonLabel *lblBranch=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblBranch.text=@"Branch";
            lblBranch.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblBranch];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBranch attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBranch attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBranch attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBranch attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
            
            
            txtBranch= [[CommonTextField alloc] init];
            txtBranch.tag=7;
            txtBranch.delegate=self;
            txtBranch.placeholder=@"Branch";
            txtBranch.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtBranch];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBranch attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBranch attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBranch attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBranch attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
            
            
            CommonLabel *lblJointOwn=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblJointOwn.text=@"Joint Own";
            lblJointOwn.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblJointOwn];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblJointOwn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblJointOwn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblJointOwn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblJointOwn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
            
            
            txtJointOwn = [[CommonTextField alloc] init];
            txtJointOwn.tag=8;
            txtJointOwn.delegate=self;
            txtJointOwn.placeholder=@"Joint Own";
            txtJointOwn.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtJointOwn];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtJointOwn attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtJointOwn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtJointOwn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtJointOwn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
            
            
        }
        
        
        else if(indexPath.section==5)
        {
            
            CommonLabel *lblGender=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblGender.text=@"Gender";
            lblGender.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblGender];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblGender attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblGender attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblGender attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblGender attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
            
            
            txtGender= [[CommonTextField alloc] init];
            txtGender.tag=9;
            txtGender.delegate=self;
            txtGender.placeholder=@"Gender";
            txtGender.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtGender];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtGender attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtGender attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtGender attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtGender attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
            
//            CommonLabel *lblNatureofRelation=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblNatureofRelation.text=@"Nature of Relation";
//            lblNatureofRelation.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblNatureofRelation];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNatureofRelation attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNatureofRelation attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNatureofRelation attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNatureofRelation attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
//            
//            
//            txtNatureOfRelation= [[CommonTextField alloc] init];
//            txtNatureOfRelation.tag=9;
//            txtNatureOfRelation.delegate=self;
//            txtNatureOfRelation.placeholder=@"Nature of Relation";
//            txtNatureOfRelation.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtNatureOfRelation];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNatureOfRelation attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNatureOfRelation attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNatureOfRelation attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNatureOfRelation attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
            
            
            CommonLabel *lblResidenceStatus=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblResidenceStatus.text=@"Residence Status";
            lblResidenceStatus.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblResidenceStatus];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResidenceStatus attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResidenceStatus attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResidenceStatus attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblResidenceStatus attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
            
            
            txtResidenceStatus = [[CommonTextField alloc] init];
            txtResidenceStatus.tag=10;
            txtResidenceStatus.delegate=self;
            txtResidenceStatus.placeholder=@"Residence Status";
            txtResidenceStatus.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtResidenceStatus];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceStatus attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceStatus attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceStatus attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtResidenceStatus attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
            
            
        }
        
        
        
        
        
        else if(indexPath.section==6)
        {
            
            CommonLabel *lblNationality=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblNationality.text=@"Nationality";
            lblNationality.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblNationality];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNationality attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNationality attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNationality attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblNationality attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
            
            
            txtNationality= [[CommonTextField alloc] init];
            txtNationality.tag=11;
            txtNationality.delegate=self;
            txtNationality.placeholder=@"Nationality";
            txtNationality.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtNationality];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNationality attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNationality attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNationality attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtNationality attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
            
            
            CommonLabel *lblDateofbirth=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblDateofbirth.text=@"Date Of Birth";
            lblDateofbirth.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblDateofbirth];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDateofbirth attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDateofbirth attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDateofbirth attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblDateofbirth attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
            
            
            txtDateOfBirth = [[CommonTextField alloc] init];
            txtDateOfBirth.tag=12;
            txtDateOfBirth.delegate=self;
            txtDateOfBirth.placeholder=@"Date Of Birth";
            txtDateOfBirth.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtDateOfBirth];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDateOfBirth attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDateOfBirth attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDateOfBirth attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtDateOfBirth attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
            
            
        }
        
        
        
        
        else if(indexPath.section==7)
        {
            
            CommonLabel *lblEducation=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblEducation.text=@"Education";
            lblEducation.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblEducation];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEducation attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEducation attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEducation attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEducation attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
            
            
            txtEducation= [[CommonTextField alloc] init];
            txtEducation.tag=13;
            txtEducation.delegate=self;
            txtEducation.placeholder=@"Education";
            txtEducation.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtEducation];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEducation attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEducation attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEducation attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEducation attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
            
            
            CommonLabel *lblMaritalStatus=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblMaritalStatus.text=@"Marital Status";
            lblMaritalStatus.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblMaritalStatus];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaritalStatus attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaritalStatus attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaritalStatus attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMaritalStatus attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
            
            
            txtMaritalStatus = [[CommonTextField alloc] init];
            txtMaritalStatus.tag=14;
            txtMaritalStatus.delegate=self;
            txtMaritalStatus.placeholder=@"Marital Status";
            txtMaritalStatus.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtMaritalStatus];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaritalStatus attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaritalStatus attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaritalStatus attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMaritalStatus attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
            
            
        }
        

        if(indexPath.section==8)
        {
            
            CommonLabel *lblPassportNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPassportNo.text=@"Passport No";
            lblPassportNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPassportNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
            
            
            txtPassportNo=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtPassportNo.tag=15;
            txtPassportNo.delegate=self;
            txtPassportNo.placeholder=@"Passport No";
            txtPassportNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPassportNo];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
            
            
            CommonLabel *lblPassportIssuePlace=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPassportIssuePlace.text=@"Passport Issue Place";
            lblPassportIssuePlace.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPassportIssuePlace];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssuePlace attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssuePlace attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssuePlace attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssuePlace attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
            
            
            txtPassportIssuePlace = [[CommonTextField alloc] init];
            txtPassportIssuePlace.tag=16;
            txtPassportIssuePlace.delegate=self;
            txtPassportIssuePlace.placeholder=@"Passport Issue Place";
            txtPassportIssuePlace.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPassportIssuePlace];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssuePlace attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssuePlace attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssuePlace attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssuePlace attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
            
            
            
            
        }
        else if(indexPath.section==9)
        {
            
            CommonLabel *lblPassportIssueDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPassportIssueDate.text=@"Passport Issue Date";
            lblPassportIssueDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPassportIssueDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
            
            
            txtPassportIssueDate = [[CommonTextField alloc] init];
            txtPassportIssueDate.tag=17;
            txtPassportIssueDate.delegate=self;
            txtPassportIssueDate.placeholder=@"Passport Issue Date";
            txtPassportIssueDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPassportIssueDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
            
            
            CommonLabel *lblPassportExpDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPassportExpDate.text=@"Passport Expiry Date";
            lblPassportExpDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPassportExpDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
            
            
            txtPassportExpDate = [[CommonTextField alloc] init];
            txtPassportExpDate.tag=18;
            txtPassportExpDate.delegate=self;
            txtPassportExpDate.placeholder=@"Passport Expiry Date";
            txtPassportExpDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPassportExpDate];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
            
            
        }
        else if(indexPath.section==10){
            
            CommonLabel *lblPassportIssueCountry=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPassportIssueCountry.text=@"Passport Issue Cntry";
            lblPassportIssueCountry.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPassportIssueCountry];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueCountry attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueCountry attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueCountry attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPassportIssueCountry attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
            
            
            txtPassportIssueCountry=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtPassportIssueCountry.tag=19;
            txtPassportIssueCountry.delegate=self;
            txtPassportIssueCountry.placeholder=@"Passport Issue Country";
            txtPassportIssueCountry.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPassportIssueCountry];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueCountry attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueCountry attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueCountry attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPassportIssueCountry attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
            
            
            
            CommonLabel *lblEmiratesId=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblEmiratesId.text=@"Emirates Id";
            lblEmiratesId.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblEmiratesId];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesId attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesId attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesId attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesId attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
            
            
            
            txtEmiratesId=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtEmiratesId.tag=20;
            txtEmiratesId.delegate=self;
            txtEmiratesId.placeholder=@"Emirates Id";
            txtEmiratesId.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtEmiratesId];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEmiratesId attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEmiratesId attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEmiratesId attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEmiratesId attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
            
            
            
            
        }
        
        else if(indexPath.section==11){
            

            
            
            
            
            CommonLabel *lblEmiratesExpDate=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblEmiratesExpDate.text=@"Emirates Id Exp Dt";
            lblEmiratesExpDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblEmiratesExpDate];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblEmiratesExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
            
            
          
            
            txtEmiratesIdExpDate = [[CommonTextField alloc] init];
            txtEmiratesIdExpDate.tag=21;
            txtEmiratesIdExpDate.delegate=self;
            txtEmiratesIdExpDate.placeholder=@"Emirtaes id Exp Date";
            txtEmiratesIdExpDate.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtEmiratesIdExpDate];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEmiratesIdExpDate attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEmiratesIdExpDate attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEmiratesIdExpDate attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtEmiratesIdExpDate attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
            
            

            
            
            
            
            
        }
        
        

//        else if(indexPath.section==8)
//        {
//
//            CommonLabel *lblGender=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblGender.text=@"Gender";
//            lblGender.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblGender];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblGender attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblGender attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblGender attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblGender attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
//
//
//            txtGender= [[CommonTextField alloc] init];
//            txtGender.tag=15;
//            txtGender.delegate=self;
//            txtGender.placeholder=@"Gender";
//            txtGender.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtGender];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtGender attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtGender attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
//
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtGender attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtGender attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];


//            CommonLabel *lblPreferredLangauge=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblPreferredLangauge.text=@"Preferred Langauge";
//            lblPreferredLangauge.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblPreferredLangauge];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreferredLangauge attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreferredLangauge attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreferredLangauge attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPreferredLangauge attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
//
//
//            txtPreferredLang = [[CommonTextField alloc] init];
//            txtPreferredLang.tag=16;
//            txtPreferredLang.delegate=self;
//            txtPreferredLang.placeholder=@"Preferred Langauge";
//            txtPreferredLang.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtPreferredLang];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreferredLang attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreferredLang attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
//
//
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreferredLang attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPreferredLang attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];


//       }
        
//        else if(indexPath.section==9)
//        {
//            
//            CommonLabel *lblFamilyinUae=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblFamilyinUae.text=@"Family In UAE";
//            lblFamilyinUae.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblFamilyinUae];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilyinUae attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilyinUae attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilyinUae attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilyinUae attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
//            
//            
//            txtFamilyUAE= [[CommonTextField alloc] init];
//            txtFamilyUAE.tag=17;
//            txtFamilyUAE.delegate=self;
//            txtFamilyUAE.placeholder=@"Family In UAE";
//            txtFamilyUAE.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtFamilyUAE];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilyUAE attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilyUAE attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilyUAE attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilyUAE attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
//            
//            
//            CommonLabel *lblFamilySize=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblFamilySize.text=@"Family Size";
//            lblFamilySize.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblFamilySize];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilySize attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilySize attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilySize attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFamilySize attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
//            
//            
//            txtFamilySize = [[CommonTextField alloc] init];
//            txtFamilySize.tag=18;
//            txtFamilySize.delegate=self;
//            txtFamilySize.placeholder=@"Family Size";
//            txtFamilySize.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtFamilySize];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilySize attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilySize attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilySize attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFamilySize attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
//            
//            
//        }
//        
//        
//        else if(indexPath.section==10)
//        {
//            
//            CommonLabel *lblCarOwnership=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblCarOwnership.text=@"Car Ownership";
//            lblCarOwnership.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblCarOwnership];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarOwnership attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarOwnership attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarOwnership attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarOwnership attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
//            
//            
//            txtCarOwnership= [[CommonTextField alloc] init];
//            txtCarOwnership.tag=19;
//            txtCarOwnership.delegate=self;
//            txtCarOwnership.placeholder=@"Car Ownership";
//            txtCarOwnership.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtCarOwnership];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarOwnership attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarOwnership attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarOwnership attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarOwnership attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
//            
//            
//            CommonLabel *lblCarYear=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblCarYear.text=@"Car Year";
//            lblCarYear.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblCarYear];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarYear attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarYear attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarYear attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCarYear attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
//            
//            
//            txtCarYear = [[CommonTextField alloc] init];
//            txtCarYear.tag=20;
//            txtCarYear.delegate=self;
//            txtCarYear.placeholder=@"Car Year";
//            txtCarYear.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtCarYear];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarYear attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarYear attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarYear attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCarYear attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
//            
//            
//        }
//        
//        
//        else if(indexPath.section==11)
//        {
//            
//            CommonLabel *lblMedia=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblMedia.text=@"Media";
//            lblMedia.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblMedia];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMedia attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPerX constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMedia attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPerY constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMedia attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPerWidth constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblMedia attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPerHeight constant:0]];
//            
//            
//            txtMedia= [[CommonTextField alloc] init];
//            txtMedia.tag=21;
//            txtMedia.delegate=self;
//            txtMedia.placeholder=@"Media";
//            txtMedia.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtMedia];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMedia attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer1X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMedia attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer1Y constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMedia attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer1Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtMedia attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer1Height constant:0]];
//            
//            
//            CommonLabel *lblFavouriteCity=[[CommonLabel alloc]initWithFrame:CGRectZero];
//            lblFavouriteCity.text=@"Favourite City";
//            lblFavouriteCity.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:lblFavouriteCity];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFavouriteCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintPer2X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFavouriteCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintPer2Y constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFavouriteCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintPer2Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblFavouriteCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintPer2Height constant:0]];
//            
//            
//            txtFavCity = [[CommonTextField alloc] init];
//            txtFavCity.tag=22;
//            txtFavCity.delegate=self;
//            txtFavCity.placeholder=@"Favourite City";
//            txtFavCity.translatesAutoresizingMaskIntoConstraints=NO;
//            [cell.contentView addSubview:txtFavCity];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavCity attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintPer2X constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavCity attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintPer2Y constant:0]];
//            
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavCity attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintPer2Width constant:0]];
//            
//            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtFavCity attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintPer2Height constant:0]];
//            
//            
//        }
        
        
    }
    else{
        
        
 
        
        [cell.contentView viewWithTag:100+indexPath.section];
        [cell.contentView viewWithTag:indexPath.section];
        
        [cell.contentView viewWithTag:500+indexPath.section];
        [cell.contentView viewWithTag:600+indexPath.section];
        
    }
    
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    if(([actionMode isEqualToString:@"UPDATE"] || [actionMode isEqualToString:@"ENQUIRY"])   && [personalArray count]>0)
    {
        
         [self loadData];
        
    }
    

    if([self.actionMode isEqualToString:@"ENQUIRY"] || [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"APPROVER"])
    {
        [swtExistingCustomer setEnabled:NO];
        
        
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
//        personalData = [personalArray objectAtIndex:indexPath.section];
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
//    
    
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
    
}


- (void) doValidate {
    
    
    
    //------validation starts---------
    
    if([switchFlag isEqualToString:@"Y"])
    {
        
        
        if([CommonUtils checkEmptyString:txtExtRelation.text]==YES)
        {
            
            [CommonUtils showMessage:@"Select Existing Relationship Type":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtExtRelationNo.text]==YES)
        {
            
            [CommonUtils showMessage:@"Enter Existing Relationship No":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
       
        
    }
    if([CommonUtils checkEmptyString:txtCustomerName.text]==YES)
    {
        
        [CommonUtils showMessage:@"Customer Name can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    

    
//    if([CommonUtils checkEmptyString:txtFirstName.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"First Name can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
    if([CommonUtils checkEmptyString:txtTitle.text]==YES)
    {
        
        [CommonUtils showMessage:@"Title can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtCategoryType.text]==YES)
    {
        
        [CommonUtils showMessage:@"Category Type can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtBranch.text]==YES)
    {
        
        [CommonUtils showMessage:@"Branch can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtJointOwn.text]==YES)
    {
        
        [CommonUtils showMessage:@"Joint Own can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtGender.text]==YES)
    {
        
        [CommonUtils showMessage:@"Gender can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }

//    if([CommonUtils checkEmptyString:txtNatureOfRelation.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Nature Of Relation  can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
    if([CommonUtils checkEmptyString:txtResidenceStatus.text]==YES)
    {
        
        [CommonUtils showMessage:@"Residence Status can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtNationality.text]==YES)
    {
        
        [CommonUtils showMessage:@"Nationality can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtDateOfBirth.text]==YES)
    {
        
        [CommonUtils showMessage:@"Date Of Birth can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtEducation.text]==YES)
    {
        
        [CommonUtils showMessage:@"Education can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtMaritalStatus.text]==YES)
    {
        
        [CommonUtils showMessage:@"Marital Status can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtPassportNo.text]==YES)
    {

        [CommonUtils showMessage:@"Passport Number can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];

        return;

    }

    if([CommonUtils checkEmptyString:txtPassportIssuePlace.text]==YES)
    {

        [CommonUtils showMessage:@"Passport Issue Place can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];

        return;

    }
    if([CommonUtils checkEmptyString:txtPassportIssueDate.text]==YES)
    {

        [CommonUtils showMessage:@"Passport Issue Date can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];

        return;

    }
    if([CommonUtils checkEmptyString:txtPassportExpDate.text]==YES)
    {

        [CommonUtils showMessage:@"Passport Expiry Date can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];

        return;

    }
    if([CommonUtils checkEmptyString:txtPassportIssueCountry.text]==YES)
    {

        [CommonUtils showMessage:@"Passport Issue Country can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtEmiratesId.text]==YES)
    {
        
        [CommonUtils showMessage:@"Emirates Id can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtEmiratesIdExpDate.text]==YES)
    {

        [CommonUtils showMessage:@"Emirates Id Expiry Date can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];

        return;

    }

    
   //    if([CommonUtils checkEmptyString:txtPreferredLang.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Preferred Language can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtFamilyUAE.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Family in UAE can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtFamilySize.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@" Family Size can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtCarOwnership.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@" Car Ownership can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    //--Having car than only allow Car Year
//    if([[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCarOwnership.tag]] isEqualToString:@"YES01"] &&   [CommonUtils checkEmptyString:txtCarYear.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@" Car Year can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtMedia.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@" Media can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
//    if([CommonUtils checkEmptyString:txtFavCity.text]==YES)
//    {
//        
//        [CommonUtils showMessage:@"Favourite City can't be blank":self];
//        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//        
//        return;
//        
//    }
    
//    if([actionMode isEqualToString:@"FETCH"])
//    {
//        actionMode=@"UPDATE";
//    }
//    
    
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    
    
    [self buildJSON];
    
    
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}


- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    //NSData *newData;
    NSString *cifNumber;
    NSString *accountNumber;
    NSString *creditCardNumber;
    

    
   
    
     NSLog(@"action mode in personal %@",actionMode);
    
    //------To Check User Account Relations
    
    if ([[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtExtRelation.tag]] isEqualToString:@"CIF01"]) {
        
        cifNumber=self.txtExtRelationNo.text;
        accountNumber=@"";
        creditCardNumber=@"";
        
    }
    else if ([[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtExtRelation.tag]] isEqualToString:@"ACC02"]) {
        
        cifNumber=@"";
        accountNumber=self.txtExtRelationNo.text;
        creditCardNumber=@"";
        
    }
    else if ([[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtExtRelation.tag]] isEqualToString:@"CCN03"]) {
        
        cifNumber=@"";
        accountNumber=@"";
        creditCardNumber=self.txtExtRelationNo.text;
        
    }
    //--
    
    //--Erases car year when CarOwnership is NO
//    if ([[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCarOwnership.tag]] isEqualToString:@"NO002"]) {
//        
//        self.txtCarYear.text=@"";
//    }
    

    
     //recordStatus=@"INPROGRESS";
    
    
    @try{
        
        
//            if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
//            {
//                jsonDictionary= @{@"refNo":self.refNo};
//            }
//            else
//            {
        
                NSLog(@"RefNo %@",self.refNo);
               
                
               
                //-------
                
                jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo),
                                  @"accountType":emptyStringIfNil(self.accountType),
                                  @"extCustomerFlag":emptyStringIfNil(switchFlag),
                                  @"extRelationship":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtExtRelation.tag]]),
                                  @"cifNumber":emptyStringIfNil(cifNumber),
                                  @"extAccountNo":emptyStringIfNil(accountNumber),
                                  @"extCreditCardNo":emptyStringIfNil(creditCardNumber),
                                  @"relationshipNo":emptyStringIfNil(self.txtExtRelationNo.text),
                                  @"customerName":emptyStringIfNil(self.txtCustomerName.text),
                                  @"firstName":emptyStringIfNil(self.txtFirstName.text),
                                  @"middleName":emptyStringIfNil(self.txtMiddleName.text),
                                  @"lastName":emptyStringIfNil(self.txtLastName.text),
                                  @"title":[popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtTitle.tag]],
                                  @"categoryType":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCategoryType.tag]]),
                                  @"branch":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtBranch.tag]]),
                                  @"jointOwn":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtJointOwn.tag]]),
                                  @"natureOfRelation":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtNatureOfRelation.tag]]),
                                  @"residenceStatus":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtResidenceStatus.tag]]),
                                  @"nationality":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtNationality.tag]]),
                                  @"dob":emptyStringIfNil(self.txtDateOfBirth.text),
                                  @"educated":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtEducation.tag]]),
                                  @"maritalStatus":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtMaritalStatus.tag]]),
                                  @"gender":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtGender.tag]]),
                                  @"passportNo":emptyStringIfNil(self.txtPassportNo.text),
                                  @"passportIssueDate":emptyStringIfNil(self.txtPassportIssueDate.text),
                                  @"passportExpDate":emptyStringIfNil(self.txtPassportExpDate.text),
                                  @"passportIssuePlace":emptyStringIfNil(self.txtPassportIssuePlace.text),
                                  @"passportIssueCountry":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtPassportIssueCountry.tag]]),
                                  @"emiratesID":emptyStringIfNil(self.txtEmiratesId.text),
                                  @"emiratesIDExpDate":emptyStringIfNil(self.txtEmiratesIdExpDate.text),
                                  @"recordStatus":emptyStringIfNil(self.recordStatus)
                                  
                                  };
        
//        @"motherMaidenName":emptyStringIfNil(self.txtMotherMaidenName.text),
//        @"segment":emptyStringIfNil(self.txtSegment.text),
//        @"preferredLanguage":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtPreferredLang.tag]]),
//        @"familyInUAE":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtFamilyUAE.tag]]),
//        @"familySizeUAE":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtFamilySize.tag]]),
//        @"carOwnership":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtCarOwnership.tag]]),
//        @"carYear":([self.txtCarYear.text length]==0?@"":self.txtCarYear.text),
//        @"media":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtMedia.tag]]),
//        @"favouriteCity":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtFavCity.tag]]),
//        @"domicile":emptyStringIfNil(self.txtDomicile.text),
        

        
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
                
                //newData=[CommonUtils connectHost :@"insertPersonalDetails" :jsonDictionary:self];
                //[self parseResponse:newData:@"insertPersonalDetails":@"personalDetailsWrapper"];
                
                
                
                //viewMode=@"N";
            }
            if([actionMode isEqualToString:@"UPDATE"])// && [viewMode isEqualToString:@"N"])
            {
                
                //newData=[CommonUtils connectHost :@"updatePersonalDetails" :jsonDictionary:self];
                //[self parseResponse:newData:@"updatePersonalDetails":@"personalDetailsWrapper"];
                
                //viewMode=@"Y";
            }
        
        
        
        
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
        
            self.refNo=personalData.refNo;
 
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
        
//                   IdentificationViewController *identificationViewController = [[IdentificationViewController alloc]initWithNibName:nil bundle:nil];
//                   identificationViewController.actionMode=self.actionMode;
//                   identificationViewController.recordStatus=self.recordStatus;
//                   //identificationViewController.viewMode=self.viewMode;
//                   identificationViewController.refNo=self.refNo;
//                   identificationViewController.accountType=self.accountType;
//                   identificationViewController.menuName=self.menuName;
//                   identificationViewController.existingRefNo=existingRefNo;
//                    NSLog(@"To invoke next screen existingRefNo %@ ",identificationViewController.existingRefNo);
//
//                    identificationViewController.existingCustomerFlag=existingCustomerFlag;
//                    NSLog(@"To invoke next screen existingCustomerFlag %@ ",identificationViewController.existingCustomerFlag);
//
//        
//                   [self.navigationController pushViewController:identificationViewController animated:YES];
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
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
    //{
    //    NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
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





- (void) doValidateExistingCustomer {
    
    
    
    //------validation starts---------
    
    if([switchFlag isEqualToString:@"Y"])
    {
        
        
        if([CommonUtils checkEmptyString:txtExtRelation.text]==YES)
        {
            
            [CommonUtils showMessage:@"Select Existing Relationship Type":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        if([CommonUtils checkEmptyString:txtExtRelationNo.text]==YES)
        {
            
            [CommonUtils showMessage:@"Enter Existing Relationship No":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
        
        if([actionMode isEqualToString:@"NEW"] && [existingCustomerFlag isEqualToString:@"Y"] && [[[NSUserDefaults standardUserDefaults] stringForKey:@"userGroup"] isEqualToString:@"MAKER"])
        {
            
            [self viewExistingCustomerData];
            

            
      
            
        }
        
    }
    
  
}
    


- (void) viewExistingCustomerData {
    
    @try{
        
        
        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
        
        
        
       // NSDictionary *jsonDictionary= @{@"cifNumber":emptyStringIfNil(self.txtExtRelationNo.text),
       //                                 @"extAccountNo":emptyStringIfNil(self.txtExtRelationNo.text),
       //                                 @"extCreditCardNo":emptyStringIfNil(self.txtExtRelationNo.text)};
        
       
        
        //NSData *newData=[CommonUtils connectHost :@"fetchExistingCustomer" :jsonDictionary:self];
        //[self parseResponse:newData:@"fetchExistingCustomer":@"personalDetailsWrapper"];
        
        personalData = [personalArray objectAtIndex:0];
        existingRefNo=personalData.existingRefNo;
        
        if (existingRefNo !=NULL) {
            
        
        UIAlertController *alertController=[UIAlertController
                                            alertControllerWithTitle:@"Confirmation"
                                            message:[NSString stringWithFormat:@"Do you want to load existing data for %@ ?",existingRefNo]
                                            preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction* okAction = [UIAlertAction
                                   actionWithTitle:@"Proceed"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       
              
                                       
                                       [self loadData];
                                       
                 
                                       
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
        else
        {
            [CommonUtils showMessage:@"Records Not Found" :self];
        }

        
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in view Existing Customer viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
        
    }
    @finally {
        
        NSLog(@"finally in view Existing Customer viewData Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
}

-(void) loadData {
    
    
    @try{
        
        
        
            
            
                
                personalData = [personalArray objectAtIndex:0];
                switchFlag=emptyStringIfNil(personalData.extCustomerFlag);
                NSLog(@"switchflag %@",switchFlag);
                [self operateSwitch:switchFlag];
                txtRefNo.text=emptyStringIfNil(personalData.refNo);
                txtExtRelation.text=emptyStringIfNil(personalData.extRelationshipValue);
                txtExtRelationNo.text=emptyStringIfNil(personalData.relationshipNo);
                txtCustomerName.text=emptyStringIfNil(personalData.customerName);
                txtFirstName.text=emptyStringIfNil(personalData.firstName);
                txtMiddleName.text=emptyStringIfNil(personalData.middleName);
                txtLastName.text=emptyStringIfNil(personalData.lastName);

                txtTitle.text=emptyStringIfNil(personalData.titleValue);
                txtCategoryType.text=emptyStringIfNil(personalData.categoryTypeValue);
                txtBranch.text=emptyStringIfNil(personalData.branchValue);
                txtJointOwn.text=emptyStringIfNil(personalData.jointOwnValue);
                txtNatureOfRelation.text=emptyStringIfNil(personalData.natureOfRelationValue);
                txtResidenceStatus.text=emptyStringIfNil(personalData.residenceStatusValue);
                txtNationality.text=emptyStringIfNil(personalData.nationalityValue);
                txtDateOfBirth.text=emptyStringIfNil(personalData.dob);
                txtEducation.text=emptyStringIfNil(personalData.educatedValue);
                txtMaritalStatus.text=emptyStringIfNil(personalData.maritalStatusValue);
                txtGender.text=emptyStringIfNil(personalData.genderValue);
                    
            //        
            //    txtPreferredLang.text=emptyStringIfNil(personalData.preferredLanguageValue);
            //    txtFamilyUAE.text=emptyStringIfNil(personalData.familyInUAEValue);
            //    txtFamilySize.text=emptyStringIfNil(personalData.familySizeUAEValue);
            //    txtCarOwnership.text=emptyStringIfNil(personalData.carOwnershipValue);
            //    txtCarYear.text=emptyStringIfNil(personalData.carYear);
            //    txtMedia.text=emptyStringIfNil(personalData.mediaValue);
            //    txtFavCity.text=emptyStringIfNil(personalData.favouriteCityValue);
            //    txtDomicile.text=emptyStringIfNil(personalData.domicile);
                    
            //    txtMotherMaidenName.text=emptyStringIfNil(personalData.motherMaidenName);
            //    txtSegment.text=emptyStringIfNil(personalData.segment);

                    
                txtPassportNo.text=emptyStringIfNil(personalData.passportNo);
                txtPassportIssueDate.text=emptyStringIfNil(personalData.passportIssueDate);
                txtPassportExpDate.text=emptyStringIfNil(personalData.passportExpDate);
                txtPassportIssuePlace.text=emptyStringIfNil(personalData.passportIssuePlace);
                txtPassportIssueCountry.text=emptyStringIfNil(personalData.passportIssueCountryValue);
                txtEmiratesId.text=emptyStringIfNil(personalData.emiratesID);
                txtEmiratesIdExpDate.text=emptyStringIfNil(personalData.emiratesIDExpDate);
                
             
                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.passportIssueCountry) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtPassportIssueCountry.tag]];
                    
                
                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.extRelationship) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtExtRelation.tag]];
                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.title) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtTitle.tag]];
                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.categoryType) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtCategoryType.tag]];
                
                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.branch) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtBranch.tag]];
                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.jointOwn) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtJointOwn.tag]];
                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.natureOfRelation) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtNatureOfRelation.tag]];
                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.residenceStatus) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtResidenceStatus.tag]];
                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.nationality) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtNationality.tag]];
                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.educated) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtEducation.tag]];
                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.maritalStatus) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtMaritalStatus.tag]];
                [popoverCodeValue setObject:emptyStringIfNil(self.personalData.gender) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtGender.tag]];
                    
                    
                    
            //    [popoverCodeValue setObject:emptyStringIfNil(self.personalData.preferredLanguage) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtPreferredLang.tag]];
            //    [popoverCodeValue setObject:emptyStringIfNil(self.personalData.familyInUAE) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtFamilyUAE.tag]];
            //    [popoverCodeValue setObject:emptyStringIfNil(self.personalData.familySizeUAE) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtFamilySize.tag]];
            //    [popoverCodeValue setObject:emptyStringIfNil(self.personalData.carOwnership) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtCarOwnership.tag]];
            //    [popoverCodeValue setObject:emptyStringIfNil(self.personalData.media) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtMedia.tag]];
            //    [popoverCodeValue setObject:emptyStringIfNil(self.personalData.favouriteCity) forKey:[NSString stringWithFormat:@"%ld", (long)self.txtFavCity.tag]];
                
                
                   
                
                
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
        
        
            //when empty first time
            if([self.refNo isEqualToString:@""] || [self.refNo length]<=0)
            {
                self.refNo=@"0";
            }
        
            //NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo)};
            
            //NSData *newData=[CommonUtils connectHost :@"fetchPathStatus" :jsonDictionary:self];
            //[self parseResponsePath:newData:@"fetchPathStatus":@"pathStatusWrapper"];
            
                
           
        

        
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
                                           //NSDictionary *jsonDictionary= @{@"refNo":emptyStringIfNil(self.refNo),
                                           //                                @"recordStatus":@"INPROGRESS"
                                           //                                };
                                           //}
                                           
                                           //if([actionMode isEqualToString:@"UPDATE"] && [viewMode isEqualToString:@"Y"])
                                           //{
                                           
                                           //NSData *newData=[CommonUtils connectHost :@"updateApplicationStatus" :jsonDictionary:self];
                                           //[self parseResponse:newData:@"updateApplicationStatus":@"personalDetailsWrapper"];
                                           
                                           
                                           
//                                           
//                                           QueueViewController *queueViewController = [[QueueViewController alloc]initWithNibName:nil bundle:nil];
//                                           queueViewController.actionMode=@"UPDATE";
//                                           queueViewController.menuId=@"QUEUEAPPROVER";
//                                           queueViewController.recordStatus=@"CREATE";
//                                           [self.navigationController pushViewController:queueViewController animated:YES];
                                           
                                           
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
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    @finally {
        
        NSLog(@"finally in doreject Code");
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
//            
//            return newData;
//            
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
//         [CommonUtils showMessage:[exception reason] :self];
//        
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
//




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
                personalArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    personalData = [[PersonalData alloc] initWithJSONDictionary:dict];
                    //NSLog(@" onBoardData %@",onBoardData.accountNumber);
                    
                    
                    
                    // Add the Location object to the array
                    [personalArray addObject:personalData];
                    
                    
                }
                
                
                NSLog(@"data count %lu",(unsigned long)personalArray.count);
                
                
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
        existingCustomerFlag=@"Y";
        
        [self.btnExtRelationshipNo setEnabled:YES];
      
       
        
    } else{
        switchFlag=@"N";
        self.txtExtRelation.text=@"";
        self.txtExtRelationNo.text=@"";
        existingCustomerFlag=@"N";
        NSLog(@"Switch is OFF");
        
        [self.btnExtRelationshipNo setEnabled:NO];
    }
}

- (void)operateSwitch:(NSString*)sender{
    if([sender isEqualToString:@"Y"]){
        [swtExistingCustomer setOn:YES animated:YES];
        NSLog(@"Switch is ON");
    } else{
        [swtExistingCustomer setOn:NO animated:YES];
        NSLog(@"Switch is OFF");
    }
}

//-(void)countdownTimer{
//    
//    secondsLeft = hours = minutes = seconds = 0;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
//    
//}
//
//- (void)updateCounter:(NSTimer *)theTimer {
//    if(secondsLeft > 0 ){
//        secondsLeft -- ;
//        hours = secondsLeft / 3600;
//        minutes = (secondsLeft % 3600) / 60;
//        seconds = (secondsLeft %3600) % 60;
//        self.timerView.font=[UIFont systemFontOfSize:45.0f];
//        self.timerView.textColor=[UIColor brownColor];
//        self.timerView.textAlignment=NSTextAlignmentCenter;
//        self.timerView.text = [NSString stringWithFormat:@"%02d:%02d:%02d", hours, minutes, seconds];
//    }
//    else{
//        secondsLeft = 16925;
//    }
//}

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
            
            
            if(pathData.screen==NULL)
            {
                [jsonDictionary setObject:pathStringIfNil(pathData.status) forKey:@"PERSONAL"];
            }
            else{
                [jsonDictionary setObject:pathStringIfNil(pathData.status) forKey:pathData.screen];
            }
            
            
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

//-(NSString*)ReadSingleTonInstanceVariable:(NSString*)InstVar
//{
//    SigletonClass *sObj=[SigletonClass sharedSingletonClass];
//    return [sObj valueForKey:InstVar];
//}

-(void) logout:(id) sender
{
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    return;
}





-(void)doDedup :(UIButton *)sender
{
    @try
    {
        
          NSLog(@"button click doDedup ");
        
        if([CommonUtils checkEmptyString:txtCustomerName.text]==YES && [CommonUtils checkEmptyString:txtDateOfBirth.text]==YES)
        {
            
            [CommonUtils showMessage:@"Enter Data Before Duplicate Check":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            
            return;
            
        }
    

//        [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
//        
//        DedupViewController *dedupViewController = [[DedupViewController alloc]initWithNibName:nil bundle:nil];
//        
//
//        //--
////        dedupViewController.cifNumber=self.txtExtRelationNo.text;
////        dedupViewController.accountNumber=self.txtExtRelationNo.text;
////        dedupViewController.creditCardNumber=self.txtExtRelationNo.text;
//        dedupViewController.customerName=self.txtCustomerName.text;
//        //dedupViewController.firstName=self.txtFirstName.text;
//        dedupViewController.dob=self.txtDateOfBirth.text;
//        //dedupViewController.refNo=self.refNo;
//
//        
//        
//        // Present the view controller using the popover style.
//        dedupViewController.modalPresentationStyle = UIModalPresentationPopover;
//        [self presentViewController:dedupViewController animated: YES completion: nil];
//        
//        // Get the popover presentation controller and configure it.
//        UIPopoverPresentationController *presentationController =[dedupViewController popoverPresentationController];
//        presentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
//        presentationController.sourceView = self.view;
//        NSLog(@"x %f and y %f %@",sender.frame.origin.x,sender.frame.origin.y,sender.class);
//        presentationController.sourceRect =  CGRectMake(80, sender.frame.origin.y/4, 1, 1);

        
        //dedupViewController.passportNumber=self.txtExtRelationNo.text;
        //dedupViewController.emiratesId=self.txtExtRelationNo.text;
        //dedupViewController.fieldTag=(int)sender.tag;
        //dedupViewController.delegate=self;
        
//        UIPopoverController *dedupController =[[UIPopoverController alloc] initWithContentViewController:dedupViewController];
//        [dedupController setPopoverContentSize:CGSizeMake(dedupViewController.view.frame.size.width/2, dedupViewController.view.frame.size.height/2)];
        
        
//        if(dedupController.popoverVisible==NO){
//            
//            //NSLog(@" dedup popover x %lf",sender.frame.origin.x);
//            //NSLog(@" dedup popover y %lf",sender.frame.origin.y);
//            //CGRectMake(0, sender.frame.origin.y, 1, 1)
//            
//            [dedupController presentPopoverFromRect:CGRectMake(80, sender.frame.origin.y/4, 1, 1) inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//        }
//        else{
//            [dedupController dismissPopoverAnimated:YES];
//        }
        
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in do dedup code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in do dedup Code");
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    }
    
    
}

//
//-(void) loadActivityIndicatorsrdedefrdedeeddsxxds
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

////Keyboard up
////03-May-2016
//
//-(void)keyboardWillShow {
//    // Animate the current view out of the way
//    if (self.view.frame.origin.y >= 0)
//    {
//        [self setViewMovedUp:YES];
//    }
//    else if (self.view.frame.origin.y < 0)
//    {
//        [self setViewMovedUp:NO];
//    }
//}
//
//-(void)keyboardWillHide {
//    if (self.view.frame.origin.y >= 0)
//    {
//        [self setViewMovedUp:YES];
//    }
//    else if (self.view.frame.origin.y < 0)
//    {
//        [self setViewMovedUp:NO];
//    }
//}
//
//-(void)textFieldDidBeginEditing:(UITextField *)sender
//{
//    //if ([sender isEqual:mailTf])
//    //{
//        //move the main view, so that the keyboard does not hide it.
//        if  (self.view.frame.origin.y >= 0)
//        {
//            [self setViewMovedUp:YES];
//        }
//    //}
//}
//
////method to move the view up/down whenever the keyboard is shown/dismissed
//-(void)setViewMovedUp:(BOOL)movedUp
//{
//    [UIView beginAnimations:nil context:NULL];
//    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
//    
//    CGRect rect = self.view.frame;
//    if (movedUp)
//    {
//        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
//        // 2. increase the size of the view so that the area behind the keyboard is covered up.
//        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
//        rect.size.height += kOFFSET_FOR_KEYBOARD;
//    }
//    else
//    {
//        // revert back to the normal state.
//        rect.origin.y += kOFFSET_FOR_KEYBOARD;
//        rect.size.height -= kOFFSET_FOR_KEYBOARD;
//    }
//    self.view.frame = rect;
//    
//    [UIView commitAnimations];
//}
//
//
//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    // register for keyboard notifications
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillShow)
//                                                 name:UIKeyboardWillShowNotification
//                                               object:nil];
//    
//    [[NSNotificationCenter defaultCenter] addObserver:self
//                                             selector:@selector(keyboardWillHide)
//                                                 name:UIKeyboardWillHideNotification
//                                               object:nil];
//}
//
//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    // unregister for keyboard notifications while not visible.
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:UIKeyboardWillShowNotification
//                                                  object:nil];
//    
//    [[NSNotificationCenter defaultCenter] removeObserver:self
//                                                    name:UIKeyboardWillHideNotification
//                                                  object:nil];
//}

@end


//
//  CreditCard3ViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 13/11/15.
//  Copyright © 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CreditCard3ViewController.h"
#import "CreditCardData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "PopoverViewController.h"
#import "PopoverData.h"
#import "KYCViewController.h"
#import "QueueViewController.h"



@interface CreditCard3ViewController ()



@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red

CGFloat lblConstraintCre3X2=0.52f;
CGFloat lblConstraintCre3Y2=1.0f;
CGFloat lblConstraintCre3Width2=0.5f;
CGFloat lblConstraintCre3Height2=0.8f;

CGFloat ConstraintCre3X2=1.19f;
CGFloat ConstraintCre3Y2=1.0f;
CGFloat ConstraintCre3Width2=0.80f;
CGFloat ConstraintCre3Height2=0.8f;

CGFloat constraintCre31X2=0.69f;
CGFloat constraintCre31Y2=1.0f;
CGFloat constraintCre31Width2=0.3f;
CGFloat constraintCre31Height2=0.8f;

CGFloat lblConstraintCre32X2=1.52f;
CGFloat lblConstraintCre32Y2=1.0f;
CGFloat lblConstraintCre32Width2=0.5f;
CGFloat lblConstraintCre32Height2=0.8f;

CGFloat ConstraintCre32X2=1.69f;
CGFloat ConstraintCre32Y2=1.0f;
CGFloat ConstraintCre32Width2=0.3f;
CGFloat ConstraintCre32Height2=0.8f;




@implementation CreditCard3ViewController



//
//@synthesize userid;
//@synthesize sessionid;
@synthesize actionMode;
@synthesize menuName;
//@synthesize viewMode;

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

@synthesize txtCisNumber1;
@synthesize txtCaseID1;
@synthesize txtPrimaryMobileNo;
@synthesize txtBeneficiaryTelephone;
@synthesize txtBeneficiaryType;
@synthesize txtCisNumber2;
@synthesize txtCaseID2;
@synthesize txtCampaignCode;

@synthesize existingCustomerFlag;
@synthesize existingRefNo;
@synthesize recordStatus;
//@synthesize accountType;

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
    
    
    //--CIS No
    if (textField.tag == 1 || textField.tag == 3 || textField.tag == 4 || textField.tag == 6) {
        
        
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
    //--Case ID
    if (textField.tag == 2 ) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
   
    //--Case ID
    if (textField.tag == 7) {
        
        
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 15;
        
    }
    
    //--Campaign Code
    if (textField.tag == 8) {
        
        
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
    //--Beneficiary Type
    if(textField.tag == 5)
        {
            [self popoverData:txtBeneficiaryType:@"BeneficiaryType"];
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
    
    
    return 5;//[componentsArray count];
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
    if (section == 1) {
        
        
        return @" SMS Billpay / Top-Up Application";
    }
    if (section == 3) {
        
        
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
            
            CommonLabel *lblCisNumber1=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCisNumber1.text=@"CIS Number";
            lblCisNumber1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCisNumber1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCisNumber1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintCre3X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCisNumber1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintCre3Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCisNumber1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintCre3Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCisNumber1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintCre3Height2 constant:0]];
            
            
            txtCisNumber1=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtCisNumber1.tag=1;
            txtCisNumber1.delegate=self;
            txtCisNumber1.placeholder=@"CIS Number";
            txtCisNumber1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCisNumber1];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCisNumber1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintCre31X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCisNumber1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintCre31Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCisNumber1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintCre31Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCisNumber1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintCre31Height2 constant:0]];
            
            
            CommonLabel *lblCaseID1=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCaseID1.text=@"Case ID";
            lblCaseID1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCaseID1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCaseID1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintCre32X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCaseID1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintCre32Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCaseID1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintCre32Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCaseID1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintCre32Height2 constant:0]];
            
            
            txtCaseID1 = [[CommonTextField alloc] init];
            txtCaseID1.tag=2;
            txtCaseID1.delegate=self;
            txtCaseID1.placeholder=@"Case ID";
            txtCaseID1.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCaseID1];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCaseID1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintCre32X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCaseID1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintCre32Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCaseID1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintCre32Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCaseID1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintCre32Height2 constant:0]];
            
            
            
            
        }
        else if(indexPath.section==1)
        {
            
            CommonLabel *lblPrimaryMobileNo=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblPrimaryMobileNo.text=@"Primary Mobile No";
            lblPrimaryMobileNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblPrimaryMobileNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPrimaryMobileNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintCre3X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPrimaryMobileNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintCre3Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPrimaryMobileNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintCre3Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblPrimaryMobileNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintCre3Height2 constant:0]];
            
            
            txtPrimaryMobileNo = [[CommonTextField alloc] init];
            txtPrimaryMobileNo.tag=3;
            txtPrimaryMobileNo.delegate=self;
            txtPrimaryMobileNo.placeholder=@"Primary Mobile No";
            txtPrimaryMobileNo.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtPrimaryMobileNo];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPrimaryMobileNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintCre31X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPrimaryMobileNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintCre31Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPrimaryMobileNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintCre31Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtPrimaryMobileNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintCre31Height2 constant:0]];
            
            CommonLabel *lblBeneficiaryTelephone=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblBeneficiaryTelephone.text=@"Beneficiary Tel No";
            lblBeneficiaryTelephone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblBeneficiaryTelephone];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBeneficiaryTelephone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintCre32X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBeneficiaryTelephone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintCre32Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBeneficiaryTelephone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintCre32Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBeneficiaryTelephone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintCre32Height2 constant:0]];
            
            
            txtBeneficiaryTelephone=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtBeneficiaryTelephone.tag=4;
            txtBeneficiaryTelephone.delegate=self;
            txtBeneficiaryTelephone.placeholder=@"Beneficiary Tel No";
            txtBeneficiaryTelephone.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtBeneficiaryTelephone];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBeneficiaryTelephone attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintCre32X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBeneficiaryTelephone attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintCre32Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBeneficiaryTelephone attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintCre32Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBeneficiaryTelephone attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintCre32Height2 constant:0]];
            
        }
        else if(indexPath.section==2){
            
            CommonLabel *lblBeneficiaryType=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblBeneficiaryType.text=@"Beneficiary Type";
            lblBeneficiaryType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblBeneficiaryType];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBeneficiaryType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintCre3X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBeneficiaryType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintCre3Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBeneficiaryType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintCre3Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblBeneficiaryType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintCre3Height2 constant:0]];
            
            
            txtBeneficiaryType=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtBeneficiaryType.tag=5;
            txtBeneficiaryType.delegate=self;
            txtBeneficiaryType.placeholder=@"Beneficiary Type";
            txtBeneficiaryType.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtBeneficiaryType];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBeneficiaryType attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintCre31X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBeneficiaryType attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintCre31Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBeneficiaryType attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintCre31Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtBeneficiaryType attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintCre31Height2 constant:0]];
            
            
        }
        else if(indexPath.section==3){
            
            CommonLabel *lblCisNumber2=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCisNumber2.text=@"CIS Number";
            lblCisNumber2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCisNumber2];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCisNumber2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintCre3X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCisNumber2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintCre3Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCisNumber2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintCre3Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCisNumber2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintCre3Height2 constant:0]];
            
            
            txtCisNumber2=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtCisNumber2.tag=6;
            txtCisNumber2.delegate=self;
            txtCisNumber2.placeholder=@"CIS Number";
            txtCisNumber2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCisNumber2];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCisNumber2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintCre31X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCisNumber2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintCre31Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCisNumber2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintCre31Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCisNumber2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintCre31Height2 constant:0]];
            
            
            
            CommonLabel *lblCaseID2=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCaseID2.text=@"Case ID";
            lblCaseID2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCaseID2];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCaseID2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintCre32X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCaseID2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintCre32Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCaseID2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintCre32Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCaseID2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintCre32Height2 constant:0]];
            
            
            txtCaseID2 = [[CommonTextField alloc] init];
            txtCaseID2.tag=7;
            txtCaseID2.delegate=self;
            txtCaseID2.placeholder=@"Case ID";
            txtCaseID2.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCaseID2];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCaseID2 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:ConstraintCre32X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCaseID2 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:ConstraintCre32Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCaseID2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:ConstraintCre32Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCaseID2 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:ConstraintCre32Height2 constant:0]];
            
            
        }
        
        
        else if(indexPath.section==4){
            CommonLabel *lblCampaignCode=[[CommonLabel alloc]initWithFrame:CGRectZero];
            lblCampaignCode.text=@"Campaign Code";
            lblCampaignCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:lblCampaignCode];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCampaignCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:lblConstraintCre3X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCampaignCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:lblConstraintCre3Y2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCampaignCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:lblConstraintCre3Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:lblCampaignCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:lblConstraintCre3Height2 constant:0]];
            
            
            txtCampaignCode=[[CommonTextField alloc] initWithFrame:CGRectZero];
            txtCampaignCode.tag=8;
            txtCampaignCode.delegate=self;
            txtCampaignCode.placeholder=@"Campaign Code";
            txtCampaignCode.translatesAutoresizingMaskIntoConstraints=NO;
            [cell.contentView addSubview:txtCampaignCode];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCampaignCode attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterX multiplier:constraintCre31X2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCampaignCode attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeCenterY multiplier:constraintCre31Y2 constant:0]];
            
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCampaignCode attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeWidth multiplier:constraintCre31Width2 constant:0]];
            
            [cell addConstraint:[NSLayoutConstraint constraintWithItem:txtCampaignCode attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeHeight multiplier:constraintCre31Height2 constant:0]];
            
            
            
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
    
    if([CommonUtils checkEmptyString:txtCisNumber1.text]==YES)
    {
        
        [CommonUtils showMessage:@"CIS Number can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtCaseID1.text]==YES)
    {
        
        [CommonUtils showMessage:@"Case ID can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtPrimaryMobileNo.text]==YES)
    {
        
        [CommonUtils showMessage:@"Primary Mobile No can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtBeneficiaryTelephone.text]==YES)
    {
        
        [CommonUtils showMessage:@"Beneficiary Telephone No can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtBeneficiaryType.text]==YES)
    {
        
        [CommonUtils showMessage:@"Beneficiary Type can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtCisNumber2.text]==YES)
    {
        
        [CommonUtils showMessage:@"CIS Number can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    if([CommonUtils checkEmptyString:txtCaseID2.text]==YES)
    {
        
        [CommonUtils showMessage:@"Case ID can't be blank":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    if([CommonUtils checkEmptyString:txtCampaignCode.text]==YES)
    {
        
        [CommonUtils showMessage:@"Campaign Code can't be blank":self];
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
                          @"cisNumber1":emptyStringIfNil(self.txtCisNumber1.text),
                          @"caseID1":emptyStringIfNil(self.txtCaseID1.text),
                          @"primaryMobileNo":emptyStringIfNil(self.txtPrimaryMobileNo.text),
                          @"beneficiaryTelephone":emptyStringIfNil(self.txtBeneficiaryTelephone.text),
                          @"beneficiaryType":emptyStringIfNil([popoverCodeValue valueForKey:[NSString stringWithFormat:@"%d",self.txtBeneficiaryType.tag]]),
                          @"cisNumber2":emptyStringIfNil(self.txtCisNumber2.text),
                          @"caseID2":emptyStringIfNil(self.txtCaseID2.text),
                          @"campaignCode":emptyStringIfNil(self.txtCampaignCode.text),
                         
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
        
        newData=[CommonUtils connectHost :@"updateCreditCard3" :jsonDictionary :self];
        [self parseResponse:newData:@"updateCreditCard3":@"creditCardWrapper"];
        
        
        
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
                KYCViewController *kycViewController = [[KYCViewController alloc]initWithNibName:nil bundle:nil];
        
                kycViewController.actionMode=self.actionMode;
                kycViewController.recordStatus=self.recordStatus;
                //productViewController.viewMode=self.viewMode;
                kycViewController.refNo=self.refNo;
                kycViewController.existingCustomerFlag=self.existingCustomerFlag;
                kycViewController.menuName=self.menuName;
                //kycViewController.accountType=self.accountType;
        
                [self.navigationController pushViewController:kycViewController animated:YES];
        
        
        
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
        
        NSData *newData=[CommonUtils connectHost :@"fetchCreditCard3" :jsonDictionary :self];
        [self parseResponse:newData:@"fetchCreditCard3":@"creditCardWrapper"];
        
        
        
        //}
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in Creditcard3 viewData code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
        
    }
    @finally {
        
        NSLog(@"finally in  Creditcard3 viewData Code");
        
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
        
        txtCisNumber1.text=emptyStringIfNil(creditCardData.cisNumber1);
        txtCaseID1.text=emptyStringIfNil(creditCardData.caseID1);
        txtPrimaryMobileNo.text=emptyStringIfNil(creditCardData.primaryMobileNo);
        txtBeneficiaryTelephone.text=emptyStringIfNil(creditCardData.beneficiaryTelephone);
        txtBeneficiaryType.text=emptyStringIfNil(creditCardData.beneficiaryTypeValue);
        txtCisNumber2.text=emptyStringIfNil(creditCardData.cisNumber2);
        txtCaseID2.text=emptyStringIfNil(creditCardData.caseID2);
        txtCampaignCode.text=emptyStringIfNil(creditCardData.campaignCode);
        
        
        [popoverCodeValue setObject:emptyStringIfNil(self.creditCardData.beneficiaryType) forKey:[NSString stringWithFormat:@"%d", self.txtBeneficiaryType.tag]];
        
        
        
        
        
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
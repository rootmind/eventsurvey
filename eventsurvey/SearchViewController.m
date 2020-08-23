//
//  SearchViewController.m
//  Onboard
//
//  Created by Rootmind TechSoft Private Limited on 18/09/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "SearchData.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "SearchViewController.h"
#import "PortfolioViewController.h"
#import "CCPortfolioViewController.h"






@interface SearchViewController ()


@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red



//CGFloat lblConstraintSeaX=0.52f;
//CGFloat lblConstraintSeaY=1.0f;
//CGFloat lblConstraintSeaWidth=0.5f;
//CGFloat lblConstraintSeaHeight=0.8f;
//
//CGFloat ConstraintSeaX=1.19f;
//CGFloat ConstraintSeaY=1.0f;
//CGFloat ConstraintSeaWidth=0.80f;
//CGFloat ConstraintSeaHeight=0.8f;
//
//CGFloat ConstraintSea1X=0.69f;
//CGFloat ConstraintSea1Y=1.0f;
//CGFloat ConstraintSea1Width=0.3f;
//CGFloat ConstraintSea1Height=0.8f;
//
//CGFloat lblConstraintSea2X=1.52f;
//CGFloat lblConstraintSea2Y=1.0f;
//CGFloat lblConstraintSea2Width=0.5f;
//CGFloat lblConstraintSea2Height=0.8f;
//
//CGFloat ConstraintSea2X=1.69f;
//CGFloat ConstraintSea2Y=1.0f;
//CGFloat ConstraintSea2Width=0.3f;
//CGFloat ConstraintSea2Height=0.8f;


@implementation SearchViewController


@synthesize userid;
@synthesize sessionid;
@synthesize lastLoginDate;
@synthesize actionMode;

//@synthesize onBoardDataKeyData;
//@synthesize onBoardDataValueData;
@synthesize dataDictionary;



@synthesize searchArray;
@synthesize searchData;
@synthesize btnSearch;
@synthesize tableView;

@synthesize lblCIFNumber;
@synthesize lblAccountNo;
@synthesize lblCreditCardNo;
@synthesize lblCustomerName;
@synthesize txtCIFNumber;
@synthesize txtAccountNo;
@synthesize txtCreditCardNo;
@synthesize txtCustomerName;

@synthesize  txtOTP;

@synthesize otpArray;
@synthesize otpData;

//@synthesize cIFNumber;
//@synthesize accountNo;
//@synthesize creditCardNo;
//@synthesize customerName;








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
//@synthesize dataArray;

@synthesize webView;
//@synthesize activityIndicator;
//@synthesize lblLoading;

@synthesize timerView;


int hours, minutes, seconds,secondsLeft;







- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
    
    self.navigationItem.title=@"Search";
    
    //[self.navigationItem setHidesBackButton:NO animated:YES];
    
    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    
    
    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryHidden;
    [self.splitViewController.displayModeButtonItem action];
    
    
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
    
    
    //UIBarButtonItem* rightNavButton=[[UIBarButtonItem alloc] initWithTitle:@"Save" style:UIBarButtonItemStylePlain target:self action:@selector(doValidate)];
    
   // self.navigationItem.rightBarButtonItem =rightNavButton ;
    
    
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
    screenView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    screenView.layer.shadowOffset = CGSizeMake(0, 3);
    screenView.layer.shadowRadius = 10.0;
    screenView.layer.shadowColor = [UIColor blackColor].CGColor;
    screenView.layer.shadowOpacity = 0.8;
    screenView.layer.cornerRadius = 15.0;
    screenView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:screenView];
    
    //---timer UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.3 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.55 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:screenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.70 constant:0]];
    
    
    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
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
    //tableView.contentInset = UIEdgeInsetsMake(-60, 0, 0, 0);
    
    
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
    
    

    
    
    
    [self displayHeader];
    [self displayGraph];
   
    
    [CommonUtils loadActivityIndicator:self];
    
    
    
    //self.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld", accountName.count];
    
    
    
    
}

-(void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == self.txtCIFNumber) {
        [textField resignFirstResponder];
        return NO;
    }
    
    if (textField == self.txtAccountNo) {
        [textField resignFirstResponder];
        return NO;
    }
    
    if (textField == self.txtCreditCardNo) {
        [textField resignFirstResponder];
        return NO;
    }
    
    if (textField == self.txtCustomerName) {
        [textField resignFirstResponder];
        return NO;
    }
    
    return YES;
}




//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    
//    // Prevent crashing undo bug – see note below.
//    if(range.length + range.location > textField.text.length)
//    {
//        return NO;
//    }
//    
//    if (textField.tag == 0) {
//        
//        
//        NSUInteger newLength = [textField.text length] + [string length] - range.length;
//        return newLength <= 50;
//        
//    }
//    
//    //    if (textField == self.self.txtSalary) {
//    //
//    //        NSCharacterSet *nonNumberSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
//    //
//    //        // allow backspace
//    //        if (range.length > 0 && [string length] == 0) {
//    //            return YES;
//    //        }
//    //        // do not allow . at the beggining
//    //        if (range.location == 0 && [string isEqualToString:@"."]) {
//    //            return NO;
//    //        }
//    //        // set the text field value manually
//    //        NSString *newValue = [[textField text] stringByReplacingCharactersInRange:range withString:string];
//    //        newValue = [[newValue componentsSeparatedByCharactersInSet:nonNumberSet] componentsJoinedByString:@""];
//    //        textField.text = newValue;
//    //        // return NO because we're manually setting the value
//    //        return NO;
//    //    }
//    //    return YES;
//    
//    return YES;
//    
//}


//-(BOOL) textFieldShouldBeginEditing:(UITextField *)textField
//{
//    
//    //        if ([textField isEqual: txtDOB])
//    //        {
//    //            [self setDate:txtDOB];
//    //            return NO;
//    //
//    //        }
//    //        else if([textField isEqual:txtNationality])
//    //        {
//    //            [self popoverData:txtNationality:@"NATIONALITY"];
//    //            return NO; //to disable keyboard
//    //        }
//    //        else if([textField isEqual:txtJointOwn])
//    //        {
//    //            [self popoverData:txtJointOwn:@"JOINTOWN"];
//    //            return NO; //to disable keyboard
//    //        }
//    
//    //NSLog(@"fieldTag %ld", (long)textField.tag);
//    
//    
//    //Existing Relationship
//    
//        return YES;
//    
//}

//- (void)textFieldDidBeginEditing:(UITextField *)textField
//{
//    [self animateTextField: textField up: YES];
//    
//    
//}



//-(void) setDate:(UITextField *)textField
//{
//    
//    
//    
//    //UITextField *textField =(UITextField *)sender;
//    NSLog(@"fieldTag1 %ld", (long)textField.tag);
//    
//    datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,44,0, 0)];
//    textField.delegate=self;
//    datePicker.hidden=NO;
//    //[datePicker setDate:[NSDate date]];
//    datePicker.datePickerMode = UIDatePickerModeDate;
//    [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
//    [textField setInputView:datePicker];
//    
//    
//    
//    dateToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
//    [dateToolBar setBarStyle:UIBarStyleDefault];
//    [dateToolBar sizeToFit];
//    
//    
//    UIBarButtonItem* flexButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace    target:self  action:nil];
//    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self  action:@selector(donePicker)];
//    NSArray* barItems = [NSArray arrayWithObjects:flexButton,doneButton, nil];
//    [dateToolBar setItems:barItems animated:YES];
//    
//    textField.inputAccessoryView=dateToolBar;
//    
//    
//    
//}

//-(void)donePicker
//{
//    
//    [dateToolBar removeFromSuperview];
//    [datePicker removeFromSuperview];
//    
//    
//    
//}
//
//-(void) dateTextField:(UITextField *)sender
//{
//    
//    NSLog(@"fieldTag2 %ld", (long)sender.tag);
//    
//    //UITextField *textField = (UITextField *)sender;
//    UIDatePicker *picker = (UIDatePicker*)sender.inputView;
//    [picker setMaximumDate:[NSDate date]];
//    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
//    NSDate *eventDate = picker.date;
//    [dateFormat setDateFormat:@"dd/MM/yyyy"];
//    
//    NSString *dateString = [dateFormat stringFromDate:eventDate];
//    sender.text = [NSString stringWithFormat:@"%@",dateString];
//}


//-(void) popoverData: (UITextField *)sender :(NSString *)dateField :(NSString *)tableName
//{
//    @try
//    {
//    
//        PopoverViewController *popoverViewController = [[PopoverViewController alloc]initWithNibName:nil bundle:nil];
//        //popoverViewController.actionCode=actionCode;
//        popoverViewController.dateField=dateField;
//        popoverViewController.tableName=tableName;
//        popoverViewController.fieldTag=(int)sender.tag;
//        popoverViewController.delegate=self;
//        
//        UIPopoverController *popoverController =[[UIPopoverController alloc] initWithContentViewController:popoverViewController];
//        [popoverController setPopoverContentSize:CGSizeMake(self.view.frame.size.width/4, self.view.frame.size.height/4)];
//        
//        
//        if(popoverController.popoverVisible==NO){
//            
//            //NSLog(@" test %lf",sender.frame.origin.x);
//            //NSLog(@" test %lf",sender.frame.origin.y);
//            
//            [popoverController presentPopoverFromRect:CGRectMake(50, sender.frame.origin.y, 1, 1)    inView:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
//        }
//        else{
//            [popoverController dismissPopoverAnimated:YES];
//        }
//    
//    }
//    @catch (NSException *exception) {
//        
//        NSLog(@"Exception in Popover code %@ reason %@ " , [exception name], [exception reason]);
//        
//        [CommonUtils showMessage:[exception reason] :self];
//    }
//    @finally {
//        
//        NSLog(@"finally in Popover  Code");
//    }
//
//
//
//
//}



//- (void)textFieldDidEndEditing:(UITextField *)textField
//{
//    
//    
//    [self animateTextField: textField up: NO];
//    
//    
//    
//}
//
//- (void) animateTextField: (UITextField*) textField up: (BOOL) up
//{
//    const int movementDistance = textField.frame.origin.y / 2;//80; // tweak as needed
//    const float movementDuration = 0.3f; // tweak as needed
//    
//    int movement = (up ? -movementDistance : movementDistance);
//    
//    [UIView beginAnimations: @"anim" context: nil];
//    [UIView setAnimationBeginsFromCurrentState: YES];
//    [UIView setAnimationDuration: movementDuration];
//    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
//    [UIView commitAnimations];
//}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return [searchArray count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 75;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
   
        
        return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{

    if(section ==0)
    {
        return 0.00f;
    }
    return 15.0f;
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.00f;
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
 
    
    cell.backgroundColor=[UIColor pumice];
    cell.layer.borderWidth=0.1f;
    cell.layer.cornerRadius=15.0f;
    //cell.selectionStyle = UITableViewCellSelectionStyleBlue;
    cell.layer.borderColor=[UIColor borderColor].CGColor;
    cell.layer.shadowRadius=3.0f;
    cell.layer.shadowOffset = CGSizeMake(0, 3);
    cell.layer.shadowColor = [UIColor blackColor].CGColor;
    cell.layer.shadowOpacity = 0.8;
    
    
    //NSString *selectedFriend =[NSString initWithFormat @"%@", [[friends objectAtIndex: storyIndex] objectForKey: @"firstname"]];
    
    UIFont *myFont = [UIFont boldSystemFontOfSize:16.0f];//[ UIFont fontWithName: @"Arial-BoldMT" size: 14.0 ];
    cell.textLabel.font  = myFont;
    cell.textLabel.textColor=[UIColor blackColor];
//    UIFont *mySecondFont = [UIFont boldSystemFontOfSize:10.0f]; //[ UIFont fontWithName: @"Arial-BoldMT" size: 12.0 ];
//    cell.detailTextLabel.font  = mySecondFont;
//    //cell.detailTextLabel.textColor=[UIColor blueColor];
    
    
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
    
    
    
//    searchData = [searchArray objectAtIndex:indexPath.section];
//
//    cell.selectionStyle=UITableViewCellSelectionStyleNone;
//    
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",searchData.accountNo, searchData.customerName];
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] init];//]WithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIView *bgColorView = [[UIView alloc] init];
        bgColorView.backgroundColor = [UIColor lightBluishColor];
        bgColorView.layer.masksToBounds = YES;
        cell.selectedBackgroundView = bgColorView;
        
        cell.accessoryView = [UIImageView accessoryImage];
        

    }

   
//    
//        searchData = [searchArray objectAtIndex:0];
//    
//
//        cell.textLabel.text=searchData.customerName;
//        txtCIFNumber.text=searchData.cIFNumber;
//        txtAccountNo.text=searchData.accountNo;
//        txtCreditCardNo.text=searchData.creditCardNo;
//        txtCustomerName.text=searchData.customerName;
//    
    
    
        //cell.textLabel.text = [searchArray objectAtIndex:indexPath.row];
    
    
    
    searchData = [searchArray objectAtIndex:indexPath.section];
    
    NSLog(@"selected account No %@",searchData.accountNo);
    NSLog(@"selected customer Name %@",searchData.customerName);
    
    //cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ \n%@",searchData.accountNo,searchData.customerName];
    cell.textLabel.numberOfLines=2;
         
    //cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",searchData.cifNumber, searchData.creditCardNumber];
    
    
    
    return cell;
}


// Implement something like this in your UITableViewController subclass
// or in the delegate object you use to manage your table.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    NSUInteger row = indexPath.section;//row;
    
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    
    if (row != NSNotFound)
    {
        searchData = [searchArray objectAtIndex:indexPath.section];
        
        //--to generate OTP
        [self generateOTP];
        
        
        if([otpData.generatedOTP boolValue] == NO)
        {
            [CommonUtils showMessage:@"OTP not generated":self];
            [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
            return;
        }
        
        
        UIAlertController *alertController=[UIAlertController
                                            alertControllerWithTitle:@"OTP"
                                            message:[NSString stringWithFormat:@"Enter OTP"]
                                            preferredStyle:UIAlertControllerStyleAlert];
        
        
        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
         {
             textField.placeholder = @"Enter OTP";
             textField.secureTextEntry=YES;
             textField.text=otpData.otp;  //to be deleted
         }];
        
        
        UIAlertAction* okAction = [UIAlertAction
                                   actionWithTitle:@"Proceed"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction * action)
                                   {
                                       
                                       
                                       
                                       [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
                                       
                                       
                                       txtOTP = alertController.textFields.firstObject;
                                       NSLog(@"enterd OTP %@", txtOTP);
                                       
                                       
//                                       
//                                       if([CommonUtils checkEmptyString:txtOTP.text]==YES)
//                                       {
//                                           
//                                           [CommonUtils showMessage:@"Please enter OTP":self];
//                                           [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
//                                           
//                                           return;
//                                           
//                                       }
                                       
                                       //--to validate OTP
                                       [self validateOTP];
                                       
                                       if([otpData.verifiedOTP boolValue] == NO)
                                       {
                                        
                                           [CommonUtils showMessage:@"Invalid OTP or OTP Expired":self];
                                           
                                           [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
                                           
                                           return;
                                       }
                                       
                                       
                                       //--next screen based on OTP validation
                                       
                                       PortfolioViewController *portfolioViewController = [[PortfolioViewController alloc]initWithNibName:nil bundle:nil];
                                       
                                       //NSLog(@"selected account %@",[self.onBoardDataValueData objectAtIndex:indexPath.row]);
                                       
                                       portfolioViewController.cifNumber=searchData.cifNumber;
                                       //portfolioViewController.accountNumber=searchData.accountNo;
                                       portfolioViewController.accountType=@"ALL";
                                       [self.navigationController pushViewController:portfolioViewController animated:YES];
                                       
                                       
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
        
        
             //if (indexPath.section==0)
             //{
//                PortfolioViewController *portfolioViewController = [[PortfolioViewController alloc]initWithNibName:nil bundle:nil];
//
//                //NSLog(@"selected account %@",[self.onBoardDataValueData objectAtIndex:indexPath.row]);
//
//                portfolioViewController.cifNumber=searchData.cifNumber;
//                //portfolioViewController.accountNumber=searchData.accountNo;
//                portfolioViewController.accountType=@"ALL";
//                [self.navigationController pushViewController:portfolioViewController animated:YES];
             //}
        
//            if (indexPath.section==1)
//            {
//                CCPortfolioViewController *ccPortfolioViewController = [[CCPortfolioViewController alloc]initWithNibName:nil bundle:nil];
//                
//                //NSLog(@"selected account %@",[self.onBoardDataValueData objectAtIndex:indexPath.row]);
//                
//                ccPortfolioViewController.cifNumber=searchData.cifNumber;
//                ccPortfolioViewController.creditCardNumber=searchData.creditCardNumber;
//                ccPortfolioViewController.accountType=@"SAVINGS";
//                ccPortfolioViewController.sessionid=self.sessionid;
//                ccPortfolioViewController.userid=self.userid;
//                
//                [self.navigationController pushViewController:ccPortfolioViewController animated:YES];
//            }
        
  
        
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
    }
    
    
    
    
    
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
}


- (void) doValidate {
    
    
    
    //------validation starts---------
 
    [NSThread detachNewThreadSelector:@selector(startActivityIndicator) toTarget:self withObject:nil];
    
    if([CommonUtils checkEmptyString:txtCIFNumber.text]==YES && [CommonUtils checkEmptyString:txtAccountNo.text]==YES && [CommonUtils checkEmptyString:txtCreditCardNo.text]==YES && [CommonUtils checkEmptyString:txtCustomerName.text]==YES)
    {
        
        [CommonUtils showMessage:@"Please enter data to search":self];
        [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
        
        return;
        
    }
    
    [self.txtCIFNumber resignFirstResponder];
    [self.txtAccountNo resignFirstResponder];
    [self.txtCreditCardNo resignFirstResponder];
    [self.txtCustomerName resignFirstResponder];

    
    [self buildJSON];
    [self.tableView reloadData];
    
    [self.webView reload];
    
    [NSThread detachNewThreadSelector:@selector(stopActivityIndicator) toTarget:self withObject:nil];
    
}


- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    NSData *newData;

    
      NSLog(@"in buildJSON");
    
    @try{
        
        
            
        
            
            jsonDictionary= @{
                              @"cifNumber":emptyStringIfNil(self.txtCIFNumber.text),
                              @"accountNo":emptyStringIfNil(self.txtAccountNo.text),
                              @"creditCardNumber":emptyStringIfNil(self.txtCreditCardNo.text),
                              @"customerName":emptyStringIfNil(self.txtCustomerName.text)
                              };
            
     
        
 
        
        
        
        //NSString *jsonString = [container JSONRepresentation];
        NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
      
        newData=[CommonUtils connectHost :@"fetchEnquiry" :jsonDictionary:self];
            [self parseResponse:newData:@"fetchEnquiry":@"searchWrapper"];
       
     
        
      
      
       
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildJSON code %@ reason %@ " , [exception name], [exception reason]);
         [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildJSON Code");
    }
    
}


- (void) generateOTP {
    
    
    NSDictionary *jsonDictionary;
    NSData *newData;
    
    
    NSLog(@"in generateOTP");
    
    @try{
        
        
        
        
        
        jsonDictionary= @{
                          @"cifNumber":emptyStringIfNil(searchData.cifNumber),
                          @"accountNo":emptyStringIfNil(searchData.accountNo),
                          @"creditCardNumber":emptyStringIfNil(searchData.creditCardNumber)
                          };
        
        
        
        
        
        
        
        //NSString *jsonString = [container JSONRepresentation];
        NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
        
        newData=[CommonUtils connectHost :@"insertOTP" :jsonDictionary:self];
        [self parseResponseOTP:newData:@"insertOTP":@"otpWrapper"];
        
        
        
        
        
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in generate OTP code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in generate OTP Code");
    }
    
}

- (void) validateOTP {
    
    
    NSDictionary *jsonDictionary;
    NSData *newData;
    
    
    NSLog(@"in Validate OTP");
    
    @try{
        
        
        
        jsonDictionary= @{
                          @"otp":emptyStringIfNil(self.txtOTP.text),
                          @"cifNumber":emptyStringIfNil(searchData.cifNumber),
                          @"accountNo":emptyStringIfNil(searchData.accountNo),
                          @"creditCardNumber":emptyStringIfNil(searchData.creditCardNumber)
                          };
        
        //NSString *jsonString = [container JSONRepresentation];
        NSLog(@"jsonDictionary: %@", [jsonDictionary description]);
        
        newData=[CommonUtils connectHost :@"validateOTP" :jsonDictionary:self];
        [self parseResponseOTP:newData:@"validateOTP":@"otpWrapper"];
        
        
        
        
        
        
    }
    
    @catch (NSException *exception) {
        
        NSLog(@"Exception in validate OTP code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in validate OTP Code");
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





- (void) parseResponse:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        NSLog(@"get customer info enterest %@",userid);
        
        
        
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
            sessionid = [jsonObject objectForKey:@"sessionid"];
            
            NSLog(@"userid print :%@",userid);
            NSLog(@"sessionid print :%@",sessionid);
            
            
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
                searchArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    searchData = [[SearchData alloc] initWithJSONDictionary:dict];
//                    NSLog(@" searchData %@",searchData.customerName);
                    
                    // Add the Location object to the array
                    [searchArray addObject:searchData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)searchArray.count);
                
                
                
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
                
                [CommonUtils showMessage:@"Record not found!":self];
                
                
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



- (void) parseResponseOTP:(NSData *) data : (NSString *)methodAction :(NSString *) dataFile{
    
    
    @try {
        
        
        
        NSLog(@"get customer info enterest %@",userid);
        
        
        
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
            sessionid = [jsonObject objectForKey:@"sessionid"];
            
            NSLog(@"userid print :%@",userid);
            NSLog(@"sessionid print :%@",sessionid);
            
            
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
                otpArray = [[NSMutableArray alloc] init];
                
                // Get an array of dictionaries with the key "locations"
                //NSArray *array = [dataDictionary objectForKey:@"personalDetailsWrapper"];
                NSArray *array = [dataDictionary objectForKey:dataFile];
                // Iterate through the array of dictionaries
                for(NSDictionary *dict in array) {
                    // Create a new Location object for each one and initialise it with information in the dictionary
                    otpData = [[OTPData alloc] initWithJSONDictionary:dict];
                    //                    NSLog(@" searchData %@",searchData.customerName);
                    
                    // Add the Location object to the array
                    [otpArray addObject:otpData];
                }
                
                
                NSLog(@"data count %lu",(unsigned long)otpArray.count);
                
                
                
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
                
                [CommonUtils showMessage:@"Record not found!":self];
                
                
            }
            
        }
        else{
            
            [CommonUtils showError:error:self:@"parseResponse"];
            
            
            
        }
        
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in parseResponse OTP code %@ reason %@ " , [exception name], [exception reason]);
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in parseResponse OTP Code");
    }
    
}

- (void) displayHeader{




    UIView *headerView = [[UIView alloc] init];
    headerView.layer.borderWidth=1.0;
    headerView.layer.borderColor=[UIColor borderBlueColor].CGColor;
    headerView.layer.shadowRadius=10.0;
    headerView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];//[UIColor whiteColor];
    headerView.layer.shadowOffset = CGSizeMake(0, 3);
    headerView.layer.shadowRadius = 10.0;
    headerView.layer.shadowColor = [UIColor blackColor].CGColor;
    headerView.layer.shadowOpacity = 0.8;
    headerView.layer.cornerRadius = 15.0;
    //headerView.layer.doubleSided=YES;
    headerView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:headerView];

    //create the frame that will contain our label
    //CGRect labelFrame = CGRectMake(40, 60, 240, 80);

    NSLog(@" frame width %lf",headerView.bounds.size.width);
    NSLog(@" frame height %lf",headerView.bounds.size.height);

    
    //move the frame position
    //labelFrame.origin.y += labelFrame.size.height + 0.1f;
    //headerView.bounds.origin.y +=  15.0f;
    //UILabel *lblCIFNumber = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblCIFNumber = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblCIFNumber.font = [UIFont boldSystemFontOfSize:14.0f];
    lblCIFNumber.textAlignment =  NSTextAlignmentLeft;
    lblCIFNumber.textColor = [UIColor blackColor];
    //lblCustomerNumber.layer.borderColor = [UIColor blackColor].CGColor;
    //lblCustomerNumber.layer.borderWidth = 1.0;
    lblCIFNumber.text=@"CIF Number";
    lblCIFNumber.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblCIFNumber];

    
    //UITextField *txtCIFNumber = [[UITextField alloc] init];
    txtCIFNumber = [[UITextField alloc] init];
    txtCIFNumber.borderStyle = UITextBorderStyleRoundedRect;
    txtCIFNumber.layer.borderWidth=0.5;

    txtCIFNumber.layer.borderColor=[UIColor blackColor].CGColor;
    txtCIFNumber.layer.cornerRadius=5.0;
    txtCIFNumber.font = [UIFont systemFontOfSize:18];
    txtCIFNumber.placeholder = @"CIF Number";
    txtCIFNumber.autocorrectionType = UITextAutocorrectionTypeNo;
    txtCIFNumber.keyboardType = UIKeyboardTypeDefault;
    txtCIFNumber.returnKeyType = UIReturnKeyDone;
    txtCIFNumber.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtCIFNumber.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtCIFNumber.delegate = self;
    txtCIFNumber.delegate=self;
    txtCIFNumber.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtCIFNumber];
    
    
    //move the frame position
    //labelFrame.origin.y += labelFrame.size.height + 0.1f;
    //headerView.bounds.origin.y +=  15.0f;
    //UILabel *lblAccountNo = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblAccountNo = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblAccountNo.font = [UIFont boldSystemFontOfSize:14.0f];
    lblAccountNo.textAlignment =  NSTextAlignmentLeft;
    lblAccountNo.textColor = [UIColor blackColor];
    //lblCustomerNumber.layer.borderColor = [UIColor blackColor].CGColor;
    //lblCustomerNumber.layer.borderWidth = 1.0;
    lblAccountNo.text= @"Account Number";
    lblAccountNo.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblAccountNo];
    
    
    //UITextField *txtAccountNo = [[UITextField alloc] init];
    txtAccountNo = [[UITextField alloc] init];
    txtAccountNo.borderStyle = UITextBorderStyleRoundedRect;
    txtAccountNo.layer.borderWidth=0.5;
  
    txtAccountNo.layer.borderColor=[UIColor blackColor].CGColor;
    txtAccountNo.layer.cornerRadius=5.0;
    txtAccountNo.font = [UIFont systemFontOfSize:18];
    txtAccountNo.placeholder = @"Account Number";
    txtAccountNo.autocorrectionType = UITextAutocorrectionTypeNo;
    txtAccountNo.keyboardType = UIKeyboardTypeDefault;
    txtAccountNo.returnKeyType = UIReturnKeyDone;
    txtAccountNo.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtAccountNo.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtAccountNo.delegate = self;
    txtAccountNo.delegate=self;
    txtAccountNo.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtAccountNo];
    
    
    
    

    //CGRectMake(25, 90, 270, 100);
    //labelFrame.size.height = 00.0f;
    //UILabel *lblCreditCardNo = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblCreditCardNo = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblCreditCardNo.textColor = [UIColor blackColor];
    //set the number of lines to contain a bigger text
    //lblCustomerName.numberOfLines = 2;
    //lblCustomerName.font = [UIFont italicSystemFontOfSize:12.0f];
    lblCreditCardNo.font = [UIFont boldSystemFontOfSize:14.0f];
    lblCreditCardNo.textAlignment =  NSTextAlignmentLeft;
    //lblCustomerName.layer.borderColor = [UIColor blackColor].CGColor;
    //lblCustomerName.layer.borderWidth = 1.0;
    lblCreditCardNo.text= @"Credit Card Number";
    lblCreditCardNo.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblCreditCardNo];
    
    
    //UITextField *txtCreditCardNo = [[UITextField alloc] init];
    txtCreditCardNo = [[UITextField alloc] init];
    txtCreditCardNo.borderStyle = UITextBorderStyleRoundedRect;
    txtCreditCardNo.layer.borderWidth=0.5;
    
    txtCreditCardNo.layer.borderColor=[UIColor blackColor].CGColor;
    txtCreditCardNo.layer.cornerRadius=5.0;
    txtCreditCardNo.font = [UIFont systemFontOfSize:18];
    txtCreditCardNo.placeholder = @"Credit Card Number";
    txtCreditCardNo.autocorrectionType = UITextAutocorrectionTypeNo;
    txtCreditCardNo.keyboardType = UIKeyboardTypeDefault;
    txtCreditCardNo.returnKeyType = UIReturnKeyDone;
    txtCreditCardNo.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtCreditCardNo.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtCreditCardNo.delegate = self;
    txtCreditCardNo.delegate=self;
    txtCreditCardNo.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtCreditCardNo];
    
    
    //CGRectMake(25, 90, 270, 100);
    //labelFrame.size.height = 00.0f;
    //UILabel *lblCustomerName = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblCustomerName = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblCustomerName.textColor = [UIColor blackColor];
    //set the number of lines to contain a bigger text
    //lblCustomerName.numberOfLines = 2;
    //lblCustomerName.font = [UIFont italicSystemFontOfSize:12.0f];
    lblCustomerName.font = [UIFont boldSystemFontOfSize:14.0f];
    lblCustomerName.textAlignment =  NSTextAlignmentLeft;
    //lblCustomerName.layer.borderColor = [UIColor blackColor].CGColor;
    //lblCustomerName.layer.borderWidth = 1.0;
    lblCustomerName.text= @"Customer Name";
    lblCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblCustomerName];
    
    
    //UITextField *txtCustomerName = [[UITextField alloc] init];
    txtCustomerName = [[UITextField alloc] init];
    txtCustomerName.borderStyle = UITextBorderStyleRoundedRect;
    txtCustomerName.layer.borderWidth=0.5;
 
    txtCustomerName.layer.borderColor=[UIColor blackColor].CGColor;
    txtCustomerName.layer.cornerRadius=5.0;
    txtCustomerName.font = [UIFont systemFontOfSize:18];
    txtCustomerName.placeholder = @"Customer Name";
    txtCustomerName.autocorrectionType = UITextAutocorrectionTypeNo;
    txtCustomerName.keyboardType = UIKeyboardTypeDefault;
    txtCustomerName.returnKeyType = UIReturnKeyDone;
    txtCustomerName.clearButtonMode = UITextFieldViewModeWhileEditing;
    txtCustomerName.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    txtCustomerName.delegate = self;
    txtCustomerName.delegate=self;
    txtCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:txtCustomerName];
    




    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.45 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:0.75 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.25 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.70 constant:0]];
    
    
    
    //-----CIF Number
    
    //---lblCIFNumber
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCIFNumber attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.8 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCIFNumber attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:0.23 constant:0]];
    
    //---txtCIFNumber

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCIFNumber attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.8 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCIFNumber attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:0.68 constant:0]];

    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCIFNumber attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCIFNumber attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];

    
    //----- lbl Account Number
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblAccountNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.2 constant:0]];
    
    //---txt Account Number
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.8 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.55 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtAccountNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    
    
    
    //-----lbl Credit Card Number
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCreditCardNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCreditCardNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:0.3 constant:0]];
    
    //---txt CreditCard Number
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditCardNo attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditCardNo attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:0.68 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditCardNo attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCreditCardNo attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];



    //----lbl customer name
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];

    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.2 constant:0]];
    
    //---txt Customer Name
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:1.55 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.2 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:txtCustomerName attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
 
   
  
    
    
    btnSearch = [[UIButton alloc ] init];//WithFrame:CGRectMake(120, 200, 60, 30) ];
    [btnSearch setTitle:@"Search" forState:UIControlStateNormal];
    //btnLogin.titleLabel.text=@"Login";
    //[btnLogin setTitleColor:[UIColor grayColor] forState: UIControlStateNormal];
    //btnLogin.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    btnSearch.layer.borderColor=[UIColor grayColor].CGColor;
    btnSearch.layer.borderWidth=0.5f;
    [btnSearch setBackgroundColor:[UIColor whiteColor]];
    [btnSearch setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //btnLogin.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    btnSearch.titleLabel.font = [UIFont systemFontOfSize:18];
    btnSearch.layer.cornerRadius=5.0f;
    //btnLogin.layer.masksToBounds=YES;
    //btnLogin.clipsToBounds=YES;
    [btnSearch addTarget:self action:@selector(doValidate) forControlEvents:UIControlEventTouchUpInside];
    btnSearch.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:btnSearch];
    
    //
    //    lblMessage = [[UILabel alloc] initWithFrame:CGRectMake(40, 240, 300, 20)];
    //    lblMessage.font = [UIFont systemFontOfSize:14];
    //    lblMessage.contentMode=UIControlContentHorizontalAlignmentLeft;
    //    [self.view addSubview:lblMessage];
    
    
  
    
    //-----Search button
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSearch attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.4 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSearch attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeCenterX multiplier:0.85 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:btnSearch attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.20 constant:0]];
    
    
    


}


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
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"search" ofType:@"html" inDirectory:@"www"]];
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    webView.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:webView];
    
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.45 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.70 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:webView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.25 constant:0]];
    
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
        
        //searchData = [searchArray objectAtIndex:0];
        
        //NSLog(@"path refno %@",pathData.refNo);
        
        //[jsonDictionary setObject:projectsSummary.projectsByOverallStatus forKey:projectsSummary.overallStatus];
        
        
        //}
        
        [jsonDictionary setObject:[NSString stringWithFormat:@"%d",[searchArray count]] forKey:@"Search"];
//        [jsonDictionary setObject:pathStringIfNil(pathData.identificationPathStatus) forKey:@"Identity"];
//        [jsonDictionary setObject:pathStringIfNil(pathData.occupationPathStatus) forKey:@"Occupation"];
//        [jsonDictionary setObject:pathStringIfNil(pathData.contactPathStatus) forKey:@"Contact"];
//        [jsonDictionary setObject:pathStringIfNil(pathData.addressPathStatus) forKey:@"Address"];
//        [jsonDictionary setObject:pathStringIfNil(pathData.productPathStatus) forKey:@"Product"];
//        [jsonDictionary setObject:pathStringIfNil(pathData.kycPathStatus) forKey:@"KYC"];
        //[jsonDictionary setObject:pathStringIfNil(pathData.kyc2PathStatus) forKey:@"KYC2"];
        //[jsonDictionary setObject:pathStringIfNil(pathData.kycTranPathStatus) forKey:@"KYCTran"];
        //[jsonDictionary setObject:pathStringIfNil(pathData.kycTran2PathStatus) forKey:@"KYCTran2"];
        //[jsonDictionary setObject:pathStringIfNil(pathData.kycEDDPathStatus) forKey:@"KYCEDD"];
        
        
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


//-(void) showMessage:(NSString *) msg{
//    
//    UIAlertController * alertController=   [UIAlertController
//                                            alertControllerWithTitle:@"message"
//                                            message:msg
//                                            preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* okAction = [UIAlertAction
//                               actionWithTitle:@"OK"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action)
//                               {
//                                   //Do some thing here
//                                   //[self.navigationController popViewControllerAnimated:YES];
//                                   
//                               }];
//    
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
//    
//    
//    
//}
//
//-(void) showError:(NSError *) error{
//    
//    //[NSString stringWithFormat:@"%ld,%@",(long)error.code,error.description]
//    
//    UIAlertController * alertController=   [UIAlertController
//                                            alertControllerWithTitle:@"error"
//                                            message:error.debugDescription
//                                            preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* okAction = [UIAlertAction
//                               actionWithTitle:@"OK"
//                               style:UIAlertActionStyleDefault
//                               handler:^(UIAlertAction * action)
//                               {
//                                   //Do some thing here
//                                   //[self.navigationController popViewControllerAnimated:YES];
//                                   
//                               }];
//    
//    [alertController addAction:okAction];
//    [self presentViewController:alertController animated:YES completion:nil];
//    
//    
//    
//    
//}


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
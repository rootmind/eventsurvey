//
//  PopoverViewController.m
//  Onboard
//
//  Created by Sai Kiran Gandham on 5/18/15.
//  Copyright (c) 2015 Sai Kiran Gandham. All rights reserved.
//


#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "PopoverViewController.h"
#import "SingletonClass.h"
#import "UIColor+Constants.h"
#import "UIImage+Constants.h"
#import "CommonUtils.h"
#import "PopoverData.h"





@interface PopoverViewController ()

@property (strong, nonatomic) UISearchController *searchController;

// for state restoration
@property BOOL searchControllerWasActive;
@property BOOL searchControllerSearchFieldWasFirstResponder;

@end

#define rad 15  // radius
#define normalColor [UIColor colorWithRed:0.39 green:0.15 blue:0.24 alpha:1.0]  // cell background color, dark red




@implementation PopoverViewController


@synthesize userid;
@synthesize sessionid;
@synthesize dateField;
@synthesize dateRange;
@synthesize dateFormat;

//@synthesize popoverDataKeyData;
//@synthesize popoverDataValueData;
@synthesize dataDictionary;

//@synthesize customerName;
//@synthesize customerSegment;

//@synthesize availableBalance;


//@synthesize accountName;
//@synthesize accountNumber;
//@synthesize accountCurrency;
//@synthesize accountAvlBalance;
//@synthesize accountCurrentBalance;
//@synthesize popoverDatatatus;

@synthesize tableView;
@synthesize popoverArray;



//@synthesize dataArray;
@synthesize actionCode;
@synthesize popoverData;


@synthesize delegate;
@synthesize checkedIndexPath;
@synthesize fieldTag;
@synthesize tableName;
@synthesize filter;
//@synthesize searchBar;
//@synthesize searchController;


@synthesize managedObjectContext;
@synthesize managedObjectModel;
@synthesize persistentStoreCoordinator;

@synthesize listMasterDataArray;
@synthesize sortedResults;
@synthesize listMasterMO;
@synthesize multiSelect;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.backgroundColor=[UIColor controllerBGColor];//[UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1.0];//[UIColor whiteColor];
    
//    self.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
//    self.splitViewController.preferredDisplayMode = UISplitViewControllerDisplayModePrimaryOverlay;
//    [self.splitViewController.displayModeButtonItem action];
    
    
    
    
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
    
    
    
    
    
    
    [CommonUtils loadActivityIndicator:self];
    
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
    

    
    //[self fetchPopoverData];
    
    
    CoreDataController *coreDataController=[CoreDataController sharedCoreDataController];
    
    managedObjectContext = coreDataController.managedObjectContext;
    managedObjectModel=coreDataController.managedObjectModel;
    persistentStoreCoordinator = coreDataController.persistentStoreCoordinator;
    
   
    NSLog(@"dateField %@",dateField);
    NSLog(@"tableName %@",tableName);
    NSLog(@"fieldTag %d",fieldTag);
    NSLog(@"dateRange %@",dateRange);
    NSLog(@"dateFormat %@",dateFormat);
    

    if ([dateField isEqualToString:@"Y"])
    {
        
       
        
        //UIDatePicker  *datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,0,250,0)];
        UIDatePicker  *datePicker = [[UIDatePicker alloc]init];
        datePicker.hidden=NO;
        //[datePicker setDate:[NSDate date]];
        //[datePicker setMinuteInterval:5];
        datePicker.datePickerMode = UIDatePickerModeDate;
        
//        if (sender.text.length>0)
//        {
//            @try {
//                NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
//                [formatter setDateFormat:@"dd/MM/yyyy"];
//                NSDate * dateToSet = [formatter dateFromString:sender.text];
//                datePicker.date = dateToSet;
//            }
//            @catch (NSException *exception) {
//                //if the date is in wrong format, set date to today
//                datePicker.date = [NSDate date];
//            }
//        }
        
        
        [datePicker addTarget:self action:@selector(dateTextField:) forControlEvents:UIControlEventValueChanged];
        datePicker.translatesAutoresizingMaskIntoConstraints=NO;
        [self.view addSubview:datePicker];
        
        //--datepicker
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:datePicker attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:datePicker attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:datePicker attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:datePicker attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
        
        
        
        NSLog(@"inside datePicker");
        
        UIToolbar *doneToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
        [doneToolBar setBarStyle:UIBarStyleDefault];
        [doneToolBar sizeToFit];
        
        
        UIBarButtonItem* flexButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace    target:self  action:nil];
        UIBarButtonItem* doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self  action:@selector(donePicker)];
        NSArray* barItems = [NSArray arrayWithObjects:doneButton,flexButton, nil];
        [doneToolBar setItems:barItems animated:YES];
        
        [self.view addSubview:doneToolBar];
        
        
      
        
        
    }
    else
    {
        
         [self doValidate];
    
        //UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        // must set delegate & dataSource, otherwise the the table will be empty and not responsive
        //tableView.autoresizingMask =UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        //tableView.frame = CGRectMake(30,200,270,300);
        tableView.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:1.0];////[UIColor lightGrayColor];
        //tableView.layer.borderWidth=1.0f;
        //tableView.layer.borderColor=[UIColor grayColor].CGColor;
        //tableView.layer.cornerRadius=15.0f;
        //tableView.allowsSelection = NO;
        tableView.alwaysBounceVertical = NO;
        tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        tableView.sectionHeaderHeight = 0.0;
        tableView.sectionFooterHeight = 0.0;
        tableView.rowHeight=UITableViewAutomaticDimension;
        tableView.allowsMultipleSelection=YES;
        
        //self.edgesForExtendedLayout = UIRectEdgeNone;
        
        //    CGRect titleRect = CGRectMake(0, 0, 100, 20);
        //    UILabel *tableTitle = [[UILabel alloc] initWithFrame:titleRect];
        //    tableTitle.textColor = [UIColor captionColor];
        //    tableTitle.backgroundColor = [tableView backgroundColor];
        //    tableTitle.opaque = YES;
        //    tableTitle.font = [UIFont boldSystemFontOfSize:14];
        //    tableTitle.textAlignment=NSTextAlignmentCenter;
        //    tableTitle.text = @"popoverData";
        //    //tableTitle.translatesAutoresizingMaskIntoConstraints=NO;
        //    tableView.tableHeaderView = tableTitle;
        
        //tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
        //[tableView setSeparatorColor:[UIColor whiteColor]];
        tableView.separatorInset=UIEdgeInsetsZero;
        tableView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;
        
        //tableView.tableHeaderView=searchBar;
        
        // add to canvas
        tableView.translatesAutoresizingMaskIntoConstraints=NO;
        [self.view addSubview:tableView];
        
        
     
        //---header UIView
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.1 constant:0]];
        
        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.9 constant:0]];

        [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
        
        
        
            //searchBar=[[UISearchBar alloc]initWithFrame:self.view.bounds];
            //_searchController=[[UISearchController alloc]initWithSearchResultsController:nil];
            //self.searchController.searchResultsUpdater = self;
            //[self.searchController.searchBar sizeToFit];
            //tableView.tableHeaderView = self.searchController.searchBar;
        
        
            // we want to be the delegate for our filtered table so didSelectRowAtIndexPath is called for both tables
            tableView.delegate = self;
            //self.searchController.delegate = self;
            //self.searchController.dimsBackgroundDuringPresentation = NO; // default is YES
            //self.searchController.searchBar.delegate = self; // so we can monitor text changes + others
        
            // Search is now just presenting a view controller. As such, normal view controller
            // presentation semantics apply. Namely that presentation will walk up the view controller
            // hierarchy until it finds the root view controller or one that defines a presentation context.
            //
            //self.definesPresentationContext = YES;  // know where you want UISearchController to be displayed
            
            
//            searchBar.translatesAutoresizingMaskIntoConstraints=NO;
//            //searchController.searchResultsUpdater=self;
//        
//            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
//        
//            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
//        
//            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
//        
//            [self.view addConstraint:[NSLayoutConstraint constraintWithItem:searchBar attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];

        
        
        //if([multiSelect isEqualToString:@"Y"])
        //{
            NSLog(@"inside multiselect");
        
            UIToolbar *dateToolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0,0,self.view.frame.size.width,self.view.frame.size.height)];
            [dateToolBar setBarStyle:UIBarStyleDefault];
            [dateToolBar sizeToFit];
            
            
            UIBarButtonItem* flexButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace    target:self  action:nil];
            UIBarButtonItem* doneButton = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self  action:@selector(donePicker)];
            NSArray* barItems = [NSArray arrayWithObjects:doneButton,flexButton, nil];
            [dateToolBar setItems:barItems animated:YES];
            
            [self.view addSubview:dateToolBar];
        //}


        

    }



    //[self displayHeader];
    
    self.checkedIndexPath=nil;
    
    

    


    
    
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    
    return [sortedResults count];//[popoverArray count];
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
    
        if(section==0)
        {
            return nil; //tableName
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
    
    //popoverData = [popoverArray objectAtIndex:indexPath.section];
    
    
    listMasterMO=(MST_ListMasterMO *)sortedResults[indexPath.section];
    
        
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    
 
    //cell.textLabel.text = [NSString stringWithFormat:@"%@",popoverData.desc];
    
     cell.textLabel.text = [NSString stringWithFormat:@"%@",listMasterMO.desc];

    
    //    NSString *CRDRflag = [[NSString alloc] init];
    //
    //    if([popoverData.CRDRflag isEqual:@"CR"])
    //    {
    //        CRDRflag=@"+";
    //    }
    //    else
    //    {
    //        CRDRflag=@"-";
    //    }
    
    //cell.detailTextLabel.text=[NSString stringWithFormat:@"\n%@  %@",popoverData.availableBalance,popoverData.accountCurrency];
    //cell.detailTextLabel.numberOfLines=0;
    //cell.detailTextLabel.lineBreakMode=NSLineBreakByWordWrapping;
    
    //    cell.textLabel.text =[NSString stringWithFormat:@"%@",popoverData.accountDesc];
    //    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@         %@   %@",popoverData.accountNumber,popoverData.availableBalance,popoverData.accountCurrency];
    
    
    
    
    //[cell.layer setBorderColor:[UIColor grayColor].CGColor];
    //[cell setTintColor:[UIColor redColor]];
    
    //cell.separatorInset = UIEdgeInsetsMake(0.f, 0.f, 0.f, cell.bounds.size.width);
    
    
    //if (indexPath.row != 0)
    //{
    //        cell.contentView.backgroundColor = [UIColor clearColor];
    //        UIView *whiteRoundedCornerView = [[UIView alloc] initWithFrame:CGRectMake(0,0,cell.frame.size.width,cell.frame.size.height)];
    //        whiteRoundedCornerView.backgroundColor = [UIColor whiteColor];
    //        whiteRoundedCornerView.layer.masksToBounds = NO;
    //        whiteRoundedCornerView.layer.cornerRadius = 3.0;
    //        whiteRoundedCornerView.layer.shadowOffset = CGSizeMake(-1, 1);
    //        whiteRoundedCornerView.layer.shadowOpacity = 0.5;
    //        [cell.contentView addSubview:whiteRoundedCornerView];
    //        [cell.contentView sendSubviewToBack:whiteRoundedCornerView];
    
    //}
    
    
    //    [cell.layer setShadowColor:[UIColor grayColor].CGColor];
    //    [cell.layer setShadowOpacity:0.8f];
    //    [cell.layer setShadowRadius:12.0f];
    //    cell.layer.shadowOffset = CGSizeMake(12.0f, 12.0f);
    
    
    //UIView *shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, tableView.bounds.size.height)];
    //CALayer *sublayerHeader = [CALayer layer];
    //sublayerHeader.backgroundColor = [UIColor whiteColor].CGColor;
    //sublayerHeader.shadowOffset = CGSizeMake(0, 3);
    //sublayerHeader.shadowRadius = 10.0;
    //sublayerHeader.shadowColor = [UIColor blackColor].CGColor;
    //sublayerHeader.shadowOpacity = 0.8;
    //sublayerHeader.cornerRadius = 10.0;
    //sublayerHeader.frame = CGRectMake(0, 0, tableView.bounds.size
    //  .width, tableView.bounds.size.height);
    //[shadowView.layer addSublayer:sublayerHeader];
    //[self.view.layer addSublayer:sublayerHeader];
    //[cell.contentView addSubview:shadowView];
    
    //[cell.layer addSublayer:sublayerHeader];
    
    
    
    /*cell.contentView.layer.cornerRadius = 15.0f;
     cell.contentView.layer.borderColor = [UIColor grayColor].CGColor;
     cell.contentView.layer.borderWidth = 1.0f;*/
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"MyReuseIdentifier";
    UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:MyIdentifier];
    
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:MyIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
        cell.accessoryType = UITableViewCellAccessoryNone;
        //cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        
    }
    
    
    
    
    
    return cell;
}


// Implement something like this in your UITableViewController subclass
// or in the delegate object you use to manage your table.
- (void)tableView:(UITableView *)tableView1 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    
    
    //NSLog(@"checked index %@",self.checkedIndexPath);
    
    
    if(self.checkedIndexPath)
    {
        UITableViewCell* cell = [tableView1
                                 cellForRowAtIndexPath:self.checkedIndexPath];
        cell.accessoryType = UITableViewCellAccessoryNone;
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
    }
    
    if([multiSelect isEqualToString:@"Y"])
    {
        UITableViewCell* cell = [tableView1 cellForRowAtIndexPath:indexPath];
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
            cell.accessoryType = UITableViewCellAccessoryNone;
        } else {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
        
    }
    else
    {
        if([self.checkedIndexPath isEqual:indexPath])
        {
            self.checkedIndexPath = nil;
        }
        else
        {
            UITableViewCell* cell = [tableView1 cellForRowAtIndexPath:indexPath];
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            self.checkedIndexPath = indexPath;
        }
    
        NSUInteger row = indexPath.section;//row;
        
        
        
        if (row != NSNotFound)
        {
            //popoverData = [popoverArray objectAtIndex:indexPath.section];
            listMasterMO = sortedResults[indexPath.section];
            
            // NSLog(@"selected account %@",popoverData.accountNumber);
            
            //if([actionCode isEqualToString:@"JOINTOWN"])
            //{
                //NSLog(@"inside %@", [dataArray objectAtIndex:indexPath.section]);
                //NSLog(@"fieldTag %ld", (long)fieldTag);
            
     
              //  [self.delegate addItemViewController:self didFinishEnteringItem:[NSString stringWithFormat:@"%@",popoverData.desc]  didFinishEnteringItem1:[NSString stringWithFormat:@"%@",popoverData.code] didFinishEnteringItem2:fieldTag];
            
                [self.delegate addItemViewController:self didFinishEnteringItem:[NSString stringWithFormat:@"%@",listMasterMO.desc]  didFinishEnteringItem1:[NSString stringWithFormat:@"%@",listMasterMO.code] didFinishEnteringItem2:fieldTag];


            
                [self dismissViewControllerAnimated:YES completion:nil];
                
            
                
            //}
            
            
            
        }
    }
}

// Tap on row accessory
- (void) tableView: (UITableView *) tableView accessoryButtonTappedForRowWithIndexPath: (NSIndexPath *) indexPath{
    
     self.checkedIndexPath=indexPath;
}


- (void) doValidate {
    
    
    //------validation starts---------
    
    if (![tableName isEqualToString:@""])
    {
         NSLog(@"table name before buildJSON %@ ", tableName);
        //[self buildJSON];
        [self buildMO];
    
    }
    
}

- (void) buildJSON {
    
    
    NSDictionary *jsonDictionary;
    NSData *newData;
    
    @try{
        
                
            NSLog(@"table name in buildJSON %@ ", tableName);
            
            jsonDictionary= @{@"tableName":self.tableName,
                              @"filter":emptyStringIfNil(self.filter)
                              };
            
            //newData=[CommonUtils connectHost :@"fetchPopoverData" :jsonDictionary:self];
            [self parseResponse:newData:@"fetchPopoverData":@"popoverWrapper"];
            
           
        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildjson code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildjson Code");
    }
    
    
}



- (void) parseResponse:(NSData *) data :(NSString *)methodAction :(NSString *)dataFile{
    
    
    @try {
        
        
        
            NSLog(@"get popover info enterest %@",userid);
            
            
            
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
                    dataDictionary =[jsonObject objectForKey:methodAction];
                    
                    NSLog(@"Dictionary: %@", [dataDictionary description]);
                    
                    
                    for(NSString *key in [dataDictionary allKeys]) {
                        NSLog(@"key code: %@",key);
                        NSLog(@"key: %@",[dataDictionary objectForKey:key]);
                        
                        //NSLog(@"value: %@",[customerInfo valueForKey:@"amountOutStanding"]);
                        
                    }
                    
                    // Create a new array to hold the locations
                    popoverArray = [[NSMutableArray alloc] init];
                    
                    // Get an array of dictionaries with the key "locations"
                    NSArray *array = [dataDictionary objectForKey:dataFile];
                    // Iterate through the array of dictionaries
                    for(NSDictionary *dict in array) {
                        // Create a new Location object for each one and initialise it with information in the dictionary
                        popoverData = [[PopoverData alloc] initWithJSONDictionary:dict];
                        NSLog(@" popoverData %@",popoverData.code);
                        
                        // Add the Location object to the array
                        [popoverArray addObject:popoverData];
                    }
                    
                    
                    NSLog(@"data count %lu",(unsigned long)popoverArray.count);
                    
                    
                    
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
                    
                    //NSDictionary *customerDetailData = [dataDictionary objectForKey:@"popoverDataWrapper"];
                    
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
                    //                popoverDatatatus= [customerDetailData objectForKey:@"popoverDatatatus"];
                    
                    
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
                    //                popoverDataKeyData = [[NSArray alloc] initWithArray:[customerDetailData allKeys]];
                    //                popoverDataValueData = [[NSArray alloc] initWithArray:[customerDetailData allValues]];
                    
                    
                    //custKeyData = [custKeyData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                    //custValueData = [custValueData sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
                    
                    //                for (NSString *string in popoverDataKeyData) {
                    //                    NSLog(@" array key data:%@", string);
                    //                }
                    //
                    //                for (NSString *string in popoverDataValueData) {
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
                    NSLog(@"Customer Code is Invalid...");
                }
                
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


- (void) displayHeader{
    
    
    if(popoverArray.count >0)
    {
        
        popoverData = [popoverArray objectAtIndex:0];
        
        //capture first account details
        //customerName=[NSString stringWithFormat:@"%@",popoverData.customerName ];
        //customerSegment=[NSString stringWithFormat:@"%@",popoverData.customerSegment];
        //NSLog(@" custname %@",customerName);
        //NSLog(@" custseg %@",customerSegment);
    }
    
    
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
    
    //create the frame that l contain our label
    //CGRect labelFrame = CGRectMake(40, 60, 240, 80);
    
    NSLog(@" frame width %lf",headerView.bounds.size.width);
    NSLog(@" frame height %lf",headerView.bounds.size.height);
    
    
    //CGRectMake(25, 90, 270, 100);
    //labelFrame.size.height = 00.0f;
    UILabel *lblCustomerName = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblCustomerName.textColor = [UIColor blackColor];
    //set the number of lines to contain a bigger text
    //lblCustomerName.numberOfLines = 2;
    //lblCustomerName.font = [UIFont italicSystemFontOfSize:12.0f];
    lblCustomerName.font = [UIFont boldSystemFontOfSize:14.0f];
    lblCustomerName.textAlignment =  NSTextAlignmentLeft;
    //lblCustomerName.layer.borderColor = [UIColor blackColor].CGColor;
    //lblCustomerName.layer.borderWidth = 1.0;
    if(popoverArray.count >0)
    {
        lblCustomerName.text =[NSString stringWithFormat:@"%@",popoverData.code];
    }
    lblCustomerName.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblCustomerName];
    
    
    
    //move the frame position
    //labelFrame.origin.y += labelFrame.size.height + 0.1f;
    //headerView.bounds.origin.y +=  15.0f;
    UILabel *lblCustomerSegment = [[UILabel alloc] init];//WithFrame:headerView.frame];
    lblCustomerSegment.font = [UIFont boldSystemFontOfSize:14.0f];
    lblCustomerSegment.textAlignment =  NSTextAlignmentLeft;
    lblCustomerSegment.textColor = [UIColor blackColor];
    //lblCustomerNumber.layer.borderColor = [UIColor blackColor].CGColor;
    //lblCustomerNumber.layer.borderWidth = 1.0;
    
    //    if(popoverArray.count >0)
    //    {
    //        lblCustomerSegment.text = [NSString stringWithFormat:@"%@",popoverData.customerSegment];
    //    }
    lblCustomerSegment.translatesAutoresizingMaskIntoConstraints=NO;
    [self.view addSubview:lblCustomerSegment];
    
    
    //---header UIView
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:0.45 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.15 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:headerView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.90 constant:0]];
    
    
    //----customer name
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:0.9 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
    //-----customer segement
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerSegment attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationLessThanOrEqual toItem:headerView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerSegment attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeLeft multiplier:1.4 constant:0]];
    
    
    
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:lblCustomerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:headerView attribute:NSLayoutAttributeWidth multiplier:0.80 constant:0]];
    //
    
    //    //labelFrame.origin.y += labelFrame.size.height + 1.0f;
    //    labelFrame.origin.y +=  20.0f;
    //    UILabel *lblavalBalance  = [[UILabel alloc] initWithFrame:labelFrame];
    //    lblavalBalance.textColor = [UIColor blackColor];
    //    lblavalBalance.text = [NSString stringWithFormat:@"Available Balance    %@",availableBalance];
    //    //set the number of lines to 0, meaning use as many lines as needed
    //    lblavalBalance.numberOfLines = 0;
    //    //lblavalBalance.font = [UIFont fontWithName:@"Arial-Bold" size:12.0f];
    //    lblavalBalance.font = [UIFont boldSystemFontOfSize:12.0f];
    //    lblavalBalance.textAlignment =  NSTextAlignmentLeft;
    //    //lblavalBalance.layer.borderColor = [UIColor blackColor].CGColor;
    //    //lblavalBalance.layer.borderWidth = 1.0;
    //    //Resizes and moves the receiver view so it just encloses its subviews.
    //    //watch the border of the frame in this example
    //    //[lblavalBalance sizeToFit];
    //    [self.view addSubview:lblavalBalance];
    
}


-(void) dateTextField:(id)sender
{
    
    NSLog((@"dateTextField inside"));
    
    UIDatePicker *picker = (UIDatePicker*)sender;
    
    if([dateRange isEqualToString:@"LT"])
    {
        
        
        [picker setMaximumDate:[NSDate date]];
        
        NSLog(@"max date %@", dateRange);
    }
    else if([dateRange isEqualToString:@"GT"])
    {
        [picker setMinimumDate:[NSDate date]];
        
        NSLog(@"min date %@", dateRange);
    }
    else
    {
        //[picker setDate:[NSDate date]];
        
        //[picker setMaximumDate:[NSDate date]];
        
        NSLog(@"eq date %@", dateRange);
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSDate *eventDate = picker.date;
    
    if([dateFormat length]==0) //if blank
    {
        NSLog(@"before dateFormatter %@", dateFormat);
        
        [dateFormatter setDateFormat:@"dd/MM/yyyy"];
        
         NSLog(@"after dateFormatter %@", dateFormat);
        
    }
    else
    {
        [dateFormatter setDateFormat:dateFormat];
        
        NSLog(@"after1 dateFormatter %@", dateFormat);
    }
    

    NSString *dateString = [dateFormatter stringFromDate:eventDate];
    //sender.text = [NSString stringWithFormat:@"%@",dateString];
    
    NSLog(@"dateString %@", dateString);
    
    [self.delegate addItemViewController:self didFinishEnteringItem:[NSString stringWithFormat:@"%@",dateString]  didFinishEnteringItem1:[NSString stringWithFormat:@"%@",dateString] didFinishEnteringItem2:fieldTag];
    
    
}

-(void) donePicker
{
    
    
    if([multiSelect isEqualToString:@"Y"])
    {
        NSArray *selectedIndexPaths = [self.tableView indexPathsForSelectedRows];

        NSLog(@"selected rows %@",selectedIndexPaths);
        
        NSString *listDataConcat=@"";
        NSIndexPath *indexPath;
        NSUInteger row;
        //int y;
        
        for(int i=0; i<[selectedIndexPaths count];i++){
            
            //y=selectedIndexPaths[i];
            indexPath = [selectedIndexPaths objectAtIndex:i];
            row = indexPath.section;
            
            listMasterMO = sortedResults[row];
            
            listDataConcat=[NSString stringWithFormat:@"%@:%@",listDataConcat,emptyStringIfNil(listMasterMO.desc)];
            
            NSLog(@"list data concat %@",listDataConcat);

        }
    
        if ([listDataConcat hasPrefix:@":"] && [listDataConcat length] > 1) {
            listDataConcat = [listDataConcat substringFromIndex:1];
        }
        
        [self.delegate addItemViewController:self didFinishEnteringItem:[NSString stringWithFormat:@"%@",listDataConcat]  didFinishEnteringItem1:[NSString stringWithFormat:@"%@",listDataConcat] didFinishEnteringItem2:fieldTag];
    }

    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // restore the searchController's active state
//    if (self.searchControllerWasActive) {
//        self.searchController.active = self.searchControllerWasActive;
//        _searchControllerWasActive = NO;
//        
//        if (self.searchControllerSearchFieldWasFirstResponder) {
//            [self.searchController.searchBar becomeFirstResponder];
//            _searchControllerSearchFieldWasFirstResponder = NO;
//        }
//    }
}


#pragma mark - UISearchBarDelegate
//
//- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
//    [searchBar resignFirstResponder];
//}
//
//
//#pragma mark - UISearchControllerDelegate
//
//// Called after the search controller's search bar has agreed to begin editing or when
//// 'active' is set to YES.
//// If you choose not to present the controller yourself or do not implement this method,
//// a default presentation is performed on your behalf.
////
//// Implement this method if the default presentation is not adequate for your purposes.
////
//- (void)presentSearchController:(UISearchController *)searchController {
//    
//}
//
//- (void)willPresentSearchController:(UISearchController *)searchController {
//    // do something before the search controller is presented
//}
//
//- (void)didPresentSearchController:(UISearchController *)searchController {
//    // do something after the search controller is presented
//}
//
//- (void)willDismissSearchController:(UISearchController *)searchController {
//    // do something before the search controller is dismissed
//}
//
//- (void)didDismissSearchController:(UISearchController *)searchController {
//    // do something after the search controller is dismissed
//}
//
//#pragma mark - UISearchResultsUpdating
//
//- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
//    // update the filtered array based on the search text
//    NSString *searchText = searchController.searchBar.text;
//    
//    NSMutableArray *searchResults = [self.popoverArray mutableCopy];
//    
//    // strip out all the leading and trailing spaces
//    NSString *strippedString = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
//    
//    // break up the search terms (separated by spaces)
//    NSArray *searchItems = nil;
//    if (strippedString.length > 0) {
//        searchItems = [strippedString componentsSeparatedByString:@" "];
//    }
//    
//    // build all the "AND" expressions for each value in the searchString
//    //
//    NSMutableArray *andMatchPredicates = [NSMutableArray array];
//    
//    for (NSString *searchString in searchItems) {
//        // each searchString creates an OR predicate for: name, yearIntroduced, introPrice
//        //
//        // example if searchItems contains "iphone 599 2007":
//        //      name CONTAINS[c] "iphone"
//        //      name CONTAINS[c] "599", yearIntroduced ==[c] 599, introPrice ==[c] 599
//        //      name CONTAINS[c] "2007", yearIntroduced ==[c] 2007, introPrice ==[c] 2007
//        //
//        NSMutableArray *searchItemsPredicate = [NSMutableArray array];
//        
//        // Below we use NSExpression represent expressions in our predicates.
//        // NSPredicate is made up of smaller, atomic parts: two NSExpressions (a left-hand value and a right-hand value)
//        
//        // name field matching
//        //NSExpression *lhs = [NSExpression expressionForKeyPath:@"title"];
//        NSExpression *lhs = [NSExpression expressionForConstantValue:searchString];
//        NSExpression *rhs = [NSExpression expressionForConstantValue:searchString];
//        NSPredicate *finalPredicate = [NSComparisonPredicate
//                                       predicateWithLeftExpression:lhs
//                                       rightExpression:rhs
//                                       modifier:NSDirectPredicateModifier
//                                       type:NSContainsPredicateOperatorType
//                                       options:NSCaseInsensitivePredicateOption];
//        [searchItemsPredicate addObject:finalPredicate];
//        
////        // yearIntroduced field matching
////        NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
////        [numberFormatter setNumberStyle:NSNumberFormatterNoStyle];
////        NSNumber *targetNumber = [numberFormatter numberFromString:searchString];
////        if (targetNumber != nil) {   // searchString may not convert to a number
////            lhs = [NSExpression expressionForKeyPath:@"yearIntroduced"];
////            rhs = [NSExpression expressionForConstantValue:targetNumber];
////            finalPredicate = [NSComparisonPredicate
////                              predicateWithLeftExpression:lhs
////                              rightExpression:rhs
////                              modifier:NSDirectPredicateModifier
////                              type:NSEqualToPredicateOperatorType
////                              options:NSCaseInsensitivePredicateOption];
////            [searchItemsPredicate addObject:finalPredicate];
////            
////            // price field matching
////            lhs = [NSExpression expressionForKeyPath:@"introPrice"];
////            rhs = [NSExpression expressionForConstantValue:targetNumber];
////            finalPredicate = [NSComparisonPredicate
////                              predicateWithLeftExpression:lhs
////                              rightExpression:rhs
////                              modifier:NSDirectPredicateModifier
////                              type:NSEqualToPredicateOperatorType
////                              options:NSCaseInsensitivePredicateOption];
////            [searchItemsPredicate addObject:finalPredicate];
////        }
//        
//        // at this OR predicate to our master AND predicate
//        NSCompoundPredicate *orMatchPredicates = [NSCompoundPredicate orPredicateWithSubpredicates:searchItemsPredicate];
//        [andMatchPredicates addObject:orMatchPredicates];
//    }
//    
//    // match up the fields of the Product object
//    NSCompoundPredicate *finalCompoundPredicate =
//    [NSCompoundPredicate andPredicateWithSubpredicates:andMatchPredicates];
//    searchResults = [[searchResults filteredArrayUsingPredicate:finalCompoundPredicate] mutableCopy];
//    
//    self.popoverArray=searchResults;
//    [self.tableView reloadData];
//    
//    // hand over the filtered results to our search results table
////    APLResultsTableController *tableController = (APLResultsTableController *)self.searchController.searchResultsController;
////    tableController.filteredProducts = searchResults;
////    [tableController.tableView reloadData];
//}
//
//
//#pragma mark - UIStateRestoration
//
//// we restore several items for state restoration:
////  1) Search controller's active state,
////  2) search text,
////  3) first responder
//
//NSString *const ViewControllerTitleKey = @"ViewControllerTitleKey";
//NSString *const SearchControllerIsActiveKey = @"SearchControllerIsActiveKey";
//NSString *const SearchBarTextKey = @"SearchBarTextKey";
//NSString *const SearchBarIsFirstResponderKey = @"SearchBarIsFirstResponderKey";
//
//- (void)encodeRestorableStateWithCoder:(NSCoder *)coder {
//    [super encodeRestorableStateWithCoder:coder];
//    
//    // encode the view state so it can be restored later
//    
//    // encode the title
//    [coder encodeObject:self.title forKey:ViewControllerTitleKey];
//    
//    UISearchController *searchController = self.searchController;
//    
//    // encode the search controller's active state
//    BOOL searchDisplayControllerIsActive = searchController.isActive;
//    [coder encodeBool:searchDisplayControllerIsActive forKey:SearchControllerIsActiveKey];
//    
//    // encode the first responser status
//    if (searchDisplayControllerIsActive) {
//        [coder encodeBool:[searchController.searchBar isFirstResponder] forKey:SearchBarIsFirstResponderKey];
//    }
//    
//    // encode the search bar text
//    [coder encodeObject:searchController.searchBar.text forKey:SearchBarTextKey];
//}
//
//- (void)decodeRestorableStateWithCoder:(NSCoder *)coder {
//    [super decodeRestorableStateWithCoder:coder];
//    
//    // restore the title
//    self.title = [coder decodeObjectForKey:ViewControllerTitleKey];
//    
//    // restore the active state:
//    // we can't make the searchController active here since it's not part of the view
//    // hierarchy yet, instead we do it in viewWillAppear
//    //
//    _searchControllerWasActive = [coder decodeBoolForKey:SearchControllerIsActiveKey];
//    
//    // restore the first responder status:
//    // we can't make the searchController first responder here since it's not part of the view
//    // hierarchy yet, instead we do it in viewWillAppear
//    //
//    _searchControllerSearchFieldWasFirstResponder = [coder decodeBoolForKey:SearchBarIsFirstResponderKey];
//    
//    // restore the text in the search field
//    self.searchController.searchBar.text = [coder decodeObjectForKey:SearchBarTextKey];
//}
//
//

static inline NSString* emptyStringIfNil(NSString *value) {
    return value? value : @"";
}


- (void) buildMO {
    
    
    @try{
        
        
        NSLog(@"Before Fetch ListMaster");
        //---To Fetch----
        
        NSFetchRequest *request= [NSFetchRequest fetchRequestWithEntityName:@"MST_ListMaster"];
        NSError *error=nil;
       
        
        [request setPredicate:[NSPredicate predicateWithFormat:@"tableName==%@", tableName]];
        NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
        
        if (!results) {
            NSLog(@"Error fetching ListMaster objects parseResponseListMaster: %@\n%@", [error localizedDescription], [error userInfo]);
        }
        
        //MST_EventMO *eventDataMO=(MST_EventMO *)results[0];
        
        //NSLog(@"Return values from ListMaster MO  results %@",results);
        
        NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"desc" ascending:YES];
 
        sortedResults = [results sortedArrayUsingDescriptors:[NSArray arrayWithObjects:sort, nil]];

        
    }
    @catch (NSException *exception) {
        
        NSLog(@"Exception in buildjson code %@ reason %@ " , [exception name], [exception reason]);
        
        [CommonUtils showMessage:[exception reason] :self];
    }
    @finally {
        
        NSLog(@"finally in buildjson Code");
    }
    
    
}


@end






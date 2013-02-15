//
//  HistoryVC.m
//  West_Mileage
//
//  Created by Gabriel West on 2/13/13.
//  Copyright (c) 2013 Gabriel West. All rights reserved.
//

#import "HistoryVC.h"

@interface HistoryVC ()

@end

@implementation HistoryVC
@synthesize myMileage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [historyTable setDataSource:self];
    [historyTable setDelegate:self];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return myMileage.mileageArray.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *unused = @"UNUSED";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:unused];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:unused];
    }
    cell.textLabel.font = [UIFont systemFontOfSize:14];
    MileageEntry * thisEntry = [myMileage.mileageArray objectAtIndex:indexPath.row];
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    NSDate * dater = thisEntry.date;
    [formatter setDateFormat:@"MM/dd, HH:mm:ss zzz"];
    cell.detailTextLabel.text = [formatter stringFromDate:dater];
    cell.textLabel.text = [NSString stringWithFormat:@"MPG:%.2f -- Distance: %.2f / Fuel: %.2f", thisEntry.fuelEconomy, thisEntry.milesDriven, thisEntry.fuelAdded];
    return cell;
}

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"Editing");
    tableView.editing = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

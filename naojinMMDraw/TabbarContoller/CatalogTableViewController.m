//
//  CatalogTableViewController.m
//  naojin
//
//  Created by yang mengge on 15/1/22.
//  Copyright (c) 2015年 zhai shuqing. All rights reserved.
//

#import "CatalogTableViewController.h"
#import "localSqlService.h"
#import "AppDelegate.h"

@interface CatalogTableViewController ()

@property (nonatomic,strong) NSMutableArray *array;

@end

@implementation CatalogTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"目录";
    NSArray * sqlarray = [[localSqlService sharedInstance]getAllData];
    self.array = [[NSMutableArray alloc]initWithArray:sqlarray];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - table view datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cellIdentifier";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellID];
    NSDictionary *dictionary = [self.array objectAtIndex:indexPath.row];
    cell.textLabel.text =  [dictionary objectForKey:@"Q"];
    return cell;
}

#pragma mark - table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUserDefaults *userDetfault = [NSUserDefaults standardUserDefaults];
    [userDetfault setInteger:indexPath.row forKey:@"index"];
    [userDetfault synchronize];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"DataUpdateNotification"
                                                        object:nil];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

@end

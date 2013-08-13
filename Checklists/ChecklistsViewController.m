//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by APPLE on 13-8-12.
//  Copyright (c) 2013年 Yujiang. All rights reserved.
//

#import "ChecklistsViewController.h"
#import "Checklists.h"

@interface ChecklistsViewController ()

@end

@implementation ChecklistsViewController{
    NSMutableArray *items;
}

- (IBAction)addItem
{
    int newRoundItem = [items count];
    
    Checklists *item = [[Checklists alloc] init];
    item.text = @"I'm a new row";
    item.checked = NO;
    [items addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRoundItem inSection:0];
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [items removeObjectAtIndex:indexPath.row];
    
    NSArray *indexPaths = [NSArray arrayWithObject:indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    items = [[NSMutableArray alloc] initWithCapacity:20];
    
    Checklists *item;
    
    item = [[Checklists alloc] init];
    item.text = @"Walk the dog";
    item.checked = NO;
    [items addObject:item];
    
    item = [[Checklists alloc] init];
    item.text = @"Brush my teeth";
    item.checked = YES;
    [items addObject:item];
    
    item = [[Checklists alloc] init];
    item.text = @"Learn iOS development";
    item.checked = YES;
    [items addObject:item];
    
    item = [[Checklists alloc] init];
    item.text = @"Soccer practice";
    item.checked = NO;
    [items addObject:item];
    
    item = [[Checklists alloc] init];
    item.text = @"Eat ice cream";
    item.checked = YES;
    [items addObject:item];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [items count];
}

- (void)configureCheckmarkForCell:(UITableViewCell *)cell withChecklistItem:(Checklists *)item
{
    if (item.checked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
}

- (void)configureTextForCell:(UITableViewCell *)cell withChecklistItem:(Checklists *)item
{
    UILabel *lable = (UILabel *)[cell viewWithTag:1000];
    lable.text = item.text;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    Checklists *item = [items objectAtIndex:indexPath.row];
    
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    [self configureTextForCell:cell withChecklistItem:item];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    Checklists *item = [items objectAtIndex:indexPath.row];
    
    [item toggleChecked];
    
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)addItem:(UIBarButtonItem *)sender {
}
@end

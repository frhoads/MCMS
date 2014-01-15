//
//  ViewController.m
//  MCMS
//
//  Created by Fletcher Rhoads on 1/14/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableArray *creatures;
    
    __weak IBOutlet UITextField *magicalCreatureTextField;
    
    __weak IBOutlet UITableView *myTableView;
    
    
}

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    creatures = [NSMutableArray array];
    MagicalCreature *myCreature;
    myCreature = [[MagicalCreature alloc]init];
    myCreature.name = @"Unicorn";
    myCreature.description = @"The unicorn is a legendary animal that has been described since antiquity as a beast with a large, pointed, spiraling horn projecting from its forehead.";
    myCreature.creatureImage = [UIImage imageNamed:@"unicorn.jpeg"];
    [creatures addObject:myCreature];
    
    myCreature = [[MagicalCreature alloc]init];
    myCreature.name = @"Dragon";
    myCreature.description = @"A dragon is a legendary creature, typically with serpentine or           reptilian traits, that features in the myths of many cultures.";
    myCreature.creatureImage = [UIImage imageNamed:@"dragon.jpeg"];
    [creatures addObject:myCreature];
    
    myCreature = [[MagicalCreature alloc]init];
    myCreature.name = @"Don Bora";
    myCreature.description =
                        @"Don is a bit of a process geek and has brought eXtreme Programming into Market Forward, Baxter and Bank of America, among others.";
    myCreature.creatureImage = [UIImage imageNamed:@"don-bora.jpg"];
    [creatures addObject:myCreature];
    
    [myTableView reloadData];
}

-(void)viewDidAppear:(BOOL)animated
{
    [myTableView reloadData];
}

- (IBAction)onAddButtonPressed:(UIButton*)addButton
{
    if (![magicalCreatureTextField.text isEqualToString:@""]) {
        MagicalCreature *myCreature = [[MagicalCreature alloc]init];
        myCreature.name = magicalCreatureTextField.text;
        [creatures addObject:myCreature];
        magicalCreatureTextField.text = @"";
        [magicalCreatureTextField resignFirstResponder];
        [myTableView reloadData];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CreatureViewController *vc = segue.destinationViewController;
    NSIndexPath *ip = [myTableView indexPathForSelectedRow];
    vc.creature = creatures[ip.row];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MagicalCreature *myCreature = [creatures objectAtIndex: indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CreatureID"];

    cell.textLabel.text = myCreature.name;
    cell.detailTextLabel.text = myCreature.description;
    
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

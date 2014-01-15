//
//  CreatureViewController.m
//  MCMS
//
//  Created by Fletcher Rhoads on 1/14/14.
//  Copyright (c) 2014 Fletcher Rhoads. All rights reserved.
//

#import "CreatureViewController.h"
#import "ViewController.h"

@interface CreatureViewController ()
{
    __weak IBOutlet UILabel *name;
    
    __weak IBOutlet UITextField *nameTextField;
    
    __weak IBOutlet UIImageView *image;
    
    __weak IBOutlet UITextView *description;
    
    __weak IBOutlet UIButton *saveButton;
    
    __weak IBOutlet UIButton *editButton;
    
    BOOL isEditMode;
}


@end

@implementation CreatureViewController
@synthesize creature;

- (IBAction)onEditButtonPressed:(UIButton*)sender
{
    if (isEditMode) {
        isEditMode = NO;
        name.alpha = 1;
        nameTextField.alpha = 0;
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        saveButton.hidden = YES;
    }else{
        isEditMode = YES;
        name.alpha = 0;
        nameTextField.alpha = 1;
        nameTextField.text= name.text;
        saveButton.hidden = NO;
        [sender setTitle:@"Cancel" forState:UIControlStateNormal];
    }
    [nameTextField resignFirstResponder];
}

- (IBAction)onSaveButtonPressed:(id)sender
{
    creature.name = nameTextField.text;
    [nameTextField resignFirstResponder];
    name.text = nameTextField.text;
    [editButton setTitle:@"Edit" forState:UIControlStateNormal];
    saveButton.hidden = YES;
    name.alpha = 1;
    nameTextField.alpha = 0;
    isEditMode = NO;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	isEditMode = NO;
    name.alpha = 1;
    nameTextField.alpha = 0;
    name.text = creature.name;
    description.text = creature.description;
    image.image = creature.creatureImage;
    saveButton.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

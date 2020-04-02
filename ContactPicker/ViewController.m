//
//  ViewController.m
//  ContactPicker
//
//  Created by erictel-imac on 4/2/20.
//  Copyright © 2020 erictel-imac. All rights reserved.
//

@import UIKit;
@import ContactsUI;

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)btnBuscar:(id)sender {
    
    CNContactPickerViewController *contactPicker = [[CNContactPickerViewController alloc]init];
    
    contactPicker.delegate = self;
    contactPicker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
    
    [self presentViewController:contactPicker animated:YES completion:nil];
}

-(void) contactPicker:(CNContactPickerViewController *) picker didSelectContactProperty:(nonnull CNContactProperty *)contactProperty{
    
    CNContact *contact = contactProperty.contact;
    NSString *identify = contactProperty.identifier;
    NSString *_lastDisplay = @"";
    for (CNLabeledValue<CNPhoneNumber*>* number in contact.phoneNumbers) {
        
        if ([number.identifier isEqualToString:identify]) {
            _lastDisplay = ((CNPhoneNumber *)number.value).stringValue;
            self.txtNumero.text = _lastDisplay;
        }
        
        
    }
}

@end

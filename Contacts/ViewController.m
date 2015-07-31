//
//  ViewController.m
//  Contacts
//
//  Created by TRM on 7/31/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "ViewController.h"
#import "ContactController.h"
#import "ContactDetailViewController.h"

static NSString *cellID = @"cellID";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.view addSubview:self.tableView];
    
    UIBarButtonItem *addContactButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContact)];
    self.navigationItem.rightBarButtonItem = addContactButton;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIBarButton Methods

- (void)addContact {
    UIAlertController *addContactAlert = [UIAlertController alertControllerWithTitle:@"Add Contact?" message:@"Enter information about new contact or press cancel." preferredStyle:UIAlertControllerStyleAlert];
    
    [addContactAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"First Name";
    }];
    
    [addContactAlert addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"Last Name";
    }];
    
    [addContactAlert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    [addContactAlert addAction:[UIAlertAction actionWithTitle:@"Enter" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        Contact *newContact = [[ContactController sharedInstance] createContact];
        newContact.firstName = ((UITextField *)addContactAlert.textFields[0]).text;
        newContact.lastName = ((UITextField *)addContactAlert.textFields[1]).text;
        
        [self.tableView reloadData];
    }]];
    
    [self.navigationController presentViewController:addContactAlert animated:YES completion:nil];
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *key = [[ContactController sharedInstance].indexedContacts allKeys][indexPath.section];
    
    NSArray *valueArray = [ContactController sharedInstance].indexedContacts[key];
    
    Contact *contact = valueArray[indexPath.row];
    
    ContactDetailViewController *contactDVC = [ContactDetailViewController new];
    
    contactDVC.contact = contact;
    
    [self.navigationController pushViewController:contactDVC animated:YES];
}

#pragma mark - UITableViewDataSource Methods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    NSString *key = [[ContactController sharedInstance].indexedContacts allKeys][indexPath.section];
    
    NSArray *valueArray = [ContactController sharedInstance].indexedContacts[key];
    
    Contact *contact = valueArray[indexPath.row];
    
    cell.textLabel.text = [contact fullName];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *key = [[ContactController sharedInstance].indexedContacts allKeys][section];
    NSArray *valueArray = [ContactController sharedInstance].indexedContacts[key];
    return valueArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[ContactController sharedInstance].indexedContacts allKeys].count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [[ContactController sharedInstance].indexedContacts allKeys][section];
}

@end












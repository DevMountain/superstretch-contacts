# superstretch-contacts
A Friday Super Stretch Problem that creates a basic address book with contacts indexed by letter. Demonstrates UITableView sections, NSDictionary, Model Controller, Passing data to next view, UIAlertController


###Super Stretch Problem
Create an app that displays a list of contacts in a tableview grouped into sections by first letter of first name. You should have a ContactController (think CRUD) to manage your contacts and provide the data to the datasource. When your shared instance is created the first time, you should generate some predefined contacts:

Leslie Phelps
Nathaniel Adams
Arlene Watkins
Chelsea Berry
Lynda Sparks
Abraham Gilbert
Roland Montgomery
Brad Massey
Freda Shaw
Elbert Wood

With extra time allow the user to input new contacts with a UIAlertController and add a detail view.

Contact *contact1 = [sharedInstance createContact];
contact1.firstName = @"Leslie";
contact1.lastName = @"Phelps";
        
Contact *contact2 = [sharedInstance createContact];
contact2.firstName = @"Elbert";
contact2.lastName = @"Wood";
        
Contact *contact3 = [sharedInstance createContact];
contact3.firstName = @"Freda";
contact3.lastName = @"Shaw";
        
Contact *contact4 = [sharedInstance createContact];
contact4.firstName = @"Brad";
contact4.lastName = @"Massey";
        
Contact *contact5 = [sharedInstance createContact];
contact5.firstName = @"Roland";
contact5.lastName = @"Montgomery";
        
Contact *contact6 = [sharedInstance createContact];
contact6.firstName = @"Abraham";
contact6.lastName = @"Gilbert";
        
Contact *contact7 = [sharedInstance createContact];
contact7.firstName = @"Lynda";
contact7.lastName = @"Sparks";
        
Contact *contact8 = [sharedInstance createContact];
contact8.firstName = @"Chelsea";
contact8.lastName = @"Berry";
        
Contact *contact9 = [sharedInstance createContact];
contact9.firstName = @"Arlene";
contact9.lastName = @"Watkins";
        
Contact *contact10 = [sharedInstance createContact];
contact10.firstName = @"Nathaniel";
contact10.lastName = @"Adams";

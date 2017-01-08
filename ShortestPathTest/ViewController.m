//
//  ViewController.m
//  ShortestPathTest
//
//  Created by Tarun on 07/01/17.
//  Copyright © 2017 Rappier. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn_addvalues;
@property (weak, nonatomic) IBOutlet UITextField *txtfield_matrixvalues;
@property (weak, nonatomic) IBOutlet UILabel *lbl_shortestpathvalue;
@property (weak, nonatomic) IBOutlet UIButton *btn_shortestpathcalc;
@property (weak, nonatomic) IBOutlet UITextField *txt_numberrowcolmn;
@property (weak, nonatomic) IBOutlet UITextField *txt_numberofrows;
@property (weak, nonatomic) IBOutlet UITextField *txt_numberofcolum;


@end

@implementation ViewController
NSMutableArray *arr_matrix;
int m=0;

- (void)viewDidLoad
{
   
    [super viewDidLoad];
    
    
    
}
-(int)minValueFromValue1:(int)x andValue2:(int)y andValue3:(int)z // checking which value is less and returning that value by using conditional operator.
{
    if (x < y)
        return (x < z)? x : z;
    else
        return (y < z)? y : z;
}


-(int)minCostValueWithCost:(NSArray*)values andPath1:(int)m andPath2:(int)n // minimum cost method passing the array and path values in to to calculate minmum cost value and returing back to main method.
{
    
    if (n < 0 || m < 0)
        return INT_MAX;
    else if (m == 0 && n == 0)
        return((NSNumber*)values[m][n]).intValue;
    else
        return ((NSNumber*)values[m][n]).intValue +[self minValueFromValue1:[self minCostValueWithCost:values andPath1:m-1 andPath2:n-1] andValue2:[self minCostValueWithCost:values andPath1:m-1 andPath2:n] andValue3:[self minCostValueWithCost:values andPath1:m andPath2:n-1]];
}


- (IBAction)Method_addingvaluestoMatrix:(UIButton *)sender
{
    
    // Resigning the keyboard
    [self.view endEditing:true];
    
    
    NSString *values = self.txtfield_matrixvalues.text;
    
    arr_matrix = [[NSMutableArray alloc]init];
    
    NSArray *temp=[values componentsSeparatedByString:@","];
    
    for (int i = 0; i <  [self.txt_numberofrows.text integerValue]; i++) // row
    {
         NSMutableArray *inner = [[NSMutableArray alloc] initWithCapacity:[self.txt_numberofcolum.text integerValue]];
        for (int j = 0; j <  [self.txt_numberofcolum.text integerValue]; j++) //column
        {
            [inner addObject:[temp objectAtIndex:m]]; // adding values to the inner array
            m++;
        }
        [arr_matrix addObject:inner]; // adding inner array to the main array
    }

  

    // hidding and un hiding the buttons
    self.btn_shortestpathcalc.hidden=FALSE;
    self.btn_addvalues.hidden=true;
    
}

- (IBAction)Method_calculateshortestpath:(UIButton *)sender
{
    // Resigning the textfield
    
     [self.view endEditing:true];
    
    // Un hiding the label

    self.lbl_shortestpathvalue.hidden=FALSE;
    
    // assinginig the value to label
    
    NSInteger value=[self minCostValueWithCost:arr_matrix andPath1:(int)[arr_matrix count]-1 andPath2:(int)[[arr_matrix firstObject] count]-1];
    
    if(value>50)
    {
        self.lbl_shortestpathvalue.text=@"Path Abandoned.";
    }
    else
    {
        self.lbl_shortestpathvalue.text=[NSString stringWithFormat:@"%d",[self minCostValueWithCost:arr_matrix andPath1:(int)[arr_matrix count]-1 andPath2:(int)[[arr_matrix firstObject] count]-1]];

    }
    
    
    NSLog(@"MIN : %i",[self minCostValueWithCost:arr_matrix andPath1:(int)[arr_matrix count]-1 andPath2:(int)[[arr_matrix firstObject] count]-1]);
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

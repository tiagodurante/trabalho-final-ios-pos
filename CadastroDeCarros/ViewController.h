//
//  ViewController.h
//  CadastroDeCarros
//
//  Created by Faculdade Alfa on 03/12/16.
//  Copyright (c) 2016 Tiago Amado Durante. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate, UIActionSheetDelegate> {
    NSString *filePath;
    NSMutableArray *dados;
}

@property (strong, nonatomic) IBOutlet UITextField *marca;
@property (nonatomic, strong) IBOutlet UITextField *modelo;
@property (strong, nonatomic) IBOutlet UITextField *ano;
@property (nonatomic, strong) IBOutlet UITextField *valor;

-(IBAction)guardar:(id)sender;

@end


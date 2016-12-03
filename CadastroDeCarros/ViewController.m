//
//  ViewController.m
//  CadastroDeCarros
//
//  Created by Faculdade Alfa on 03/12/16.
//  Copyright (c) 2016 Tiago Amado Durante. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize ano, modelo, marca, valor;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    filePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/dados.plist"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        dados = [NSMutableArray arrayWithContentsOfFile:filePath];
    }
    else {
        dados = [[NSMutableArray alloc] init];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)guardar:(id)sender {
    NSDictionary *item = [NSDictionary dictionaryWithObjectsAndKeys:
                          ano.text, @"ano",
                          modelo.text, @"modelo",
                          marca.text, @"marca",
                          valor.text, @"valor",
                          nil];
    
    //[dados addObject:item]; //salva sempre abaixo dos resultados anteriores
    [dados insertObject:item atIndex:0]; //adiciona sempre acima de todos os resultados
    [dados writeToFile:filePath atomically:YES];
    [self mostrarMensagem];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(void)mostrarMensagem {
    UIAlertView *alerta = [[UIAlertView alloc] initWithTitle:@"Alerta" message:@"Veículo salvo com sucesso" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    [alerta show];
    alerta = nil;
}
@end

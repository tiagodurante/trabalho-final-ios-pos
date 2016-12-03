//
//  ListagemViewController.m
//  CadastroDeCarros
//
//  Created by Faculdade Alfa on 03/12/16.
//  Copyright (c) 2016 Tiago Amado Durante. All rights reserved.
//

#import "ListagemViewController.h"

@interface ListagemViewController ()

@end

@implementation ListagemViewController

@synthesize dados, tabela;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *filePath = [NSHomeDirectory() stringByAppendingString:@"/Documents/dados.plist"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        dados = [NSMutableArray arrayWithContentsOfFile:filePath];
    }
    
    [tabela reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //numero de seções na tableView
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //returna o numero de linhas
    return dados.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //criando uma celular a partir do prototipo criado na tabela
    UITableViewCell *celula = [tableView dequeueReusableCellWithIdentifier:@"Celula"];
    if (celula == nil) {
        celula = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"Celula"];
    }
    
    @try {
        //verifica se este dado ja está na tabela
        if ([dados objectAtIndex:indexPath.row] != Nil){
            //carregando dicionario com um objeto do array
            NSDictionary *item = [dados objectAtIndex:indexPath.row];
            //titulo no label
            celula.textLabel.text = [item objectForKey:@"marca"];
            //carregando os valores dos combustiveis
            celula.detailTextLabel.text = [NSString stringWithFormat:@"Modelo: %@. Ano: %@. Valor: %@", [item objectForKey:@"modelo"], [item objectForKey:@"ano"], [item objectForKey:@"valor"]];
        }
    }
    @catch (NSException *exception) {
        
    }
    @finally {
        //retornando a celula criada
        return celula;
    }
}

-(IBAction)voltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

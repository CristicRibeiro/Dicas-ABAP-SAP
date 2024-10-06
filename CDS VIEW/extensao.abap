//ESTA EH UMA CDS DE PEDIDO.

@AbapCatalog.sqlViewName: 'ZV_PEDIDO_CCR' //nome da view que fica no dicionario e pode ser consultado na SE11
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Pedido'

//criando serviço Odata atraves de cds tem que ter essa anotacao
@OData.publish: true 



define view ZCDS_MVCRIBEIRO_pedido as select from zovcabec_ccr as t1 // nome da cds e nome da tabela que sera consultada

association [1..1] to zcliente_ccr as t2 //nome da tabela ou cds que quer acessar
            on t1.clienteid = t2.clienteid //conectando as duas tabelas através do cammpo clienteId
            
association [1..*] to zov_item as t3 
            on t1.ovid = t3.ovid // 1..* -> 1 ordem de vendas por ter N itens
{
    key t1.ovid,
    t1.clienteid,
    t1.data_criacao,
    
    //anotacoes para virtual elements
    @ObjectModel.virtualElement: true
    @ObjectModel.virtualElementCalculatedBy: 'ZCL_VE_PEDIDO_CCR' //nome da classe
    
    
    cast('' as abap.char(10) ) as categoria, // campo criado virtual elements
    
    
    
    
    //t2 // precisa clicar na seta pra escolher a associação e aí vai mostrar na tela o item selecionado
    //t2.nome //fica igual ao join, vai criar coluna nova e vai mostrar o nome que está na segunda tabela, na tabela principal
    t2 as _cliente, // dando apelido para a associação
    t3 as _item
}
//..
//..
//..
//..

//ABAIXO A CDS DE EXTENSÃO PARA PEDIDO

@AbapCatalog.sqlViewAppendName: 'ZV_PED_EXIT1_CCR'
@EndUserText.label: 'Dados do Pedido'
extend view ZCDS_MVCRIBEIRO_pedido //nome da cds que vai ser extendida
with ZCDS_MVCRIBEIRO_PEDIDO_EXT1
{
t1.cond_pgto //nome do campo que nao tem na cds original
    //assim a eh add mais um campo na cds, porem sem alterar a original
}


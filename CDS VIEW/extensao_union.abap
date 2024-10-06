//CDS PARCEIRO

@AbapCatalog.sqlViewName: 'ZV_PARCEIRO_CCR' //nome da view que fica no dicionario e pode ser consultado na SE11
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Parceiro'

//precisa dessa anotação para fazer extensao com UNION
@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST,#UNION ]

define view ZCDS_MVCRIBEIRO_PARCEIRO as // nome da cds

select from zcliente_ccr // nome da tabela que sera consultada
{
    clienteid as Parceiroid,
    nome as Nome
    //como na segunda tabela tem a coluna email, foi criada esta coluna com o mesmo tipo
    //cast('' as abap.char(255)) as Email
    
}

union // quando tem o mesmo dado nas 2 consultas, unio ñ mostra no resultado essSa repetição
//union all // quando tem o mesmo dado nas 2 consultas, union all mostra 

select from zfornecedor_ccr // nome da tabela que sera consultada
{
    fornecedor_id as Parceiroid,
    nome as Nome
    //email as Email
}

//..
//..
//..
//..

ABAIXO EXTENSAO CDS ATRAVES DE UNION

@AbapCatalog.sqlViewAppendName: 'ZV_PARC_EXT1_CCR'
@EndUserText.label: 'Dados Parceiro'

extend view ZCDS_MVCRIBEIRO_PARCEIRO  //nome da cds que vai ser extendida
with ZCDS_MVCRIBEIRO_PARCEIRO_EXT1
{
   cast('nao possui' as abap.char( 255 )) as Email
}

union

{
    email
}

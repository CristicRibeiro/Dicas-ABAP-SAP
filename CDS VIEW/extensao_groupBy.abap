CDS PEDIDO 2 PARA EXTENSAO GROUP BY

@AbapCatalog.sqlViewName: 'ZV_PEDIDO2_CCR' //nome da view que fica no dicionario e pode ser consultado na SE11
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'pedido2'

//precisa dessa anotação para fazer extensao com group by
@AbapCatalog.viewEnhancementCategory: [ #PROJECTION_LIST,#GROUP_BY ]


define view ZCDS_MVCRIBEIRO_pedido2 as // nome da cds
select from zovcabec_ccr  as t1 //nome da tabela que sera consultada

//juntando 2 tabelas atraves do campo ovid
inner join ZCDS_MVCRIBEIRO_ITEM_OV as t2 on t1.ovid = t2.Ovid
{
    key t1.ovid,
    sum( t2.PrecoTotal ) as total_ordenSs //somando todos os itens de acordo com ordemm de venda e add em total de ordens
}
group by t1.ovid // fazendo o agrupamento pela ordem de venda

//..
//..
//..
//..


ABAIXO EXTENSAO VIA GROUP BY

@AbapCatalog.sqlViewAppendName: 'ZV_PED2_EXT1_CCR'
@EndUserText.label: 'Dados do Pedido'
extend view ZCDS_MVCRIBEIRO_pedido2 //nome da cds que vai ser extendida
with ZCDS_MVCRIBEIRO_PEDIDO2_EXT1
{
    min(t2.PrecoTotal) as preco_minimo,
    max(t2.PrecoTotal) as preco_maximo
}
group by t1.ovid

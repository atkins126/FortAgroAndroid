object dmRevisao: TdmRevisao
  OldCreateOrder = False
  Height = 409
  Width = 893
  object TAuxRevisaoItem: TFDQuery
    CachedUpdates = True
    OnReconcileError = TAuxRevisaoItemReconcileError
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select a.* from AuxRevisaoItens a'
      'where status>-1')
    Left = 32
    Top = 24
    object TAuxRevisaoItemid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TAuxRevisaoItemstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TAuxRevisaoItemdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TAuxRevisaoItemidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TAuxRevisaoItemdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TAuxRevisaoItemidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TAuxRevisaoItemnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TAuxRevisaoItemgrupo: TStringField
      FieldName = 'grupo'
      Origin = 'grupo'
      Size = 100
    end
    object TAuxRevisaoItemsyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TAuxRevisaoItemsyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
  end
  object TPlanorevisao: TFDQuery
    CachedUpdates = True
    OnReconcileError = TPlanorevisaoReconcileError
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from planorevisao')
    Left = 32
    Top = 72
    object TPlanorevisaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TPlanorevisaonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TPlanorevisaointervalohoras: TBCDField
      FieldName = 'intervalohoras'
      Origin = 'intervalohoras'
      Precision = 15
      Size = 3
    end
  end
  object TPlanoRevisaoMaquinas: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'idrevisao'
    MasterSource = dsRevisao
    MasterFields = 'id'
    DetailFields = 'idrevisao'
    OnReconcileError = TPlanoRevisaoMaquinasReconcileError
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select '
      ' a.*,'
      ' b.modelo,'
      ' b.prefixo,'
      ' b.placa,'
      ' b.combustivel,'
      ' b.ultimarevisao,'
      ' b.horimetroultimarev'
      'from planorevisaomaquinas a '
      'join maquinaveiculo b on a.idmaquina=b.id'
      'where a.status=1'
      'and a.idRevisao=:id')
    Left = 32
    Top = 184
    ParamData = <
      item
        Name = 'ID'
        ParamType = ptInput
      end>
    object TPlanoRevisaoMaquinasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPlanoRevisaoMaquinasstatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
    end
    object TPlanoRevisaoMaquinasdatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TPlanoRevisaoMaquinasidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object TPlanoRevisaoMaquinasdataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object TPlanoRevisaoMaquinasidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
    end
    object TPlanoRevisaoMaquinasidrevisao: TIntegerField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
    end
    object TPlanoRevisaoMaquinasidmaquina: TIntegerField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
    end
    object TPlanoRevisaoMaquinassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TPlanoRevisaoMaquinassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
    object TPlanoRevisaoMaquinasmodelo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'modelo'
      Origin = 'modelo'
      Size = 50
    end
    object TPlanoRevisaoMaquinasprefixo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'prefixo'
      Origin = 'prefixo'
    end
    object TPlanoRevisaoMaquinasplaca: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'placa'
      Origin = 'placa'
    end
    object TPlanoRevisaoMaquinascombustivel: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
    object TPlanoRevisaoMaquinasultimarevisao: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'ultimarevisao'
      Origin = 'ultimarevisao'
    end
    object TPlanoRevisaoMaquinashorimetroultimarev: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'horimetroultimarev'
      Origin = 'horimetroultimarev'
      Precision = 15
      Size = 3
    end
  end
  object dsRevisao: TDataSource
    DataSet = TPlanorevisao
    Left = 32
    Top = 320
  end
  object TRevisaoMaquinaAplLista: TFDQuery
    CachedUpdates = True
    OnReconcileError = TRevisaoMaquinaAplListaReconcileError
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select'
      '    c.*,'
      '    coalesce(r.nome,'#39'CORRETIVA'#39') PlanoRevisao,'
      '    m.prefixo,'
      '    u.nome responsavel,'
      '   case'
      '    when C.TIPO=0 then '#39'PREVENTIVA'#39
      '    when C.TIPO=1 then '#39'CORRETIVA'#39
      '   end TipoRevisao'
      '   from revisaomaquina c'
      '   left join planorevisao r on r.id=c.idplanorevisao'
      '   join maquinaveiculo m on m.id=c.idmaquina'
      '   join usuario u on u.id=c.idresponsavel'
      '   where c.status>-1')
    Left = 384
    Top = 72
    object TRevisaoMaquinaAplListaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TRevisaoMaquinaAplListastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplListadatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplListaidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplListadataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TRevisaoMaquinaAplListaidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TRevisaoMaquinaAplListaidplanorevisao: TWideStringField
      FieldName = 'idplanorevisao'
      Origin = 'idplanorevisao'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplListaidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplListaobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TRevisaoMaquinaAplListadatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
      Required = True
    end
    object TRevisaoMaquinaAplListadatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object TRevisaoMaquinaAplListasyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplListasyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplListaidresponsavel: TWideStringField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplListahorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 2
    end
    object TRevisaoMaquinaAplListatipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplListahorimetroproxima: TBCDField
      FieldName = 'horimetroproxima'
      Origin = 'horimetroproxima'
      Precision = 15
      Size = 3
    end
    object TRevisaoMaquinaAplListaPlanoRevisao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'PlanoRevisao'
      Origin = 'PlanoRevisao'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object TRevisaoMaquinaAplListaprefixo: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'prefixo'
      Origin = 'prefixo'
      ProviderFlags = []
      ReadOnly = True
    end
    object TRevisaoMaquinaAplListaresponsavel: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'responsavel'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object TRevisaoMaquinaAplListaTipoRevisao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'TipoRevisao'
      Origin = 'TipoRevisao'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object TRevisaoMaquinaItens: TFDQuery
    CachedUpdates = True
    OnReconcileError = TRevisaoMaquinaItensReconcileError
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select a.*,b.nome,b.codigofabricante,'
      'case '
      ' when a.tipo=0 then '#39'Manuten'#231#227'o'#39
      ' when a.tipo=1 then '#39'Lubrifica'#231#227'o'#39
      ' when a.tipo=2 then '#39'Verifica'#231#227'o'#39
      'end tipoStr'
      'from revisaomaquinaitens a '
      'join produtos b on a.idproduto=b.id'
      'where a.status>-1')
    Left = 384
    Top = 136
    object TRevisaoMaquinaItensid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TRevisaoMaquinaItensstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaItensdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaItensidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaItensdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TRevisaoMaquinaItensidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TRevisaoMaquinaItensidrevisao: TWideStringField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaItenssyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaItenssyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaItensidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Size = 32767
    end
    object TRevisaoMaquinaItensqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 10
      Size = 3
    end
    object TRevisaoMaquinaItensitem: TStringField
      FieldName = 'item'
      Origin = 'item'
      Size = 100
    end
    object TRevisaoMaquinaItenstipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 32767
    end
    object TRevisaoMaquinaItensobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TRevisaoMaquinaItensiditem: TWideStringField
      FieldName = 'iditem'
      Origin = 'iditem'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaItensnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TRevisaoMaquinaItenscodigofabricante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TRevisaoMaquinaItenstipoStr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipoStr'
      Origin = 'tipoStr'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object qryAux: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    Left = 520
    Top = 120
  end
  object TRevisaoMaquinaApl: TFDQuery
    CachedUpdates = True
    OnReconcileError = TRevisaoMaquinaItensReconcileError
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from revisaomaquina a '
      'where a.status>-1')
    Left = 520
    Top = 176
    object TRevisaoMaquinaAplid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TRevisaoMaquinaAplstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaApldatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaApldataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TRevisaoMaquinaAplidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TRevisaoMaquinaAplidplanorevisao: TWideStringField
      FieldName = 'idplanorevisao'
      Origin = 'idplanorevisao'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TRevisaoMaquinaApldatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
      Required = True
    end
    object TRevisaoMaquinaApldatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object TRevisaoMaquinaAplsyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplsyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplidresponsavel: TWideStringField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplhorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 2
    end
    object TRevisaoMaquinaApltipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 32767
    end
    object TRevisaoMaquinaAplhorimetroproxima: TBCDField
      FieldName = 'horimetroproxima'
      Origin = 'horimetroproxima'
      Precision = 15
      Size = 3
    end
  end
  object TRevisaoServicos: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from servicomanutencao s '
      'where status =1')
    Left = 376
    Top = 200
    object TRevisaoServicosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TRevisaoServicosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TRevisaoServicosdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TRevisaoServicosidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TRevisaoServicosdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TRevisaoServicosidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TRevisaoServicostiposervico: TWideStringField
      FieldName = 'tiposervico'
      Origin = 'tiposervico'
      Size = 32767
    end
    object TRevisaoServicosidrevisao: TWideStringField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
      Size = 32767
    end
    object TRevisaoServicosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object TRevisaoServicosresponsavel: TStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object TRevisaoServicosvalortotal: TBCDField
      FieldName = 'valortotal'
      Origin = 'valortotal'
      Precision = 15
      Size = 3
    end
    object TRevisaoServicossyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TRevisaoServicossyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TRevisaoServicosdatarealizado: TDateField
      FieldName = 'datarealizado'
      Origin = 'datarealizado'
    end
  end
  object TPlanoRevisaoItens: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select '
      'cast(case '
      ' when a.tipo =0 then '#39'MANUTEN'#199#195'O'#39
      ' when a.tipo =1 then '#39'LUBRIFICA'#199#195'O'#39
      ' when a.tipo =2 then '#39'VERIFICA'#199#195'O'#39
      'end as varchar(13)) tipoStr,'
      
        'a.*,Item,p.codigofabricante,p.nome produto  from planorevisaoite' +
        'ns a '
      'left join produtos p on p.id=a.idproduto'
      'where a.status>-1 and a.idrevisao=1'
      'order by a.tipo,a.item')
    Left = 32
    Top = 128
    object TPlanoRevisaoItenstipoStr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipoStr'
      Origin = 'tipoStr'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object TPlanoRevisaoItensid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TPlanoRevisaoItensstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoItensdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoItensidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoItensdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TPlanoRevisaoItensidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TPlanoRevisaoItensidrevisao: TWideStringField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
      Size = 32767
    end
    object TPlanoRevisaoItenssyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoItenssyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoItensidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Size = 32767
    end
    object TPlanoRevisaoItensqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 10
      Size = 3
    end
    object TPlanoRevisaoItenstipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoItensobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TPlanoRevisaoItensitem: TStringField
      FieldName = 'item'
      Origin = 'item'
      Size = 100
    end
    object TPlanoRevisaoItensiditem: TWideStringField
      FieldName = 'iditem'
      Origin = 'iditem'
      Size = 32767
    end
    object TPlanoRevisaoItensitem_1: TStringField
      FieldName = 'item_1'
      Origin = 'item'
      ProviderFlags = []
      Size = 100
    end
    object TPlanoRevisaoItenscodigofabricante: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'codigofabricante'
      Origin = 'codigofabricante'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TPlanoRevisaoItensproduto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'produto'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
end

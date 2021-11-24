object dmDB: TdmDB
  OldCreateOrder = False
  Height = 612
  Width = 851
  object FDConn: TFDConnection
    Params.Strings = (
      
        'Database=D:\Projetos2021\FortAgroMobile\FortAgroAndroid\db\Fort.' +
        'db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDConnBeforeConnect
    Left = 32
    Top = 16
  end
  object qryConfig: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'SELECT * FROM CONFIG')
    Left = 40
    Top = 80
    object qryConfigIP_SERVIDOR: TWideStringField
      FieldName = 'IP_SERVIDOR'
      Origin = 'IP_SERVIDOR'
      Size = 15
    end
    object qryConfigPOTA_SERVIDOR: TIntegerField
      FieldName = 'POTA_SERVIDOR'
      Origin = 'POTA_SERVIDOR'
    end
    object qryConfigSERIAL: TWideStringField
      FieldName = 'SERIAL'
      Origin = 'SERIAL'
    end
    object qryConfigSalvarLogin: TIntegerField
      FieldName = 'SalvarLogin'
      Origin = 'SalvarLogin'
    end
    object qryConfigTIPODB: TStringField
      FieldName = 'TIPODB'
      Origin = 'TIPODB'
      Size = 11
    end
  end
  object TUsuario: TFDQuery
    CachedUpdates = True
    OnReconcileError = TUsuarioReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select '
      ' U.*,'
      ' case '
      '  when tipo=0 then '#39'PADRAO'#39
      '  when tipo=1 then '#39'SUPERVISOR'#39
      '  when tipo=2 then '#39'DIRETORIA'#39
      ' end tipoSTR'
      'from usuario U'
      'where Status>=-1')
    Left = 32
    Top = 180
    object TUsuarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object TUsuariostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TUsuarionome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 100
    end
    object TUsuariousuario: TStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Required = True
      Size = 25
    end
    object TUsuariosenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Required = True
      Size = 50
    end
    object TUsuariotipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 32767
    end
    object TUsuariosupervisor: TStringField
      FieldName = 'supervisor'
      Origin = 'supervisor'
      Size = 100
    end
    object TUsuariotipoSTR: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipoSTR'
      Origin = 'tipoSTR'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object TUsuarioagronomo: TIntegerField
      FieldName = 'agronomo'
      Origin = 'agronomo'
    end
    object TUsuarioabastecimento: TIntegerField
      FieldName = 'abastecimento'
      Origin = 'abastecimento'
    end
    object TUsuariomanutencaomaquinas: TWideStringField
      FieldName = 'manutencaomaquinas'
      Origin = 'manutencaomaquinas'
      Required = True
      Size = 32767
    end
    object TUsuarioarmazem: TWideStringField
      FieldName = 'armazem'
      Origin = 'armazem'
      Required = True
      Size = 32767
    end
    object TUsuarioaplicacaosolido: TWideStringField
      FieldName = 'aplicacaosolido'
      Origin = 'aplicacaosolido'
      Required = True
      Size = 32767
    end
    object TUsuariopulverizacao: TWideStringField
      FieldName = 'pulverizacao'
      Origin = 'pulverizacao'
      Required = True
      Size = 32767
    end
    object TUsuarioplantio: TWideStringField
      FieldName = 'plantio'
      Origin = 'plantio'
      Required = True
      Size = 32767
    end
    object TUsuariocolheita: TWideStringField
      FieldName = 'colheita'
      Origin = 'colheita'
      Required = True
      Size = 32767
    end
    object TUsuariomonitoramentopragas: TWideStringField
      FieldName = 'monitoramentopragas'
      Origin = 'monitoramentopragas'
      Required = True
      Size = 32767
    end
    object TUsuariopluviometria: TWideStringField
      FieldName = 'pluviometria'
      Origin = 'pluviometria'
      Required = True
      Size = 32767
    end
    object TUsuarioabastecimentoexterno: TIntegerField
      FieldName = 'abastecimentoexterno'
      Origin = 'abastecimentoexterno'
    end
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 128
    Top = 16
  end
  object qryControAcces: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from control_access'
      'order by id desc'
      'limit 1')
    Left = 36
    Top = 132
    object qryControAccesusuario: TWideStringField
      FieldName = 'usuario'
      Origin = 'usuario'
      Size = 32767
    end
    object qryControAccesdata_access: TDateTimeField
      FieldName = 'data_access'
      Origin = 'data_access'
    end
    object qryControAccesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryControAccessenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 100
    end
  end
  object TMaquina: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select a.*'
      'from maquinaveiculo a'
      'where status=1'
      'order by modelo')
    Left = 32
    Top = 232
    object TMaquinaid: TWideStringField
      FieldName = 'id'
      Origin = 'id'
      Required = True
      Size = 32767
    end
    object TMaquinastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TMaquinatipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
      Size = 50
    end
    object TMaquinamarca: TStringField
      FieldName = 'marca'
      Origin = 'marca'
      Size = 50
    end
    object TMaquinamodelo: TStringField
      FieldName = 'modelo'
      Origin = 'modelo'
      Required = True
      Size = 50
    end
    object TMaquinaplaca: TStringField
      FieldName = 'placa'
      Origin = 'placa'
    end
    object TMaquinaano: TWideStringField
      FieldName = 'ano'
      Origin = 'ano'
      Size = 32767
    end
    object TMaquinachassi: TStringField
      FieldName = 'chassi'
      Origin = 'chassi'
      Size = 30
    end
    object TMaquinacombustivel: TWideStringField
      FieldName = 'combustivel'
      Origin = 'combustivel'
      Size = 32767
    end
    object TMaquinavalor: TBCDField
      FieldName = 'valor'
      Origin = 'valor'
      Precision = 15
      Size = 2
    end
    object TMaquinanumeroserie: TStringField
      FieldName = 'numeroserie'
      Origin = 'numeroserie'
      Size = 30
    end
    object TMaquinaimg: TBlobField
      FieldName = 'img'
      Origin = 'img'
    end
    object TMaquinaprefixo: TStringField
      FieldName = 'prefixo'
      Origin = 'prefixo'
    end
    object TMaquinaultimarevisao: TDateField
      FieldName = 'ultimarevisao'
      Origin = 'ultimarevisao'
    end
    object TMaquinahorimetroultimarev: TBCDField
      FieldName = 'horimetroultimarev'
      Origin = 'horimetroultimarev'
      Precision = 15
      Size = 3
    end
    object TMaquinahorimetroproximarevisao: TBCDField
      FieldName = 'horimetroproximarevisao'
      Origin = 'horimetroproximarevisao'
      Precision = 15
      Size = 3
    end
    object TMaquinahorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 3
    end
  end
  object TProdutos: TFDQuery
    CachedUpdates = True
    OnReconcileError = TProdutosReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select * from produtos'
      'where status=1'
      'order by nome')
    Left = 32
    Top = 288
    object TProdutosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TProdutosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TProdutosnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TProdutostipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
    end
    object TProdutosunidademedida: TStringField
      FieldName = 'unidademedida'
      Origin = 'unidademedida'
      Size = 10
    end
    object TProdutosestoqueminimo: TBCDField
      FieldName = 'estoqueminimo'
      Origin = 'estoqueminimo'
      Precision = 15
      Size = 2
    end
    object TProdutosobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TProdutoscodigobarras: TStringField
      FieldName = 'codigobarras'
      Origin = 'codigobarras'
    end
    object TProdutoscodigofabricante: TStringField
      FieldName = 'codigofabricante'
      Size = 50
    end
    object TProdutosdefencivo: TIntegerField
      FieldName = 'defencivo'
      Origin = 'defencivo'
    end
  end
  object TOperacoes: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from operacoes'
      'order by id')
    Left = 32
    Top = 344
    object TOperacoesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TOperacoesstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TOperacoesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TOperacaoSafra: TFDQuery
    CachedUpdates = True
    OnReconcileError = TOperacaoSafraReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select o.*,t.nome Talhao,op.nome Operacao,s.nome setor,'
      
        '    x.nome tipoaplicacaosolido,ac.nome Cultura,rc.nome Receituar' +
        'io,co.Nome Cobertura,'
      '    acl.nome Variedade'
      '    from operacaosafratalhao o'
      '    left join talhoes t on t.id=o.idtalhao'
      '    left join setor s on s.id=t.idsetor'
      
        '    left join auxtipooperacaosolido x on x.id=o.idtipoaplicacaos' +
        'olido'
      '    left join auxculturas ac on ac.id=o.idcultura'
      '    left join auxcultivares acl on acl.id=o.idvariedade'
      '    left join receiturario rc on rc.id=o.idreceituario'
      '    left join Auxcobertura co on co.id=o.idCobertura'
      '    join operacoes op on op.id=o.idoperacao'
      '    where o.Status in(1,2)')
    Left = 208
    Top = 136
    object TOperacaoSafraid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TOperacaoSafrastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TOperacaoSafradatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TOperacaoSafraidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TOperacaoSafradataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TOperacaoSafraidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TOperacaoSafraidsafra: TWideStringField
      FieldName = 'idsafra'
      Origin = 'idsafra'
      Size = 32767
    end
    object TOperacaoSafraidoperacao: TWideStringField
      FieldName = 'idoperacao'
      Origin = 'idoperacao'
      Size = 32767
    end
    object TOperacaoSafradatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object TOperacaoSafradatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object TOperacaoSafraobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TOperacaoSafraidtalhao: TWideStringField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
      Size = 32767
    end
    object TOperacaoSafraidresponsavel: TWideStringField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
      Size = 32767
    end
    object TOperacaoSafraareaprevista: TBCDField
      FieldName = 'areaprevista'
      Origin = 'areaprevista'
      Precision = 15
      Size = 2
    end
    object TOperacaoSafraarearealizada: TBCDField
      FieldName = 'arearealizada'
      Origin = 'arearealizada'
      Precision = 15
      Size = 2
    end
    object TOperacaoSafraTalhao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Talhao'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TOperacaoSafraOperacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Operacao'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TOperacaoSafrasetor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'setor'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TOperacaoSafraFlagSync: TIntegerField
      FieldName = 'FlagSync'
      Origin = 'FlagSync'
    end
    object TOperacaoSafradataSync: TDateTimeField
      FieldName = 'dataSync'
      Origin = 'dataSync'
    end
    object TOperacaoSafrafinalidade: TStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 30
    end
    object TOperacaoSafraidtipoaplicacaosolido: TStringField
      FieldName = 'idtipoaplicacaosolido'
      Origin = 'idtipoaplicacaosolido'
      Size = 30
    end
    object TOperacaoSafraidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object TOperacaoSafraidvariedade: TIntegerField
      FieldName = 'idvariedade'
      Origin = 'idvariedade'
    end
    object TOperacaoSafraidreceituario: TIntegerField
      FieldName = 'idreceituario'
      Origin = 'idreceituario'
    end
    object TOperacaoSafratipoaplicacaosolido: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipoaplicacaosolido'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TOperacaoSafraCultura: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Cultura'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TOperacaoSafraReceituario: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Receituario'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TOperacaoSafraidOpMaster: TIntegerField
      FieldName = 'idOpMaster'
      Origin = 'idOpMaster'
    end
    object TOperacaoSafraCobertura: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Cobertura'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TOperacaoSafratipoterraaereo: TStringField
      FieldName = 'tipoterraaereo'
      Origin = 'tipoterraaereo'
    end
    object TOperacaoSafraQualidadeCobertura: TStringField
      FieldName = 'QualidadeCobertura'
      Origin = 'QualidadeCobertura'
    end
    object TOperacaoSafraidcobertura: TIntegerField
      FieldName = 'idcobertura'
    end
    object TOperacaoSafraVariedade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Variedade'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object TOperacaoSafraMaquinas: TFDQuery
    CachedUpdates = True
    OnReconcileError = TOperacaoSafraMaquinasReconcileError
    Connection = FDConn
    SQL.Strings = (
      
        'select a.*,b.modelo||'#39'-'#39'||b.prefixo maquina from detoperacaosafr' +
        'atalhaomaquinasoperadores a'
      'join maquinaveiculo b on a.idmaquina=b.id'
      'where a.status=1')
    Left = 208
    Top = 184
    object TOperacaoSafraMaquinasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TOperacaoSafraMaquinasstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TOperacaoSafraMaquinasidoperacaotalhao: TWideStringField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
      Size = 32767
    end
    object TOperacaoSafraMaquinasidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
      Size = 32767
    end
    object TOperacaoSafraMaquinasoperador: TStringField
      FieldName = 'operador'
      Origin = 'operador'
      Size = 100
    end
    object TOperacaoSafraMaquinashorainicio: TBCDField
      FieldName = 'horainicio'
      Origin = 'horainicio'
      Precision = 15
      Size = 2
    end
    object TOperacaoSafraMaquinashorafim: TBCDField
      FieldName = 'horafim'
      Origin = 'horafim'
      Precision = 15
      Size = 2
    end
    object TOperacaoSafraMaquinasobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TOperacaoSafraMaquinashoraparada: TBCDField
      FieldName = 'horaparada'
      Origin = 'horaparada'
      Precision = 15
      Size = 2
    end
    object TOperacaoSafraMaquinasdata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object TOperacaoSafraMaquinasidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Origin = 'idUsuario'
    end
    object TOperacaoSafraMaquinashoraTrabalhada: TBCDField
      FieldName = 'horaTrabalhada'
      Origin = 'horaTrabalhada'
      Precision = 15
      Size = 2
    end
    object TOperacaoSafraMaquinasmaquina: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'maquina'
      Origin = 'maquina'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object TOperacaoSafraMaquinasidOperador: TIntegerField
      FieldName = 'idOperador'
      Origin = 'idOperador'
    end
    object TOperacaoSafraMaquinasromaneio: TWideStringField
      FieldName = 'romaneio'
      Origin = 'romaneio'
    end
  end
  object TOperacaoSafraProdutos: TFDQuery
    CachedUpdates = True
    OnReconcileError = TOperacaoSafraProdutosReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select a.*,b.nome Produto from DetOperacaoSafraTalhaoProdutos a'
      'join produtos b on b.id=a.idproduto'
      'where a.status=1')
    Left = 208
    Top = 240
    object TOperacaoSafraProdutosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TOperacaoSafraProdutosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TOperacaoSafraProdutosdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TOperacaoSafraProdutosidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TOperacaoSafraProdutosdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TOperacaoSafraProdutosidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TOperacaoSafraProdutosidoperacaotalhao: TWideStringField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
      Size = 32767
    end
    object TOperacaoSafraProdutosidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Size = 32767
    end
    object TOperacaoSafraProdutosqtdeutilidado: TWideStringField
      FieldName = 'qtdeutilidado'
      Origin = 'qtdeutilidado'
      Size = 32767
    end
    object TOperacaoSafraProdutosobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TOperacaoSafraProdutosdata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object TOperacaoSafraProdutosProduto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TOperacaoSafraProdutosqtdPrevista: TBCDField
      FieldName = 'qtdPrevista'
      Origin = 'qtdPrevista'
      Precision = 15
      Size = 2
    end
  end
  object TOperacaoSafraOcorrencia: TFDQuery
    CachedUpdates = True
    OnReconcileError = TOperacaoSafraOcorrenciaReconcileError
    Connection = FDConn
    SQL.Strings = (
      
        'select a.*,b.nome TipoOcorrencia from DetOperacaoSafraTalhaoOcor' +
        'rencia a '
      'join auxtipoocorrencia b on a.idtipoocorrencia=b.id'
      'where a.status=1')
    Left = 208
    Top = 296
    object TOperacaoSafraOcorrenciastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TOperacaoSafraOcorrenciadatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TOperacaoSafraOcorrenciadataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TOperacaoSafraOcorrenciaidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TOperacaoSafraOcorrenciaidoperacaotalhao: TWideStringField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
      Size = 32767
    end
    object TOperacaoSafraOcorrenciadataocorrencia: TDateField
      FieldName = 'dataocorrencia'
      Origin = 'dataocorrencia'
    end
    object TOperacaoSafraOcorrenciaidtipoocorrencia: TWideStringField
      FieldName = 'idtipoocorrencia'
      Origin = 'idtipoocorrencia'
      Size = 32767
    end
    object TOperacaoSafraOcorrenciahora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TOperacaoSafraOcorrenciadescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object TOperacaoSafraOcorrenciadata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
    object TOperacaoSafraOcorrenciaTipoOcorrencia: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TipoOcorrencia'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TOperacaoSafraOcorrenciaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TOperacaoSafraOcorrenciaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
  end
  object TAuxOcorrencia: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from auxtipoocorrencia')
    Left = 208
    Top = 88
    object TAuxOcorrenciaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TAuxOcorrenciastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TAuxOcorrencianome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object qryOpSafra: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      
        'select o.*,t.nome Talhao,op.nome Operacao from operacaosafratalh' +
        'ao o '
      'join talhoes t on t.id=o.idtalhao'
      'join operacoes op on op.id=o.idoperacao')
    Left = 316
    Top = 88
    object qryOpSafraid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOpSafrastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object qryOpSafradatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object qryOpSafraidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object qryOpSafradataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object qryOpSafraidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object qryOpSafraidsafra: TWideStringField
      FieldName = 'idsafra'
      Origin = 'idsafra'
      Required = True
      Size = 32767
    end
    object qryOpSafraidoperacao: TWideStringField
      FieldName = 'idoperacao'
      Origin = 'idoperacao'
      Required = True
      Size = 32767
    end
    object qryOpSafradatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object qryOpSafradatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object qryOpSafraobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object qryOpSafraidtalhao: TWideStringField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
      Required = True
      Size = 32767
    end
    object qryOpSafraidresponsavel: TWideStringField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
      Size = 32767
    end
    object qryOpSafraareaprevista: TBCDField
      FieldName = 'areaprevista'
      Origin = 'areaprevista'
      Precision = 15
      Size = 2
    end
    object qryOpSafraarearealizada: TBCDField
      FieldName = 'arearealizada'
      Origin = 'arearealizada'
      Precision = 15
      Size = 2
    end
    object qryOpSafraTalhao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Talhao'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryOpSafraOperacao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Operacao'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryOpSafraFlagSync: TIntegerField
      FieldName = 'FlagSync'
      Origin = 'FlagSync'
      Required = True
    end
    object qryOpSafradataSync: TDateTimeField
      FieldName = 'dataSync'
      Origin = 'dataSync'
    end
    object qryOpSafrafinalidade: TStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 30
    end
    object qryOpSafraidtipoaplicacaosolido: TStringField
      FieldName = 'idtipoaplicacaosolido'
      Origin = 'idtipoaplicacaosolido'
      Size = 30
    end
    object qryOpSafraidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object qryOpSafraidvariedade: TIntegerField
      FieldName = 'idvariedade'
      Origin = 'idvariedade'
    end
    object qryOpSafraidreceituario: TIntegerField
      FieldName = 'idreceituario'
      Origin = 'idreceituario'
    end
    object qryOpSafratipoterraaereo: TStringField
      FieldName = 'tipoterraaereo'
      Origin = 'tipoterraaereo'
      Size = 10
    end
  end
  object TReceituario: TFDQuery
    CachedUpdates = True
    OnReconcileError = TReceituarioReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select id,'
      'status, '
      'nome,'
      'responsavel, '
      'idResponsavel, '
      'DataRegistro,'
      'datarecomendacao,'
      'dataprevaplicacao,'
      'cast(observacao as VARCHAR(100)) observacao '
      'from receiturario'
      'where id=-1'
      'order by dataregistro')
    Left = 208
    Top = 344
    object TReceituarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TReceituariostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TReceituarionome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TReceituarioresponsavel: TStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Required = True
      Size = 100
    end
    object TReceituarioidResponsavel: TIntegerField
      FieldName = 'idResponsavel'
      Origin = 'idResponsavel'
    end
    object TReceituarioDataRegistro: TDateTimeField
      FieldName = 'DataRegistro'
      Origin = 'DataRegistro'
    end
    object TReceituariodatarecomendacao: TDateField
      FieldName = 'datarecomendacao'
      Origin = 'datarecomendacao'
    end
    object TReceituariodataprevaplicacao: TDateField
      FieldName = 'dataprevaplicacao'
      Origin = 'dataprevaplicacao'
    end
    object TReceituarioobservacao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'observacao'
      Origin = 'observacao'
      ProviderFlags = []
      Size = 32767
    end
  end
  object TDetReceituario: TFDQuery
    CachedUpdates = True
    OnReconcileError = TDetReceituarioReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select'
      '   DISTINCT '
      '   dr.*,pr.nome Produto'
      '   from detreceiturario dr'
      '   join produtos pr on pr.id=dr.idproduto ')
    Left = 208
    Top = 400
    object TDetReceituarioid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TDetReceituariostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TDetReceituarioidreceiturario: TWideStringField
      FieldName = 'idreceiturario'
      Origin = 'idreceiturario'
      Required = True
      Size = 32767
    end
    object TDetReceituarioidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Required = True
      Size = 32767
    end
    object TDetReceituarioproduto: TStringField
      FieldName = 'produto'
      Origin = 'produto'
      Size = 100
    end
    object TDetReceituarioidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Origin = 'idUsuario'
    end
    object TDetReceituariofinalidade: TStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Required = True
      Size = 100
    end
    object TDetReceituarioFlagSync: TIntegerField
      FieldName = 'FlagSync'
      Origin = 'FlagSync'
    end
    object TDetReceituarioqtdporhe: TBCDField
      FieldName = 'qtdporhe'
      Required = True
      Precision = 15
      Size = 2
    end
    object TDetReceituarioProduto_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto_1'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object TTipoAplicacaoSolido: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from auxtipooperacaosolido')
    Left = 316
    Top = 136
    object TTipoAplicacaoSolidoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TTipoAplicacaoSolidostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TTipoAplicacaoSolidonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TDetTalhoesPul: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'SELECT D.*,T.nome Talhao FROM DetTalhoesPulverizacao D '
      'JOIN talhoes T ON T.ID=D.idTalhao')
    Left = 313
    Top = 184
    object TDetTalhoesPulid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
    end
    object TDetTalhoesPulidTalhao: TIntegerField
      FieldName = 'idTalhao'
      Origin = 'idTalhao'
      Required = True
    end
    object TDetTalhoesPulidOperacao: TIntegerField
      FieldName = 'idOperacao'
      Origin = 'idOperacao'
      Required = True
    end
    object TDetTalhoesPulAreaPrevista: TBCDField
      FieldName = 'AreaPrevista'
      Origin = 'AreaPrevista'
      Precision = 15
      Size = 2
    end
    object TDetTalhoesPulAreaRealizada: TBCDField
      FieldName = 'AreaRealizada'
      Origin = 'AreaRealizada'
      Precision = 15
      Size = 2
    end
    object TDetTalhoesPulTalhao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Talhao'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object qryAux: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    Left = 592
    Top = 56
  end
  object qryGridReceituario: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select'
      '   th.nome talhao,'
      '   dr.produto,'
      '   TH.areahe,'
      '   dr.qtdporhe,'
      '   cast((dr.qtdporhe*dr.qtdporhe)as varchar(1000)) qtdTotal,'
      '   dr.finalidade,'
      '   rc.Nome'
      '   from operacaosafratalhao op'
      '   join receiturario rc on rc.id=op.idreceituario'
      '   join detreceiturario dr on dr.idreceiturario=rc.id'
      '   join talhoes th on th.id=dr.idTalhao'
      '   and op.finalidade=dr.finalidade')
    Left = 320
    Top = 240
    object qryGridReceituarioproduto: TStringField
      FieldName = 'produto'
      Origin = 'produto'
      Size = 100
    end
    object qryGridReceituarioqtdporhe: TBCDField
      FieldName = 'qtdporhe'
      Origin = 'qtdporhe'
      Required = True
      Precision = 15
      Size = 2
    end
    object qryGridReceituarioqtdTotal: TWideStringField
      FieldName = 'qtdTotal'
      Origin = 'qtdTotal'
      Size = 32767
    end
    object qryGridReceituariofinalidade: TStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Required = True
    end
    object qryGridReceituariotalhao: TStringField
      FieldName = 'talhao'
      Origin = 'talhao'
      Size = 50
    end
    object qryGridReceituarioareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object qryGridReceituarionome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TAreas: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select a.* from areas a'
      'order by nome')
    Left = 120
    Top = 224
    object TAreasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TAreasstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TAreasnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TAreasareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TAreaslatitude: TFMTBCDField
      FieldName = 'latitude'
      Origin = 'latitude'
      Precision = 10
      Size = 6
    end
    object TAreaslongitude: TFMTBCDField
      FieldName = 'longitude'
      Origin = 'longitude'
      Precision = 10
      Size = 6
    end
    object TAreasresponsavel: TStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
  end
  object TSetor: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from setor'
      'order by nome')
    Left = 120
    Top = 280
    object TSetorid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TSetorstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TSetornome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSetorareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TSetorlatitude: TFMTBCDField
      FieldName = 'latitude'
      Origin = 'latitude'
      Precision = 10
      Size = 6
    end
    object TSetorlongitude: TFMTBCDField
      FieldName = 'longitude'
      Origin = 'longitude'
      Precision = 10
      Size = 6
    end
    object TSetoridarea: TWideStringField
      FieldName = 'idarea'
      Origin = 'idarea'
      Required = True
      Size = 32767
    end
  end
  object TTalhoes: TFDQuery
    CachedUpdates = True
    OnReconcileError = TTalhoesReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select t.*,s.nome setor from talhoes t '
      'join setor s on s.id=t.idSetor '
      'where t.status=1'
      'order by t.nome')
    Left = 120
    Top = 336
    object TTalhoesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TTalhoesstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TTalhoesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TTalhoesareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TTalhoeslatitude: TFMTBCDField
      FieldName = 'latitude'
      Origin = 'latitude'
      Precision = 10
      Size = 6
    end
    object TTalhoeslongitude: TFMTBCDField
      FieldName = 'longitude'
      Origin = 'longitude'
      Precision = 10
      Size = 6
    end
    object TTalhoesidsetor: TWideStringField
      FieldName = 'idsetor'
      Origin = 'idsetor'
      Required = True
      Size = 32767
    end
    object TTalhoesqrcode: TStringField
      FieldName = 'qrcode'
      Origin = 'qrcode'
    end
    object TTalhoesobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TTalhoessetor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'setor'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TTalhoestipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
    end
    object TTalhoesqrcodesaida: TStringField
      FieldName = 'qrcodesaida'
      Origin = 'qrcodesaida'
    end
  end
  object TCulturas: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'SELECT * FROM auxculturas')
    Left = 120
    Top = 176
    object TCulturasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TCulturasstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TCulturasnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TCultivares: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from auxcultivares')
    Left = 120
    Top = 133
    object TCultivaresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TCultivaresstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TCultivaresnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TSafra: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from safra')
    Left = 120
    Top = 82
    object TSafraid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TSafranome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSafrastatus: TIntegerField
      FieldName = 'status'
      Origin = 'status'
      Required = True
    end
  end
  object qryTalhoesPul: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from DetTalhoesPulverizacao'
      'where idOperacao=142900')
    Left = 440
    Top = 96
  end
  object qryQuebraMaquinasPul: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select l.*, '
      
        ' cast(round(HorasTalhao * (l.PercetHoras/100),2) as varchar(20))' +
        'HorasTalhaoPercent'
      'from '
      '(select '
      ' w.*, '
      ' cast(w.AreaRealizada * 100 as double)/w.AreaTotal PercetHoras'
      'from '
      '(select '
      '  k.id,'
      '  b.status,'
      '  b.idOperacaotalhao,'
      '  b.idmaquina,'
      '  b.operador,'
      '  b.horainicio,'
      '  b.horafim,'
      '  b.observacao,'
      '  b.horaparada,'
      '  b.data,'
      '  b.idusuario,'
      '  b.IdOperador,'
      '  k.idTalhao,'
      
        '  cast(((b.horafim-b.horainicio)-b.horaparada) as varchar(20)) H' +
        'orasTalhao,'
      '  AreaRealizada,'
      
        '  cast((select sum(y.AreaRealizada) from DetTalhoesPulverizacao ' +
        'y'
      '  where idOperacao=k.idOperacao) as double) areaTotal'
      'from detoperacaosafratalhaomaquinasoperadores b'
      'join DetTalhoesPulverizacao k on k.idOperacao=b.idoperacaotalhao'
      'WHERE b.status=1)w)l')
    Left = 440
    Top = 216
    object qryQuebraMaquinasPulid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryQuebraMaquinasPulstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object qryQuebraMaquinasPulidOperacaotalhao: TWideStringField
      FieldName = 'idOperacaotalhao'
      Origin = 'idOperacaotalhao'
      Required = True
      Size = 32767
    end
    object qryQuebraMaquinasPulidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
      Required = True
      Size = 32767
    end
    object qryQuebraMaquinasPuloperador: TStringField
      FieldName = 'operador'
      Origin = 'operador'
      Size = 100
    end
    object qryQuebraMaquinasPulhorainicio: TBCDField
      FieldName = 'horainicio'
      Origin = 'horainicio'
      Precision = 15
      Size = 2
    end
    object qryQuebraMaquinasPulhorafim: TBCDField
      FieldName = 'horafim'
      Origin = 'horafim'
      Precision = 15
      Size = 2
    end
    object qryQuebraMaquinasPulobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object qryQuebraMaquinasPulhoraparada: TBCDField
      FieldName = 'horaparada'
      Origin = 'horaparada'
      Precision = 15
      Size = 2
    end
    object qryQuebraMaquinasPuldata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object qryQuebraMaquinasPulHorasTalhaoPercent: TWideStringField
      FieldName = 'HorasTalhaoPercent'
      Origin = 'HorasTalhaoPercent'
      Size = 32767
    end
    object qryQuebraMaquinasPulidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object qryQuebraMaquinasPulIdOperador: TIntegerField
      FieldName = 'IdOperador'
      Origin = 'IdOperador'
    end
    object qryQuebraMaquinasPulidTalhao: TIntegerField
      FieldName = 'idTalhao'
      Origin = 'idTalhao'
      Required = True
    end
    object qryQuebraMaquinasPulHorasTalhao: TWideStringField
      FieldName = 'HorasTalhao'
      Origin = 'HorasTalhao'
      Size = 32767
    end
    object qryQuebraMaquinasPulAreaRealizada: TBCDField
      FieldName = 'AreaRealizada'
      Origin = 'AreaRealizada'
      Precision = 15
      Size = 2
    end
    object qryQuebraMaquinasPulPercetHoras: TFloatField
      FieldName = 'PercetHoras'
      Origin = 'PercetHoras'
    end
    object qryQuebraMaquinasPulareaTotal: TFloatField
      FieldName = 'areaTotal'
      Origin = 'areaTotal'
    end
  end
  object qryOperacaoQuebrada: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from operacaosafratalhao'
      'where status=3 ')
    Left = 440
    Top = 160
    object qryOperacaoQuebradaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object qryOperacaoQuebradastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object qryOperacaoQuebradadatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object qryOperacaoQuebradaidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object qryOperacaoQuebradadataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object qryOperacaoQuebradaidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object qryOperacaoQuebradaidsafra: TWideStringField
      FieldName = 'idsafra'
      Origin = 'idsafra'
      Required = True
      Size = 32767
    end
    object qryOperacaoQuebradaidoperacao: TWideStringField
      FieldName = 'idoperacao'
      Origin = 'idoperacao'
      Required = True
      Size = 32767
    end
    object qryOperacaoQuebradadatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object qryOperacaoQuebradadatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object qryOperacaoQuebradaobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object qryOperacaoQuebradaidtalhao: TWideStringField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
      Required = True
      Size = 32767
    end
    object qryOperacaoQuebradaidresponsavel: TWideStringField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
      Size = 32767
    end
    object qryOperacaoQuebradaareaprevista: TBCDField
      FieldName = 'areaprevista'
      Origin = 'areaprevista'
      Precision = 15
      Size = 2
    end
    object qryOperacaoQuebradaarearealizada: TBCDField
      FieldName = 'arearealizada'
      Origin = 'arearealizada'
      Precision = 15
      Size = 2
    end
    object qryOperacaoQuebradaFlagSync: TIntegerField
      FieldName = 'FlagSync'
      Origin = 'FlagSync'
      Required = True
    end
    object qryOperacaoQuebradadataSync: TDateTimeField
      FieldName = 'dataSync'
      Origin = 'dataSync'
    end
    object qryOperacaoQuebradafinalidade: TStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 30
    end
    object qryOperacaoQuebradaidtipoaplicacaosolido: TStringField
      FieldName = 'idtipoaplicacaosolido'
      Origin = 'idtipoaplicacaosolido'
      Size = 30
    end
    object qryOperacaoQuebradaidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object qryOperacaoQuebradaidvariedade: TIntegerField
      FieldName = 'idvariedade'
      Origin = 'idvariedade'
    end
    object qryOperacaoQuebradaidreceituario: TIntegerField
      FieldName = 'idreceituario'
      Origin = 'idreceituario'
    end
    object qryOperacaoQuebradatipoterraaereo: TStringField
      FieldName = 'tipoterraaereo'
      Origin = 'tipoterraaereo'
      Size = 10
    end
    object qryOperacaoQuebradaidOpMaster: TIntegerField
      FieldName = 'idOpMaster'
      Origin = 'idOpMaster'
    end
    object qryOperacaoQuebradaQualidadeCobertura: TStringField
      FieldName = 'QualidadeCobertura'
      Origin = 'QualidadeCobertura'
    end
    object qryOperacaoQuebradaidcobertura: TIntegerField
      FieldName = 'idcobertura'
    end
  end
  object qryQuebraProdutosPul: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select '
      ' w.* ,'
      
        ' cast(round(w.qtdeutilidado*(PercentArea/100),2)as varchar(10)) ' +
        'QtdeUtilizadaTalhao '
      'from '
      '(select '
      ' y.*,'
      ' cast((y.AreaRealizada*100) as double)/AreaTotal PercentArea'
      'from '
      '(select '
      ' a.*,'
      ' b.idTalhao,'
      ' b.AreaRealizada,'
      
        ' (select sum(AreaRealizada) from DetTalhoesPulverizacao where id' +
        'Operacao=a.idoperacaotalhao) AreaTotal'
      'from DetOperacaoSafraTalhaoProdutos a'
      'join DetTalhoesPulverizacao b on a.idoperacaotalhao=b.idOperacao'
      'where a.status=1)y)w')
    Left = 440
    Top = 272
    object qryQuebraProdutosPulid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryQuebraProdutosPulidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Required = True
      Size = 32767
    end
    object qryQuebraProdutosPulQtdeUtilizadaTalhao: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'QtdeUtilizadaTalhao'
      Origin = 'QtdeUtilizadaTalhao'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object qryQuebraProdutosPulobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object qryQuebraProdutosPuldata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
  end
  object qryQuebraOcorrenciaPul: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select a.*,b.IdTalhao from DetOperacaoSafraTalhaoOcorrencia a '
      'join DetTalhoesPulverizacao b on a.idoperacaotalhao=b.idOperacao'
      'where a.status=1')
    Left = 440
    Top = 328
    object qryQuebraOcorrenciaPulid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryQuebraOcorrenciaPulstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object qryQuebraOcorrenciaPuldatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object qryQuebraOcorrenciaPulidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
    end
    object qryQuebraOcorrenciaPuldataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object qryQuebraOcorrenciaPulidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object qryQuebraOcorrenciaPulidoperacaotalhao: TWideStringField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
      Required = True
      Size = 32767
    end
    object qryQuebraOcorrenciaPuldataocorrencia: TDateField
      FieldName = 'dataocorrencia'
      Origin = 'dataocorrencia'
    end
    object qryQuebraOcorrenciaPulidtipoocorrencia: TWideStringField
      FieldName = 'idtipoocorrencia'
      Origin = 'idtipoocorrencia'
      Size = 32767
    end
    object qryQuebraOcorrenciaPulhora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object qryQuebraOcorrenciaPuldescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object qryQuebraOcorrenciaPuldata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object qryQuebraOcorrenciaPulidTalhao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idTalhao'
      Origin = 'idTalhao'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object TAuxCobertura: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from auxcobertura')
    Left = 208
    Top = 40
    object TAuxCoberturaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object TAuxCoberturastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TAuxCoberturanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object TOperadorMaquina: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from operadormaquinas'
      'where status=1')
    Left = 448
    Top = 432
    object TOperadorMaquinaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object TOperadorMaquinastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TOperadorMaquinanome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TOperadorMaquinarg: TStringField
      FieldName = 'rg'
      Origin = 'rg'
      Size = 10
    end
    object TOperadorMaquinacpf: TStringField
      FieldName = 'cpf'
      Origin = 'cpf'
    end
    object TOperadorMaquinacnh: TStringField
      FieldName = 'cnh'
      Origin = 'cnh'
    end
    object TOperadorMaquinacelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
  end
  object TStandPlantas: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      
        'select a.*,b.nome Cultura,c.nome Variedade,t.nome Talhao from St' +
        'andSementes a'
      'join auxculturas b on b.id=a.idCultura '
      'join auxcultivares c on c.id=a.IdVariedade'
      'join talhoes t on t.id=a.idtalhao'
      'where a.status=1')
    Left = 592
    Top = 112
    object TStandPlantasid: TIntegerField
      FieldName = 'id'
    end
    object TStandPlantasidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Required = True
    end
    object TStandPlantasDataSementes: TDateField
      FieldName = 'DataSementes'
    end
    object TStandPlantasidCultura: TIntegerField
      FieldName = 'idCultura'
    end
    object TStandPlantasIdVariedade: TIntegerField
      FieldName = 'IdVariedade'
    end
    object TStandPlantasQtdeSementes: TBCDField
      FieldName = 'QtdeSementes'
      Precision = 15
      Size = 2
    end
    object TStandPlantasDataPlantas: TDateField
      FieldName = 'DataPlantas'
    end
    object TStandPlantasQtdePlantas: TBCDField
      FieldName = 'QtdePlantas'
      Precision = 15
      Size = 2
    end
    object TStandPlantassyncaws: TIntegerField
      FieldName = 'syncaws'
    end
    object TStandPlantasStatus: TIntegerField
      FieldName = 'Status'
    end
    object TStandPlantasidTalhao: TIntegerField
      FieldName = 'idTalhao'
    end
    object TStandPlantassyncfaz: TIntegerField
      FieldName = 'syncfaz'
    end
    object TStandPlantasCultura: TStringField
      FieldName = 'Cultura'
      ReadOnly = True
      Size = 50
    end
    object TStandPlantasVariedade: TStringField
      FieldName = 'Variedade'
      ReadOnly = True
      Size = 50
    end
    object TStandPlantasTalhao: TStringField
      FieldName = 'Talhao'
      ReadOnly = True
      Size = 50
    end
  end
  object TGridReceituarioTalhao: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select '
      ' dr.*,'
      ' t.Nome Talhao'
      'from detreceiturarioTalhao dr '
      'join talhoes t on t.id=dr.idtalhao'
      'where idReceiturario=1')
    Left = 208
    Top = 496
    object TGridReceituarioTalhaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object TGridReceituarioTalhaostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TGridReceituarioTalhaodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TGridReceituarioTalhaoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TGridReceituarioTalhaodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TGridReceituarioTalhaoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TGridReceituarioTalhaoidtalhao: TWideStringField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
      Size = 32767
    end
    object TGridReceituarioTalhaoareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TGridReceituarioTalhaosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TGridReceituarioTalhaosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TGridReceituarioTalhaoidreceiturario: TWideStringField
      FieldName = 'idreceiturario'
      Origin = 'idreceiturario'
      Size = 32767
    end
    object TGridReceituarioTalhaoTalhao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Talhao'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object TDetReceituarioTalhao: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select '
      ' dr.*'
      'from detreceiturarioTalhao dr '
      'where idReceiturario=-1')
    Left = 208
    Top = 448
    object TDetReceituarioTalhaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object TDetReceituarioTalhaostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TDetReceituarioTalhaodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TDetReceituarioTalhaoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TDetReceituarioTalhaodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TDetReceituarioTalhaoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TDetReceituarioTalhaoidtalhao: TWideStringField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
      Size = 32767
    end
    object TDetReceituarioTalhaoareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TDetReceituarioTalhaosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TDetReceituarioTalhaosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TDetReceituarioTalhaoidreceiturario: TWideStringField
      FieldName = 'idreceiturario'
      Origin = 'idreceiturario'
      Size = 32767
    end
  end
  object TVazaoOperacao: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from DetVazaoOperacao')
    Left = 208
    Top = 552
    object TVazaoOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object TVazaoOperacaostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TVazaoOperacaodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TVazaoOperacaoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TVazaoOperacaodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TVazaoOperacaoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TVazaoOperacaoidoperacaotalhao: TWideStringField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
      Size = 32767
    end
    object TVazaoOperacaoCincoLTHA: TIntegerField
      FieldName = 'CincoLTHA'
      Origin = 'CincoLTHA'
    end
    object TVazaoOperacaoDezLTHA: TIntegerField
      FieldName = 'DezLTHA'
      Origin = 'DezLTHA'
    end
    object TVazaoOperacaoQuinzeLTHA: TIntegerField
      FieldName = 'QuinzeLTHA'
      Origin = 'QuinzeLTHA'
    end
    object TVazaoOperacaoVinteLTHA: TIntegerField
      FieldName = 'VinteLTHA'
      Origin = 'VinteLTHA'
    end
    object TVazaoOperacaoTrintaLTHA: TIntegerField
      FieldName = 'TrintaLTHA'
      Origin = 'TrintaLTHA'
    end
    object TVazaoOperacaoQuarentaLTHA: TIntegerField
      FieldName = 'QuarentaLTHA'
      Origin = 'QuarentaLTHA'
    end
    object TVazaoOperacaoCinquentaLTHA: TIntegerField
      FieldName = 'CinquentaLTHA'
      Origin = 'CinquentaLTHA'
    end
    object TVazaoOperacaoSetentaeCincoLTHA: TIntegerField
      FieldName = 'SetentaeCincoLTHA'
      Origin = 'SetentaeCincoLTHA'
    end
    object TVazaoOperacaoCemLTHA: TIntegerField
      FieldName = 'CemLTHA'
      Origin = 'CemLTHA'
    end
    object TVazaoOperacaosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TVazaoOperacaosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object qryQuebraVazaoOperacao: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from DetVazaoOperacao')
    Left = 448
    Top = 384
    object qryQuebraVazaoOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object qryQuebraVazaoOperacaostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object qryQuebraVazaoOperacaodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object qryQuebraVazaoOperacaoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object qryQuebraVazaoOperacaodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object qryQuebraVazaoOperacaoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object qryQuebraVazaoOperacaoidoperacaotalhao: TWideStringField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
      Size = 32767
    end
    object qryQuebraVazaoOperacaoCincoLTHA: TIntegerField
      FieldName = 'CincoLTHA'
      Origin = 'CincoLTHA'
    end
    object qryQuebraVazaoOperacaoDezLTHA: TIntegerField
      FieldName = 'DezLTHA'
      Origin = 'DezLTHA'
    end
    object qryQuebraVazaoOperacaoQuinzeLTHA: TIntegerField
      FieldName = 'QuinzeLTHA'
      Origin = 'QuinzeLTHA'
    end
    object qryQuebraVazaoOperacaoVinteLTHA: TIntegerField
      FieldName = 'VinteLTHA'
      Origin = 'VinteLTHA'
    end
    object qryQuebraVazaoOperacaoTrintaLTHA: TIntegerField
      FieldName = 'TrintaLTHA'
      Origin = 'TrintaLTHA'
    end
    object qryQuebraVazaoOperacaoQuarentaLTHA: TIntegerField
      FieldName = 'QuarentaLTHA'
      Origin = 'QuarentaLTHA'
    end
    object qryQuebraVazaoOperacaoCinquentaLTHA: TIntegerField
      FieldName = 'CinquentaLTHA'
      Origin = 'CinquentaLTHA'
    end
    object qryQuebraVazaoOperacaoSetentaeCincoLTHA: TIntegerField
      FieldName = 'SetentaeCincoLTHA'
      Origin = 'SetentaeCincoLTHA'
    end
    object qryQuebraVazaoOperacaoCemLTHA: TIntegerField
      FieldName = 'CemLTHA'
      Origin = 'CemLTHA'
    end
    object qryQuebraVazaoOperacaosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object qryQuebraVazaoOperacaosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object TPluviometro: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select a.*,b.nome setor from Pluviometro a'
      'join setor b on a.idSetor=b.id')
    Left = 592
    Top = 168
    object TPluviometroid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPluviometrostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TPluviometrodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TPluviometroidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TPluviometrodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TPluviometroidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TPluviometronome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TPluviometrolatitude: TStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TPluviometrolongitude: TStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TPluviometrosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TPluviometrosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TPluviometrosetor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'setor'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TPluviometroidsetor: TIntegerField
      FieldName = 'idsetor'
      Origin = 'idsetor'
      Required = True
    end
  end
  object TPluviometroTalhoes: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select a.*,b.nome talhao from PluviometroTalhoes a '
      'join talhoes b on a.idTalhao=b.id'
      'where a.status=1 and a.idPLuviometro=1')
    Left = 592
    Top = 224
    object TPluviometroTalhoesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPluviometroTalhoesstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TPluviometroTalhoesdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TPluviometroTalhoesidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TPluviometroTalhoesdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TPluviometroTalhoesidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TPluviometroTalhoessyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TPluviometroTalhoessyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TPluviometroTalhoestalhao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'talhao'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TPluviometroTalhoesidpluviometro: TIntegerField
      FieldName = 'idpluviometro'
      Origin = 'idpluviometro'
      Required = True
    end
    object TPluviometroTalhoesidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
      Required = True
    end
  end
  object TPluviometria: TFDQuery
    CachedUpdates = True
    OnReconcileError = TPluviometriaReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select a.*,b.nome Setor,c.nome Pluviometro from pluviometria a'
      'join talhoes t on a.idtalhao=t.id'
      'join setor b on b.id=t.idsetor'
      'join Pluviometro c on c.id=a.idpluviometro')
    Left = 592
    Top = 280
    object TPluviometriaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPluviometriastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TPluviometriadatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TPluviometriaidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TPluviometriadataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TPluviometriaidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TPluviometriaidpluviometro: TWideStringField
      FieldName = 'idpluviometro'
      Origin = 'idpluviometro'
      Size = 32767
    end
    object TPluviometriaidtalhao: TWideStringField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
      Size = 32767
    end
    object TPluviometriavolumemm: TBCDField
      FieldName = 'volumemm'
      Origin = 'volumemm'
      Precision = 15
      Size = 3
    end
    object TPluviometriadatacoleta: TDateField
      FieldName = 'datacoleta'
      Origin = 'datacoleta'
    end
    object TPluviometriahora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TPluviometriasyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TPluviometriasyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TPluviometriaSetor: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Setor'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TPluviometriaPluviometro: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Pluviometro'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object TLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from localestoque'
      'where status=1')
    Left = 592
    Top = 336
    object TLocalEstoqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TLocalEstoquestatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TLocalEstoquedatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TLocalEstoqueidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TLocalEstoquedataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TLocalEstoqueidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TLocalEstoquenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TLocalEstoqueidsegmento: TWideStringField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
      Size = 32767
    end
    object TLocalEstoquesyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TLocalEstoquesyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object TAbastecimento: TFDQuery
    CachedUpdates = True
    OnReconcileError = TAbastecimentoReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select '
      ' a.*, '
      ' b.nome LocalEstoque,'
      ' c.prefixo  Maquina,'
      ' d.nome Operador,'
      ' case '
      '  when a.combustivel =0 then '#39'Diesel'#39
      '  when a.combustivel =1 then '#39'Gasolina'#39
      '  when a.combustivel =2 then '#39'Alcool'#39
      ' end CombustivelStr,'
      ' h.nome Atividade'
      'from abastecimento a'
      'join localestoque b on a.idlocalestoque=b.id'
      'join maquinaveiculo c on c.id=a.idmaquina'
      'join operadormaquinas d on d.id=a.idOperador'
      'join auxatividadeabastecimento h on h.id=a.idAtividade')
    Left = 592
    Top = 392
    object TAbastecimentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAbastecimentostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TAbastecimentodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TAbastecimentoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TAbastecimentodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TAbastecimentoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TAbastecimentoidlocalestoque: TWideStringField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
      Size = 32767
    end
    object TAbastecimentoidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
      Size = 32767
    end
    object TAbastecimentoidoperador: TWideStringField
      FieldName = 'idoperador'
      Origin = 'idoperador'
      Size = 32767
    end
    object TAbastecimentovolumelt: TBCDField
      FieldName = 'volumelt'
      Origin = 'volumelt'
      Precision = 15
      Size = 3
    end
    object TAbastecimentocombustivel: TIntegerField
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
    object TAbastecimentodataabastecimento: TDateField
      FieldName = 'dataabastecimento'
      Origin = 'dataabastecimento'
    end
    object TAbastecimentohora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TAbastecimentosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TAbastecimentosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TAbastecimentoLocalEstoque: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LocalEstoque'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TAbastecimentoMaquina: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Maquina'
      Origin = 'prefixo'
      ProviderFlags = []
      ReadOnly = True
    end
    object TAbastecimentoOperador: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Operador'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TAbastecimentohorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoCombustivelStr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CombustivelStr'
      Origin = 'CombustivelStr'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object TAbastecimentoidatividade: TIntegerField
      FieldName = 'idatividade'
      Origin = 'idatividade'
    end
    object TAbastecimentoAtividade: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Atividade'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TAbastecimentoobs: TStringField
      FieldName = 'obs'
      Origin = 'obs'
      Size = 100
    end
    object TAbastecimentoimg: TWideMemoField
      FieldName = 'img'
      Origin = 'img'
      BlobType = ftWideMemo
    end
    object TAbastecimentoimg2: TWideMemoField
      FieldName = 'img2'
      Origin = 'img2'
      BlobType = ftWideMemo
    end
    object TAbastecimentoimg3: TWideMemoField
      FieldName = 'img3'
      Origin = 'img3'
      BlobType = ftWideMemo
    end
    object TAbastecimentoimg4: TWideMemoField
      FieldName = 'img4'
      Origin = 'img4'
      BlobType = ftWideMemo
    end
    object TAbastecimentoimg5: TWideMemoField
      FieldName = 'img5'
      Origin = 'img5'
      BlobType = ftWideMemo
    end
    object TAbastecimentoexterno: TWideStringField
      FieldName = 'externo'
      Origin = 'externo'
      Size = 32767
    end
  end
  object TAbastecimentoOutros: TFDQuery
    CachedUpdates = True
    OnReconcileError = TAbastecimentoOutrosReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select a.*,b.nome Produto from abastecimentoOutros a'
      'join produtos b on b.id=a.idproduto')
    Left = 600
    Top = 456
    object TAbastecimentoOutrosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TAbastecimentoOutrosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TAbastecimentoOutrosdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TAbastecimentoOutrosidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TAbastecimentoOutrosdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TAbastecimentoOutrosidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TAbastecimentoOutrosidabastecimento: TWideStringField
      FieldName = 'idabastecimento'
      Origin = 'idabastecimento'
      Size = 32767
    end
    object TAbastecimentoOutrosidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Size = 32767
    end
    object TAbastecimentoOutrosquantidade: TBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 15
      Size = 3
    end
    object TAbastecimentoOutrossyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TAbastecimentoOutrossyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TAbastecimentoOutrosProduto: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Produto'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object TPragas: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from auxPragas')
    Left = 320
    Top = 296
    object TPragasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TPragasstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TPragasdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TPragasidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TPragasdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TPragasidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TPragasnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TPragassyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TPragassyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object TMonitoramento: TFDQuery
    CachedUpdates = True
    OnReconcileError = TMonitoramentoReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select '
      ' a.*,'
      ' b.nome Talhao,'
      ' case '
      '  when tipoAbertura=0 then '#39'Manual'#39' '
      '  when tipoAbertura=1 then '#39'Codigo Barras'#39' '
      ' end tipoAberturaStr'
      'from monitoramentopragas a '
      'join talhoes b on a.idTalhao=b.id'
      'where a.status>-1')
    Left = 320
    Top = 352
    object TMonitoramentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMonitoramentostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TMonitoramentodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TMonitoramentoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TMonitoramentodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TMonitoramentoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TMonitoramentodataMonitoramento: TDateField
      FieldName = 'dataMonitoramento'
      Origin = 'dataMonitoramento'
    end
    object TMonitoramentoidTalhao: TWideStringField
      FieldName = 'idTalhao'
      Origin = 'idTalhao'
      Size = 32767
    end
    object TMonitoramentohoraInicio: TSQLTimeStampField
      FieldName = 'horaInicio'
      Origin = 'horaInicio'
    end
    object TMonitoramentotipoAbertura: TIntegerField
      FieldName = 'tipoAbertura'
      Origin = 'tipoAbertura'
    end
    object TMonitoramentohoraFim: TSQLTimeStampField
      FieldName = 'horaFim'
      Origin = 'horaFim'
    end
    object TMonitoramentosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TMonitoramentosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TMonitoramentoTalhao: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Talhao'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TMonitoramentotipoAberturaStr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'tipoAberturaStr'
      Origin = 'tipoAberturaStr'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
    object TMonitoramentoTagAbertura: TStringField
      FieldName = 'TagAbertura'
      Origin = 'TagAbertura'
    end
    object TMonitoramentoTagFechamento: TStringField
      FieldName = 'TagFechamento'
      Origin = 'TagFechamento'
    end
  end
  object TMonitoramentoPontos: TFDQuery
    CachedUpdates = True
    OnReconcileError = TMonitoramentoPontosReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select '
      ' a.*'
      'from monitoramentopragasPontos a '
      'where a.status=1 and a.idMonitoramento=1')
    Left = 320
    Top = 400
    object TMonitoramentoPontosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMonitoramentoPontosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TMonitoramentoPontosdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TMonitoramentoPontosidMonitoramento: TWideStringField
      FieldName = 'idMonitoramento'
      Origin = 'idMonitoramento'
      Size = 32767
    end
    object TMonitoramentoPontosPonto: TStringField
      FieldName = 'Ponto'
      Origin = 'Ponto'
    end
    object TMonitoramentoPontosdataPonto: TDateField
      FieldName = 'dataPonto'
      Origin = 'dataPonto'
    end
    object TMonitoramentoPontoshora: TSQLTimeStampField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TMonitoramentoPontoslatitude: TStringField
      FieldName = 'latitude'
      Origin = 'latitude'
      Size = 50
    end
    object TMonitoramentoPontoslongitude: TStringField
      FieldName = 'longitude'
      Origin = 'longitude'
      Size = 50
    end
    object TMonitoramentoPontossyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TMonitoramentoPontossyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object TGetTalhoes: TFDQuery
    CachedUpdates = True
    OnReconcileError = TGetTalhoesReconcileError
    Connection = FDConn
    SQL.Strings = (
      'select * from talhoes')
    Left = 120
    Top = 400
    object TGetTalhoesid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TGetTalhoesstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TGetTalhoesnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TGetTalhoesareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TGetTalhoeslatitude: TFMTBCDField
      FieldName = 'latitude'
      Origin = 'latitude'
      Precision = 10
      Size = 6
    end
    object TGetTalhoeslongitude: TFMTBCDField
      FieldName = 'longitude'
      Origin = 'longitude'
      Precision = 10
      Size = 6
    end
    object TGetTalhoesidsetor: TWideStringField
      FieldName = 'idsetor'
      Origin = 'idsetor'
      Required = True
      Size = 32767
    end
    object TGetTalhoesqrcode: TStringField
      FieldName = 'qrcode'
      Origin = 'qrcode'
    end
    object TGetTalhoestipo: TStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Required = True
    end
    object TGetTalhoesobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TGetTalhoesqrcodesaida: TStringField
      FieldName = 'qrcodesaida'
      Origin = 'qrcodesaida'
    end
  end
  object TMonitoramentoPontosValores: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select '
      ' a.*,'
      ' b.nome Praga,'
      ' case'
      '  when caracteristica=0 then '#39'Postura'#39
      '  when caracteristica=1 then '#39'Pequena'#39
      '  when caracteristica=2 then '#39'M'#233'dia'#39
      '  when caracteristica=3 then '#39'Grande'#39
      '  when caracteristica=4 then '#39'Ninfas'#39
      '  when caracteristica=5 then '#39'Rajado'#39
      '  when caracteristica=6 then '#39'Adultos'#39
      '  when caracteristica=7 then '#39'Branco'#39
      ' end CaracteristicaStr'
      'from monitoramentopragasPontosValores a'
      'join auxPragas b on a.idPraga=b.id'
      'where a.idPonto=1')
    Left = 320
    Top = 464
    object TMonitoramentoPontosValoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMonitoramentoPontosValoresstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TMonitoramentoPontosValoresdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TMonitoramentoPontosValoresidPonto: TWideStringField
      FieldName = 'idPonto'
      Origin = 'idPonto'
      Size = 32767
    end
    object TMonitoramentoPontosValoresidPraga: TWideStringField
      FieldName = 'idPraga'
      Origin = 'idPraga'
      Size = 32767
    end
    object TMonitoramentoPontosValoreshora: TSQLTimeStampField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TMonitoramentoPontosValoressyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TMonitoramentoPontosValoressyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TMonitoramentoPontosValorescontagem: TIntegerField
      FieldName = 'contagem'
      Origin = 'contagem'
    end
    object TMonitoramentoPontosValoresPraga: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Praga'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TMonitoramentoPontosValorescaracteristica: TIntegerField
      FieldName = 'caracteristica'
      Origin = 'caracteristica'
    end
    object TMonitoramentoPontosValoresCaracteristicaStr: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'CaracteristicaStr'
      Origin = 'CaracteristicaStr'
      ProviderFlags = []
      ReadOnly = True
      Size = 32767
    end
  end
  object TMonitPontosValoresInsert: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from monitoramentopragasPontosValores a'
      'where a.idPonto=-1')
    Left = 320
    Top = 520
    object TMonitPontosValoresInsertid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TMonitPontosValoresInsertstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TMonitPontosValoresInsertdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TMonitPontosValoresInsertidPonto: TWideStringField
      FieldName = 'idPonto'
      Origin = 'idPonto'
      Size = 32767
    end
    object TMonitPontosValoresInsertidPraga: TWideStringField
      FieldName = 'idPraga'
      Origin = 'idPraga'
      Size = 32767
    end
    object TMonitPontosValoresInserthora: TSQLTimeStampField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TMonitPontosValoresInsertsyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TMonitPontosValoresInsertsyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TMonitPontosValoresInsertcontagem: TIntegerField
      FieldName = 'contagem'
      Origin = 'contagem'
    end
    object TMonitPontosValoresInsertcaracteristica: TIntegerField
      FieldName = 'caracteristica'
      Origin = 'caracteristica'
    end
  end
  object TMovLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      '  select '
      '    a.*,'
      '    o.nome LocalOrigem,'
      '    d.nome LocalDestino,'
      '    '#39#39' Produto from tranferenciaLocalestoque A'
      '  join localestoque o on o.id=a.idlocalestoqueorigem'
      '  join localestoque d on d.id=a.idlocalestoquedetino'
      '  where a.status=1'
      '  order by a.datamov desc')
    Left = 704
    Top = 48
    object TMovLocalEstoqueid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TMovLocalEstoquestatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TMovLocalEstoquedatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Origin = 'datareg'
    end
    object TMovLocalEstoqueidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TMovLocalEstoquedataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TMovLocalEstoqueidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TMovLocalEstoqueidlocalestoqueorigem: TWideStringField
      FieldName = 'idlocalestoqueorigem'
      Origin = 'idlocalestoqueorigem'
      Size = 32767
    end
    object TMovLocalEstoqueidlocalestoqueDetino: TWideStringField
      FieldName = 'idlocalestoqueDetino'
      Origin = 'idlocalestoqueDetino'
      Size = 32767
    end
    object TMovLocalEstoqueidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Size = 32767
    end
    object TMovLocalEstoqueqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 15
      Size = 3
    end
    object TMovLocalEstoquedatamov: TDateField
      FieldName = 'datamov'
      Origin = 'datamov'
    end
    object TMovLocalEstoquehora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TMovLocalEstoquesyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TMovLocalEstoquesyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TMovLocalEstoqueLocalOrigem: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LocalOrigem'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TMovLocalEstoqueLocalDestino: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'LocalDestino'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object TMovLocalEstoqueProduto: TWideStringField
      FieldName = 'Produto'
      ReadOnly = True
      Size = 32767
    end
  end
  object Tauxatividadeabastecimento: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'SELECT * FROM auxatividadeabastecimento')
    Left = 712
    Top = 104
    object Tauxatividadeabastecimentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Tauxatividadeabastecimentostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object Tauxatividadeabastecimentodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object Tauxatividadeabastecimentoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object Tauxatividadeabastecimentodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
    end
    object Tauxatividadeabastecimentoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object Tauxatividadeabastecimentonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object Tauxatividadeabastecimentosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object Tauxatividadeabastecimentosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object Contratos: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from contratos'
      'where status=1')
    Left = 704
    Top = 168
    object Contratosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object Contratosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object Contratosdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object Contratosidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object Contratosdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object Contratosidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object Contratosidcomprador: TWideStringField
      FieldName = 'idcomprador'
      Origin = 'idcomprador'
      Size = 32767
    end
    object Contratosidcultura: TWideStringField
      FieldName = 'idcultura'
      Origin = 'idcultura'
      Size = 32767
    end
    object Contratosidsafra: TWideStringField
      FieldName = 'idsafra'
      Origin = 'idsafra'
      Size = 32767
    end
    object Contratosnumerocontrato: TStringField
      FieldName = 'numerocontrato'
      Origin = 'numerocontrato'
    end
    object Contratostotalcompravolume: TBCDField
      FieldName = 'totalcompravolume'
      Origin = 'totalcompravolume'
      Precision = 15
      Size = 3
    end
    object Contratostotalcomprasacos: TBCDField
      FieldName = 'totalcomprasacos'
      Origin = 'totalcomprasacos'
      Precision = 15
      Size = 3
    end
    object Contratostotalembarquevolume: TBCDField
      FieldName = 'totalembarquevolume'
      Origin = 'totalembarquevolume'
      Precision = 15
      Size = 3
    end
    object Contratostotalembarquesacos: TBCDField
      FieldName = 'totalembarquesacos'
      Origin = 'totalembarquesacos'
      Precision = 15
      Size = 3
    end
    object Contratossyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object Contratossyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object Embarques: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select * from embarque'
      'where status=1')
    Left = 712
    Top = 280
    object Embarquesid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Embarquesstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object Embarquesdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object Embarquesidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object Embarquesdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object Embarquesidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object Embarquesidcontrato: TWideStringField
      FieldName = 'idcontrato'
      Origin = 'idcontrato'
      Size = 32767
    end
    object Embarquesnumeronf: TWideStringField
      FieldName = 'numeronf'
      Origin = 'numeronf'
      Size = 32767
    end
    object Embarquesplaca: TStringField
      FieldName = 'placa'
      Origin = 'placa'
      Size = 15
    end
    object Embarquesdataembarque: TDateField
      FieldName = 'dataembarque'
      Origin = 'dataembarque'
    end
    object Embarqueshorabarque: TTimeField
      FieldName = 'horabarque'
      Origin = 'horabarque'
    end
    object Embarquestara: TBCDField
      FieldName = 'tara'
      Origin = 'tara'
      Precision = 15
      Size = 3
    end
    object Embarquesbruto: TBCDField
      FieldName = 'bruto'
      Origin = 'bruto'
      Precision = 15
      Size = 3
    end
    object Embarquesliquido: TBCDField
      FieldName = 'liquido'
      Origin = 'liquido'
      Precision = 15
      Size = 3
    end
    object Embarquesimp: TBCDField
      FieldName = 'imp'
      Origin = 'imp'
      Precision = 15
      Size = 3
    end
    object Embarquesqueb: TBCDField
      FieldName = 'queb'
      Origin = 'queb'
      Precision = 15
      Size = 3
    end
    object Embarquesverd: TBCDField
      FieldName = 'verd'
      Origin = 'verd'
      Precision = 15
      Size = 3
    end
    object Embarquesavar: TBCDField
      FieldName = 'avar'
      Origin = 'avar'
      Precision = 15
      Size = 3
    end
    object Embarquesumid: TBCDField
      FieldName = 'umid'
      Origin = 'umid'
      Precision = 15
      Size = 3
    end
    object Embarquessyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object Embarquessyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object ContratosGrid: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select '
      ' a.*,'
      ' b.nome Comprador'
      'from contratos a'
      'join comprador b on idcomprador=b.id')
    Left = 712
    Top = 224
    object ContratosGridid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object ContratosGridstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object ContratosGriddatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object ContratosGrididusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object ContratosGriddataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object ContratosGrididusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object ContratosGrididcomprador: TWideStringField
      FieldName = 'idcomprador'
      Origin = 'idcomprador'
      Required = True
      Size = 32767
    end
    object ContratosGrididcultura: TWideStringField
      FieldName = 'idcultura'
      Origin = 'idcultura'
      Required = True
      Size = 32767
    end
    object ContratosGrididsafra: TWideStringField
      FieldName = 'idsafra'
      Origin = 'idsafra'
      Required = True
      Size = 32767
    end
    object ContratosGridnumerocontrato: TStringField
      FieldName = 'numerocontrato'
      Origin = 'numerocontrato'
      Required = True
    end
    object ContratosGridtotalcompravolume: TBCDField
      FieldName = 'totalcompravolume'
      Origin = 'totalcompravolume'
      Required = True
      Precision = 15
      Size = 3
    end
    object ContratosGridtotalcomprasacos: TBCDField
      FieldName = 'totalcomprasacos'
      Origin = 'totalcomprasacos'
      Required = True
      Precision = 15
      Size = 3
    end
    object ContratosGridtotalembarquevolume: TBCDField
      FieldName = 'totalembarquevolume'
      Origin = 'totalembarquevolume'
      Required = True
      Precision = 15
      Size = 3
    end
    object ContratosGridtotalembarquesacos: TBCDField
      FieldName = 'totalembarquesacos'
      Origin = 'totalembarquesacos'
      Required = True
      Precision = 15
      Size = 3
    end
    object ContratosGridsyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object ContratosGridsyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object ContratosGridComprador: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Comprador'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object EmbarquesGrid: TFDQuery
    CachedUpdates = True
    Connection = FDConn
    SQL.Strings = (
      'select a.*,b.numerocontrato,c.nome Comprador from embarque a '
      'join contratos b on a.idContrato=b.id'
      'join comprador c on c.id=b.idcomprador'
      'where a.status=1')
    Left = 712
    Top = 336
    object EmbarquesGridid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object EmbarquesGridstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object EmbarquesGriddatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object EmbarquesGrididusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object EmbarquesGriddataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object EmbarquesGrididusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object EmbarquesGrididcontrato: TWideStringField
      FieldName = 'idcontrato'
      Origin = 'idcontrato'
      Required = True
      Size = 32767
    end
    object EmbarquesGridnumeronf: TWideStringField
      FieldName = 'numeronf'
      Origin = 'numeronf'
      Required = True
      Size = 32767
    end
    object EmbarquesGridplaca: TStringField
      FieldName = 'placa'
      Origin = 'placa'
      Required = True
      Size = 15
    end
    object EmbarquesGriddataembarque: TDateField
      FieldName = 'dataembarque'
      Origin = 'dataembarque'
      Required = True
    end
    object EmbarquesGridhorabarque: TTimeField
      FieldName = 'horabarque'
      Origin = 'horabarque'
      Required = True
    end
    object EmbarquesGridtara: TBCDField
      FieldName = 'tara'
      Origin = 'tara'
      Required = True
      Precision = 15
      Size = 3
    end
    object EmbarquesGridbruto: TBCDField
      FieldName = 'bruto'
      Origin = 'bruto'
      Required = True
      Precision = 15
      Size = 3
    end
    object EmbarquesGridliquido: TBCDField
      FieldName = 'liquido'
      Origin = 'liquido'
      Required = True
      Precision = 15
      Size = 3
    end
    object EmbarquesGridimp: TBCDField
      FieldName = 'imp'
      Origin = 'imp'
      Required = True
      Precision = 15
      Size = 3
    end
    object EmbarquesGridqueb: TBCDField
      FieldName = 'queb'
      Origin = 'queb'
      Required = True
      Precision = 15
      Size = 3
    end
    object EmbarquesGridverd: TBCDField
      FieldName = 'verd'
      Origin = 'verd'
      Required = True
      Precision = 15
      Size = 3
    end
    object EmbarquesGridavar: TBCDField
      FieldName = 'avar'
      Origin = 'avar'
      Required = True
      Precision = 15
      Size = 3
    end
    object EmbarquesGridumid: TBCDField
      FieldName = 'umid'
      Origin = 'umid'
      Required = True
      Precision = 15
      Size = 3
    end
    object EmbarquesGridsyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object EmbarquesGridsyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object EmbarquesGridnumerocontrato: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'numerocontrato'
      Origin = 'numerocontrato'
      ProviderFlags = []
      ReadOnly = True
    end
    object EmbarquesGridComprador: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Comprador'
      Origin = 'nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
  end
  object TListaRevisao: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select a.*,b.nome  from revisaomaquinahist a '
      'join planorevisao b on a.idplanorevisao=b.id'
      'where a.idmaquina=1')
    Left = 440
    Top = 40
    object TListaRevisaoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object TListaRevisaoidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Required = True
      Size = 32767
    end
    object TListaRevisaoobservacao: TStringField
      FieldName = 'observacao'
      Size = 100
    end
    object TListaRevisaodatainicio: TDateField
      FieldName = 'datainicio'
      Required = True
    end
    object TListaRevisaodatafim: TDateField
      FieldName = 'datafim'
    end
    object TListaRevisaohorimetro: TBCDField
      FieldName = 'horimetro'
      Precision = 15
      Size = 2
    end
    object TListaRevisaohorimetroproxima: TBCDField
      FieldName = 'horimetroproxima'
      Precision = 15
      Size = 3
    end
    object TListaRevisaoidplanorevisao: TIntegerField
      FieldName = 'idplanorevisao'
    end
    object TListaRevisaonome: TStringField
      FieldName = 'nome'
      ReadOnly = True
      Size = 100
    end
  end
  object TOperacaoExtra: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from operacaosafratalhao')
    Left = 320
    Top = 24
    object TOperacaoExtraid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TOperacaoExtrastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TOperacaoExtradatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TOperacaoExtraidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TOperacaoExtradataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TOperacaoExtraidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TOperacaoExtraidsafra: TWideStringField
      FieldName = 'idsafra'
      Origin = 'idsafra'
      Required = True
      Size = 32767
    end
    object TOperacaoExtraidoperacao: TWideStringField
      FieldName = 'idoperacao'
      Origin = 'idoperacao'
      Required = True
      Size = 32767
    end
    object TOperacaoExtradatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object TOperacaoExtradatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object TOperacaoExtraobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TOperacaoExtraidtalhao: TWideStringField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
      Required = True
      Size = 32767
    end
    object TOperacaoExtraidresponsavel: TWideStringField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
      Size = 32767
    end
    object TOperacaoExtraareaprevista: TBCDField
      FieldName = 'areaprevista'
      Origin = 'areaprevista'
      Precision = 15
      Size = 2
    end
    object TOperacaoExtraarearealizada: TBCDField
      FieldName = 'arearealizada'
      Origin = 'arearealizada'
      Precision = 15
      Size = 2
    end
    object TOperacaoExtraFlagSync: TIntegerField
      FieldName = 'FlagSync'
      Origin = 'FlagSync'
      Required = True
    end
    object TOperacaoExtradataSync: TDateTimeField
      FieldName = 'dataSync'
      Origin = 'dataSync'
    end
    object TOperacaoExtrafinalidade: TStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 30
    end
    object TOperacaoExtraidtipoaplicacaosolido: TStringField
      FieldName = 'idtipoaplicacaosolido'
      Origin = 'idtipoaplicacaosolido'
      Size = 30
    end
    object TOperacaoExtraidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object TOperacaoExtraidvariedade: TIntegerField
      FieldName = 'idvariedade'
      Origin = 'idvariedade'
    end
    object TOperacaoExtraidreceituario: TIntegerField
      FieldName = 'idreceituario'
      Origin = 'idreceituario'
    end
    object TOperacaoExtratipoterraaereo: TStringField
      FieldName = 'tipoterraaereo'
      Origin = 'tipoterraaereo'
    end
    object TOperacaoExtraidOpMaster: TIntegerField
      FieldName = 'idOpMaster'
      Origin = 'idOpMaster'
    end
    object TOperacaoExtraidcobertura: TIntegerField
      FieldName = 'idcobertura'
      Origin = 'idcobertura'
    end
    object TOperacaoExtraQualidadeCobertura: TStringField
      FieldName = 'QualidadeCobertura'
      Origin = 'QualidadeCobertura'
    end
  end
  object QryFotos: TFDQuery
    Connection = FDConn
    SQL.Strings = (
      'select * from abastecimento')
    Left = 464
    Top = 528
    object QryFotosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryFotosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object QryFotosdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object QryFotosidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object QryFotosdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object QryFotosidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object QryFotosidlocalestoque: TWideStringField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
      Required = True
      Size = 32767
    end
    object QryFotosidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
      Required = True
      Size = 32767
    end
    object QryFotosidoperador: TWideStringField
      FieldName = 'idoperador'
      Origin = 'idoperador'
      Required = True
      Size = 32767
    end
    object QryFotosvolumelt: TBCDField
      FieldName = 'volumelt'
      Origin = 'volumelt'
      Precision = 15
      Size = 3
    end
    object QryFotoscombustivel: TIntegerField
      FieldName = 'combustivel'
      Origin = 'combustivel'
      Required = True
    end
    object QryFotosdataabastecimento: TDateField
      FieldName = 'dataabastecimento'
      Origin = 'dataabastecimento'
      Required = True
    end
    object QryFotoshora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
      Required = True
    end
    object QryFotossyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object QryFotossyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object QryFotoshorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 3
    end
    object QryFotosidatividade: TIntegerField
      FieldName = 'idatividade'
      Origin = 'idatividade'
    end
    object QryFotosobs: TStringField
      FieldName = 'obs'
      Origin = 'obs'
      Size = 100
    end
    object QryFotosimg: TWideMemoField
      FieldName = 'img'
      Origin = 'img'
      BlobType = ftWideMemo
    end
    object QryFotosimg2: TWideMemoField
      FieldName = 'img2'
      Origin = 'img2'
      BlobType = ftWideMemo
    end
    object QryFotosimg3: TWideMemoField
      FieldName = 'img3'
      Origin = 'img3'
      BlobType = ftWideMemo
    end
    object QryFotosimg4: TWideMemoField
      FieldName = 'img4'
      Origin = 'img4'
      BlobType = ftWideMemo
    end
    object QryFotosimg5: TWideMemoField
      FieldName = 'img5'
      Origin = 'img5'
      BlobType = ftWideMemo
    end
    object QryFotosexterno: TWideStringField
      FieldName = 'externo'
      Origin = 'externo'
      Required = True
      Size = 32767
    end
  end
end

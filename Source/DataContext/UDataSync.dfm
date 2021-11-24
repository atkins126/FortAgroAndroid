object dmSync: TdmSync
  OldCreateOrder = False
  Height = 619
  Width = 864
  object qryOpSafraSync: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from operacaosafratalhao '
      'where status=3 '
      'and flagsync=0 and idTalhao>0'
      
        'and id in(select idoperacaotalhao from detoperacaosafratalhaomaq' +
        'uinasoperadores)'
      '')
    Left = 72
    Top = 24
    object qryOpSafraSyncid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOpSafraSyncstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object qryOpSafraSyncdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object qryOpSafraSyncidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object qryOpSafraSyncdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object qryOpSafraSyncidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object qryOpSafraSyncidsafra: TWideStringField
      FieldName = 'idsafra'
      Origin = 'idsafra'
      Required = True
      Size = 32767
    end
    object qryOpSafraSyncidoperacao: TWideStringField
      FieldName = 'idoperacao'
      Origin = 'idoperacao'
      Required = True
      Size = 32767
    end
    object qryOpSafraSyncdatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object qryOpSafraSyncdatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object qryOpSafraSyncobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object qryOpSafraSyncidtalhao: TWideStringField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
      Required = True
      Size = 32767
    end
    object qryOpSafraSyncidresponsavel: TWideStringField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
      Size = 32767
    end
    object qryOpSafraSyncareaprevista: TBCDField
      FieldName = 'areaprevista'
      Origin = 'areaprevista'
      Precision = 15
      Size = 2
    end
    object qryOpSafraSyncarearealizada: TBCDField
      FieldName = 'arearealizada'
      Origin = 'arearealizada'
      Precision = 15
      Size = 2
    end
    object qryOpSafraSyncFlagSync: TIntegerField
      FieldName = 'FlagSync'
      Origin = 'FlagSync'
      Required = True
    end
    object qryOpSafraSyncdataSync: TDateTimeField
      FieldName = 'dataSync'
      Origin = 'dataSync'
    end
    object qryOpSafraSyncfinalidade: TStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 30
    end
    object qryOpSafraSyncidtipoaplicacaosolido: TStringField
      FieldName = 'idtipoaplicacaosolido'
      Origin = 'idtipoaplicacaosolido'
      Size = 30
    end
    object qryOpSafraSyncidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object qryOpSafraSyncidvariedade: TIntegerField
      FieldName = 'idvariedade'
      Origin = 'idvariedade'
    end
    object qryOpSafraSyncidreceituario: TIntegerField
      FieldName = 'idreceituario'
      Origin = 'idreceituario'
    end
    object qryOpSafraSynctipoterraaereo: TStringField
      FieldName = 'tipoterraaereo'
      Origin = 'tipoterraaereo'
      Size = 10
    end
    object qryOpSafraSyncidOpMaster: TIntegerField
      FieldName = 'idOpMaster'
      Origin = 'idOpMaster'
    end
    object qryOpSafraSyncQualidadeCobertura: TStringField
      FieldName = 'QualidadeCobertura'
      Origin = 'QualidadeCobertura'
    end
    object qryOpSafraSyncidcobertura: TIntegerField
      FieldName = 'idcobertura'
      Origin = 'idcobertura'
    end
  end
  object qryOpSafraMaquinasSync: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from detoperacaosafratalhaomaquinasoperadores a'
      'where a.status=1')
    Left = 72
    Top = 88
  end
  object qryOpSafraProdutosSync: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from DetOperacaoSafraTalhaoProdutos a'
      'where a.status=1')
    Left = 68
    Top = 152
    object qryOpSafraProdutosSyncid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOpSafraProdutosSyncstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object qryOpSafraProdutosSyncdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object qryOpSafraProdutosSyncidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object qryOpSafraProdutosSyncdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object qryOpSafraProdutosSyncidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object qryOpSafraProdutosSyncidoperacaotalhao: TWideStringField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
      Required = True
      Size = 32767
    end
    object qryOpSafraProdutosSyncidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Required = True
      Size = 32767
    end
    object qryOpSafraProdutosSyncqtdeutilidado: TWideStringField
      FieldName = 'qtdeutilidado'
      Origin = 'qtdeutilidado'
      Size = 32767
    end
    object qryOpSafraProdutosSyncobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object qryOpSafraProdutosSyncdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
  end
  object qryOpSafraOocorrencisSync: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from DetOperacaoSafraTalhaoOcorrencia a '
      'where a.status=1')
    Left = 64
    Top = 208
    object qryOpSafraOocorrencisSyncid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryOpSafraOocorrencisSyncstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object qryOpSafraOocorrencisSyncdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object qryOpSafraOocorrencisSyncidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
    end
    object qryOpSafraOocorrencisSyncdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object qryOpSafraOocorrencisSyncidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object qryOpSafraOocorrencisSyncidoperacaotalhao: TWideStringField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
      Size = 32767
    end
    object qryOpSafraOocorrencisSyncdataocorrencia: TDateField
      FieldName = 'dataocorrencia'
      Origin = 'dataocorrencia'
    end
    object qryOpSafraOocorrencisSyncidtipoocorrencia: TWideStringField
      FieldName = 'idtipoocorrencia'
      Origin = 'idtipoocorrencia'
      Size = 32767
    end
    object qryOpSafraOocorrencisSynchora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object qryOpSafraOocorrencisSyncdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object qryOpSafraOocorrencisSyncdata: TDateField
      FieldName = 'data'
      Origin = 'data'
    end
  end
  object IdHTTP1: TIdHTTP
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 376
    Top = 32
  end
  object qryOpSafraPulverizacao: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from operacaosafratalhao b'
      'where b.status=3 and b.Flagsync=0')
    Left = 224
    Top = 16
    object qryOpSafraPulverizacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object qryOpSafraPulverizacaostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object qryOpSafraPulverizacaoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object qryOpSafraPulverizacaoidsafra: TWideStringField
      FieldName = 'idsafra'
      Origin = 'idsafra'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoidoperacao: TWideStringField
      FieldName = 'idoperacao'
      Origin = 'idoperacao'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaodatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object qryOpSafraPulverizacaodatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object qryOpSafraPulverizacaoobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object qryOpSafraPulverizacaoidtalhao: TWideStringField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoidresponsavel: TWideStringField
      FieldName = 'idresponsavel'
      Origin = 'idresponsavel'
      Size = 32767
    end
    object qryOpSafraPulverizacaoareaprevista: TBCDField
      FieldName = 'areaprevista'
      Origin = 'areaprevista'
      Precision = 15
      Size = 2
    end
    object qryOpSafraPulverizacaoarearealizada: TBCDField
      FieldName = 'arearealizada'
      Origin = 'arearealizada'
      Precision = 15
      Size = 2
    end
    object qryOpSafraPulverizacaoFlagSync: TIntegerField
      FieldName = 'FlagSync'
      Origin = 'FlagSync'
      Required = True
    end
    object qryOpSafraPulverizacaodataSync: TDateTimeField
      FieldName = 'dataSync'
      Origin = 'dataSync'
    end
    object qryOpSafraPulverizacaofinalidade: TStringField
      FieldName = 'finalidade'
      Origin = 'finalidade'
      Size = 30
    end
    object qryOpSafraPulverizacaoidtipoaplicacaosolido: TStringField
      FieldName = 'idtipoaplicacaosolido'
      Origin = 'idtipoaplicacaosolido'
      Size = 30
    end
    object qryOpSafraPulverizacaoidcultura: TIntegerField
      FieldName = 'idcultura'
      Origin = 'idcultura'
    end
    object qryOpSafraPulverizacaoidvariedade: TIntegerField
      FieldName = 'idvariedade'
      Origin = 'idvariedade'
    end
    object qryOpSafraPulverizacaoidreceituario: TIntegerField
      FieldName = 'idreceituario'
      Origin = 'idreceituario'
    end
    object qryOpSafraPulverizacaotipoterraaereo: TStringField
      FieldName = 'tipoterraaereo'
      Origin = 'tipoterraaereo'
      Size = 10
    end
    object qryOpSafraPulverizacaoidOpMaster: TIntegerField
      FieldName = 'idOpMaster'
      Origin = 'idOpMaster'
    end
    object qryOpSafraPulverizacaoQualidadeCobertura: TStringField
      FieldName = 'QualidadeCobertura'
      Origin = 'QualidadeCobertura'
    end
    object qryOpSafraPulverizacaoidcobertura: TIntegerField
      FieldName = 'idcobertura'
    end
  end
  object qryOpSafraPulverizacaoMaquina: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select k.id,k.status,k.idOperacaotalhao,k.idmaquina,k.operador,'
      
        'k.horainicio,k.horafim,k.observacao,k.horaparada,k.data,k.idusua' +
        'rio,k.idTalhao,'
      ' case'
      '  when length(horas)<2 then '#39'0'#39'||horas'
      ' end||'#39':'#39'||'
      ' case'
      
        '  when length(cast(minCalc as integer))<2 then '#39'0'#39'||cast(minCalc' +
        ' as integer)'
      '  else'
      '   cast(minCalc as integer) '
      ' end HorasTalhao'
      'from '
      '(select w.*,'
      ' case '
      '  when min>0 then (cast(min as double)/cast(100 as double))*60'
      ' end minCalc'
      'from '
      '(select y.*, '
      'substr(HorasTalhao,0,INSTR(HorasTalhao,'#39'.'#39'))horas,'
      
        'substr(HorasTalhao,INSTR(HorasTalhao,'#39'.'#39')+1,length(HorasTalhao))' +
        'min'
      'from '
      '(select '
      ' b.*,'
      ' a.idTalhao,'
      
        ' cast(((horaFim-horaInicio)-horaparada)as double)/cast((select c' +
        'ount(*) from DetTalhoesPulverizacao where idOperacao=b.idoperaca' +
        'otalhao)as double)  HorasTalhao'
      'from detoperacaosafratalhaomaquinasoperadores b'
      
        'join DetTalhoesPulverizacao a on a.idOperacao=b.idoperacaotalhao' +
        ')y)w)k'
      'where k.status=1'
      ''
      ''
      ''
      '')
    Left = 224
    Top = 88
    object qryOpSafraPulverizacaoMaquinaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOpSafraPulverizacaoMaquinastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoMaquinaidoperacaotalhao: TWideStringField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoMaquinaidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoMaquinaoperador: TStringField
      FieldName = 'operador'
      Origin = 'operador'
      Size = 100
    end
    object qryOpSafraPulverizacaoMaquinaobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object qryOpSafraPulverizacaoMaquinadata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object qryOpSafraPulverizacaoMaquinaidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Origin = 'idUsuario'
    end
    object qryOpSafraPulverizacaoMaquinaidTalhao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idTalhao'
      Origin = 'idTalhao'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryOpSafraPulverizacaoMaquinahorainicio: TBCDField
      FieldName = 'horainicio'
      Precision = 15
      Size = 2
    end
    object qryOpSafraPulverizacaoMaquinahorafim: TBCDField
      FieldName = 'horafim'
      Precision = 15
      Size = 2
    end
    object qryOpSafraPulverizacaoMaquinahoraparada: TBCDField
      FieldName = 'horaparada'
      Precision = 15
      Size = 2
    end
    object qryOpSafraPulverizacaoMaquinaHorasTalhao: TWideStringField
      FieldName = 'HorasTalhao'
      ReadOnly = True
      Size = 32767
    end
  end
  object qryOpSafraPulverizacaoProdutos: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select '
      ' a.*,'
      ' b.idTalhao,'
      
        ' cast(a.qtdeutilidado/(select count(*) from DetTalhoesPulverizac' +
        'ao where idOperacao=a.idoperacaotalhao) as varvhar(20)) qtdTalha' +
        'o'
      'from DetOperacaoSafraTalhaoProdutos a'
      'join DetTalhoesPulverizacao b on a.idoperacaotalhao=b.idOperacao'
      'where a.status=1')
    Left = 220
    Top = 152
    object qryOpSafraPulverizacaoProdutosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryOpSafraPulverizacaoProdutosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoProdutosdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoProdutosidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoProdutosdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object qryOpSafraPulverizacaoProdutosidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object qryOpSafraPulverizacaoProdutosidoperacaotalhao: TWideStringField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoProdutosidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoProdutosqtdeutilidado: TWideStringField
      FieldName = 'qtdeutilidado'
      Origin = 'qtdeutilidado'
      Size = 32767
    end
    object qryOpSafraPulverizacaoProdutosobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object qryOpSafraPulverizacaoProdutosdata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object qryOpSafraPulverizacaoProdutosidTalhao: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'idTalhao'
      Origin = 'idTalhao'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryOpSafraPulverizacaoProdutosqtdTalhao: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'qtdTalhao'
      Origin = 'qtdTalhao'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  object qryOpSafraPulverizacaoOcorrencia: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select a.* from DetOperacaoSafraTalhaoOcorrencia a '
      'join DetTalhoesPulverizacao b on a.idoperacaotalhao=b.idOperacao'
      'where a.status=1')
    Left = 224
    Top = 216
    object qryOpSafraPulverizacaoOcorrenciaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qryOpSafraPulverizacaoOcorrenciastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoOcorrenciadatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoOcorrenciaidusuario: TIntegerField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
    end
    object qryOpSafraPulverizacaoOcorrenciadataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object qryOpSafraPulverizacaoOcorrenciaidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object qryOpSafraPulverizacaoOcorrenciaidoperacaotalhao: TWideStringField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
      Required = True
      Size = 32767
    end
    object qryOpSafraPulverizacaoOcorrenciadataocorrencia: TDateField
      FieldName = 'dataocorrencia'
      Origin = 'dataocorrencia'
    end
    object qryOpSafraPulverizacaoOcorrenciaidtipoocorrencia: TWideStringField
      FieldName = 'idtipoocorrencia'
      Origin = 'idtipoocorrencia'
      Size = 32767
    end
    object qryOpSafraPulverizacaoOcorrenciahora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object qryOpSafraPulverizacaoOcorrenciadescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object qryOpSafraPulverizacaoOcorrenciadata: TDateField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
  end
  object TSyncReceituario: TFDQuery
    CachedUpdates = True
    OnReconcileError = TSyncReceituarioReconcileError
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select'
      '*'
      'from receiturario'
      'WHERE STATUS=0')
    Left = 433
    Top = 120
    object TSyncReceituarioid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object TSyncReceituariostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TSyncReceituarionome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncReceituarioresponsavel: TStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object TSyncReceituarioidResponsavel: TIntegerField
      FieldName = 'idResponsavel'
      Origin = 'idResponsavel'
    end
    object TSyncReceituarioDataRegistro: TDateTimeField
      FieldName = 'DataRegistro'
      Origin = 'DataRegistro'
    end
    object TSyncReceituariodatarecomendacao: TDateField
      FieldName = 'datarecomendacao'
      Origin = 'datarecomendacao'
    end
    object TSyncReceituariodataprevaplicacao: TDateField
      FieldName = 'dataprevaplicacao'
      Origin = 'dataprevaplicacao'
    end
    object TSyncReceituarioobservacao: TWideStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
  end
  object FDStanStorageJSONLink1: TFDStanStorageJSONLink
    Left = 512
    Top = 176
  end
  object TSyncDetReceituario: TFDQuery
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select'
      ' id,'
      ' status,'
      ' current_timestamp datareg,'
      ' idusuario,'
      ' current_timestamp dataalteracao,'
      ' idusuario idusuarioalteracao,'
      ' idreceiturario,'
      ' finalidade,'
      ' qtdporhe,'
      ' idproduto'
      'from detreceiturario'
      'where idreceiturario=1')
    Left = 505
    Top = 8
  end
  object qryAux: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    Left = 344
    Top = 272
  end
  object TSyncVazaoOperacao: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from DetVazaoOperacao'
      '')
    Left = 560
    Top = 125
    object TSyncVazaoOperacaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object TSyncVazaoOperacaostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TSyncVazaoOperacaodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TSyncVazaoOperacaoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TSyncVazaoOperacaodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TSyncVazaoOperacaoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TSyncVazaoOperacaoidoperacaotalhao: TWideStringField
      FieldName = 'idoperacaotalhao'
      Origin = 'idoperacaotalhao'
      Size = 32767
    end
    object TSyncVazaoOperacaoCincoLTHA: TIntegerField
      FieldName = 'CincoLTHA'
      Origin = 'CincoLTHA'
    end
    object TSyncVazaoOperacaoDezLTHA: TIntegerField
      FieldName = 'DezLTHA'
      Origin = 'DezLTHA'
    end
    object TSyncVazaoOperacaoQuinzeLTHA: TIntegerField
      FieldName = 'QuinzeLTHA'
      Origin = 'QuinzeLTHA'
    end
    object TSyncVazaoOperacaoVinteLTHA: TIntegerField
      FieldName = 'VinteLTHA'
      Origin = 'VinteLTHA'
    end
    object TSyncVazaoOperacaoTrintaLTHA: TIntegerField
      FieldName = 'TrintaLTHA'
      Origin = 'TrintaLTHA'
    end
    object TSyncVazaoOperacaoQuarentaLTHA: TIntegerField
      FieldName = 'QuarentaLTHA'
      Origin = 'QuarentaLTHA'
    end
    object TSyncVazaoOperacaoCinquentaLTHA: TIntegerField
      FieldName = 'CinquentaLTHA'
      Origin = 'CinquentaLTHA'
    end
    object TSyncVazaoOperacaoSetentaeCincoLTHA: TIntegerField
      FieldName = 'SetentaeCincoLTHA'
      Origin = 'SetentaeCincoLTHA'
    end
    object TSyncVazaoOperacaoCemLTHA: TIntegerField
      FieldName = 'CemLTHA'
      Origin = 'CemLTHA'
    end
    object TSyncVazaoOperacaosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TSyncVazaoOperacaosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object TSyncStandPlantas: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from StandSementes'
      'where status=1 and syncaws=0'
      'and qtdeplantas>0 and qtdeSementes>0')
    Left = 504
    Top = 240
    object TSyncStandPlantasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncStandPlantasidUsuario: TIntegerField
      FieldName = 'idUsuario'
      Origin = 'idUsuario'
      Required = True
    end
    object TSyncStandPlantasDataSementes: TDateField
      FieldName = 'DataSementes'
      Origin = 'DataSementes'
    end
    object TSyncStandPlantasidCultura: TIntegerField
      FieldName = 'idCultura'
      Origin = 'idCultura'
    end
    object TSyncStandPlantasIdVariedade: TIntegerField
      FieldName = 'IdVariedade'
      Origin = 'IdVariedade'
    end
    object TSyncStandPlantasQtdeSementes: TBCDField
      FieldName = 'QtdeSementes'
      Origin = 'QtdeSementes'
      Precision = 15
      Size = 2
    end
    object TSyncStandPlantasDataPlantas: TDateField
      FieldName = 'DataPlantas'
      Origin = 'DataPlantas'
    end
    object TSyncStandPlantasQtdePlantas: TBCDField
      FieldName = 'QtdePlantas'
      Origin = 'QtdePlantas'
      Precision = 15
      Size = 2
    end
    object TSyncStandPlantassyncaws: TIntegerField
      FieldName = 'syncaws'
      Origin = 'syncaws'
    end
    object TSyncStandPlantasStatus: TIntegerField
      FieldName = 'Status'
      Origin = 'Status'
    end
    object TSyncStandPlantasidTalhao: TIntegerField
      FieldName = 'idTalhao'
      Origin = 'idTalhao'
    end
    object TSyncStandPlantassyncfaz: TIntegerField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
    end
  end
  object TSyncAtualizaReceituario: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select id,status from receiturario'
      'where status=1'
      '')
    Left = 64
    Top = 272
    object TSyncAtualizaReceituarioid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TSyncAtualizaReceituariostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
  end
  object TSyncPluviometro: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select a.* from Pluviometro a')
    Left = 216
    Top = 272
    object TSyncPluviometroid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncPluviometrostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TSyncPluviometrodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TSyncPluviometroidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TSyncPluviometrodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TSyncPluviometroidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TSyncPluviometronome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncPluviometrolatitude: TStringField
      FieldName = 'latitude'
      Origin = 'latitude'
    end
    object TSyncPluviometrolongitude: TStringField
      FieldName = 'longitude'
      Origin = 'longitude'
    end
    object TSyncPluviometrosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TSyncPluviometrosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TSyncPluviometroidsetor: TIntegerField
      FieldName = 'idsetor'
      Origin = 'idsetor'
      Required = True
    end
  end
  object TSyncPluviometroTalhoes: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from PluviometroTalhoes ')
    Left = 224
    Top = 328
    object TSyncPluviometroTalhoesid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object TSyncPluviometroTalhoesstatus: TWideStringField
      FieldName = 'status'
      Required = True
      Size = 32767
    end
    object TSyncPluviometroTalhoesdatareg: TWideStringField
      FieldName = 'datareg'
      Required = True
      Size = 32767
    end
    object TSyncPluviometroTalhoesidusuario: TWideStringField
      FieldName = 'idusuario'
      Required = True
      Size = 32767
    end
    object TSyncPluviometroTalhoesdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Size = 32767
    end
    object TSyncPluviometroTalhoesidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Size = 32767
    end
    object TSyncPluviometroTalhoessyncaws: TWideStringField
      FieldName = 'syncaws'
      Required = True
      Size = 32767
    end
    object TSyncPluviometroTalhoessyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TSyncPluviometroTalhoesidpluviometro: TIntegerField
      FieldName = 'idpluviometro'
      Origin = 'idpluviometro'
      Required = True
    end
    object TSyncPluviometroTalhoesidtalhao: TIntegerField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
      Required = True
    end
  end
  object TSyncPluviometria: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select '
      ' a.id,'
      ' a.status,'
      ' a.datareg,'
      ' a.idusuario,'
      ' a.dataalteracao,'
      ' a.idusuarioalteracao,'
      ' a.idpluviometro,'
      ' b.idtalhao,'
      ' a.volumemm,'
      ' a.datacoleta,'
      ' a.hora,'
      ' a.syncaws,'
      ' a.syncfaz'
      ' from pluviometria a '
      
        'join PluviometroTalhoes b on a.idpluviometro=b.idpLuviometro and' +
        ' b.status=1'
      'where a.syncfaz=0'
      '')
    Left = 504
    Top = 304
    object TSyncPluviometriaid: TIntegerField
      FieldName = 'id'
    end
    object TSyncPluviometriastatus: TWideStringField
      FieldName = 'status'
      Size = 32767
    end
    object TSyncPluviometriadatareg: TWideStringField
      FieldName = 'datareg'
      Size = 32767
    end
    object TSyncPluviometriaidusuario: TWideStringField
      FieldName = 'idusuario'
      Size = 32767
    end
    object TSyncPluviometriadataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Size = 32767
    end
    object TSyncPluviometriaidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Size = 32767
    end
    object TSyncPluviometriaidpluviometro: TWideStringField
      FieldName = 'idpluviometro'
      Size = 32767
    end
    object TSyncPluviometriaidTalhao: TIntegerField
      FieldName = 'idTalhao'
    end
    object TSyncPluviometriavolumemm: TBCDField
      FieldName = 'volumemm'
      Precision = 15
      Size = 3
    end
    object TSyncPluviometriadatacoleta: TDateField
      FieldName = 'datacoleta'
    end
    object TSyncPluviometriahora: TTimeField
      FieldName = 'hora'
    end
    object TSyncPluviometriasyncaws: TWideStringField
      FieldName = 'syncaws'
      Size = 32767
    end
    object TSyncPluviometriasyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Size = 32767
    end
  end
  object TSyncLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from localestoque'
      'where status=1')
    Left = 664
    Top = 312
    object TSyncLocalEstoqueid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncLocalEstoquestatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TSyncLocalEstoquedatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TSyncLocalEstoqueidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TSyncLocalEstoquedataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TSyncLocalEstoqueidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TSyncLocalEstoquenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncLocalEstoqueidsegmento: TWideStringField
      FieldName = 'idsegmento'
      Origin = 'idsegmento'
      Size = 32767
    end
    object TSyncLocalEstoquesyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TSyncLocalEstoquesyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object TSyncAbastecimento: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select '
      ' *'
      'from abastecimento a'
      'where syncFaz=0')
    Left = 656
    Top = 192
    object TSyncAbastecimentoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncAbastecimentostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TSyncAbastecimentodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TSyncAbastecimentoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TSyncAbastecimentodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TSyncAbastecimentoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TSyncAbastecimentoidlocalestoque: TWideStringField
      FieldName = 'idlocalestoque'
      Origin = 'idlocalestoque'
      Size = 32767
    end
    object TSyncAbastecimentoidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
      Size = 32767
    end
    object TSyncAbastecimentoidoperador: TWideStringField
      FieldName = 'idoperador'
      Origin = 'idoperador'
      Size = 32767
    end
    object TSyncAbastecimentovolumelt: TBCDField
      FieldName = 'volumelt'
      Origin = 'volumelt'
      Precision = 15
      Size = 3
    end
    object TSyncAbastecimentocombustivel: TIntegerField
      FieldName = 'combustivel'
      Origin = 'combustivel'
    end
    object TSyncAbastecimentodataabastecimento: TDateField
      FieldName = 'dataabastecimento'
      Origin = 'dataabastecimento'
    end
    object TSyncAbastecimentohora: TTimeField
      FieldName = 'hora'
      Origin = 'hora'
    end
    object TSyncAbastecimentosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TSyncAbastecimentosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TSyncAbastecimentohorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 3
    end
    object TSyncAbastecimentoidatividade: TIntegerField
      FieldName = 'idatividade'
      Origin = 'idatividade'
    end
    object TSyncAbastecimentoobs: TStringField
      FieldName = 'obs'
      Origin = 'obs'
      Size = 100
    end
    object TSyncAbastecimentoimg: TWideMemoField
      FieldName = 'img'
      Origin = 'img'
      BlobType = ftWideMemo
    end
    object TSyncAbastecimentoimg2: TWideMemoField
      FieldName = 'img2'
      Origin = 'img2'
      BlobType = ftWideMemo
    end
    object TSyncAbastecimentoimg3: TWideMemoField
      FieldName = 'img3'
      Origin = 'img3'
      BlobType = ftWideMemo
    end
    object TSyncAbastecimentoimg4: TWideMemoField
      FieldName = 'img4'
      Origin = 'img4'
      BlobType = ftWideMemo
    end
    object TSyncAbastecimentoimg5: TWideMemoField
      FieldName = 'img5'
      Origin = 'img5'
      BlobType = ftWideMemo
    end
    object TSyncAbastecimentoexterno: TWideStringField
      FieldName = 'externo'
      Origin = 'externo'
      Required = True
      Size = 32767
    end
  end
  object TSyncAbastecimentoOutros: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select a.* from abastecimentoOutros a'
      'where syncfaz=0')
    Left = 656
    Top = 253
    object TSyncAbastecimentoOutrosid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncAbastecimentoOutrosstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TSyncAbastecimentoOutrosdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TSyncAbastecimentoOutrosidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TSyncAbastecimentoOutrosdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TSyncAbastecimentoOutrosidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TSyncAbastecimentoOutrosidabastecimento: TWideStringField
      FieldName = 'idabastecimento'
      Origin = 'idabastecimento'
      Size = 32767
    end
    object TSyncAbastecimentoOutrosidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Size = 32767
    end
    object TSyncAbastecimentoOutrosquantidade: TBCDField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      Precision = 15
      Size = 3
    end
    object TSyncAbastecimentoOutrossyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TSyncAbastecimentoOutrossyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object TSyncPragas: TFDQuery
    CachedUpdates = True
    OnReconcileError = TSyncPragasReconcileError
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from auxpragas')
    Left = 224
    Top = 376
    object TSyncPragasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TSyncPragasstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object TSyncPragasdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TSyncPragasidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TSyncPragasdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TSyncPragasidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TSyncPragasnome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object TSyncPragassyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TSyncPragassyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object TmonitoramentopragasPontosValores: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from monitoramentopragaspontosvalores')
    Left = 400
    Top = 438
    object TmonitoramentopragasPontosValoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TmonitoramentopragasPontosValoresstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TmonitoramentopragasPontosValoresdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TmonitoramentopragasPontosValoresidPonto: TWideStringField
      FieldName = 'idPonto'
      Origin = 'idPonto'
      Required = True
      Size = 32767
    end
    object TmonitoramentopragasPontosValoresidPraga: TWideStringField
      FieldName = 'idPraga'
      Origin = 'idPraga'
      Required = True
      Size = 32767
    end
    object TmonitoramentopragasPontosValoreshora: TSQLTimeStampField
      FieldName = 'hora'
      Origin = 'hora'
      Required = True
    end
    object TmonitoramentopragasPontosValoressyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TmonitoramentopragasPontosValoressyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TmonitoramentopragasPontosValorescontagem: TIntegerField
      FieldName = 'contagem'
      Origin = 'contagem'
      Required = True
    end
    object TmonitoramentopragasPontosValorescaracteristica: TIntegerField
      FieldName = 'caracteristica'
      Origin = 'caracteristica'
    end
  end
  object TmonitoramentopragasPontos: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'SELECT * FROM monitoramentopragasPontos')
    Left = 400
    Top = 392
    object TmonitoramentopragasPontosid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object TmonitoramentopragasPontosstatus: TWideStringField
      FieldName = 'status'
      Required = True
      Size = 32767
    end
    object TmonitoramentopragasPontosdatareg: TWideStringField
      FieldName = 'datareg'
      Required = True
      Size = 32767
    end
    object TmonitoramentopragasPontosidMonitoramento: TWideStringField
      FieldName = 'idMonitoramento'
      Required = True
      Size = 32767
    end
    object TmonitoramentopragasPontosdataPonto: TDateField
      FieldName = 'dataPonto'
      Required = True
    end
    object TmonitoramentopragasPontosPonto: TStringField
      FieldName = 'Ponto'
      Required = True
    end
    object TmonitoramentopragasPontoshora: TSQLTimeStampField
      FieldName = 'hora'
      Required = True
    end
    object TmonitoramentopragasPontoslatitude: TStringField
      FieldName = 'latitude'
      Size = 50
    end
    object TmonitoramentopragasPontoslongitude: TStringField
      FieldName = 'longitude'
      Size = 50
    end
    object TmonitoramentopragasPontossyncaws: TWideStringField
      FieldName = 'syncaws'
      Required = True
      Size = 32767
    end
    object TmonitoramentopragasPontossyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Required = True
      Size = 32767
    end
  end
  object TMonitoramentoPraga: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from monitoramentopragas'
      'where status=2 and syncfaz=0')
    Left = 400
    Top = 344
    object TMonitoramentoPragaid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TMonitoramentoPragastatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TMonitoramentoPragadatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TMonitoramentoPragaidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TMonitoramentoPragadataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TMonitoramentoPragaidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TMonitoramentoPragadataMonitoramento: TDateField
      FieldName = 'dataMonitoramento'
      Origin = 'dataMonitoramento'
      Required = True
    end
    object TMonitoramentoPragaidTalhao: TWideStringField
      FieldName = 'idTalhao'
      Origin = 'idTalhao'
      Required = True
      Size = 32767
    end
    object TMonitoramentoPragahoraInicio: TSQLTimeStampField
      FieldName = 'horaInicio'
      Origin = 'horaInicio'
      Required = True
    end
    object TMonitoramentoPragatipoAbertura: TIntegerField
      FieldName = 'tipoAbertura'
      Origin = 'tipoAbertura'
      Required = True
    end
    object TMonitoramentoPragahoraFim: TSQLTimeStampField
      FieldName = 'horaFim'
      Origin = 'horaFim'
    end
    object TMonitoramentoPragasyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TMonitoramentoPragasyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TMonitoramentoPragaTagAbertura: TStringField
      FieldName = 'TagAbertura'
      Origin = 'TagAbertura'
    end
    object TMonitoramentoPragaTagFechamento: TStringField
      FieldName = 'TagFechamento'
      Origin = 'TagFechamento'
    end
  end
  object TMovLocalEstoque: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      '  select '
      '  * from tranferenciaLocalestoque A'
      '  where syncfaz=0')
    Left = 664
    Top = 368
    object TMovLocalEstoqueid: TFDAutoIncField
      FieldName = 'id'
      ReadOnly = True
    end
    object TMovLocalEstoquestatus: TWideStringField
      FieldName = 'status'
      Required = True
      Size = 32767
    end
    object TMovLocalEstoquedatareg: TSQLTimeStampField
      FieldName = 'datareg'
      Required = True
    end
    object TMovLocalEstoqueidusuario: TWideStringField
      FieldName = 'idusuario'
      Required = True
      Size = 32767
    end
    object TMovLocalEstoquedataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Size = 32767
    end
    object TMovLocalEstoqueidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Size = 32767
    end
    object TMovLocalEstoqueidlocalestoqueorigem: TWideStringField
      FieldName = 'idlocalestoqueorigem'
      Required = True
      Size = 32767
    end
    object TMovLocalEstoqueidlocalestoqueDetino: TWideStringField
      FieldName = 'idlocalestoqueDetino'
      Required = True
      Size = 32767
    end
    object TMovLocalEstoqueidproduto: TWideStringField
      FieldName = 'idproduto'
      Required = True
      Size = 32767
    end
    object TMovLocalEstoqueqtde: TBCDField
      FieldName = 'qtde'
      Precision = 15
      Size = 3
    end
    object TMovLocalEstoquedatamov: TDateField
      FieldName = 'datamov'
      Required = True
    end
    object TMovLocalEstoquehora: TTimeField
      FieldName = 'hora'
      Required = True
    end
    object TMovLocalEstoquesyncaws: TWideStringField
      FieldName = 'syncaws'
      Required = True
      Size = 32767
    end
    object TMovLocalEstoquesyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Required = True
      Size = 32767
    end
  end
  object Tauxatividadeabastecimento: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'SELECT * FROM auxatividadeabastecimento')
    Left = 656
    Top = 136
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
  object Comprador: TFDQuery
    CachedUpdates = True
    OnReconcileError = CompradorReconcileError
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from comprador')
    Left = 792
    Top = 240
    object Compradorid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
    end
    object Compradorstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Size = 32767
    end
    object Compradordatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object Compradoridusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object Compradordataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object Compradoridusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object Compradornome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object Compradorcidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 100
    end
    object Compradoruf: TWideStringField
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object Compradorcpf_cnpj: TStringField
      FieldName = 'cpf_cnpj'
      Origin = 'cpf_cnpj'
      Size = 30
    end
    object Compradortelefone_fixo: TStringField
      FieldName = 'telefone_fixo'
      Origin = 'telefone_fixo'
    end
    object Compradorcelular: TStringField
      FieldName = 'celular'
      Origin = 'celular'
    end
    object Compradoremail: TStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object Compradorcontatopessoa: TStringField
      FieldName = 'contatopessoa'
      Origin = 'contatopessoa'
      Size = 100
    end
    object Compradorsenha: TStringField
      FieldName = 'senha'
      Origin = 'senha'
    end
    object Compradorsyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object Compradorrazaosocial: TStringField
      FieldName = 'razaosocial'
      Origin = 'razaosocial'
      Size = 100
    end
    object Compradorinscricaoestadual: TStringField
      FieldName = 'inscricaoestadual'
      Origin = 'inscricaoestadual'
    end
    object Compradorsyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
  end
  object Contratos: TFDQuery
    CachedUpdates = True
    OnReconcileError = ContratosReconcileError
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from contratos')
    Left = 792
    Top = 288
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
  object Embarque: TFDQuery
    CachedUpdates = True
    OnReconcileError = EmbarqueReconcileError
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from embarque'
      'where syncFaz=0')
    Left = 792
    Top = 336
    object Embarqueid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Embarquestatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object Embarquedatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object Embarqueidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object Embarquedataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object Embarqueidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object Embarqueidcontrato: TWideStringField
      FieldName = 'idcontrato'
      Origin = 'idcontrato'
      Required = True
      Size = 32767
    end
    object Embarquenumeronf: TWideStringField
      FieldName = 'numeronf'
      Origin = 'numeronf'
      Required = True
      Size = 32767
    end
    object Embarqueplaca: TStringField
      FieldName = 'placa'
      Origin = 'placa'
      Required = True
      Size = 15
    end
    object Embarquedataembarque: TDateField
      FieldName = 'dataembarque'
      Origin = 'dataembarque'
      Required = True
    end
    object Embarquehorabarque: TTimeField
      FieldName = 'horabarque'
      Origin = 'horabarque'
      Required = True
    end
    object Embarquetara: TBCDField
      FieldName = 'tara'
      Origin = 'tara'
      Required = True
      Precision = 15
      Size = 3
    end
    object Embarquebruto: TBCDField
      FieldName = 'bruto'
      Origin = 'bruto'
      Required = True
      Precision = 15
      Size = 3
    end
    object Embarqueliquido: TBCDField
      FieldName = 'liquido'
      Origin = 'liquido'
      Required = True
      Precision = 15
      Size = 3
    end
    object Embarqueimp: TBCDField
      FieldName = 'imp'
      Origin = 'imp'
      Required = True
      Precision = 15
      Size = 3
    end
    object Embarquequeb: TBCDField
      FieldName = 'queb'
      Origin = 'queb'
      Required = True
      Precision = 15
      Size = 3
    end
    object Embarqueverd: TBCDField
      FieldName = 'verd'
      Origin = 'verd'
      Required = True
      Precision = 15
      Size = 3
    end
    object Embarqueavar: TBCDField
      FieldName = 'avar'
      Origin = 'avar'
      Required = True
      Precision = 15
      Size = 3
    end
    object Embarqueumid: TBCDField
      FieldName = 'umid'
      Origin = 'umid'
      Required = True
      Precision = 15
      Size = 3
    end
    object Embarquesyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object Embarquesyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
  end
  object TAuxRevisaoItem: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from AuxRevisaoItens a')
    Left = 64
    Top = 328
    object TAuxRevisaoItemid: TWideStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 32767
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
  object TRevisao: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from planorevisao'
      'where status>-1')
    Left = 64
    Top = 376
    object TRevisaoid: TIntegerField
      FieldName = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object TRevisaostatus: TIntegerField
      FieldName = 'status'
    end
    object TRevisaodatareg: TSQLTimeStampField
      FieldName = 'datareg'
    end
    object TRevisaoidusuario: TIntegerField
      FieldName = 'idusuario'
    end
    object TRevisaodataalteracao: TSQLTimeStampField
      FieldName = 'dataalteracao'
    end
    object TRevisaoidusuarioalteracao: TIntegerField
      FieldName = 'idusuarioalteracao'
    end
    object TRevisaonome: TWideStringField
      FieldName = 'nome'
      Size = 100
    end
    object TRevisaointervalohoras: TBCDField
      FieldName = 'intervalohoras'
      Precision = 15
      Size = 3
    end
    object TRevisaosyncaws: TIntegerField
      FieldName = 'syncaws'
    end
    object TRevisaosyncfaz: TIntegerField
      FieldName = 'syncfaz'
    end
  end
  object TRevisaoItens: TFDQuery
    CachedUpdates = True
    IndexFieldNames = 'idrevisao'
    MasterFields = 'id'
    DetailFields = 'idrevisao'
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from planorevisaoitens ')
    Left = 64
    Top = 432
    object TRevisaoItensid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TRevisaoItensstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TRevisaoItensdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TRevisaoItensidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TRevisaoItensdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TRevisaoItensidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TRevisaoItensidrevisao: TWideStringField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
      Required = True
      Size = 32767
    end
    object TRevisaoItensiditem: TWideStringField
      FieldName = 'iditem'
      Origin = 'iditem'
      Required = True
      Size = 32767
    end
    object TRevisaoItenssyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TRevisaoItenssyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TRevisaoItensidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Required = True
      Size = 32767
    end
    object TRevisaoItensqtde: TWideStringField
      FieldName = 'qtde'
      Origin = 'qtde'
      Size = 32767
    end
  end
  object TManutencao: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select '
      
        ' id,idplanorevisao,idmaquina,datainicio,datafim,horimetro,horime' +
        'troproxima'
      'from revisaomaquina '
      'WHERE ID=-100'
      ''
      #9)
    Left = 344
    Top = 128
    object TManutencaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TManutencaoidplanorevisao: TWideStringField
      FieldName = 'idplanorevisao'
      Origin = 'idplanorevisao'
      Size = 32767
    end
    object TManutencaoidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
      Size = 32767
    end
    object TManutencaodatainicio: TDateField
      FieldName = 'datainicio'
      Origin = 'datainicio'
    end
    object TManutencaodatafim: TDateField
      FieldName = 'datafim'
      Origin = 'datafim'
    end
    object TManutencaohorimetro: TBCDField
      FieldName = 'horimetro'
      Origin = 'horimetro'
      Precision = 15
      Size = 2
    end
    object TManutencaohorimetroproxima: TBCDField
      FieldName = 'horimetroproxima'
      Origin = 'horimetroproxima'
      Precision = 15
      Size = 3
    end
  end
  object TPlanoManutencao: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select id,nome,intervalohoras from planorevisao '
      'where id=-1')
    Left = 344
    Top = 176
    object TPlanoManutencaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TPlanoManutencaonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object TPlanoManutencaointervalohoras: TBCDField
      FieldName = 'intervalohoras'
      Origin = 'intervalohoras'
      Precision = 15
      Size = 3
    end
  end
  object qryAuxSync: TFDQuery
    Connection = dmDB.FDConn
    Left = 600
    Top = 448
  end
  object TPlanoRevisaoMaquinas: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from planorevisaomaquinas')
    Left = 656
    Top = 24
    object TPlanoRevisaoMaquinasid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TPlanoRevisaoMaquinasstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoMaquinasdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoMaquinasidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoMaquinasdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TPlanoRevisaoMaquinasidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TPlanoRevisaoMaquinasidrevisao: TWideStringField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoMaquinasidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Origin = 'idmaquina'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoMaquinassyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoMaquinassyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
  end
  object TPlanoRevisaoItens: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from planorevisaoitens ')
    Left = 656
    Top = 80
    object TPlanoRevisaoItensid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object TPlanoRevisaoItensstatus: TWideStringField
      FieldName = 'status'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoItensdatareg: TWideStringField
      FieldName = 'datareg'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoItensidusuario: TWideStringField
      FieldName = 'idusuario'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoItensdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Size = 32767
    end
    object TPlanoRevisaoItensidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Size = 32767
    end
    object TPlanoRevisaoItensidrevisao: TWideStringField
      FieldName = 'idrevisao'
      Size = 32767
    end
    object TPlanoRevisaoItenssyncaws: TWideStringField
      FieldName = 'syncaws'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoItenssyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoItensidproduto: TWideStringField
      FieldName = 'idproduto'
      Size = 32767
    end
    object TPlanoRevisaoItensqtde: TBCDField
      FieldName = 'qtde'
      Precision = 10
      Size = 3
    end
    object TPlanoRevisaoItenstipo: TWideStringField
      FieldName = 'tipo'
      Required = True
      Size = 32767
    end
    object TPlanoRevisaoItensobservacao: TStringField
      FieldName = 'observacao'
      Size = 100
    end
    object TPlanoRevisaoItensitem: TStringField
      FieldName = 'item'
      Size = 100
    end
    object TPlanoRevisaoItensiditem: TWideStringField
      FieldName = 'iditem'
      Size = 32767
    end
  end
  object TPostAuxItemRevisao: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from auxrevisaoitens'
      'where syncfaz=0')
    Left = 392
    Top = 512
    object TPostAuxItemRevisaoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object TPostAuxItemRevisaostatus: TWideStringField
      FieldName = 'status'
      Required = True
      Size = 32767
    end
    object TPostAuxItemRevisaodatareg: TWideStringField
      FieldName = 'datareg'
      Required = True
      Size = 32767
    end
    object TPostAuxItemRevisaoidusuario: TWideStringField
      FieldName = 'idusuario'
      Required = True
      Size = 32767
    end
    object TPostAuxItemRevisaodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Size = 32767
    end
    object TPostAuxItemRevisaoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Size = 32767
    end
    object TPostAuxItemRevisaonome: TStringField
      FieldName = 'nome'
      Size = 100
    end
    object TPostAuxItemRevisaogrupo: TStringField
      FieldName = 'grupo'
      Size = 100
    end
    object TPostAuxItemRevisaosyncaws: TWideStringField
      FieldName = 'syncaws'
      Required = True
      Size = 32767
    end
    object TPostAuxItemRevisaosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Required = True
      Size = 32767
    end
  end
  object TPostRevisaoItem: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from revisaomaquinaitens '
      'where syncfaz=0')
    Left = 568
    Top = 512
    object TPostRevisaoItemid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TPostRevisaoItemstatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TPostRevisaoItemdatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TPostRevisaoItemidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TPostRevisaoItemdataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TPostRevisaoItemidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TPostRevisaoItemidrevisao: TWideStringField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
      Required = True
      Size = 32767
    end
    object TPostRevisaoItemsyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TPostRevisaoItemsyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TPostRevisaoItemidproduto: TWideStringField
      FieldName = 'idproduto'
      Origin = 'idproduto'
      Size = 32767
    end
    object TPostRevisaoItemqtde: TBCDField
      FieldName = 'qtde'
      Origin = 'qtde'
      Precision = 10
      Size = 3
    end
    object TPostRevisaoItemitem: TStringField
      FieldName = 'item'
      Origin = 'item'
      Size = 100
    end
    object TPostRevisaoItemtipo: TWideStringField
      FieldName = 'tipo'
      Origin = 'tipo'
      Size = 32767
    end
    object TPostRevisaoItemobservacao: TStringField
      FieldName = 'observacao'
      Origin = 'observacao'
      Size = 100
    end
    object TPostRevisaoItemiditem: TWideStringField
      FieldName = 'iditem'
      Origin = 'iditem'
      Required = True
      Size = 32767
    end
  end
  object TPostRevisao: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from revisaomaquina r '
      'where syncfaz=0 '
      'and status=3')
    Left = 488
    Top = 512
    object TPostRevisaoid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object TPostRevisaostatus: TWideStringField
      FieldName = 'status'
      Required = True
      Size = 32767
    end
    object TPostRevisaodatareg: TWideStringField
      FieldName = 'datareg'
      Required = True
      Size = 32767
    end
    object TPostRevisaoidusuario: TWideStringField
      FieldName = 'idusuario'
      Required = True
      Size = 32767
    end
    object TPostRevisaodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Size = 32767
    end
    object TPostRevisaoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Size = 32767
    end
    object TPostRevisaoidplanorevisao: TWideStringField
      FieldName = 'idplanorevisao'
      Required = True
      Size = 32767
    end
    object TPostRevisaoidmaquina: TWideStringField
      FieldName = 'idmaquina'
      Required = True
      Size = 32767
    end
    object TPostRevisaoobservacao: TStringField
      FieldName = 'observacao'
      Size = 100
    end
    object TPostRevisaodatainicio: TDateField
      FieldName = 'datainicio'
      Required = True
    end
    object TPostRevisaodatafim: TDateField
      FieldName = 'datafim'
    end
    object TPostRevisaosyncaws: TWideStringField
      FieldName = 'syncaws'
      Required = True
      Size = 32767
    end
    object TPostRevisaosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TPostRevisaoidresponsavel: TWideStringField
      FieldName = 'idresponsavel'
      Required = True
      Size = 32767
    end
    object TPostRevisaohorimetro: TBCDField
      FieldName = 'horimetro'
      Precision = 15
      Size = 2
    end
    object TPostRevisaotipo: TWideStringField
      FieldName = 'tipo'
      Required = True
      Size = 32767
    end
    object TPostRevisaohorimetroproxima: TBCDField
      FieldName = 'horimetroproxima'
      Precision = 15
      Size = 3
    end
  end
  object TPostRevisaoServico: TFDQuery
    CachedUpdates = True
    Connection = dmDB.FDConn
    SQL.Strings = (
      'SELECT * FROM servicomanutencao'
      'where syncfaz=0')
    Left = 672
    Top = 512
    object TPostRevisaoServicoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object TPostRevisaoServicostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TPostRevisaoServicodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Required = True
      Size = 32767
    end
    object TPostRevisaoServicoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Required = True
      Size = 32767
    end
    object TPostRevisaoServicodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TPostRevisaoServicoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TPostRevisaoServicotiposervico: TWideStringField
      FieldName = 'tiposervico'
      Origin = 'tiposervico'
      Size = 32767
    end
    object TPostRevisaoServicoidrevisao: TWideStringField
      FieldName = 'idrevisao'
      Origin = 'idrevisao'
      Required = True
      Size = 32767
    end
    object TPostRevisaoServicodescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object TPostRevisaoServicoresponsavel: TStringField
      FieldName = 'responsavel'
      Origin = 'responsavel'
      Size = 100
    end
    object TPostRevisaoServicovalortotal: TBCDField
      FieldName = 'valortotal'
      Origin = 'valortotal'
      Precision = 15
      Size = 3
    end
    object TPostRevisaoServicosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Required = True
      Size = 32767
    end
    object TPostRevisaoServicosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Required = True
      Size = 32767
    end
    object TPostRevisaoServicodatarealizado: TDateField
      FieldName = 'datarealizado'
      Origin = 'datarealizado'
    end
  end
  object TSyncDetReceituarioTalhao: TFDQuery
    Connection = dmDB.FDConn
    SQL.Strings = (
      'select * from  detreceiturarioTalhao'
      'where status=1 and syncaws=0')
    Left = 505
    Top = 64
    object TSyncDetReceituarioTalhaoid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      Required = True
    end
    object TSyncDetReceituarioTalhaostatus: TWideStringField
      FieldName = 'status'
      Origin = 'status'
      Required = True
      Size = 32767
    end
    object TSyncDetReceituarioTalhaodatareg: TWideStringField
      FieldName = 'datareg'
      Origin = 'datareg'
      Size = 32767
    end
    object TSyncDetReceituarioTalhaoidusuario: TWideStringField
      FieldName = 'idusuario'
      Origin = 'idusuario'
      Size = 32767
    end
    object TSyncDetReceituarioTalhaodataalteracao: TWideStringField
      FieldName = 'dataalteracao'
      Origin = 'dataalteracao'
      Size = 32767
    end
    object TSyncDetReceituarioTalhaoidusuarioalteracao: TWideStringField
      FieldName = 'idusuarioalteracao'
      Origin = 'idusuarioalteracao'
      Size = 32767
    end
    object TSyncDetReceituarioTalhaoidtalhao: TWideStringField
      FieldName = 'idtalhao'
      Origin = 'idtalhao'
      Required = True
      Size = 32767
    end
    object TSyncDetReceituarioTalhaoareahe: TBCDField
      FieldName = 'areahe'
      Origin = 'areahe'
      Precision = 15
      Size = 2
    end
    object TSyncDetReceituarioTalhaosyncaws: TWideStringField
      FieldName = 'syncaws'
      Origin = 'syncaws'
      Size = 32767
    end
    object TSyncDetReceituarioTalhaosyncfaz: TWideStringField
      FieldName = 'syncfaz'
      Origin = 'syncfaz'
      Size = 32767
    end
    object TSyncDetReceituarioTalhaoidreceiturario: TWideStringField
      FieldName = 'idreceiturario'
      Origin = 'idreceiturario'
      Required = True
      Size = 32767
    end
  end
end

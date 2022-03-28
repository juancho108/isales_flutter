/*

class TipoTarefa {
  int id;
  int id_tipo;
  String tarefa;
  int id_statusinicial;
  String statusinicial;

  TipoTarefa(
      {this.id_tipo, this.tarefa, this.id_statusinicial, this.statusinicial});

  factory TipoTarefa.fromJson(Map<String, dynamic> json) {
    return TipoTarefa(
      id_tipo: json['id_tipo'],
      tarefa: json['tarefa'],
      id_statusinicial: json['id_statusinicial'],
      statusinicial: json['statusinicial'],
    );
  }

  factory TipoTarefa.fromJsonLoad(Map<String, dynamic> json) {
    return TipoTarefa(
      id_tipo: int.parse(json['id_tipo']) ?? json['id_tipo'],
      tarefa: json['tarefa'],
      id_statusinicial: int.parse(json['id_statusinicial']),
      statusinicial: json['statusinicial'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_tipo": id_tipo,
        "tarefa": tarefa,
        "id_statusinicial": id_statusinicial,
        "statusinicial": statusinicial,
      };
}

class Tarefa {
  int id;
  int id_pr;
  int id_tipo;
  int id_status;
  int id_pai;
  String status;
  String tipo;
  String notas;
  String codigo;
  String tarefa;
  String modulo;
  String projeto;
  String cliente;
  int Ordemresolucao;
  String Tempoestimado;
  String tempoefetuado;
  int semana;
  String tempoacumulado;
  String datacheckin;
  int efetuado;
  String criadoem;
  String planeiainiciar;
  String planeiaterminar;
  String ecranapresentacao;
  String bloqueado;
  String notasbloqueado;

  String getTempoEstimado() {
    return this.Tempoestimado == null ? '0.00' : this.Tempoestimado;
  }

  String getModulo() {
    return this.modulo == null ? '' : this.modulo;
  }

  set setIdStatus(int currentIdStatus) {
    id_status = currentIdStatus;
  }

  set setNameStatus(String currentStatus) {
    status = currentStatus;
  }

  Tarefa(
      {this.id_pr,
      this.id_tipo,
      this.id_status,
      this.id_pai,
      this.status,
      this.tipo,
      this.notas,
      this.codigo,
      this.tarefa,
      this.modulo,
      this.projeto,
      this.cliente,
      this.Ordemresolucao,
      this.Tempoestimado,
      this.tempoefetuado,
      this.semana,
      this.tempoacumulado,
      this.datacheckin,
      this.efetuado,
      this.criadoem,
      this.planeiainiciar,
      this.planeiaterminar,
      this.ecranapresentacao,
      this.bloqueado,
      this.notasbloqueado});

  factory Tarefa.fromJsonLoad(Map<String, dynamic> json) {
    return Tarefa(
      id_pr: int.parse(json['id_pr']),
      id_tipo: int.parse(json['id_tipo']),
      id_status: int.parse(json['id_status']),
      notas: json['notas'],
      codigo: json['codigo'],
      tarefa: json['tarefa'],
      modulo: json['modulo'],
      projeto: json['projeto'] == null ? '' : json['projeto'],
      cliente: json['cliente'],
      Ordemresolucao: json['Ordemresolucao'] == null
          ? 100
          : int.parse(json['Ordemresolucao']),
      Tempoestimado: json['tempoestimado'],
      tempoefetuado: json['tempoefetuado'],
      semana: int.parse(json['semana']),
      tempoacumulado: json['tempoacumulado'],
      datacheckin: json['datacheckin'],
      efetuado: int.parse(json['efetuado']),
      criadoem: json['criadoem'],
      planeiainiciar: json['planeiainiciar'],
      planeiaterminar: json['planeiaterminar'],
      ecranapresentacao: json['ecranapresentacao'],
      bloqueado: json['bloqueado'],
      notasbloqueado: '0',
    );
  }

  factory Tarefa.fromJson(Map<String, dynamic> json) {
    return Tarefa(
      id_pr: json['id_pr'].toInt(),
      id_tipo: json['id_tipo'].toInt(),
      id_status: json['id_status'].toInt(),
      id_pai: json['id_pai'],
      status: json['status'],
      tipo: json['tipo'],
      notas: json['notas'],
      codigo: json['codigo'],
      tarefa: json['tarefa'],
      modulo: json['modulo'],
      projeto: json['projeto'],
      cliente: json['cliente'],
      Ordemresolucao: json['ordemresolucao'].toInt(),
      Tempoestimado: json['tempoestimado'],
      tempoefetuado: json['tempoefetuado'],
      semana: json['semana'].toInt(),
      tempoacumulado: json['tempoacumulado'],
      datacheckin: json['datacheckin'],
      efetuado: json['efetuado'].toInt(),
      criadoem: json['criadoem'],
      planeiainiciar: json['planeiainiciar'],
      planeiaterminar: json['planeiaterminar'],
      ecranapresentacao: json['ecranapresentacao'],
      bloqueado: json['bloqueado'],
      notasbloqueado: json['notasbloqueado'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_pr": id_pr,
        "id_tipo": id_tipo,
        "id_pai": id_pai,
        "id_status": id_status,
        "notas": notas,
        "codigo": codigo,
        "tarefa": tarefa,
        "modulo": modulo,
        "projeto": projeto,
        "cliente": cliente,
        "Ordemresolucao": Ordemresolucao,
        "tempoestimado": Tempoestimado,
        "tempoefetuado": tempoefetuado,
        "semana": semana,
        "tempoacumulado": tempoacumulado,
        "datacheckin": datacheckin,
        "efetuado": efetuado,
        "criadoem": criadoem,
        "planeiainiciar": planeiainiciar,
        "planeiaterminar": planeiaterminar,
        "ecranapresentacao": ecranapresentacao,
        "bloqueado": bloqueado,
        "notasbloqueado": '0',
      };
}

class StatusWorkflow {
  int id;
  int id_tipo;
  String tarefa;
  int id_statusatual;
  String statusatual;
  String proximostatus;
  int id_proximostatus;

  StatusWorkflow(
      {this.id_tipo,
      this.tarefa,
      this.id_statusatual,
      this.statusatual,
      this.proximostatus,
      this.id_proximostatus});

  factory StatusWorkflow.fromJson(Map<String, dynamic> json) {
    return StatusWorkflow(
      id_tipo: int.parse(json['id_tipo']),
      tarefa: json['tarefa'],
      id_statusatual: int.parse(json['id_statusatual']),
      statusatual: json['statusatual'],
      proximostatus: json['proximostatus'],
      id_proximostatus: int.parse(json['id_proximostatus']),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_tipo": id_tipo,
        "tarefa": tarefa,
        "id_statusatual": id_statusatual,
        "statusatual": statusatual,
        "proximostatus": proximostatus,
        "id_proximostatus": id_proximostatus,
      };
}

class Status {
  int id;
  int id_tipo;
  String tarefa;
  int id_status;
  String codstatus;
  String designacao;
  int terminado;

  Status(
      {this.id_tipo,
      this.tarefa,
      this.id_status,
      this.codstatus,
      this.designacao,
      this.terminado});

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      id_tipo: int.parse(json['id_tipo']),
      tarefa: json['tarefa'],
      id_status: int.parse(json['id_status']),
      codstatus: json['codstatus'],
      designacao: json['designacao'],
      terminado: int.parse(json['terminado']),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_tipo": id_tipo,
        "tarefa": tarefa,
        "id_status": id_status,
        "codstatus": codstatus,
        "designacao": designacao,
        "terminado": terminado,
      };
}

class TipoTempo {
  int id;
  int id_tipo;
  String codigo;
  String designacao;

  TipoTempo({this.id_tipo, this.codigo, this.designacao});

  factory TipoTempo.fromJson(Map<String, dynamic> json) {
    return TipoTempo(
      id_tipo: json['id_tipo'],
      codigo: json['codigo'],
      designacao: json['designacao'],
    );
  }

  factory TipoTempo.fromLoadJson(Map<String, dynamic> json) {
    return TipoTempo(
      id_tipo: int.parse(json['id_tipo']),
      codigo: json['codigo'],
      designacao: json['designacao'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_tipo": id_tipo,
        "codigo": designacao,
        "designacao": designacao,
      };
}

class TipoOcorrencia {
  int id;
  int id_tipo;
  String tarefa;
  int id_tipoocorrencia;
  String codocorrencia;
  String ocorrencia;
  int id_novostatus;
  String codstatus;
  String novostatus;

  TipoOcorrencia(
      {this.id_tipo,
      this.tarefa,
      this.id_tipoocorrencia,
      this.codocorrencia,
      this.ocorrencia,
      this.id_novostatus,
      this.codstatus,
      this.novostatus});

  factory TipoOcorrencia.fromJson(Map<String, dynamic> json) {
    if (json['id_novostatus'] == null) {
      json.addAll({
        "id_novostatus": "-1",
      });
    }

    return TipoOcorrencia(
      id_tipo: json['id_tipo'],
      tarefa: json['tarefa'],
      id_tipoocorrencia: json['id_tipoocorrencia'],
      codocorrencia: json['codocorrencia'],
      ocorrencia: json['ocorrencia'],
      id_novostatus: json['id_novostatus'],
      codstatus: json['codstatus'],
      novostatus: json['novostatus'],
    );
  }

  factory TipoOcorrencia.fromJsonLoad(Map<String, dynamic> json) {
    if (json['id_novostatus'] == null) {
      json.addAll({
        "id_novostatus": "-1",
      });
    }

    return TipoOcorrencia(
      id_tipo: int.parse(json['id_tipo']),
      tarefa: json['tarefa'],
      id_tipoocorrencia: int.parse(json['id_tipoocorrencia']),
      codocorrencia: json['codocorrencia'],
      ocorrencia: json['ocorrencia'],
      id_novostatus: int.parse(json['id_novostatus']),
      codstatus: json['codstatus'],
      novostatus: json['novostatus'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_tipo": id_tipo,
        "tarefa": tarefa,
        "id_tipoocorrencia": id_tipoocorrencia,
        "codocorrencia": codocorrencia,
        "ocorrencia": ocorrencia,
        "id_novostatus": id_novostatus,
        "codstatus": codstatus,
        "novostatus": novostatus,
      };
}

class TipoTransacao {
  int id;
  int id_tipotransacao;
  String codtransacao;
  String transacao;
  int online;

  TipoTransacao(
      {this.id_tipotransacao, this.codtransacao, this.transacao, this.online});

  factory TipoTransacao.fromJson(Map<String, dynamic> json) {
    return TipoTransacao(
      id_tipotransacao: int.parse(json['id_tipotransacao']),
      codtransacao: json['codtransacao'],
      transacao: json['transacao'],
      online: int.parse(json['online']),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_tipotransacao": id_tipotransacao,
        "codtransacao": codtransacao,
        "transacao": transacao,
        "online": online,
      };
}

class Transacao {
  int id_1;
  int id_2;
  int id_3;
  int id_4;
  String codigo;
  String valor;
  String descricao;
  String notas;
  String datahora;
  String sincronizadoem;
  String tarefa;

  Transacao(
      {this.id_1,
      this.id_2,
      this.id_3,
      this.id_4,
      this.codigo,
      this.valor,
      this.descricao,
      this.notas,
      this.datahora,
      this.sincronizadoem,
      this.tarefa});

  factory Transacao.fromJson(Map<String, dynamic> json) {
    return Transacao(
      id_1: json['id_1'],
      id_2: json['id_2'],
      id_3: json['id_3'],
      id_4: json['id_4'],
      codigo: json['codigo'],
      valor: json['valor'],
      descricao: json['descricao'],
      notas: json['notas'],
      datahora: json['datahora'],
      sincronizadoem: json['sincronizadoem'],
      tarefa: json['tarefa'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id_1": id_1,
        "id_2": id_2,
        "id_3": id_3,
        "id_4": id_4,
        "codigo": codigo,
        "valor": valor,
        "descricao": descricao,
        "notas": notas,
        "datahora": datahora,
        "sincronizadoem": sincronizadoem,
      };
}


*/
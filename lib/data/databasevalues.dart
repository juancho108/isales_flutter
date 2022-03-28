class DatabaseValues {
  /*
    static final String TIPOTAREFA_TABLENAME = "TIPOS_TAREFAS";
    static final String TT_ID = "id";
    static final String TT_TIPO_ID = "id_tipo";
    static final String TT_TAREFA = "tarefa";
    static final String TT_STATUSINICIAL_ID = "id_statusinicial";
    static final String TT_STATUSINICIAL = "statusinicial";

    static final String CREATE_TIPOTAREFA =
        "create table " + TIPOTAREFA_TABLENAME + " ( " +
            TT_ID + " INTEGER PRIMARY KEY, " +
            TT_TIPO_ID + " INTEGER, " +
            TT_TAREFA + " TEXT, " +
            TT_STATUSINICIAL_ID + " INTEGER, " +
            TT_STATUSINICIAL + " TEXT " +
            ")";

    static final String TAREFA_TABLENAME = "TAREFAS";
    static final String T_ID = "id";
    static final String T_PR_ID = "id_pr";
    static final String T_TIPO_ID = "id_tipo";
    static final String T_STATUS_ID = "id_status";
    static final String T_TAREFA = "tarefa";
    static final String T_MODULO = "modulo";
    static final String T_PROJETO = "projeto";
    static final String T_CLIENTE = "cliente";
    static final String T_ORDEMRESOLUCAO = "ordemresolucao";
     */

  static final information = {
    'pos_customers': {
      'tableName': "POS_CUSTOMERS",
      'loadFile': "POSData_Customers.sql",
      'create_script': createTablePOS_CUSTOMERS
    },
    'pos_products': {
      'tableName': "POS_PRODUCTS",
      'loadFile': "POSData_Products.sql",
      'create_script': createTablePOS_PRODUCTS
    },
    'pos_calendar': {
      'tableName': "POS_CALENDAR",
      'loadFile': ".sql",
      'create_script': createTablePOS_CALENDAR
    },
    'pos_transacoes': {
      'tableName': "POS_TRANSACOES",
      'loadFile': ".sql",
      'create_script': createTablePOS_TRANSACOES
    }
  };

  static final createTablePOS_ACTIVITIES = '''
    CREATE TABLE POS_ACTIVITIES (
	POS_ACTIVITIES_ID INTEGER PRIMARY KEY
	,SALESUPID INTEGER DEFAULT 0
	,DATE TEXT
	,NOTES TEXT
	,CUSTOMERID INTEGER DEFAULT 0
	,SELLERID INTEGER DEFAULT 0
	,TYPEID INTEGER DEFAULT 0
	,CATID INTEGER DEFAULT 0
	,REASONID INTEGER DEFAULT 0
	,RESULTID INTEGER DEFAULT 0
	,SYNC_OK INTEGER DEFAULT 1
	,ANDROID_NEW INTEGER DEFAULT 0
	,ANDROID_UPDATE INTEGER DEFAULT 0
	,ANDROID_DELETE INTEGER DEFAULT 0
	)''';

  static final createTablePOS_XXX = '''
    CREATE TABLE POS_ACTIVITIES (
	POS_ACTIVITIES_ID INTEGER PRIMARY KEY
	,SALESUPID INTEGER DEFAULT 0
	,DATE TEXT
	,NOTES TEXT
	,CUSTOMERID INTEGER DEFAULT 0
	,SELLERID INTEGER DEFAULT 0
	,TYPEID INTEGER DEFAULT 0
	,CATID INTEGER DEFAULT 0
	,REASONID INTEGER DEFAULT 0
	,RESULTID INTEGER DEFAULT 0
	,SYNC_OK INTEGER DEFAULT 1
	,ANDROID_NEW INTEGER DEFAULT 0
	,ANDROID_UPDATE INTEGER DEFAULT 0
	,ANDROID_DELETE INTEGER DEFAULT 0
	)''';

  static final createTablePOS_CUSTOMERS = '''
CREATE TABLE POS_CUSTOMERS (
	POS_CUSTOMERS_ID INTEGER PRIMARY KEY
  ,TABELA TEXT
	,CODE TEXT
	,NAME TEXT
	,ADDRESS TEXT
	,NIF TEXT
	,IS_PURCHASE INTEGER
	,IS_VISIT INTEGER
	,CITY TEXT
	,PHONE TEXT
	,EMAIL TEXT
	,COUNTRYID INTEGER
	,SALESUPID INTEGER DEFAULT - 1
	,COMERCIAL_CONDITIONS TEXT
	,DAYS_TO_PAY INTEGER
	,N_OPENDOCS INTEGER
	,BALANCE FLOAT
	,CREDIT_LIMIT TEXT
	,GRACE_PERIOD INTEGER
	,ADDRESSLOCAL TEXT
	,OFFICIALNAME TEXT
	,CODPOSTAL TEXT
	,RESTDAY TEXT
	,SCHEDULE TEXT
	,WEEK_REST TEXT
	,OPEN_HOUR TEXT
	,CLOSE_HOUR TEXT
	,VISIT_HOUR TEXT
	,DELIVERY_DAY TEXT
	,DELIVERY_HOUR TEXT
	,RES_MON INTEGER
	,RES_TUE INTEGER
	,RES_WED INTEGER
	,RES_THU INTEGER
	,RES_FRI INTEGER
	,RES_SAT INTEGER
	,RES_SUN INTEGER
	,CREDIT_CONTROL INTEGER
	,CREDIT_PASSWORD TEXT
	,IS_NATIONAL INTEGER
	,NEXT_VISIT INTEGER
	,SENT INTEGER
	,ANDROID_NEW INTEGER DEFAULT 0
	,STATUS INTEGER DEFAULT 0
	,SYNC_OK INTEGER DEFAULT 1
	,SUPERVISOR_NOTES TEXT
	,VENDOR_NOTES TEXT
	,CONTACT TEXT
	,ANDROID_UPDATE INTEGER DEFAULT 0
	,ANDROID_DELETE INTEGER DEFAULT 0
	,ROUTE_CODE TEXT
	,ROUTE_LINE_POS INTEGER
	,ACTIVE INTEGER DEFAULT 0
	,CONSIDER_NEW INTEGER DEFAULT 0
	,GPS_LAT TEXT
	,GPS_LON TEXT
	,CONTACT_NAME TEXT
	,CONTACT_POST TEXT
	,CONTACT_PHONE TEXT
	,CONTACT_EMAIL TEXT
	,CONTACT_NAME_2 TEXT
	,CONTACT_POST_2 TEXT
	,CONTACT_PHONE_2 TEXT
	,CONTACT_EMAIL_2 TEXT
	,CONTACT_NAME_3 TEXT
	,CONTACT_POST_3 TEXT
	,CONTACT_PHONE_3 TEXT
	,CONTACT_EMAIL_3 TEXT
	,RESP_CREDIT_LIMIT TEXT DEFAULT 0
	,NEGOTIATE_PRICE INTEGER DEFAULT 0
	,LOGISTIC_OPERATOR_ID INTEGER DEFAULT 0
	,ONLY_CONTRACT_PRODUCTS INTEGER DEFAULT 0
	,FREQUENCY_VISIT TEXT DEFAULT ''
	,WEEK1 INTEGER DEFAULT 0
	,WEEK2 INTEGER DEFAULT 0
	,WEEK3 INTEGER DEFAULT 0
	,WEEK4 INTEGER DEFAULT 0
	,PAYMENT_CONDITIONS TEXT DEFAULT ''
	,EXTERNAL_DOC INTEGER DEFAULT 0
	,ONLY_CASH_SALES INTEGER DEFAULT 0
	,APURA_IVA INTEGER DEFAULT 1
	,TAB_TARAS INTEGER DEFAULT 0
	,COUNTRY TEXT DEFAULT 'PT'
	,NORMALIZE_CODE TEXT
	,NORMALIZE_OFFICIALNAME TEXT
	,NORMALIZE_NAME TEXT
	,NORMALIZE_ADDRESS TEXT
	,NORMALIZE_NIF TEXT
	,NORMALIZE_CITY TEXT
	,NORMALIZE_PHONE TEXT
	,CONTRATACAO_PUBLICA INTEGER DEFAULT 0
	,COMPROMISSO_CONTRATACAO_PUBLICA TEXT DEFAULT ''
	)''';

  static final createTablePOS_PRODUCTS = '''
CREATE TABLE POS_PRODUCTS (
	POS_PRODUCTS_ID INTEGER PRIMARY KEY
	,SALESUP_ID INTEGER DEFAULT 0
	,CODE TEXT
	,NAME TEXT
	,SLOGAN TEXT
	,CODSEG1 TEXT
	,CODSEG2 TEXT
	,CODSEG3 TEXT
	,CODSEG4 TEXT
	,CODSEG5 TEXT
	,CODSEG6 TEXT
	,PVP1 DOUBLE DEFAULT 0
	,PVP2 DOUBLE DEFAULT 0
	,PVP3 DOUBLE DEFAULT 0
	,PVP4 DOUBLE DEFAULT 0
	,PVP5 DOUBLE DEFAULT 0
	,PVP6 DOUBLE DEFAULT 0
	,PVP7 DOUBLE DEFAULT 0
	,PVP8 DOUBLE DEFAULT 0
	,IVA TEXT
	,SIZE DOUBLE DEFAULT 0
	,UNIT_PER_BOX DOUBLE DEFAULT 0
	,DISC1_MAX DOUBLE DEFAULT 0
	,DISC2_MAX DOUBLE DEFAULT 0
	,DISC3_MAX DOUBLE DEFAULT 0
	,SELLING_UNIT TEXT
	,PRICE_MIN DOUBLE DEFAULT 0
	,DISC1_TABLE DOUBLE DEFAULT 0
	,DISC2_TABLE DOUBLE DEFAULT 0
	,DISC3_TABLE DOUBLE DEFAULT 0
	,DISC4_TABLE DOUBLE DEFAULT 0
	,DISC5_TABLE DOUBLE DEFAULT 0
	,DISC6_TABLE DOUBLE DEFAULT 0
	,DISC7_TABLE DOUBLE DEFAULT 0
	,DISC8_TABLE DOUBLE DEFAULT 0
	,URL TEXT
	,EDIT_NAME INTEGER DEFAULT 0
	,SYNC_OK INTEGER DEFAULT 1
	,MANAGES_STOCK INTEGER DEFAULT 0
	,SELL_NEGATIVE_STOCK INTEGER DEFAULT 0
	,IS_CONTAINER INTEGER DEFAULT 0
	,GROSS_WEIGHT DOUBLE DEFAULT 0
	,NET_WEIGHT DOUBLE DEFAULT 0
	,IMAGE_FILE TEXT
	,HTML_DETAILS TEXT
	,VARIATION INTEGER DEFAULT 0
	,IS_SOGENAVE INTEGER DEFAULT 0
	,PROVIDER_CODE TEXT
	,CONV_BOXES INTEGER DEFAULT 0
	,BUYING_UNIT TEXT
	,IABA_SELL DOUBLE DEFAULT 0
	,MEMBERSPRICE TEXT
	,IS_REDUCTION TEXT
	,PVP1_IVA DOUBLE DEFAULT 0.0
	,PVP2_IVA DOUBLE DEFAULT 0.0
	,PVP3_IVA DOUBLE DEFAULT 0.0
	,PVP4_IVA DOUBLE DEFAULT 0.0
	,PVP5_IVA DOUBLE DEFAULT 0.0
	,PVP6_IVA DOUBLE DEFAULT 0.0
	,PVP7_IVA DOUBLE DEFAULT 0.0
	,PVP8_IVA DOUBLE DEFAULT 0.0
	,CONTROLA_LOTE INTEGER DEFAULT 0
	,RASTREABILIDADE INTEGER DEFAULT 0
	,DEFPROD1 TEXT DEFAULT '*'
	,DEFPROD2 TEXT DEFAULT '*'
	,UNIDADE_CAP TEXT DEFAULT ''
	,CASAS_DECIMAIS_QTD INTEGER DEFAULT - 1
	,PRODUZ_SO_COM_ENCOMENDA INTEGER DEFAULT 0
	,NAME2 TEXT DEFAULT ''
	)''';

  static final createTablePOS_CALENDAR = '''
    CREATE TABLE "POS_CALENDAR" (
POS_CALENDAR_ID integer primary key autoincrement,
SALESUPID integer default 0,
CUSTOMER_ID integer default 0,
OCCURRENCE_ID integer default 0,
PRODUCT_ID numeric default 0,
OPORTUNITY_ID numeric default 0,
OPERATOR_ID integer default 0,
ACTION_TYPE_ID integer default 0,
DATE date,
HOUR date,
NOTES text,
SOLVED integer default 0,
SOLVE_NOTES text,
SOLVE_DATE date,
FORM_ID INTEGER,
CHAVE_PDA TEXT,
DESCRICAO TEXT)''';

  static final createTablePOS_TRANSACOES = '''
    POS_TRANSACOES_ID INTEGER PRIMARY KEY AUTOINCREMENT,
CHAVE_PDA TEXT NOT NULL,
OPERATOR_ID INTEGER,
GPS_LAT NUMERIC,
GPS_LOG NUMERIC,
XML_IN TEXT
)''';

  static final createTableTipoTarefa = '''CREATE TABLE TipoTarefas (
                id INTEGER PRIMARY KEY, 
                id_tipo INTEGER, 
                tarefa TEXT, 
                id_statusinicial INTEGER, 
                statusinicial TEXT
        )''';

  static final createTablePOS_CUSTOMERS_ADDRESS =
      '''CREATE TABLE POS_CUSTOMERS_ADDRESS (
          POS_CUSTOMERS_ADDRESS_ID INTEGER PRIMARY KEY autoincrement
          ,CUSTOMER_ID INTEGER DEFAULT 0
          ,ADDRESS TEXT DEFAULT ''
          ,POSTAL_CODE TEXT DEFAULT ''
          ,CITY TEXT DEFAULT ''
          ,COUNTRY TEXT DEFAULT ''
          ,GPS_LAT TEXT DEFAULT ''
          ,GPS_LOG TEXT DEFAULT ''
          ,NOTES TEXT DEFAULT ''
          ,ADDRESS_DEFAULT INTEGER DEFAULT 0
          ,SYNC_OK INTEGER DEFAULT 1
          ,ADDRESS_ID INTEGER DEFAULT - 1
	 )''';

  static final createTableTarefa = '''CREATE TABLE Tarefas (
                id INTEGER PRIMARY KEY,
                id_pr INTEGER,
                id_tipo INTEGER,
                id_status INTEGER,
                id_pai INTEGER,
                codigo TEXT,
                tarefa TEXT,
                notas TEXT,
                modulo TEXT,
                projeto TEXT,
                cliente TEXT,
                ordemresolucao INTEGER,
                tempoestimado TEXT,
                tempoefetuado TEXT,
                semana INTEGER,
                tempoacumulado TEXT,
                datacheckin TEXT,
                efetuado INTEGER,
                criadoem TEXT,
                planeiainiciar TEXT,
                planeiaterminar TEXT,
                ecranapresentacao TEXT,
                bloqueado TEXT,
                notasbloqueado TEXT
        )''';

  static final createTableStatusWorkFlow = '''CREATE TABLE StatusWorkflow (
                id INTEGER PRIMARY KEY, 
                id_tipo INTEGER, 
                tarefa TEXT, 
                id_statusatual INTEGER, 
                statusatual TEXT, 
                proximostatus TEXT, 
                id_proximostatus INTEGER 
        )''';

  static final createTableStatus = '''CREATE TABLE Status (
                id INTEGER PRIMARY KEY, 
                id_tipo INTEGER, 
                tarefa TEXT, 
                id_status INTEGER, 
                codstatus TEXT, 
                designacao TEXT, 
                terminado INTEGER 
        )''';

  static final createTableTipoTempo = '''CREATE TABLE TipoTempos (
                id INTEGER PRIMARY KEY, 
                id_tipo INTEGER, 
                codigo TEXT, 
                designacao TEXT
        )''';

  static final createTableTipoOcorrencia = '''CREATE TABLE TipoOcorrencias (
                id INTEGER PRIMARY KEY, 
                id_tipo INTEGER, 
                tarefa TEXT, 
                id_tipoocorrencia INTEGER, 
                codocorrencia TEXT, 
                ocorrencia TEXT, 
                id_novostatus INTEGER, 
                codstatus TEXT, 
                novostatus TEXT 
        )''';

  static final createTableTipoTransacao = '''CREATE TABLE TipoTransacoes (
                id INTEGER PRIMARY KEY, 
                id_tipotransacao INTEGER, 
                codtransacao TEXT, 
                transacao TEXT, 
                online INTEGER 
        )''';

  static final createTableTransacao = '''CREATE TABLE Transacoes (
                id INTEGER PRIMARY KEY, 
                id_1 INTEGER, 
                id_2 INTEGER, 
                id_3 INTEGER, 
                id_4 INTEGER, 
                codigo TEXT, 
                valor TEXT, 
                descricao TEXT,
                notas TEXT,
                datahora TEXT,
                sincronizadoem TEXT
        )''';
}

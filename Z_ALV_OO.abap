REPORT Z_ALV_OO.
* Estrutura para armazenar os dados
TYPES: BEGIN OF ty_clientes,
         kunnr TYPE kna1-kunnr,  " Número do cliente
         name1 TYPE kna1-name1,  " Nome do cliente
         ort01 TYPE kna1-ort01.  " Cidade do cliente
TYPES: END OF ty_clientes.

DATA: gt_clientes TYPE TABLE OF ty_clientes, " Tabela interna com os dados
      gs_clientes TYPE ty_clientes.         " Linha de trabalho

* Definição para ALV
DATA: gt_fieldcat TYPE TABLE OF slis_fieldcat_alv, " Configuração do ALV
      gs_fieldcat TYPE slis_fieldcat_alv.

* Seleção de dados da tabela KNA1 (Clientes)
SELECT kunnr, name1, ort01
  FROM kna1
  INTO TABLE @gt_clientes
  WHERE kunnr = @gs_clientes-kunnr.
* Configuração das colunas do ALV
gs_fieldcat-col_pos = 1.
gs_fieldcat-fieldname = 'KUNNR'.
gs_fieldcat-seltext_m = 'Cliente'.
APPEND gs_fieldcat TO gt_fieldcat.

/*
Programa:ContagemLinhas.sas
Autor: Juan Ormelli de Medeiros
Data:04/03/2021
Versao:1.00

Descrição:Programa para contagem de linhas de cada tabela utilizada na carga de dados -
Resolução EX3


*/


proc sql;
  create table Contagem_Linhas
  (NumeroLinhas num);
run;

proc sql;
  insert into work.contagem_linhas
  select count(c.CodCor)
  from cgdexcel.cores as c;
run;
proc sql;
  insert into work.contagem_linhas
  select count(d.CodDepto)
  from cgdexcel.deptos as d;
run;
proc sql;
  insert into work.contagem_linhas
  select count(e.CodEstado)
  from cgdexcel.estados as e;
run;
proc sql;
  insert into work.contagem_linhas
  select count(g.CodGrupo)
  from cgdexcel.grupos as g;
run;
proc sql;
  insert into work.contagem_linhas
  select count(p.CodProduto)
  from cgdexcel.produtos as p;
run;
proc sql;
  insert into work.contagem_linhas
  select count(r.CodRegiao)
  from cgdexcel.regiao as r;
run;
proc sql;
  insert into work.contagem_linhas
  select count(t.CodTamanho)
  from cgdexcel.tamanhos as t;
run;
proc sql;
  insert into work.contagem_linhas
  select count(v.DataVenda)
  from cgdexcel.vendas as v;
run;
data ContagemLinhas;
  set work.contagem_linhas;
  input NomeTables$;
  datalines;
  Cores
  Deptos
  Estados
  Grupos
  Produtos
  Regiões
  Tamanhos
  Vendas
proc print data=work.contagemlinhas;
  title "Contagem Linhas";
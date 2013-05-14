-- Saber qual zoneamento um determinado lote está de acordo com a inscricao base
-- ST_Overlaps - pega o lote que pelo menos encosta na poligonal do zoneamento
-- ST_Within - pega o lote que esta totalmente dentro da poligonal do zoneamento
SELECT z.gid, z.zona, z.desc_situa, z.tipo_ativi, ST_Overlaps(l.the_geom,z.the_geom) as ok
from zonas z, lotesvr l
where l.cadastro = 41090002 and
ST_Overlaps(l.the_geom,z.the_geom)

--************************************************************

-- Script de migracao de dados entre servidores diferentes
SET search_path TO postgis, public;
--truncate ruas restart IDENTITY
INSERT INTO ruas (id_rua, nome, the_geom)
    SELECT id_rua, nome, the_geom
    FROM dblink('dbname=dbgeo port=5432 host=10.1.0.73 user=geo password=geo',
    'SELECT id_rua, nome, the_geom FROM ruas')
    AS t(id_rua integer, nome character varying(100), the_geom geometry)

--************************************************************

-- Saber em quais bairros passa uma determinada rua
SELECT r.nome, b.bairro
from ruas r, bairros_oficial b
where r.id_rua = 1580 and
r.the_geom && b.the_geom and
st_intersects(r.the_geom, b.the_geom)

-- Consulta com buffer

select l.descricao_linha, l.n_linha, l.empresa from linhas_onibus l, ponto_onibus p
where st_intersects(st_buffer(p.the_geom, 15), l.the_geom) and
p.id = 732
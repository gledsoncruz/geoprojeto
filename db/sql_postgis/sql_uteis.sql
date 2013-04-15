-- Saber qual zoneamento um determinado lote está de acordo com a inscricao base
-- ST_Overlaps - pega o lote que pelo menos encosta na poligonal do zoneamento
-- ST_Within - pega o lote que esta totalmente dentro da poligonal do zoneamento
SELECT z.gid, z.zona, z.desc_situa, z.tipo_ativi, ST_Overlaps(l.the_geom,z.the_geom) as ok
from zonas z, lotesvr l
where l.cadastro = 41090002 and
ST_Overlaps(l.the_geom,z.the_geom)
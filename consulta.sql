select v.id_vehiculo, 
	   mo.modelo, 
	   m.marca, 
	   g.grupo, 
	   v.fecha_compra, 
	   v.matricula, 
	   c.name as "Color", 
	   v.kms, 
	   a.name as "Aseguradora",
	   v.n_poliza 
from OlgaMarin.vehiculos v
inner join OlgaMarin.type_modelos mo on v.modelo = mo.id_modelo
inner join OlgaMarin.type_marcas m on mo.id_marca = m.id_marca
inner join OlgaMarin.type_grupo_empresarial g on m.id_grupo_empresarial = g.id_grupo_empresarial
inner join OlgaMarin.type_color c on v.color = c.id_color
inner join OlgaMarin.type_aseguradora a on v.aseguradora = a.id_aseguradora;
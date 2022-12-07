select v.id_vehiculo, 
	   mo.modelo, 
	   m.marca, 
	   g.grupo, 
	   v.fecha_compra, 
	   v.matricula, 
	   v.color, 
	   v.kms, 
	   v.aseguradora,
	   v.n_poliza 
from OlgaMarin.type_grupo_empresarial g
inner join OlgaMarin.type_marcas m on g.id_grupo_empresarial = m.id_grupo_empresarial
inner join OlgaMarin.type_modelos mo on m.id_marca = mo.id_marca
inner join OlgaMarin.vehiculos v on mo.id_modelo = v.modelo;
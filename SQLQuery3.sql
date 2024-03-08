select ep.Matricula, ep.Nome, ed.Data_Cadastro
from Empregado as ep
inner join EmpregadoDepartamento as ed
	on ep.matricula = ed.Matricula_Empregado
inner join Departamento as d
	on d.numero_dpto = ed.numero_dpto


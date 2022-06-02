<?php

namespace App\Models;

use PDO;

/**
 * Example user model
 *
 * PHP version 7.0
 */
class Jobs extends \Core\Model
{

    /**
     * Get all the jobs as an associative array
     *
     * @return array
     */
    public static function getJobs()
    {
        $db = static::getDB();
        $stmt = $db->query("
SELECT 
v.`ID_Vaga` as 'vaga_id', 
v.`Ds_Funcao` as 'vaga_funcao', 
v.`Ds_Vaga` as 'vaga_descricao', 
v.`Vl_Salario` as 'vaga_salario', 
v.`Ds_HorarioTrabalho` as 'vaga_horario', 
v.`Ds_Local` as 'vaga_local', 
v.`Ds_Jornada` as 'vaga_jornada',
e.`Ds_Nome` as 'empresa_nome',
e.`Ds_Setor` as 'empresa_setor',
e.`Ds_Estado` as 'empresa_estado',
e.`Ds_Empresa` as 'empresa_descricao',
e.`Ds_Cidade` as 'empresa_cidade'
FROM `tb_vagas` AS v

INNER JOIN `tb_empresa` AS e ON v.`ID_Empresa` = e.`ID_Empresa`

WHERE 1
");
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}

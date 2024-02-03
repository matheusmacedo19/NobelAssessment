SELECT 
cp.NOMBRE as CampaignName, 
cp.IDCAMPANYA as CampaignID, 
u.NOMBRE as AgentName, 
u.IDUSUARIO as AgentID, 
u.LOGIN as AgentLogin, 
COUNT(t.idTransaccion) as TotalTransaccions, 
SUM(DATEDIFF(DATE, t.tInicio, t.tFinal)) as TotalTime
FROM TRANSACCION t 
INNER JOIN
    dbo.CAMPANYA cp ON t.idCampanya = cp.IDCAMPANYA
INNER JOIN
    dbo.USUARIO u ON t.idAgente = u.IDUSUARIO
GROUP BY
    cp.IDCAMPANYA,
    cp.NOMBRE,
    u.IDUSUARIO,
    u.NOMBRE,
    u.LOGIN
ORDER BY
    cp.IDCAMPANYA,
    u.IDUSUARIO
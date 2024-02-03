CREATE PROCEDURE GetFilteredTransactionData
    @CampaignId numeric(10,0) = NULL,
    @AgentId numeric(10,0) = NULL,
    @FinalId numeric(10,0) = NULL
AS
BEGIN
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
    WHERE
        (@CampaignId IS NULL OR cp.IDCAMPANYA = @CampaignId)
        AND (@AgentId IS NULL OR u.IDUSUARIO = @AgentId)
        AND (@FinalId IS NULL OR t.idFinal = @FinalId)
    GROUP BY
        cp.IDCAMPANYA,
        cp.NOMBRE,
        u.IDUSUARIO,
        u.NOMBRE,
        u.LOGIN
    ORDER BY
        cp.IDCAMPANYA,
        u.IDUSUARIO
END
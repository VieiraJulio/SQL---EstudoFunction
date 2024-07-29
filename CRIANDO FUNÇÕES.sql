

SELECT
	nome_cliente,
	data_de_nascimento,
	[dbo].[fn_Data_Extenso](data_de_nascimento) AS 'Data completa'
FROM
	dCliente


CREATE FUNCTION fn_Data_Extenso(@Data AS DATE)
RETURNS VARCHAR(MAX)
AS
BEGIN
	RETURN	DATENAME(DW,@Data) + ', ' +
			DATENAME(D, @Data) + ' de ' +
			DATENAME(M, @Data) + ' de ' +
			DATENAME(YY,@Data)
END
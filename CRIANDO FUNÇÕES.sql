

-- OBJETIVO : CRIAR UMA FUNÇÃO DE DATA PERSONALIZADA

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


-- OBJETIVO : CRIAR UMA FUNÇÃO QUE EXTRAI O PRIMEIRO NOME DA COLUNA 


CREATE OR ALTER FUNCTION fnPrimeiroNome(@nomecompleto AS VARCHAR(MAX))
RETURNS VARCHAR(MAX)
AS
BEGIN

	DECLARE @posicaoespaco AS INT
	DECLARE @resposta AS VARCHAR(MAX)

	SET @posicaoespaco = CHARINDEX(' ', @nomecompleto)
	IF  @posicaoespaco = 0
		SET @resposta = @nomecompleto
	ELSE 
		SET @resposta = LEFT(@nomecompleto, @posicaoespaco)

	RETURN @resposta
END



SELECT 
	nome_gerente,
	[dbo].[fnPrimeiroNome](nome_gerente) AS 'FirstName'
FROM 
	dGerente
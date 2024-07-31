
/*
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



-- CRIANDO FUNÇÃO DE DIFERENÇA DE DATAS 

USE ContosoRetailDW

SELECT 
	EmployeeKey,
	FirstName,
	StartDate,
	EndDate,
	[dbo].[fn_Data_dif](StartDate,EndDate) AS 'Dif anos'
FROM
	DimEmployee


CREATE FUNCTION fn_Data_dif(@Datainicio AS DATE, @Datafinal AS DATE)
RETURNS INT
AS
BEGIN
	DECLARE @Data1 AS INT, @Data2 AS INT
	SET @Data1 = YEAR(@Datainicio)
	SET @Data2 = YEAR(ISNULL(@Datafinal, GETDATE()))
	
	RETURN	
		
		@Data2 - @Data1
END

*/

-- CRIAÇÃO DE UMA FUNÇÃO EM FORMATO DE TABELA 

CREATE OR ALTER FUNCTION fn_Gender(@Gender AS VARCHAR(MAX))
RETURNS TABLE
AS
RETURN (SELECT FirstName,Gender FROM DimEmployee WHERE Gender = @Gender)


SELECT
	FirstName,
	Gender
FROM
	dbo.fn_Gender('M')

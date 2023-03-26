@echo off

REM Define o nome do ambiente virtual

set nomeAmbienteVirtual=jupyterEnv
echo ################ Definindo o nome do ambiente virtual para: %nomeAmbienteVirtual% ################

REM Define o caminho da pasta para o ambiente virtual
set caminhoAmbienteVirtual=D:\Documentos\Projetos\python\%nomeAmbienteVirtual%
echo ################ Definindo o caminho da pasta para o ambiente virtual para: %caminhoAmbienteVirtual% #######

REM Checa se o arquivo requirements.txt existe
if exist "requirements.txt" (
    REM Cria o ambiente virtual
    "C:\Program Files\Python311\python.exe" -m venv %caminhoAmbienteVirtual%

    REM Ativa o ambiente virtual
	echo ################ Ativando o ambiente virtual %caminhoAmbienteVirtual% ################
    call %caminhoAmbienteVirtual%\Scripts\activate.bat

    REM Atualiza o pip
	echo ################ Atualizando o Pip Install ################
    python -m pip install --upgrade pip

    REM Instala as bibliotecas listadas no arquivo requirements.txt
	echo ################ 														################
	echo ################ Instalando as bibliotecas do arquivo requirements.txt ################
	echo ################ 														################
	pip install -r requirements.txt

    REM Inicia o Jupyter Notebook
	echo ################ Iniciando o Jupyter Notebook ################
    jupyter notebook

    REM Desativa o ambiente virtual
    deactivate
) else (
	echo ########################################################################################## 
    echo Nao foi encontrado o arquivo "requirements.txt" no caminho do executavel.
    echo O ambiente virtual foi criado sem a instalacao das bibliotecas.
    echo Voce pode criar o arquivo "requirements.txt" e instalar as bibliotecas posteriormente.
    echo Pressione qualquer tecla para sair.
	echo ##########################################################################################
    pause >nul
)
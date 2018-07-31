# 2018 Localization Summit — TDF Report
TDF Report for the 2018 edition of Localization Summit



# :clipboard: Visão Geral:

1. [SM30]  Cadastros e Configurações 
   1. ```/TMF/D_REPORT```
   1. ```/TMF/D_REP_FISC```
   1. ```/TMF/D_REP_VERS```
   1. ```/TMF/D_VIEW_VERS```
   1. Validações: ```/TMF/TOM02``` & ```/TMF/V_REG_REP``` _(SE16)_
   
   
2. [SE24]  Criar Classe de Report
    (herdando de ```/TMF/CL_SPED```)
    
    
3. [SE24]  Criar Classe de Parâmetros
    (herdando de ```/TMF/CL_SPED_PARAMETERS```)  
   1. Redefinir ```VALIDATE```
   1. Implementar ```CONSTRUCTOR```
   
   
4. Criar HANA View
   1. HANA Calculation View
   1. External View
   
   
5. [SE38]  Criar Programa


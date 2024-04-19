# SeriesGratisOnlineFreeHD
#### APP de Seriados feito com QT, QML e C++ . 

Ele consome os dados da TVmaze API (https://www.tvmaze.com/api). Créditos totais.

## Arquitetura:

#### Backend:

Foi usada uma arquitetura de Camadas, cada uma com uma função no sistema.

- Integration: Contem classes que se ligam com APIs/endpoints e transformam os dados obtidos em um formato aceito pelo sistema.
- Service: Recebe os dados do Integration e faz a logica de negócio.
- Delegate: Camada de transporte. Também pode ser usada para validações, como por exemplo Transactions/Commits/Rollbacks (caso houvesse banco de dados no sistema).
- Controller: Faz a exposição dos dados para o Front-End

#### Frontend:
- Control: Contém classes que conectam com o Backend e com a UI (QML), permitindo troca de dados.

![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/eda5ae7b-28b7-41ee-96c6-94afee83d8c1)




## Sobre do Ambiente de Desenvolvimento:

SO: Windows 11

Qt: 6.7

QtCreator: 13.0.0  - Based on Qt 6.6.0 (MSVC 2019, x86_64)

Kit: Desktop Qt 6.7.0 MinGW 64-bit

Build System: QMake

Compilers e demais dados do KIT:
![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/cabc35c4-31cd-42b3-ba1c-149064c37fc1)



## Instalação do Ambiente de Desenvolvimento:

#### 1 - Faça o download do Qt 6.7 e do QtCreator 13 (versão Free) no seguinte link:

https://www.qt.io/download-qt-installer-oss	

![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/cf8c32de-07f7-4357-aaf4-81249b26a812)

#### 2 - Execute o Instalador baixado e avance até o seguinte passo, clicando em "Instalação Personalizada"
![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/a6d2d524-2c42-4bda-b548-3fb46f8c4cb7)


#### 3 - Instale o Qt 6.7 junto com os componentes extras (igual na imagem abaixo)

Adendo: O projeto não usa todos esses modulos. Porém, é o ambiente que foi usado no desenvolvimento, essa instalação completa evitará possiveis erros de dependencia. 

![Test Image 1](ProjectInfo/ComponentesInstalacaoAmbiente.png)

#### 4 - Avance os passos até a instalação ser concluida.

## Buildando o APP

#### 1 - Após configurar o ambiente com os dados já disponibilizados. Abre o Qt Creator e clique em "Open Project" 
![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/3bcbc506-3016-4a72-8936-153257c39e7a)


#### 2 - Ache e abra o arquivo .pro disponibilizado dentro do diretório raiz do projeto.

![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/ced8f2fa-145b-4d8e-9330-a7dcfea956f3)

#### 3 - Com o projeto aberto,vá na aba Project e Configure o KIT que será usado para buildar o sitema (Desktop Qt 6.7.0 MinGW 64-bit).
![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/4f2e14d5-4d02-4b67-a0ff-092b1a1e5221)

#### 4 - Rode o Qmake e Rebuilde o Projeto

![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/e570b9aa-b25f-4086-9d4c-fbe058302b73)
![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/1aa30c77-5aa2-4c65-be46-6bd2749e2911)

##### 4.1 - Se necessario, rode um "distclean"
  
![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/06f19687-3a1d-43f9-8390-70146435d30f)
![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/e2bc9000-ba5d-40a2-aac2-e4958ccbc8a7)

#### 5 - Selecione o modo Debug e Clique em RUN

![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/f1b854dc-20ff-4b10-ac4c-28712cc22cc9)
![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/85687d6f-c500-4eda-a410-eee55a9e22cc)

#### 6 - Correr para o abraço


## Imagens do Inenarrável

![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/3a3ee043-9f36-4bdf-8b58-37e36328ee70)
![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/1e0039d2-24fe-4572-86de-b795b6d2ae2f)
![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/3ab61f18-181d-410c-8e20-b2e9adee2986)
![image](https://github.com/ViniCL/SeriesGratisOnlineFreeHD/assets/52608377/c73a1b0d-0dec-43a5-a59b-cdc1c07d0c2d)






<!-- Generated by NCL Eclipse -->
<ncl id="parte4" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile">          
	<head>
		<!-- importando menu -->
		<importedDocumentBase>
			<importNCL alias="docMenu" documentURI="parte_menu.ncl" />
		</importedDocumentBase>
		
		
		<regionBase>
			<region id="rgTV">
				<region id="rgFullScreen"/>
				<region id="rgInterativa" left="80%" top="10%" width="100" height="115" zIndex="3"/>
				<region id="rgClima" left="80%" top="20%" width="200" height="115" zIndex="3"/>				
			</region>				
		</regionBase>
		
		<descriptorBase>
			<descriptor id="dVideoPrincipal" region="rgFullScreen"/>
			
			<descriptor id="dImgInterativa" region="rgInterativa" >
				<descriptorParam name="transparency" value="20%"/>
			</descriptor>				
			
			<descriptor id="dClima" region="rgClima">
				<descriptorParam name="fontSize" value="28"/>
			</descriptor>
				
				
				
		</descriptorBase>
		
		<connectorBase>
			<importBase alias="myConnectors" documentURI="myConnectors.ncl"/>
		</connectorBase>
		
	</head>

	<body>
		<!-- comeca -->
		<port id="pVideoPrincipal" component="VideoPrincipal"/>
		
		<!-- Midias -->
		<media id="VideoPrincipal" src="midia/abertura.mp4" descriptor="dVideoPrincipal"/>	
		<media id="ImagemInterativa" src="midia/info_icon.png" descriptor="dImgInterativa"/>
		<media id="TemperaturaGRU" src="midia/sao_paulo.txt" descriptor="dClima"/>
		<media id="TemperaturaPOA" src="midia/porto_alegre.txt" descriptor="dClima"/>
		<media id="TemperaturaJPA" src="midia/joao_pessoa.txt" descriptor="dClima"/>

		<!-- Adicionando contexto -->
		<context id="menu" refer="docMenu#menu" />
		
		<!--Adiciona icone de interatividade-->
		<link xconnector="myConnectors#onBeginStart">
			<bind role="onBegin" component="VideoPrincipal" />
			<bind role="start" component="ImagemInterativa" />	
		</link>			
		
		<!--Ao clicar BLUE abre menu (context) e fecha interatividade-->
		<link xconnector="myConnectors#onKeySelectionStartStop">
			<bind role="onSelection" component="ImagemInterativa" >
				<bindParam name="vKey" value="BLUE"/>
			</bind>
			
			<bind role="start" component="menu" />
			<bind role="stop" component="ImagemInterativa" />
		</link>
		
		<!-- Apresentar temperatura da cidade selecionada -->
		<link xconnector="myConnectors#onKeySelectionStartStop">
			<bind component="menu" interface="pMenu1" role="onSelection"/>
			<bind component="menu" role="stop"/>
			<bind component="TemperaturaGRU" role="start" />
		</link>
		
		<link xconnector="myConnectors#onKeySelectionStartStop">
			<bind component="menu" interface="pMenu2" role="onSelection"/>
			<bind component="menu" role="stop"/>
			<bind component="TemperaturaPOA" role="start" />
		</link>
		
		<link xconnector="myConnectors#onKeySelectionStartStop">
			<bind component="menu" interface="pMenu3" role="onSelection"/>
			<bind component="menu" role="stop"/>
			<bind component="TemperaturaJPA" role="start" />
		</link>
		
		<!-- BOTAO RED ENCERRA CLIMA/MENU E PASSA PARA ICONE INTERATIVO -->

		
		<link xconnector="myConnectors#onKeySelectionStartNStopN">
			<bind role="onSelection" component="menu" interface="pMenu1" >
				<bindParam name="vKey" value="RED"/>
			</bind>

			<bind role="stop" component="menu" />
			<bind role="start" component="ImagemInterativa" />	
		</link>
		
		<link xconnector="myConnectors#onKeySelectionStartNStopN">
			<bind role="onSelection" component="menu" interface="pMenu2" >
				<bindParam name="vKey" value="RED"/>
			</bind>

			<bind role="stop" component="menu" />
			<bind role="start" component="ImagemInterativa" />	
		</link>
		
		<link xconnector="myConnectors#onKeySelectionStartNStopN">
			<bind role="onSelection" component="menu" interface="pMenu3" >
				<bindParam name="vKey" value="RED"/>
			</bind>

			<bind role="stop" component="menu" />
			<bind role="start" component="ImagemInterativa" />	
		</link>
		
		<link xconnector="myConnectors#onKeySelectionStartNStopN">
			<bind role="onSelection" component="TemperaturaGRU" >
				<bindParam name="vKey" value="RED"/>
			</bind>
				
			<bind role="stop" component="TemperaturaGRU" />
			<bind role="start" component="ImagemInterativa" />	
			
		</link>
		
		<link xconnector="myConnectors#onKeySelectionStartNStopN">
			<bind role="onSelection" component="TemperaturaPOA" >
				<bindParam name="vKey" value="RED"/>
			</bind>
				
			<bind role="stop" component="TemperaturaPOA" />
			<bind role="start" component="ImagemInterativa" />	
			
		</link>
		
		<link xconnector="myConnectors#onKeySelectionStartNStopN">
			<bind role="onSelection" component="TemperaturaJPA" >
				<bindParam name="vKey" value="RED"/>
			</bind>
				
			<bind role="stop" component="TemperaturaJPA" />
			<bind role="start" component="ImagemInterativa" />	
			
		</link>
		
		<!-- Botao GREEN volta para o menu -->
		<link xconnector="myConnectors#onKeySelectionStartStop">
			<bind component="TemperaturaGRU" role="onSelection">
				<bindParam name="vKey" value="GREEN"/>
			</bind>
			<bind component="menu" role="start"/>
			<bind component="TemperaturaGRU" role="stop" />
		</link>
		
		<link xconnector="myConnectors#onKeySelectionStartStop">
			<bind component="TemperaturaPOA" role="onSelection">
				<bindParam name="vKey" value="GREEN"/>
			</bind>
			<bind component="menu" role="start"/>
			<bind component="TemperaturaPOA" role="stop" />
		</link>
		
		<link xconnector="myConnectors#onKeySelectionStartStop">
			<bind component="TemperaturaJPA" role="onSelection">
				<bindParam name="vKey" value="GREEN"/>
			</bind>
			<bind component="menu" role="start"/>
			<bind component="TemperaturaJPA" role="stop" />
		</link>
		
		
		<!-- Fim do video, fim do icone interativo -->
		<link xconnector="myConnectors#onEndStopN">
			<bind role="onEnd" component="VideoPrincipal" />
			<bind role="stop" component="ImagemInterativa" />
			<bind role="stop" component="TemperaturaGRU" />
			<bind role="stop" component="TemperaturaPOA" />
			<bind role="stop" component="TemperaturaJPA" />
			<bind role="stop" component="menu" />			
		</link>
		
		
		

	</body>
	
</ncl>
PROPRIEDADE_NOME_1 = "setClima1"
PROPRIEDADE_NOME_2 = "setClima2"
PROPRIEDADE_NOME_3 = "setClima3"

function handler(e)
	
	--print('READ recebendo class...', e.class) io.flush()
	--print('READ recebendo type...', e.type) io.flush()
	--print('READ recebendo action...', e.action) io.flush()
	--print('READ recebendo name...', e.name) io.flush()
	--print('READ recebendo value...', e.value) io.flush()
	
	if (e.class == 'ncl' and e.type == 'attribution') then
		--value: retira da string apenas os dois primeiros numeros, representando a temperatura
		
		print('XXXXXXXXXXXXXXXXXXXXXX CLIMA INICIO ENTROU 1 IF XXXXXXXXXXXXXXXXXXX') io.flush()
		print('READ recebendo class...', e.class) io.flush()
		print('READ recebendo type...', e.type) io.flush()
		print('READ recebendo action...', e.action) io.flush()
		print('READ recebendo name...', e.name) io.flush()
		print('READ recebendo value...', e.value) io.flush()
		
		if e.name == PROPRIEDADE_NOME_1 then
			value = string.match(e.value, '%d%d')
			testClima(value, 'getClima1')
		end
		if e.name == PROPRIEDADE_NOME_2 then
			value = string.match(e.value, '%d%d')
			testClima(value, 'getClima2')
		end	
		if e.name == PROPRIEDADE_NOME_3 then
			value = string.match(e.value, '%d%d')
			testClima(value, 'getClima3')
		end			
	end
end

function testClima(value, retProp)			
	if value ~= nil then
	
		temp = tonumber(value)
		ret = 'chuva'
				
		if temp > 22 then
			ret = 'sol'
		end
				
		if temp < 10 then
			ret = 'neve'
		end
				
		print('VALOR TEMP: ',temp) io.flush()
		geraEventoDeAtriuicao(retProp, ret)
	
	end
end

function geraEventoDeAtriuicao(nomePropriedade, valor)

		evt = {
			class    = 'ncl',
			type     = 'attribution',
			action   = 'start',
			name	 = nomePropriedade,
			value    = valor,
		}

		event.post(evt) -- evento de inicio da atribuicao
		evt.action = 'stop'
		event.post(evt) -- evento de final da atribuicao

		print('Evento de atribuicao gerado:', evt.value) io.flush()
		print('Evento de atribuicao gerado:', evt.name) io.flush()
end


event.register(handler)
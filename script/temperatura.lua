PROPRIEDADE_NOME_1 = "temperatura1"
PROPRIEDADE_NOME_2 = "temperatura2"
PROPRIEDADE_NOME_3 = "temperatura3"

function handler(e)
	
	--print('READ recebendo class...', e.class) io.flush()
	--print('READ recebendo type...', e.type) io.flush()
	--print('READ recebendo action...', e.action) io.flush()
	--print('READ recebendo name...', e.name) io.flush()
	--print('READ recebendo value...', e.value) io.flush()
	
	if (e.class == 'ncl' and e.type == 'attribution') then
		if e.name == PROPRIEDADE_NOME_1 then
			testName(e.value, 'clima1')
		end
		if e.name == PROPRIEDADE_NOME_2 then
			testName(e.value, 'clima2')
		end	
		if e.name == PROPRIEDADE_NOME_3 then
			testName(e.value, 'clima3')
		end			
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

function testName(value, retProp)			
	if value ~= nil then
	
		temp = tonumber(value)
		ret = 'chuva'
				
		if temp > 22 then
			ret = 'sol'
		end
				
		if temp < 10 then
			ret = 'neve'
		end
				
		print(temp) io.flush()
		geraEventoDeAtriuicao(retProp, ret)
	
	end
end

event.register(handler)
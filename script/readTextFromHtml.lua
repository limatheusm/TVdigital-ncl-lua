local util = require 'util'
local http = require 'http'

PROPRIEDADE_TIPO_1 = 'url1'
PROPRIEDADE_TIPO_2 = 'url2'
PROPRIEDADE_TIPO_3 = 'url3'

PROPRIEDADE_NOME_1 = 'mensagem1'
PROPRIEDADE_NOME_2 = 'mensagem2'
PROPRIEDADE_NOME_3 = 'mensagem3'

PROPRIEDADE_CURRENT = '0'

local URL = "http://matheuslima.esy.es/temperatura_joao_pessoa.txt"

function handler (e)
	
	--print('READ recebendo class...', e.class) io.flush()
	--print('READ recebendo type...', e.type) io.flush()
	--print('READ recebendo action...', e.action) io.flush()
	--print('READ recebendo name...', e.name) io.flush()
	--print('READ recebendo value...', e.value) io.flush()
	
	if (e.class == 'ncl' and e.type == 'attribution' and e.action=='start') then
		
		if (e.name == PROPRIEDADE_TIPO_1 and e.value == '1') then
			URL = "http://matheuslima.esy.es/temperatura_sao_paulo.txt"
			print('--------------leitor iniciado 1 ', e.name)
			readTextFromHtml(URL)
			PROPRIEDADE_CURRENT = '1'
		end
		if (e.name == PROPRIEDADE_TIPO_2 and e.value == '2') then
			URL = "http://matheuslima.esy.es/temperatura_porto_alegre.txt"
			print('--------------leitor iniciado 2 ', e.name)
			readTextFromHtml(URL)
			PROPRIEDADE_CURRENT = '2'
		end	
		if (e.name == PROPRIEDADE_TIPO_3 and e.value == '3') then
			URL = "http://matheuslima.esy.es/temperatura_joao_pessoa.txt"
			print('--------------leitor iniciado 3 ', e.name)
			readTextFromHtml(URL)
			PROPRIEDADE_CURRENT = '3'
		end			
		
		
		
		
		
	end

end


function readTextFromHtml(url)
	print("<><> Acessando:", url) io.flush()

	http.request(url, display)
end


--funcao callback
--header: cabecalho da resposta do http
--body: corpo da resposta (neste caso, texto)
function display(header, body)
	
	print("<><> valor lido:", body) io.flush()
	
	if PROPRIEDADE_CURRENT == '1' then
		geraEventoDeAtriuicao(PROPRIEDADE_NOME_1, body)
	end
	
	if PROPRIEDADE_CURRENT == '2' then
		geraEventoDeAtriuicao(PROPRIEDADE_NOME_2, body)
	end 
	
	if PROPRIEDADE_CURRENT == '3' then
		geraEventoDeAtriuicao(PROPRIEDADE_NOME_3, body)
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
		
		print('Evento de atribuicao gerado:', evt.value) io.flush()
		event.post(evt) -- evento de inicio da atribuicao
		evt.action = 'stop'
		event.post(evt) -- evento de final da atribuicao
		print('Evento name de atribuicao gerado:', evt.name) io.flush()
end


event.register(handler)

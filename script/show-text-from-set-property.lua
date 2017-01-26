-- CONFIGURA��ES
fontFace = 'vera'
fontSize = 24
fontColor = "yellow"
bgcolor = 'black'

-- EVENTOS
PROPRIEDADE_NOME = 'texto'

function handler(e)
	
	
   
	if (e.class == 'ncl' and e.type == 'attribution') then
		if (e.name == PROPRIEDADE_NOME..'1' or e.name == PROPRIEDADE_NOME..'2' or e.name == PROPRIEDADE_NOME..'3') then
			-- e.value contem o valor atribuido a propriedade
	print('XXXXXXXXXXXXXXXXXXXXXX EXIBIDOR ENTROU XXXXXXXXXXXXXXXXXXX') io.flush()
			print('Valor sendo exibido:', e.value) io.flush()
			exibeTexto(e.value)
		end
	end
end


function exibeTexto(texto)
	-- apaga o canvas
	--width, height = canvas:attrSize()
	--canvas:attrColor(0,0,0,255)
	--canvas:drawRect('fill', 0,0, width,height)

	--canvas:attrCrop (canvas:attrCrop ())
	-- desenha o texto
	canvas:attrFont(fontFace, fontSize)
	canvas:attrColor(fontColor)
	canvas:drawText(0,0, texto)

	canvas:flush()

end



event.register(handler)

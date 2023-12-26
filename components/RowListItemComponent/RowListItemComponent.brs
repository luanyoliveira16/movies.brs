'Função é chamada depois da obtenção dos metadados de um item.
sub OnContentSet()
    content = m.top.itemContent 'Obtém o item de conteúdo e armazenamos numa variável
    if content <> invalid  'verificamos se o item não é inválido 
        m.top.FindNode("poster").uri = OnContentSet.hdPosterUrl    'obter a url da imagem em miniatura e adiciona no poster.
    end if
end sub  
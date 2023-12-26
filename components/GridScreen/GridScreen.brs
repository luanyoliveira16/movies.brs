sub Init()
    m.rowList = m.top.FindNode("rowList")
    m.rowList.SetFocus(true)
     'label com a descrição
    m.descriptionLabel = m.top.FindNode("descriptionLabel")
     'label com o título
    m.titleLabel = m.top.FindNode("titleLabel")
     'criar um observador para monitorar o campo de foco do rowList quando um item de conteúdo ganhe foco.
     'quando um item do rowList ganha foco, o manipulador é chamado para obter os metadados do item.
    m.rowList.ObserveField("rowItemFocused", "OnItemFocused") 'a cada item percorrido, esse item recebe o foco e a através da função a requisição dos metadados acontece.
end sub

sub OnItemFocused()
    focusedIndex = m.rowList.rowItemFocused 'pega a posição do item que está sob o foco.
    row = m.rowList.content.GetChild(focusedIndex[0]) 'armazena todos os itens em uma linha.
    item = row.GetChild(focusedIndex[1]) 'pega aquele que atualmente tem o foco.
    'pega a descrição
    m.descriptionLabel.text = item.description
    'pega o título
    m.titleLabel.text = item.title 
    'adiciona a duração item ao título
end sub


sub  ListarTelas()
    m.screenStack = []  'Criamos um array vazio com o mdot para adicionarmos a tela. 
end sub

'Depois criamos uma função que pega um nova tela, adiciona a lista e a exibe depois de ocultar a tela atual. 
sub ShowScreen(node as Object)
     prev = m.screenStack.Peek() 'Primeiro chamamos a pilha para sabermos a tela atual e a armazenamos em uma variável.
     if prev <> invalid 'Verificamos se a tela é válida.
         prev.visible = false 'Caso seja, a ocultaremos mudando o atributo visibible para false.
     end if
     m.top.AppendChild(node) 'E então adicionaremos a nova tela a cena principal que referenciamos usando o atributo m.top.
     node.SetFocus(true) 'Mudamos o foco para a nova tela.
     m.screenStack.Push(node) 'Adicionamos a nova tela a pilha
end sub

'Função que pega a tela atual, a remove da pilha de telas, a oculta e mostra a tela anterior.
sub CloseScreen(node as Object)
'Primeiro verificamos se a tela atual passada para o método é válida e se a tela no topo da pilha é válida e igual a atual
    if node = invalid OR (m.screenStack.Peek() <> invalid AND m.screenStack.Peek().IsSameNode(node))
'Então chamamos o método pop para remover a tela atual e armazená-la em outra variável
       last = m.screenStack.Pop()
'Definimos o visible como false
        last.visible = false
'Remover a tela da lista
        m.top.RemoveChild(node)
'Então obteremos a tela anterior na pilha chamando a função peek() e armazenando em uma variável
        prev = m.screenStack.Peek()
'Verificamos se a tela anterior é valida
        if prev <> invalid
'E se for verdadeiro, visible = true
             prev.visible = true
'Mude o foco para a tela anterior
             prev.SetFocus(true)
        end if
    end if
end sub

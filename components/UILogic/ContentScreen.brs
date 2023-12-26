'Executar a tarefa de conteúdo.
sub RodarConteudo()
    m.contentTask = CreateObject("roSGNode", "DataRequest") 'Cria a tarefa de recuperar os dados do feed de conteúdo.
    'Criar um observador que observe o campo de conteúdo e chame o manipulador de eventos do conteúdo principal carregado quando o feed de conteúdo for analisado
    m.contentTask.ObserveField("content", "OnMainContentLoaded")
    'Executar o nó de tarefa do carregador principal
    m.contentTask.control = "run"
    'Ativar o loadingIndicator enquanto o conteúdo é carregado
    m.loadingIndicator.visible = true
end sub

'Método para manipular o conteúdo carregado que é chamado quando o feed de conteúdo termina de ser analisado.
sub OnMainContentLoaded()
   m.GridScreen.SetFocus(true) 'Quando o manipulador é invocado mudamos o foco para a tela da grade.
   m.loadingIndicator.visible = false 'Desabilitamos o indicador de carregamento definido.
   m.GridScreen.content = m.contentTask.content  'Adcionamos o conteúdo a grade.
end sub

'Esse Script é para a lógica de interface do usuário.

'Criar um componente GridScreen.
sub MostrarGrid()
    m.GridScreen = CreateObject("roSGNode", "GridScreen") 'Primeiro parâmetro é o tipo do componente e o segundo o componente. O objeto roSGNode é o equivalente BrightScript da criação de nó de arquivo XML SceneGraph
'Vamos passar o m.GridScreen como argumento da função ShowScreen que criamos no arquivo ScreenStackLogic.brs
    ShowScreen(m.GridScreen) 
end sub


sub Init()
    ' set background color for scene. Applied only if backgroundUri has empty value
    m.top.backgroundUri = "pkg:/images/background.jpg"
    m.loadingIndicator = m.top.FindNode("loading")
    ListarTelas()
    MostrarGrid()
    RodarConteudo() 
end sub
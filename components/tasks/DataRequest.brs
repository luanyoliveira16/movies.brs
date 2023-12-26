'Primeiro chamamos a função Init() que define a função GetContent() que constrói uma árvore de nós de conteúdos que devem ser exibidos.
sub Init()
    m.top.functionName = "GetContent"
end sub

sub GetContent()
    ' requisição do feed de conteúdo da API.
    xfer = CreateObject("roURLTransfer")
    xfer.SetCertificatesFile("common:/certs/ca-bundle.crt")
    xfer.SetURL("https://api.themoviedb.org/3/movie/top_rated?api_key=be09912d2da2599c583fa361bd8e482b")
    rsp = xfer.GetToString()  'retornar o conteúdo em formato de string
    rootChildren = []
    rows = {} 'para armazenar temporariamente os metadados.
    'converter a string json em componentes brs
    json = ParseJson(rsp)
    if json <> invalid
        'pegaremos cada chave do feed e atribuiremos seu valor na variável value
        for each category in json 
            'verificamos o tipo de cada valor
            value = json.Lookup(category) 'Lookup retorna o valor da chave específica na matriz.
            if Type(value) = "roArray" 
                   row = {}
                   'nome de título para categoria
                   row.title = category
                   'campo filho para a matriz vazia
                   row.children = []
                   'para cada vídeo nas categorias filmes e curtas chamaremos o método get
                   for each item in value 'analaisa os itens e adiciona ao row
                       itemData = GetItemData(item)
                       row.children.Push(itemData)
                   end for
                   rootChildren.Push(row)
                end if
        end for
        'Criaremos um nó de conteúdo e depois os seus filhos nós
        contentNode = CreateObject("roSGNode", "ContentNode")
        contentNode.Update({
            children: rootChildren
        }, true)
        m.top.content = contentNode
    end if
end sub

function GetItemData(infos as Object) as Object
    item = {}
    imagePath = "https://image.tmdb.org/t/p/w500/"
    item.title = infos.title
    item.description = infos.overview
    item.hdPosterURL = imagePath+infos.poster_path
    return item
end function
'Primeiro fiz uma função que chama a função que criei abaixo.
'Depois criei a função: 
'1- Crio a tela através do objeto roSGScreen; 
'2- A partir da tela, passei como argumento da função a cena escolhida da tela que criei.
'3- Fiz a porta para onde desejo enviar os eventos.
'4- Disse para onde os eventos da minha tela deveriam ir.
'5- Mostrei a tela.

'Fiz o looping para a função funcionar sempre que necessário
'1- Criei uma variável que recebeu a espera da chegada dos eventos. O primeiro parâmetro é o tempo e o segundo a porta.
'2- Criei uma variável para comparar o tipo da resposta. 
'3- Caso receba um evento do tipo roSGScreenEvent, então
'4- Verifico se a tela está fechada através do método IsScreenClosed(). Se a resposta for verdadeiro, então o seguimento da thread é rompido. Se for falso, o processo principal do BrightScript continua.

sub Main()
    ShowChannel()
end sub

sub ShowChannel()
    screen = CreateObject("roSGScreen")
    scene = screen.CreateScene("MainScene")
    m.port = CreateObject("roMessagePort")
    screen.SetMessagePort(m.port)
    screen.Show()

    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.IsScreenClosed() then return
        end if
    end while
end sub

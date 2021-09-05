/*
 *     SISTEMA EXPERTO PARA IDENTIFICAR ENFERMEDADES
 *         DE PLANTAS DE TOMATE EN INVERNADERO
 *
 * Autor: Jonnathan Espinoza
 *
 * Ejecutar:
 *   ?- main.
 */

:-use_module(library(pce)). %libreria para realizar ventanas graficas
:-use_module(library(pce_style_item)). %libreria permite crear label, button, etc.

main:- new(D, dialog('IDENTIFICAR ENFERMEDADES DE TOMATE',size(500,500))), % crear la ventana principal

       % titulo
       new(L, label(nombre, 'IDENTIFICAR ENFERMEDADES DE TOMATE EN INVERNADERO')),

       % variable que almacena la pregunta en la ventana principal
       new(@texto, label(nombre, 'Proceda a responder las siguientes preguntas')),

       % variable que lamacena la respuesta
       new(@resp1, label(nombre, '')),

       %btn realizar el test
       new(@boton, button('REALIZAR IDENTIFICACI�N',message(@prolog, form))),


       %btn salir
       new(Exit,button('SALIR',and(
                                   message(D,destroy),
                                   message(D,free),
                                   message(D,free),
                                   message(@texto,free),
                                   message(@resp1,free),
                                   message(@boton,free)))),


       %definir tama�o de los botones y labels
       send(D, append(L)),
       send(D, display,L,point(50,20)),
       send(L,font, font(comic,bold,12)),

       send(D, append(@boton)),
       send(D, display,@boton,point(300,150)),

       send(D, append(@texto)),
       send(D, display,@texto,point(20,100)),
       send(@texto,font,font(comic,bold,10)),

       send(D, append(Exit)),
       send(D, display,Exit,point(200,200)),

       send(D, append(@resp1)),
       send(D, display,@resp1,point(20,130)),

       send(D, open_centered).

% Enfermedades
enfermedades('Cranco bacteriano'):-cranco_bacteriano,!.
enfermedades('Marchitamiento bacteriano'):-marchitamiento_bacteriano,!.
enfermedades('Podredumbre blanda'):-podredumbre_blanda,!.
enfermedades('Necrosis medular'):-necrosis_medular,!.
enfermedades('Damping off'):-damping_off,!.
enfermedades('Podredumbre de la base del tallo'):-podredumbre_de_la_base_del_tallo,!.
enfermedades('Moho blanco'):-moho_blanco,!.
enfermedades('Tizon tardio'):-tizon_tardio,!.
enfermedades('Marchitamiento por fusarium'):-marchitamiento_por_fusarium,!.
enfermedades('Mancha gris'):-mancha_gris,!.
enfermedades('Moho gris'):-moho_gris,!.
enfermedades('Moho de hoja'):-moho_de_hoja,!.
enfermedades('Tizon temprano'):-tizon_temprano,!.
enfermedades('Oidio'):-oidio,!.
enfermedades('Oidiopsis'):-oidiopsis,!.
enfermedades('Peste negra'):-peste_negra,!.
enfermedades('Begomovirus'):-begomovirus,!.
enfermedades('Podredumbre apical'):-podredumbre_apical,!.
enfermedades('Cicatriz estilar le�osa'):-cicatriz_estilar_le�osa,!.
enfermedades('Causado por herbicidas'):-causado_por_herbicidas,!.
enfermedades('Una enfermedad desconocida').

% Reglas
cranco_bacteriano :- tiene_cranco_bacteriano,
    pregunta('Enrollamiento de las hojas basales'),
    pregunta('Marchitamiento unilateral de las hojas'),
    pregunta('Necrosis de los foliolos'),
    pregunta('Parte interna del tallo presenta coloraci�n oscura'),
    pregunta('Parte interna de los peciolos presenta coloraci�n oscura'),
    pregunta('Parte interna de los peciolos presenta coloraci�n oscura'),
    pregunta('A lo largo del tallo presenta peque�os cancros'),
    pregunta('En los frutos verdes presenta manchas peque�as, redondas y de color claro').

marchitamiento_bacteriano :- tiene_marchitamiento_bacteriano,
    pregunta('Sobre los tallos aparecen ra�ces adventicias'),
    pregunta('El interior del tallo presenta una coloraci�n marr�n oscura').

podredumbre_blanda :- tiene_podredumbre_blanda,
    pregunta('Las hojas se vuelven amarillas y se marchitan'),
    pregunta('Se produce ahuecamiento del tallo').

necrosis_medular :- tiene_necrosis_medular,
    pregunta('En el tallo la m�dula se encuentra hueca o con c�maras de aire').

damping_off :- tiene_damping_off,
    pregunta('Pudrici�n de la base de tallo').

podredumbre_de_la_base_del_tallo :- tiene_podredumbre_de_la_base_del_tallo,
    pregunta('Marchitamiento de la planta'),
    pregunta('Micelio blanco alrededro del cuello en la base del tallo'),
    pregunta('Presenta esclerocios esf�ricos de color casta�o en la base del tallo').

moho_blanco :- tiene_moho_blanco,
    pregunta('El tallo se seca y se ahueca'),
    pregunta('Presenta micelio blanquecino algodonoso en los tallos'),
    pregunta('Se forma esclerosios en el tallo'),
    pregunta('Podredumbre acuosa en el fruto').

tizon_tardio :- tiene_tizon_tardio,
    pregunta('En la parte inferior de la hoja presenta una masa de micelio blanco'),
    pregunta('El follaje se vuelve de color marr�n'),
    pregunta('Los frutos verdes presntan un moteado irregular color oliva').

marchitamiento_por_fusarium :- tiene_marchitamiento_por_fusarium,
    pregunta('El follaje se marchita'),
    pregunta('El tejido vascular se vuelve oscuro').

mancha_gris :- tiene_mancha_gris.

moho_gris :- tiene_moho_gris,
    pregunta('Los frutos se ablandan y se forman zonas blanquecinas'),
    pregunta('Formaci�n de halos de color blanco en la fruta verde').

moho_de_hoja :- tiene_moho_de_hoja,
    pregunta('En la cara inferior de la hoja aparece el crecimiento del hongo como un moho de color verde oliva rodeada un halo m�s claro').

tizon_temprano :- tiene_tizon_temprano,
    pregunta('El tallo presenta lesiones oscuras, ligeramente deprimidas y alargadasen anillos conc�ntricos'),
    pregunta('Los frutos se pudren y caen').

oidio :- tiene_oidio.

oidiopsis :- tiene_oidiopsis,
    pregunta('Al rev�s de las hojas se desarrolla un micelio blanco pulverulento').

peste_negra :- tiene_peste_negra,
    pregunta('Los brotes terminales mueren formando estr�as oscuras'),
    pregunta('Las hojas se tornan parduzcas'),
    pregunta('La planta produce frutos con lesiones en anillos conc�ntricos').

begomovirus :- tiene_begomovirus,
    pregunta('Deformaci�n y disminuci�n del tama�o de la hoja'),
    pregunta('Las plantas no crecen').

podredumbre_apical :- tiene_podredumbre_apical.

cicatriz_estilar_le�osa :- tiene_cicatriz_estilar_le�osa.

causado_por_herbicidas :- tiene_causado_por_herbicidas,
    pregunta('Deformaci�n de hojas con forma de cord�n'),
    pregunta('Las hojas j�venes son arrugadas y abarquillado'),
    pregunta('Cese de crecimiento de la planta').


% guia para poder identificar que enfermedad
tiene_cranco_bacteriano :- pregunta('Marchitamiento sist�mico de la planta'),!.
tiene_marchitamiento_bacteriano :- pregunta('Marchitamiento repentino de la hojas j�venes (�pice de la planta)'),!.
tiene_podredumbre_blanda :- pregunta('Oscurecimiento externo del tallo'),!.
tiene_necrosis_medular :- pregunta('Presenta clorosis en las hojas j�venes'),!.
tiene_damping_off :- pregunta('Muerte de semilla'),!.
tiene_podredumbre_de_la_base_del_tallo :- pregunta('Lesi�n acuosa color oscuro en la base del tallo'),!.
tiene_moho_blanco :- pregunta('El tallo se ablanda, quedando de color gris'),!.
tiene_tizon_tardio :- pregunta('En las hojas apracen manchas acuosas oscuras de color marr�n gris�ceo'),!.
tiene_marchitamiento_por_fusarium :- pregunta('Las hojas inferiores se vuelven clor�ticas'),!.
tiene_mancha_gris :- pregunta('Las hojas presentan manchas muy peque�as, ciruculares de color oscuro'),!.
tiene_moho_gris :- pregunta('En las hojas, p�talos o frutos aparecen lesiones de color marr�n'),!.
tiene_moho_de_hoja :- pregunta('En la cara superior de la hoja aparece un moteado de color amarillo'),!.
tiene_tizon_temprano :- pregunta('En las hojas m�s viejas aparecen peque�as lesiones de color oscuro rodeada de un halo amarillo'),!.
tiene_oidio :- pregunta('En la parte superior de la hoja el hongo forma colornias de color blanco (moho pulverulento)'),!.
tiene_oidiopsis :- pregunta('Las hojas presentan manchas de color amarillo intenso'),!.
tiene_peste_negra :- pregunta('Ln las hojas j�venes aparecen peque�ospuntos negros'),!.
tiene_begomovirus :- pregunta('En las hojas aparece un moteado clor�tico (manchas de color amarillo alternadas con verde)'),!.
tiene_podredumbre_apical :- pregunta('Los frutos presentan una lesi�n de coloraci�n marr�n claro y acuosa'),!.
tiene_cicatriz_estilar_le�osa :- pregunta('Fruto deforme con grandes cicatrices o aberturas (agujeros) en la parte inferior del mismo'),!.
tiene_causado_por_herbicidas :- pregunta('Clorosis en el �pice'),!.

:-dynamic si/1,no/1. %Propio de prolog que solo me permite considerar SI o NO

% Aqui se dan las configuraciones donde se ira adaptando si o no de
% manera en que se vayan dando las preguntas en el cuadro de dialogo
preguntar(Problema):- new(Di,dialog('IDENTIFICACI�N')),

    new(L2, label(texto,'�La planta posee o tiene el siguiente s�ntoma?')),
    new(La, label(prob,Problema)),

    % se crean los botones SI o NO
    new(B1, button(si, and(message(Di,return,si)))),
    new(B2, button(no, and(message(Di,return,no)))),

    send(Di,append(L2)),
    send(Di,append(La)),
    send(Di,append(B1)),
    send(Di,append(B2)),
    send(Di,default_button,si),

    send(Di,open_centered),
    get(Di,confirm,Answer),
    write(Answer),
    send(Di,destroy),

    %aqui es la parte en donde se preguntar� si o no del problema
    ((Answer==si)->assert(si(Problema));
    assert(no(Problema)),fail).

pregunta(S):-(si(S)->true; (no(S)->fail;preguntar(S))).

%Aqui se limpiara en caso de darle salir
limpiar:-retract(si(_)),fail.
limpiar:-retract(no(_)),fail.
limpiar.

% se llama a las enfermedades
form :- lim,
    send(@boton,free),
    enfermedades(Enfer),
    send(@texto,selection('Seg�n lo seleccionado, es probable que la planta de tomate posea: ')),
    send(@resp1,selection(Enfer)),
    send(@resp1,font,font(comic,bold,15)),
    limpiar.

lim:-send(@resp1,selection('')).

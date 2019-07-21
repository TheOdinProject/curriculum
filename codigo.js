function opcion(humano){
    var resultado_texto = ["empate", "ganas", "pierdes"];
    var nombre = ["Piedra", "Papel", "Tijeras"];
    var jugada = [
        /*humano arriba
        maquina izquierda*/
        [0,1,2],
        [2,0,1],
        [1,2,0],
    ];
    var desc_jugada = [
        /*humano arriba
        maquina izquierda*/
        ["Empate","papel envuelve piedra ganaste","Piedra rompe tijeras tu pierdes"],
        ["papel envuelve piedra perdiste","Empate","Tijeras cortan papel tu ganas"],
        ["piedra rompe tijeras tu ganas","Tijeras cortan papel tu pierdes","Empate"],
    ];

    var cpu = Math.floor((Math.random() * 3));
    var resultado = jugada [cpu] [humano];

    document.getElementById("persona").innerHTML = "humano eligio: " + nombre [humano];
    document.getElementById("robot").innerHTML = "CPU eligio: " +nombre [cpu];
    document.getElementById("frase").innerHTML = desc_jugada [cpu][humano];
/*
    console.log("humano eligio:" + nombre [humano]);
    console.log("CPU eligio" + nombre [cpu]);
    console.log(resultado_texto[resultado]);
    console.log(desc_jugada [cpu][humano]);   
    */ 
}

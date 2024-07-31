class calculator {
    constructor(name, year){
        this.name = name;
        this.year = year;
    }

    addition(value, value2){
        return console.log(value + value2);
    }

    getName(){
        return console.log(this.name);
    }

    setName(name){
        this.name = name;
        return;
    }
}

const calc = new calculator("marble", 1992);

calc.addition(2,4);

calc.getName();

calc.setName("casio");

calc.getName();
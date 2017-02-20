/*
  Write a function nextPrime that takes in an array of numbers,
  and replaces any prime number with the next prime number. For example:
  nextPrime([13,14,15]) = [17,14,15]
  nextPrime([1,2,3,4,5]) = [1,3,5,4,7]
  Code written by Deven Bhatt (github.com/deven1)
*/
function nextPrime(inputArray){
  for(var i = 0; i < inputArray.length; i++){
    if(checkPrime(inputArray[i]) == true){
      inputArray[i] = incrementPrime(inputArray[i]);
    }
  }
  console.log(inputArray);
}

function checkPrime(inputNumber){
  if(inputNumber <= 1){
    return false;
  }
  for(var i = 2; i < inputNumber; i++){
    if(inputNumber % i != 0){
      continue;
    }
    else{
      return false;
    }
  }
  return true;
}
//console.log(checkPrime(3));
//console.log(checkPrime(4));
function incrementPrime(inputPrime){
  var outputPrime = inputPrime;
  if(checkPrime(inputPrime) == true){
    var flag = true;
    while(flag){
      outputPrime++;
      if (checkPrime(outputPrime) == true){
        flag = false;
      }
    }
    return outputPrime;
  }
  else{
    console.log("Not a prime input");
  }
}
//console.log(incrementPrime(11));
nextPrime([13,14,15]); //= [15,14,17]
nextPrime([1,2,3,4,5]); // = [1,3,5,4,7]
nextPrime([0,-1,29,1]); // = [0,-1,31,1]

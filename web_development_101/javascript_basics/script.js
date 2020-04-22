function calc(rawNums) {
    const numsArray = rawNums.split(/(×|÷|\+|\-)+/);
    numsArray.forEach(item => {
        let i = numsArray.indexOf(item);
        if (!('×÷+-'.includes(item))) {
            numsArray[i] = Number(item);
        }
    });

    numsArray.forEach(item => {
        if (item === '×') {
            const i = numsArray.indexOf(item);
            const result = numsArray[i - 1] * numsArray[i + 1];
            numsArray.splice(i - 1, 3, result)
        }
    });
    numsArray.forEach(item => {
        if (item === '÷') {
            const i = numsArray.indexOf(item);
            const result = numsArray[i - 1] / numsArray[i + 1];
            numsArray.splice(i - 1, 3, result)
        }
    });
    numsArray.forEach(item => {
        if (item === '-') {
            const i = numsArray.indexOf(item);
            const result = numsArray[i - 1] - numsArray[i + 1];
            numsArray.splice(i - 1, 3, result)
        }
    });
    numsArray.forEach(item => {
        if (item === '+') {
            const i = numsArray.indexOf(item);
            const result = numsArray[i - 1] + numsArray[i + 1];
            numsArray.splice(i - 1, 3, result)
        }
    });

    const total = document.getElementById('total');
    total.textContent = Math.round((numsArray[0] + Number.EPSILON) * 100) / 100;
    cleanHistory();
}

function disableDot() {
    const dot = document.getElementById('dot');
    dot.disabled = true;
}
function enableDot() {
    const dot = document.getElementById('dot');
    dot.disabled = false;
}

function cleanTotal() {
    const mainDisplay = document.getElementById('total');
    mainDisplay.textContent = '';
    enableDot();
}
function cleanHistory() {
    const secDisplay = document.getElementById('history');
    secDisplay.textContent = '';
}

function deleteLast(current) {
    const newCurrent = current.substring(0, current.length - 1);
    const display = document.getElementById('total');
    display.textContent = newCurrent;
}

function display(e) {
    const currentNum = document.getElementById('total');
    const current = currentNum.textContent;
    const secDisplay = document.getElementById('history');

    switch (e) {
        case '+':
            if ('-×÷'.includes(secDisplay.textContent[secDisplay.textContent.length - 1])) {
                i = secDisplay.textContent.split('');
                i[i.length - 1] = '+';
                secDisplay.textContent = i.join('');
            } else if ('+'.includes(secDisplay.textContent[secDisplay.textContent.length - 1])) {
                //nothing
            } else {
                secDisplay.textContent += current + '+';
                cleanTotal();
            }
            break;
        case '-':
            if ('+×÷'.includes(secDisplay.textContent[secDisplay.textContent.length - 1])) {
                i = secDisplay.textContent.split('');
                i[i.length - 1] = '-';
                secDisplay.textContent = i.join('');
            } else if ('-'.includes(secDisplay.textContent[secDisplay.textContent.length - 1])) {
                //nothing
            } else {
                secDisplay.textContent += current + '-';
                cleanTotal();
            }
            break;
        case '×':
            if ('+-÷'.includes(secDisplay.textContent[secDisplay.textContent.length - 1])) {
                i = secDisplay.textContent.split('');
                i[i.length - 1] = '×';
                secDisplay.textContent = i.join('');
            } else if ('×'.includes(secDisplay.textContent[secDisplay.textContent.length - 1])) {
                //nothing
            } else {
                secDisplay.textContent += current + '×';
                cleanTotal();
            }
            break;
        case '÷':
            if ('+-×'.includes(secDisplay.textContent[secDisplay.textContent.length - 1])) {
                i = secDisplay.textContent.split('');
                i[i.length - 1] = '÷';
                secDisplay.textContent = i.join('');
            } else if ('÷'.includes(secDisplay.textContent[secDisplay.textContent.length - 1])) {
                //nothing
            } else {
                secDisplay.textContent += current + '÷';
                cleanTotal();
            }
            break;
        case '=':
            secDisplay.textContent += current;
            cleanTotal();
            calc(`${secDisplay.textContent}`);
            break;
        case 'C':
            cleanTotal();
            cleanHistory();
            break;
        case 'DEL':
            deleteLast(current);
            break;
        case '.':
            if (!current.includes('.')) {
                currentNum.textContent = current + e;
                disableDot();
            }
            break;
        default:
            currentNum.textContent = current + e;
            break;
    }
}

const btns = document.querySelectorAll('button');
btns.forEach(button => button.addEventListener('click', (e) => {
    display(e.toElement.innerText)
}));
window.addEventListener('keydown', (e) => {
    const button = document.querySelector(`button[data-key="${e.keyCode}"]`);
    if (!button) return;
    if (button.disabled === true) return;
    display(button.innerText);
})

	$(document).ready(function(){
		for(var i=0; i < 256; i++){
			$('#container').append('<div></div>');
		}

		$('div div').hover(function(){
			var r = Math.floor((Math.random() * 254) + 1);
			var g = Math.floor((Math.random() * 254) + 1);
			var b = Math.floor((Math.random() * 254) + 1);
			$(this).css('background-color', 'rgb(' + r + ',' + g + ',' + b + ')');
		},
		function(){
			//$(this).css('background-color', 'white');
		
		});
	});

	function newGrid(){
		var gridSize = prompt('Enter new grid size');
		$('#container').empty();

		for(var i=0; i < gridSize * gridSize; i++){
			$('#container').append('<div></div>');
		}

		var newWH = (600 / gridSize);

		$('div div').css('width', newWH);
		$('div div').css('height', newWH);

		$('div div').hover(function(){
			var r = Math.floor((Math.random() * 254) + 1);
			var g = Math.floor((Math.random() * 254) + 1);
			var b = Math.floor((Math.random() * 254) + 1);
			$(this).css('background-color', 'rgb(' + r + ',' + g + ',' + b + ')');
		},
		function(){
			//$(this).css('background-color', 'white');
			
		});

	}



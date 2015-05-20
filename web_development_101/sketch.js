$(document).ready(function(){

	function getRandomColor() {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}
	var createGrid = function(size)
	{
		var $grid = $('#pixelgrid');

		for (i = 0; i < size; i++) 
		{
	  	 	var row = '<div class="row">';

	   	 	for (j = 0; j < size; j++)
	        row += '<div class="square"></div>';

	    	row += '</div>';

	    	$grid.append(row);
		}
		$('.square').css('width', 1000/size);
		$('.square').css('height', 1000/size);

		$('.square').mouseenter(function()
		{
			$(this).css('background-color', getRandomColor());
		});
	}
	$('button').click(function(){
		$('.square').css('background-color', 'white');
		var size = prompt("Please enter new grid size(1-128): ");
		if(size > 0 && size <= 128)
		{
			$('.square').remove();
			createGrid(size);
		}
		else
		{
			size = prompt("Please enter new grid size (1-128): ")
		}
	});
		createGrid(16);

});
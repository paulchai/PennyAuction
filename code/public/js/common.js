
 function searchProject()
 {
  params = 'dummy=1&'+$('#user_search').serialize()+'&cid='+$('.mdropdown').val();
  if($('.subslice2').length == 0)
  {
    lreload('/search?'+params);
  }
  console.log(params);
  $.ajax({
  type: "POST",
  url: "/search",
  data: params,
  dataType:'json',
  success: function(data){
    
    $('.subslice2').html(data.html);
  }
  });
 }
 $(function()
 {
  $('.floatpoint').each(function()
  {
     console.log(this);
    $(this).keypress(function(event)
     {
             if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
                event.preventDefault();
              }
     })
  });
 });
 function addtowatchlist(id)
 {
  params = {id : id};


  $.ajax({
  type: "POST",
  url: "/product/watchlist",
  data: params,
  dataType:'json',
  success: function(data){
   
    if(!data.access)
    {
      lreload('/login')
    }  
    else if(data.isadded)
    {  
      alert('Its already in watchlist');
    }  
    else
    {
      alert('Added in your watchlist!');
    }  
  }
  });
 }
 function lreload(obj)
 {
   window.location = obj;
 }

 function projectLoad()
 {
  $(".file-upload").on("change", function()
    {
        var id = $(this).attr('id');
        
        var files = !! this.files ? this.files : [];
        if ( ! files.length || ! window.FileReader) 
          return; // no file selected, or no FileReader support

        if (/^image/.test( files[0].type))
        { // only image file
            var reader = new FileReader(); // instance of the FileReader
            reader.readAsDataURL(files[0]); // read the local file
            reader.onloadend = function()
            { // set image data as back
              $('.pro_image').css("background-image", "url("+this.result+")");
            }
        }
    });
 }
 
 
 function searchProjectAjax()
 {
  params = 'dummy=1&'+$('#leftnavs').serialize();
 /* if($('.subslice2').length == 0)
  {
    lreload('/search?'+params);
  }*/
  console.log(params);
  $.ajax({
  type: "POST",
  url: "/search",
  data: params,
  dataType:'json',
  success: function(data){
   // alert(data.html);
	 $('.searchresult').html(data.html);
   // $('.subslice2').html(data.html);
  }
  });
 } 
 
 function loginaction()
 {
	// alert(11);
	var gologin = 1;
	if($('#username').val() == '')
	{
		//alert(111111);
		$('#username').css('border','1px solid red');
		gologin = 0;
	}
	if($('#passowrd').val() == '')
	{
		$('#passowrd').css('border','1px solid red');
		gologin = 0;
	}
	if(gologin == 1)
	$('#loginform').submit();
	else return 0;
	 
 }
 
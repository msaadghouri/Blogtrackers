<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" isELIgnored="false"%>
<script type="text/javascript" src="assets/js/intro.js"></script>
<!-- Theme JS files -->
	<script type="text/javascript" src="assets/js/plugins/forms/styling/uniform.min.js"></script>
<!-- 	<script type="text/javascript" src="assets/js/plugins/forms/styling/switchery.min.js"></script>
	<script type="text/javascript" src="assets/js/plugins/forms/styling/switch.min.js"></script> -->
	
	<script type="text/javascript" src="assets/js/plugins/forms/selects/bootstrap_multiselect.js"></script>
<script
					src="${pageContext.request.contextPath}/production/js/moment/moment.min.js"></script>
					<script src="${pageContext.request.contextPath}/js/screenfull.js"></script>
	<script
						src="${pageContext.request.contextPath}/production/js/datepicker/daterangepicker.js"></script>
<script type="text/javascript" src="assets/js/plugins/tables/datatables/datatables.min.js"></script>
<script type="text/javascript" src="assets/js/plugins/forms/selects/select2.min.js"></script>

<script type="text/javascript" src="assets/js/pages/datatables_basic.js"></script>


	<script type="text/javascript" src="assets/js/core/app.js"></script>
<!--	<script type="text/javascript" src="assets/js/pages/form_checkboxes_radios.js"></script>-->

	<script type="text/javascript" src="assets/js/plugins/ui/ripple.min.js"></script>
	<!-- /theme JS files --><!-- /theme JS files -->
<!--<script type="text/javascript" src="assets/js/pages/form_select2.js"></script>-->
 <script
						src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
					<script
						src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
					<script
						src="${pageContext.request.contextPath}/vendors/Chart.js/dist/Chart.min.js"></script>
					<script
						src="${pageContext.request.contextPath}/vendors/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
					<script
						src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.js"></script>
					<script
						src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.pie.js"></script>
					<script
						src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.time.js"></script>
					<script
						src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.stack.js"></script>
					<script
						src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.resize.js"></script>
					<script
						src="${pageContext.request.contextPath}/vendors/jQCloud-master/jqcloud/jqcloud-1.0.4.js"></script>
					<script
						src="${pageContext.request.contextPath}/production/js/flot/jquery.flot.orderBars.js"></script>
				<!--  	<script
						src="${pageContext.request.contextPath}/production/js/flot/date.js"></script> -->
					<script
						src="${pageContext.request.contextPath}/production/js/flot/jquery.flot.spline.js"></script>
					<script
						src="${pageContext.request.contextPath}/production/js/flot/curvedLines.js"></script>
				
<!--

//-->

<script>
						$(document)
						.ready(
								function() {
	var cb = function(start, end, label) {
        //console.log(start.toISOString(), end.toISOString(), label);
        $('#reportrange span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
        $('#reportrange input').val(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY')).trigger('change');
      };
	
      var optionSet1 =
    	      {   startDate: moment().subtract('days', 29),
    	          endDate: moment(),
    	          minDate: '01/01/1947',
    	          maxDate: moment(),
    			  showDropdowns: true,
    	          showWeekNumbers: true,
    	          timePicker : false,
				  timePickerIncrement : 1,
				  timePicker12Hour : true,
				       ranges: {
    	              
       	        'This Year' : [
						moment()
								.startOf('year'),
						moment() ],
				'Last Year' : [
						moment()
								.subtract(1,'year').startOf('year'),
						moment().subtract(1,'year').endOf('year') ]
				 /* 
				  'Last Year': [moment().subtract('years', 1).startOf('year'), moment().subtract('years', 1).endOf('year')],
					'This Year': [moment().startOf('year'), moment()]*/
    	          },
    	          opens: 'left',
    	          applyClass: 'btn-small bg-slate-600 btn-block',
    	          cancelClass: 'btn-small btn-default btn-block',
    	          format: 'MM/DD/YYYY',
    			  locale: {
    	          applyLabel: 'Submit',
    	          cancelLabel: 'Clear',
    	          fromLabel: 'From',
    	          toLabel: 'To',
    	          customRangeLabel: 'Custom',
    	          daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
    	          monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
    	          firstDay: 1
    	        }
    	          
    	      };
    	    
    	  
	if('${datepicked}' == '')
	{ 
    $('#reportrange span').html(moment().subtract('days', 500).format('MMMM D') + ' - ' + moment().format('MMMM D'));
    $('#reportrange').daterangepicker(optionSet1, cb);
	}
	
	else{ 
		$('#reportrange span').html('${datepicked}');
		$('#reportrange').daterangepicker(optionSet1, cb);
		$('#reportrange')
		.on(
				'show.daterangepicker',
				function() {
					//console.log("show event fired");
				});
$('#reportrange')
		.on(
				'hide.daterangepicker',
				function() {
					//console.log("hide event fired");
				});
$('#reportrange')
		.on(
				'apply.daterangepicker',
				function(ev, picker) {
					/* console
							.log("apply event fired, start/end dates are "
									+ picker.startDate
											.format('MMMM D, YYYY')
									+ " to "
									+ picker.endDate
											.format('MMMM D, YYYY')); */
				});
$('#reportrange')
		.on(
				'cancel.daterangepicker',
				function(ev, picker) {
					//console.log("cancel event fired");
				});
$('#options1').click(
		function() {
			$('#reportrange').data(
					'daterangepicker')
					.setOptions(
							optionSet1,
							cb);
		});
$('#options2').click(
		function() {
			$('#reportrange').data(
					'daterangepicker')
					.setOptions(
							optionSet2,
							cb);
		});
$('#destroy').click(
		function() {
			$('#reportrange').data(
					'daterangepicker')
					.remove();
		});
		}
								});
     // set attribute for the form 
    $('#trackerform').attr("action","BlogNetwork");
    $('#dateform').attr("action","BlogNetwork"); 
	 </script>
	<script type="text/javascript">
	 	//alert("here");
						function trackerchanged() {
							$(".loader").removeClass("hidden");
							document.getElementById("trackerform").submit();
						}
						function datechanged() {
							//alert("date picked");//$(".loader").removeClass("hidden");
							
							document.getElementById("dateform").submit();
						}
						
						
</script>

	<script>
	$(document).ready(function(e)
	{
	$('#features').click(function(e)
    {
	$('.features-tab').slideToggle(500);
	
	});
	
	//if any blog-blog or blog-blogger checked show features tab
	var blognetstatus = $('#blognetwork').is(':checked');
	if(blognetstatus)
	{
	$('.features-tab').show(200);
	$('.checkall:eq(0)').show(200);
	}
	
	var socialmediastatus = $('#socialmedia').is(':checked');
	if(socialmediastatus)
	{
	$('.features-tab').show(200);
	$('.checkall:eq(1)').show(200);
	}
	
	var entitystatus = $('#entity').is(':checked');
	if(entitystatus)
	{
	$('.features-tab').show(200);
	}
	
	// showing by sectionss
	$('.checkgroupindi input[type=checkbox]').each(function(index,element){
	$('.checkgroupindi input[type=checkbox]:eq('+index+')').click(function(){
	$('.checkgroup .checker span:eq('+index+')').toggleClass('checked');
	var hasthisClass = $('.checkgroup .checker span:eq('+index+')').hasClass('checked');
	$('.checkgroupindi input[type=checkbox]:eq('+index+')').attr('checked',"checked");
	var thecheckstatus;
	if(hasthisClass)
	{
	thecheckstatus = $('.checkgroupindi input[type=checkbox]:eq('+index+')').is(':checked');
	if(thecheckstatus)
	{
	//show the blog blogger and blogblogfilter
	$('.checkall:eq('+index+')').show(200);
	//console.log(thecheckstatus);
	}
	}
	else if(!hasthisClass)
	{
		thecheckstatus = false;
		if(!thecheckstatus)
		{
		//show the blog blogger and blogblogfilter
		$('.checkall:eq('+index+')').hide(200);
		//console.log(thecheckstatus);
		}	
	}
	//console.log(status)
	
	});
	});
	<% 
	boolean checkblogtoblog=false, checkblogtoblogger=false, checkfacebook=false, checktwitter=false, checkyoutube=false, checklinkedin=false, checktumblr=false, checkentity=false;
	if(session.getAttribute("blogtoblog") != null && session.getAttribute("blogtoblog") != "")
	{
	checkblogtoblog = true;	
	}
	if(session.getAttribute("blogtoblogger") != null && session.getAttribute("blogtoblogger") != "")
	{
	checkblogtoblogger = true;	
	}
	if(session.getAttribute("facebook") != null && session.getAttribute("facebook") != "")
	{
	checkfacebook = true;	
	}
	if(session.getAttribute("linkedin") != null && session.getAttribute("linkedin") != "")
	{
	checklinkedin = true;	
	}
	if(session.getAttribute("twitter") != null && session.getAttribute("twitter") != "")
	{
	checktwitter = true;	
	}
	if(session.getAttribute("youtube") != null && session.getAttribute("tumblr") != "" )
	{
	checkyoutube = true;	
	}
	if(session.getAttribute("tumblr") != null && session.getAttribute("tumblr") != "" )
	{
	checktumblr = true;	
	}
	if(session.getAttribute("entity") != null && session.getAttribute("entity") != "")
	{
	checkentity = true;	
	}
	%>
	
	// this check the box and send the parameters to the servlet
	$('.checkerindi input[type=checkbox]').each(function(index,element){
	$('.checkerindi input[type=checkbox]:eq('+index+')').click(function(){
	$('.checkboxcon .checker span:eq('+index+')').toggleClass('checked');
	var hastheClass = $('.checkboxcon .checker span:eq('+index+')').hasClass('checked');
	var checkstatus;
	$('#pageloader').show();
	if(hastheClass)
	{
	$('.checkerindi input[type=checkbox]:eq('+index+')').attr('checked',"checked");
	checkstatus = $('.checkerindi input[type=checkbox]:eq('+index+')').is(':checked'); 
	//console.log(hastheClass);
	}
	else if(!hastheClass)
	{
	$('.checkerindi input[type=checkbox]:eq('+index+')').removeAttr('checked',"checked");
	checkstatus = false;
	//console.log(hastheClass);
	}
	
	if(checkstatus)
	{
	//var checkboxval;
	var blog2blog="";
	var blog2blogger="";
	var facebook="";
	var linkedin="";
	var twitter="";
	var youtube="";
	var tumblr="";
	var entity="";
	// check if the checkbox has been initialized
	if(checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "blogtoblog" || <%=checkblogtoblog %>)	
	{
	//checkboxval = $('#blogtoblog').val();
	blog2blog = $('#blogtoblog').val();
	}
	if(checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "blogtoblogger" || <%=checkblogtoblogger %>)
	{
	blog2blogger = $('#blogtoblogger').val();	
	}
	if(checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "facebook" || <%=checkfacebook %>)
	{
	facebook = $('#facebook').val();	
	}
	if(checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "linkedin" || <%=checklinkedin %>)
	{
	linkedin = $('#linkedin').val();	
	}
	if(checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "twitter" || <%=checktwitter %>)
	{
	twitter = $('#twitter').val();	
	}
	if(checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "youtube" || <%=checkyoutube %>)
	{
	youtube = $('#youtube').val();	
	}
	if(checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "tumblr" || <%=checktumblr %>)
	{
	tumblr = $('#tumblr').val();	
	}
	if(checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "entity" || <%=checkentity %>)
	{
	entity = $('#entity').val();	
	}
	
	/* console.log("Blog to Blog "+blog2blog);
	console.log("Blogger to Blogger "+blog2blogger);
	console.log("facebook "+facebook);
	console.log("twitter "+twitter);
	console.log("youtube "+youtube);
	console.log("tumblr "+tumblr);
	console.log("linkedin "+linkedin);
	console.log("Entity "+entity); */
	
	// start the ajax request to filter blog network
	  $.post(app_url+'BlogNetwork',{
	// parse the datas	  
	//'filtervalue':blog2blog,
	'blogtoblog':blog2blog,
	'blogtoblogger':blog2blogger,
	'facebook':facebook,
	'linkedin':linkedin,
	'twitter':twitter,
	'youtube':youtube,
	'tumblr':tumblr,
	'entity':entity
	},function(responseText){
	 $('body').html(responseText);
	$('#pageloader').hide("3000");   
	//console.log(responseText);	
	}); 
	/* console.log(checkboxval);
	console.log(checkstatus);	*/
	} 
	else if(!checkstatus)
	{
	//what to do when unchecking the checkbox
		var blog2blog="";
		var blog2blogger="";
		var facebook="";
		var linkedin="";
		var twitter="";
		var youtube="";
		var tumblr="";
		var entity="";
		// check if the checkbox has been initialized
		if(!checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "blogtoblog")	
		{
		//checkboxval = $('#blogtoblog').val();
		blog2blog = "";
		}
		if(!checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "blogtoblogger")
		{
		blog2blogger = "";	
		}
		if(!checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "facebook")
		{
		facebook = "";	
		}
		if(!checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "linkedin")
		{
		linkedin = "";	
		}
		if(!checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "twitter")
		{
		twitter = "";	
		}
		if(!checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "youtube")
		{
		youtube = "";	
		}
		if(!checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "tumblr")
		{
		tumblr = "";	
		}
		if(checkstatus && $('.checkerindi input[type=checkbox]:eq('+index+')').val() === "entity")
		{
		entity = "";	
		}
		
		/* console.log("Blog to Blog "+blog2blog);
		console.log("Blogger to Blogger "+blog2blogger);
		console.log("facebook "+facebook);
		console.log("twitter "+twitter);
		console.log("youtube "+youtube);
		console.log("tumblr "+tumblr);
		console.log("linkedin "+linkedin);
		console.log("Entity "+entity); */
		
		// start the ajax request to filter blog network
		  $.post(app_url+'BlogNetwork',{
		// parse the datas	  
		//'filtervalue':blog2blog,
		'blogtoblog':blog2blog,
		'blogtoblogger':blog2blogger,
		'facebook':facebook,
		'linkedin':linkedin,
		'twitter':twitter,
		'youtube':youtube,
		'tumblr':tumblr,
		'entity':entity
		},function(responseText){
		  $('body').html(responseText);
		$('#pageloader').hide("3000");    
		//console.log(responseText);	
		}); 
		/* console.log(checkboxval);
		console.log(checkstatus);	*/
	}
	
   });
	});	
   
	});
	</script>
	<script>
	// full screen functionality for blog network
	$(function () {
		$('#supported').text('Supported/allowed: ' + !!screenfull.enabled);

		if (!screenfull.enabled) {
			return false;
		}
		
		$('#toggle-btn2').click(function () {
			screenfull.toggle($('#mainrealcontainers')[0]);
		});
		
		function fullscreenchange() {
			var elem = screenfull.element;

			$('#status').text('Is fullscreen: ' + screenfull.isFullscreen);

			if (elem) {
				$('#element').text('Element: ' + elem.localName + (elem.id ? '#' + elem.id : ''));
			}

			if (!screenfull.isFullscreen) {
				$('#external-iframe').remove();
				document.body.style.overflow = 'auto';
			}
		}

		screenfull.on('change', fullscreenchange);

		// Set the initial values
		fullscreenchange();
		
	});
	</script>
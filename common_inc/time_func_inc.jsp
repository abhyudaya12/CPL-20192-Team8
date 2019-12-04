<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="format-detection" content="telephone=no">

<script>

function todayIs() {
    var today = new Date();
    var dd = today.getDate();
    var mm = today.getMonth()+1; // Jan is 0
    var yyyy = today.getFullYear();

    if(dd<10){
        dd = '0'+dd;
    }
    if(mm<10){
        mm = '0'+mm;
    }

    today = yyyy + '-' + mm + '-' + dd;
    //alert(today);
    document.getElementById("date").innerHTML = today;
    //$('#date').text(today);
} 


</script>

</head>

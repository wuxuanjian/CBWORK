// JavaScript Document

var woo_js_one_var = "你好woo";

//点击list 返回
function changetext(id)
{
	var i ;
   i = id.target;
   var o = document.getElementsByName("div_list_tiem_con");
  	for (i=0;i<o.length ;i++ )
  	{
   		if(id==o[i])
   		{
    		break;
   		}	
 	 }
	document.getElementById("div_onclick_item").innerHTML = "<p>" + "点击按钮成功"  + i + woo_js_one_var + "</p> " ;
	preventDefault1();
}

//删除弹出窗口
function preventDefault1()
{
	var child=document.getElementById("div_fudong_rect");
	child.parentNode.removeChild(child);
}

//列表项编辑
function myFunction()
{
	
	var liArray = ["woo","xuan","jian","wu","ok","bee"];
	var i=0;
	for(i=0; i<10; i++)
	{
		var person = new Object();
		person.appName = "保护水之源";
		person.appDeclare = "在环境污染越来越严重的今天。";
		person.appDeclare1 = "下载该应用积攒人品。";
		person.appPoint = "188";
		person.appIconUrl = "icon.png";
		liArray[i] = person;
	}
	
	i=0;
	document.getElementById("div_list_ul").innerHTML = "";
	while (i<liArray.length)
  	{
		var person = liArray[i];
		var item_innerHtml = 
		"<div onclick=changetext(this) id=\"div_list_tiem_con\" name=\"div_list_tiem_con\" >"
        + 
        	"<div id=\"list_icon_div_float\">" 
		+
     	 		"<img id=\"list_img_icon_rect\" " + "src=\""
		+ 
				person.appIconUrl
		+
				"\" />"
		+
        	"</div>"
        +
        	"<div id=\"list_content1_div_float\">"
		+
            	"<h3 id=\"h3_list_center\" >"
		+ 
				person.appName
		+
				"</h3> "
		+
            	"<h5 id=\"h5_list_center1\" >" 
		+
				person.appDeclare
		+ 
				" </h5> "
		+
            	"<h5 id=\"h5_list_center2\" >"
		+
				person.appDeclare1
		+
				" </h5> "
        +    
        	"</div>"
        +
        	"<div id=\"list_content2_div_float\">"
		+
        		"<h5 id=\"h5_list_center3\" >"
		+
				person.appPoint
		+
				" </h5> "
		+
            	"<h5 id=\"h5_list_center4\" >"
		+ 
				"积分"
		+ 
				"</h5> "
		+
        	"</div>"
        +
        	"<div id=\"list_content3_div_float\">"
		+
        		"<hr> "
		+
        	"</div>"
        +        
		"</div>";
		
		document.getElementById("div_list_ul").innerHTML += item_innerHtml;
  		i++;
  	}
	
}



//网络部分
var xmlhttp;
var url = "http://3.txtsql.sinaapp.com/?action=notice";
function startWorker()
{
	xmlhttp=null;
	if (window.XMLHttpRequest)
  	{// code for IE7, Firefox, Opera, etc.
  		xmlhttp=new XMLHttpRequest();
  	}
	else if (window.ActiveXObject)
  	{// code for IE6, IE5
  		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  	}
	
	if (xmlhttp!=null)
  	{
 	 	xmlhttp.onreadystatechange=state_Change1;
  		xmlhttp.open("POST",url,true);
  		xmlhttp.send(null);
 	 }
	else
  	{
  		alert("Your browser does not support XMLHTTP.");
  	}

}

function state_Change1()
{
	if (xmlhttp.readyState==4)
  	{// 4 = "loaded"
  		if (xmlhttp.status==200)
    	{// 200 = "OK"
   	 		document.getElementById('A1').innerHTML=xmlhttp.status;
   			document.getElementById('A2').innerHTML=xmlhttp.statusText;
   			document.getElementById('A3').innerHTML=xmlhttp.responseText;
			document.getElementById("div_onclick_item").innerHTML = "<p>" + xmlhttp.status + xmlhttp.statusText + xmlhttp.responseText + "</p> " ;
    	}
 		else
    	{
    		alert("Problem retrieving XML data:" + xmlhttp.statusText);
    	}
  	}
}
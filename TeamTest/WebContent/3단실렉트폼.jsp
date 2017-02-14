<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>

<script language="ⓙavascript">
NS4 = (document.layers) ? true : false;
delta = 1;
var jobArray = new Array();
var titleArray = new Array();
var job;
var ind;

</script>
</head>
<body>

<form name=IOS action=etcorgdisplay_test.html>
<script>

function loadDefaults(i, j, s)
{
if (i!='') {
document.IOS['ind'].options[getValueIndex(document.forms['IOS']['ind'], i)].selected=true;
setInd(document.forms['IOS']['ind']);
document.forms['IOS']['job'].options[getValueIndex(document.forms['IOS']['job'], j)].selected=true;
setJob(document.forms['IOS']['job']);
document.forms['IOS']['spe'].options[getValueIndex(document.forms['IOS']['spe'], s)].selected=true;
}
}
function loadDefaultJobs(i,j,s){
if( i != '' ){
document.forms['IOS']['job'].options[getValueIndex(document.forms['IOS']['job'], j)].selected=true;
fillTitle(i);
setJob(document.forms['IOS']['job']);
document.forms['IOS']['spe'].options[getValueIndex(document.forms['IOS']['spe'], s)].selected=true;
}
}
function loadDefaultSpecs(i,j,s){
if( i != '' && j != '' ){
document.forms['IOS']['spe'].options[getValueIndex(document.forms['IOS']['spe'], s)].selected=true;
fillJob(j);
}
}
function removeElement(arr, element)
{
        for(i=0; i<arr.length; i++){
                if(arr[i].search(';'+element)!=-1){
                        arr1 = arr.slice(0, i);
                        arr2 = arr.slice(i+1);
                        arr = arr1.concat(arr2);
                        return arr;
                }
        }
}
function getTitle(industry){
        titleArr = new Array();         
        if(industry =='010000'){
                var i0Arr = new Array(
"본부관내;010100",         
"본부관외;010200");
                titleArr=i0Arr.concat(titleArr);
                return titleArr;
        }
        if(industry == '020000'){
                var i1Arr = new Array(
"정당;020100",
"정치단체;020200");
                titleArr=i1Arr.concat(titleArr);
                return titleArr;
        }
        if(industry == '030000'){
                var i2Arr = new Array(
"조기축구회;030100",
"배드민턴회;030200",
"볼링회;030300",
"검도회;030400",
"태권도회;030500",
"수영모임;030600",
"당구모임;030700",
"자동차동호회;030800",
"바둑동호회;030900",
"등산모임;031100",
"낚시출조회;031200",
"기타;031300");
                titleArr=i2Arr.concat(titleArr);
                return titleArr;
        }
        if(industry == '040000'){
                var i3Arr = new Array(
"종친회;040100",
"향우회;040200",
"동창/동문회;040300",
"계모임;040400",
"음악(밴드)동아리;040500",
"미술동아리;040600",
"공작(DIY)모임;040700",
"기타;040800");                
                titleArr=i3Arr.concat(titleArr);
                return titleArr;
        }
        if(industry == '050000'){
                var i4Arr = new Array(
"지역;050100", 
"정치;050200", 
"레져/스포츠;050300", 
"친목/취미;050400", 
"기타;050500");
                titleArr=i4Arr.concat(titleArr);
                return titleArr;
        }
        return titleArr;
}        

aaFunction = new Array(
"통/반;010101",
"입주자회의;010102",
"부녀회;010103",
"각종대책위원회;010104", 
"기타;010105");

abFunction = new Array(
"통/반;010201",
"입주자회의;010202",
"부녀회;010203",
"각종대책위원회;010204", 
"기타;010205");

acFunction = new Array(
"초등학교;040301",
"중학교;040302",
"고등학교;040303",
"대학교;040304",
"대학원;040305");


noFunction = new Array("[선택할 필요없음];");

function getJobFunction(title){
if(title == '010100'){ return aaFunction ; }
if(title == '010200'){ return abFunction ; }
if(title == '040300'){ return acFunction ; }

        return noFunction; 
} 

function GetSelectedText(box){
var boxText = '';
for(var i=0; i<box.options.length; i++){
if(box.options[i].selected && box.options[i].value != ''){
boxText = box.options[i].value;
}
}
return boxText;
}

function getValueIndex(box, value){
for(var i=0; i<box.options.length; i++){
if(box.options[i].value == value)
return i;
}
return 0;
}

function compare(s1, s2){
        var t1 = s1.toLowerCase();
        var t2 = s2.toLowerCase();
        if(t1 < t2){
                return -1;
        }
        if(t1 > t2){
                return 1;
        }
        return 0;
}
function fillTitle(industry){
document.forms['IOS']['job'].length=1;
var cnt = 1;
var isSelected = false;
var arr = getTitle(industry);
arr.sort(compare);
//document.forms['IOS']['job'].length=arr.length+1;

for(var n=0; n<arr.length; n++){
newOpt=new Option;
        i = arr[n].search(';');
newOpt.value=arr[n].slice(i+1);
newOpt.text=arr[n].slice(0,i);
        if (!isSelected){
         //newOpt.selected = true;
         isSelected = true;
        }
        document.forms['IOS']['job'].options[cnt]=newOpt;
        cnt=cnt+1;
}
/* if(NS4){
window.resizeBy(delta, delta);
delta = -1*delta;
} */
}

function fillJob(title){
document.forms['IOS']['spe'].length=0;
var cnt =0;
var isSelected = false;
var arr = getJobFunction(title);
if(arr.length != 1){
        var tmp = new Array("[예시단체 선택];-1");
        arr = tmp.concat(arr);
}
for(var n=0; n<arr.length; n++){
newOpt=new Option;
        i = arr[n].search(';');
newOpt.value=arr[n].slice(i+1);
newOpt.text=arr[n].slice(0,i);
if (!isSelected){
         newOpt.selected = true;
         isSelected = true;
        }
        document.forms['IOS']['spe'].options[cnt]=newOpt;
        cnt=cnt+1;
}
if(!(NS4)){
if(arr.length != 1){
        document.forms['IOS']['spe'].style.visibility = 'visible';

}else{
        document.forms['IOS']['spe'].style.visibility = 'hidden';
}
} // not Netscapoe 4
/* if(NS4){
window.resizeBy(delta, delta);
delta = -1*delta;
} */
}

function setInd(box) {
ind = GetSelectedText(box);
if(ind != ''){
fillTitle(ind);
}
//alert(ind);
}

function setJob(box) {
title = GetSelectedText(box);
//alert(job);
if(ind != ''){
doIt();
}
}

function doIt(){
if(ind != '' && title != ''){
fillJob(title);
} else {
alert("각종단체 범주와 종류를 선택해 주세요");
}
}

<!--
function setupDefaults(){
loadDefaults("","","");
}
// -->
</script>
		<p>
		<table width=100% border=0>
			<tr>
				<td width=30% align=right class="content"><font color="#ff0000">*</font>각종단체(범주):
				</td>
				<td width=70% class="content"><select onchange=setInd(this)
					size=1 name="ind">
						<option value="" selected>[각종단체(범주)]</option>
						<option value='010000'>지역</option>
						<option value='020000'>정치</option>
						<option value='030000'>레져/스포츠</option>
						<option value='040000'>친목/취미</option>
						<option value='050000'>온라인 동호회</option>
						<option value='060000'>기타</option>
				</select></td>
			</tr>
			<tr>
				<td width=30% align=right class="content"><font color="#ff0000">*</font>각종단체(종류):
				</td>
				<td width=70% class="content"><select onchange=setJob(this)
					size=1 name="job">
						<option value="" selected>[각종단체(종류)]</option>
				<!-- 
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
				 -->
				</select></td>
			</tr>
			<tr>
				<td width=30% align=right class="content"><font color="#ff0000">*</font>예시단체:
				</td>
				<td width=70% class="content"><select size=1 name="spe">
						<option value="" selected>[예시단체]</option>
				
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						<option></option>
						
				</select></td>
			</tr>
		</table>
		<table>
			<tr>
				<td><input type=submit value=테스트></td>
			</tr>
		</table>
	</form>
</body>
</html>
==========================================================

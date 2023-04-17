##########################################################################################
## F12 > console > cmd line on chrome
##########################################################################################
>           // <== input below setInterval() on console prompt

##########################################################################################
## setInterval : start to click connect button
##########################################################################################
function connectCallback() {
    var buttons = document.querySelectorAll("colab-dialog.yes-no-dialog paper-button#cancel"); 
    buttons.forEach(function(btn) { 
        btn.click(); 
    }); 
    console.log("1분마다 재연결 클릭"); 
    document.querySelector("colab-toolbar-button#connect").click(); 
} 
var intId=setInterval(connectCallback,1000*60);


##########################################################################################
## clearInterval : stop to click connect button
##########################################################################################
clearInterval(intId);

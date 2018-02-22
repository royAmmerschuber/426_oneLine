function deleteWindow(text,id) {
    if(windowHider("delWin")){
        var win = document.getElementById("delWin");
        win.getElementsByTagName("b").item(0).innerText=text;
        document.getElementById("delOk").href="/Shop/Edit?act=del&id="+id;
    }
}
function deleteDiscWindow(text,id) {
    if(windowHider("delDiscWin")){
        var win = document.getElementById("delDiscWin");
        win.getElementsByTagName("b").item(0).innerText=text;
        document.getElementById("delDiscOk").href="/Shop/Edit?act=delDisc&id="+id;
    }
}
function addDiscWindow(text,id) {
    if(windowHider("setDiscWin")){
        var win = document.getElementById("setDiscWin");
        document.getElementById("setDiscId").value=id;
        win.getElementsByTagName("b").item(0).innerText=text;
    }
}

function windowHider(id){
    var win=document.getElementById(id);
    var dim=document.getElementById("dimmer");
    if (win.className.split(" ")[1] === "hidden") {
        win.className = win.className.split(" ")[0];
        dim.className = dim.className.split(" ")[0];
        return true;
    } else {
        win.className += " hidden";
        dim.className += " hidden";
        return false;
    }
}


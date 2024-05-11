function textDisplayCheck(obj){
    if(obj.checked){
        obj.parentNode.nextElementSibling.classList.remove("d-none")
    }else if(!obj.parentNode.nextElementSibling.classList.contain("d-none")){
        obj.parentNode.nextElementSibling.classList.add("d-none")
    }    
}
function textDisplaySelect(id,displayNums){
    var idString=String(id);
    if(idString.includes(ObservationName[0][0])){
        document.getElementById(ObservationName[1][5]+ObservationName[0][0]+'Div').classList.toggle("none");
    }else if(idString.includes(ObservationName[0][1])){
        document.getElementById(ObservationName[1][5]+ObservationName[0][1]+'Div').classList.toggle("none");
    }else if(idString.includes(ObservationName[2][0])){
        if(document.getElementById(id).value>=1){
            if(document.getElementById(ObservationName[2][1]+'Div').classList.contains("none")){
                document.getElementById(ObservationName[2][1]+'Div').classList.remove("none");
            }
        }else{
            if(!document.getElementById(ObservationName[2][1]+'Div').classList.contains("none")){
                document.getElementById(ObservationName[2][1]+'Div').classList.add("none");
            }
        }
    }else{
        for(var i=0;i<3;i++){
            if(idString.slice(0,-6)==ObservationName[2][1+i*2]){
                if(document.getElementById(id).value==textDisplay[1+i]){
                    if(document.getElementById(idString.slice(0,-6)+'TextDiv').classList.contains("none")){
                        document.getElementById(idString.slice(0,-6)+'TextDiv').classList.remove("none");
                    }
                }else{
                    if(!document.getElementById(idString.slice(0,-6)+'TextDiv').classList.contains("none")){
                        document.getElementById(idString.slice(0,-6)+'TextDiv').classList.add("none");
                    }
                }
                break;
            }
        }
    }
}
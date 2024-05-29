$(document).ready(function() {
    var sds = document.getElementById("dum");
    if(sds == null){
        alert("You are using a free package.\n You are not allowed to remove the tag.\n");
        $("#selection").hide();
    }
    var sdss = document.getElementById("dumdiv");
    if(sdss == null){
        alert("You are using a free package.\n You are not allowed to remove the tag.\n");
        $("#selection").hide();
    }
})

var handles = ["SELECT DISTRICT","Ahmadnagar","Pune","Solapur","Nashik","Beed"];

$(function() {
  var options = '';
  for (var i = 0; i < handles.length; i++) {
      options += '<option value="' + handles[i] + '">' + handles[i] + '</option>';
  }
  $('#listBox').html(options);
});
function selct_district($val)
{
    if($val=='SELECT DISTRICT') {
   var options = '';
  $('#secondlist').html(options);
  }
 if($val=='Ahmadnagar') {
   var andhra = ["Pathardi","Jamkhed","Karjat","Sangamner","Rahuri"];
   $(function() {
  var options = '';
  for (var i = 0; i < andhra.length; i++) {
      options += '<option value="' + andhra[i] + '">' + andhra[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Pune') {
    var ap = ["Haveli","Mulshi","Shirur","Maval"];
   $(function() {
  var options = '';
  for (var i = 0; i < ap.length; i++) {
      options += '<option value="' + ap[i] + '">' + ap[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Solapur') {
    var assam = ["Akkalkot","Barshi","Karmala","Malshiras","Pandharpur"];
   $(function() {
  var options = '';
  for (var i = 0; i < assam.length; i++) {
      options += '<option value="' + assam[i] + '">' + assam[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Nashik') {
    var bihar = ["Sinnar","Trimbak","Niphad","Yeola","Dindori"];
   $(function() {
  var options = '';
  for (var i = 0; i < bihar.length; i++) {
      options += '<option value="' + bihar[i] + '">' + bihar[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
  if ($val=='Beed') {
    var Chhattisgarh = ["Aashti","Patoda","Parali","Ambajogai","Majalgaon"];
   $(function() {
  var options = '';
  for (var i = 0; i < Chhattisgarh.length; i++) {
      options += '<option value="' + Chhattisgarh[i] + '">' + Chhattisgarh[i] + '</option>';
  }
  $('#secondlist').html(options);
  });
  }
  
}
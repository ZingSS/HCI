window.onload = function(){
	var $SemesterSelector = $("#semester-list");
	var $MonthSelector = $("#month-list");
	var firstMonth = new Array();

	$SemesterSelector.change(function(){
		buildMonth();
	})

	function buildMonth(){
		var semester = $SemesterSelector.val();
		$MonthSelector.html("");
		var sed = "selected";
		if(semester.indexOf("一")!=-1){
			for (var i = 9; i <= 12; i++) {
				var monthStr = "<option value=\"" + i + "\" "+sed+">" + i + "</option>";
				$MonthSelector.append(monthStr);
				sed = "";
                }
            var monthStr = "<option value=\"" + 1 + "\" "+sed+">" + 1 + "</option>";
            $MonthSelector.append(monthStr);
		}
		else{
			for (var i = 2; i < 8; i++) {
				var monthStr = "<option value=\"" + i + "\" "+sed+">" + i + "</option>";
				$MonthSelector.append(monthStr);
				sed = "";
                }
		}
	}
}
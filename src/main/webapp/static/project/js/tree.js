(function($){
	$.fn.extend({
        tree : function(opts){
        	var settings = $.extend({
    			treeJson : ''
    		},opts||{});
        	var json = settings.treeJson;
        	var _treeJson = [];
        	_treeJson = _createTree(json,_treeJson);
        	console.log(_treeJson);
        }
    });    
})(jQuery);

function _createTree(json , _treeJson){
	json = eval(json);
	$.each(json, function(name, obj) {
		var childNode = [];
		var parent = obj;
		var id = obj.id;
		json= remove(json,"id",id);
		$.grep(json, function(childObj,i){
	   		if (childObj.pId == id) {
	   			childNode.push(childObj);
	   			json= remove(json,"id",childObj.id);
			}
	   	});
		parent.children = childNode;
		_treeJson.push(parent)
	});
	return _treeJson;
}

/**
* 从对象数组中删除属性为objPropery，值为objValue元素的对象
* @param Array array  数组对象
* @param String objPropery  对象的属性
* @param String objPropery  对象的值
* @return Array 过滤后数组
*/
function remove(array, objPropery, objValue) {
	return $.grep(array, function(cur, i) {
		return cur[objPropery] != objValue;
	});
}

// 删除指定的元素
Array.prototype.del = function(n) {
	if (n < 0)
		return this;
	return this.slice(0, n).concat(this.slice(n + 1, this.length));
}

function _create_parent(json) {
	console.log(json)
	var elements = '{';
	var parent = {};
   	for(var key in json[0]){  
   		elements += key + ":'" + json[key] + "',";
   	}
   	elements = elements.substring(0,elements.length-1) + "}";
	parent = eval('(' + elements + ')');
	parent.children = null;
   	console.log(parent);
	return parent;
}
function DateSelector(selYear, selMonth, selDay)
{
    this.selYear = selYear;
    this.selMonth = selMonth;
    this.selDay = selDay;
    this.InitYearSelect();
    this.InitMonthSelect();
}

// 增加一个最大年份的属性
DateSelector.prototype.MinYear = (new Date()).getFullYear()-5;

// 增加一个最大年份的属性
DateSelector.prototype.MaxYear = (new Date()).getFullYear()+5;

// 初始化年份
DateSelector.prototype.InitYearSelect = function()
{
    // 循环添加OPION元素到年份select对象中
    for(var i = this.MaxYear; i >= this.MinYear; i--)
    {
        // 新建一个OPTION对象
        var op = window.document.createElement("OPTION");
        
        // 设置OPTION对象的值
        op.value = String(i);
        
        // 设置OPTION对象的内容
        op.innerHTML = i;
        
        //默认当前年份为选择状态
        if(i == (new Date()).getFullYear()){
        	op.selected="selected";
        }
        
        // 添加到年份select对象
        this.selYear.appendChild(op);
    }
}

// 初始化月份
DateSelector.prototype.InitMonthSelect = function()
{
    // 循环添加OPION元素到月份select对象中
    for(var i = 0; i < 12; i++)
    {
        // 新建一个OPTION对象
        var op = window.document.createElement("OPTION");
        
       
        
        // 设置OPTION对象的内容
        if(i<9){
        	 // 设置OPTION对象的值
       		op.value = '0'+String(i+1);
        	op.innerHTML = '0'+String(i+1);
        }else{
        	 // 设置OPTION对象的值
        	op.value = String(i+1);
        	op.innerHTML = i+1
        }
        //默认当前月份为选择状态
        if(i == (new Date()).getMonth()){
        	op.selected="selected";
        }
        
        // 添加到月份select对象
        this.selMonth.appendChild(op);
    }
}

// 根据年份与月份获取当月的天数
DateSelector.DaysInMonth = function(year, month)
{
    var date = new Date(year, month, 0);
    return date.getDate();
}


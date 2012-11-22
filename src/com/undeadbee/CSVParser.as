package com.undeadbee
{
	import flash.utils.ByteArray;

	/**
	 * @auther undeadbee
	 * @blog http://www.undeadbee.com/blog
	 * @Lib name: CSVParser
	 * 将csv格式数据转化为数组或者将数组转化为csv
	 **/ 
	public class CSVParser
	{
		/**
		 * 编码utf-8
		 **/
		public static const ENCODING_UTF8:String = "utf-8";
		/**
		 * 将二进制csv数据转为二维数组
		 * @param bytes{ByteArray} csv文件的二进制形式
		 * @param encoding{String} 转字符串的编码格式
		 * @return {Array} 返回一个二维数组
		 **/ 
		public static function byteToArray(bytes:ByteArray,encoding:String = ENCODING_UTF8):Array
		{
			var resultStr:String = bytes.readMultiByte(bytes.length,encoding);
			var result:Array = CSVParser.stringToArray(resultStr);
			return result;
		}
		/**
		 * 将字符串csv数据转换为二维数组
		 * @param str csv格式的字符串
		 * @return {Array} 返回一个二维数组
		 **/ 
		public static function stringToArray(str:String):Array
		{
			var tempArr:Array=str.split(String.fromCharCode(13));
			tempArr.pop();
			var result:Array = [];
			for(var i:uint = 0;i < tempArr.length;i++)
			{
				result.push(tempArr[i].split(","));
			}
			
			return result;
		}
		/**
		 * 将二维数组转为csv字符串
		 * @param data{Array} 一个二维数组
		 * @return String 返回一个csv格式的字符串
		 **/
		public static function arrayToCSV(data:Array):String
		{
			//make a csv string
			var csv:String = '';
			for(var i:uint = 0 ; i < data.length ; i++)
			{
				for(var j:uint = 0;j < data[i].length;j++)
				{
					if(j == data[i].length - 1)
					{
						csv += data[i][j]+'\n';
					}
					else
					{
						csv += data[i][j] + ',';
					}
				}
			}
			return csv;
		}//end arrayToCSV
	}
}
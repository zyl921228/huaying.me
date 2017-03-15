using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Globalization;

/// <summary>
/// UnicodeConverter 的摘要说明
/// </summary>
public class UnicodeConverter
{
	public UnicodeConverter()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    /// <summary>
    /// 汉字转换为Unicode编码
    /// </summary>
    /// <param name="str">要编码的汉字字符串</param>
    /// <returns>Unicode编码的的字符串</returns>
    public static string ToUnicode(string str)
    {


        //汉字转成GBK十六进制码：
        byte[] gbk = Encoding.GetEncoding("GBK").GetBytes(str);
        string s1 = ""; 
        foreach (byte b in gbk)
        {
            //s1 += Convert.ToString(b, 16)+" ";
            s1 += string.Format("{0:X2}", b) + "_";
        }

        return s1.TrimEnd('_');


        //byte[] bts = Encoding.Unicode.GetBytes(str);
        //string r = "";
        //for (int i = 0; i < bts.Length; i += 2) r += "\\u" + bts[i + 1].ToString("x").PadLeft(2, '0') + bts[i].ToString("x").PadLeft(2, '0');
        //return r;
    }
    /// <summary>
    /// 将Unicode编码转换为汉字字符串
    /// </summary>
    /// <param name="str">Unicode编码字符串</param>
    /// <returns>汉字字符串</returns>
    public static string ToGB2312(string str)
    {

        //GBK十六进制码转成汉字：
        string[] b4 = str.Split('_');
        byte[] bs = new byte[b4.Length];
        for (int i = 0; i < b4.Length; i++)
        {
            bs[i] = (byte)Convert.ToByte(b4[i], 16);
        }
            
        return Encoding.GetEncoding("GBK").GetString(bs);









        //string r = "";
        //MatchCollection mc = Regex.Matches(str, @"\\u([\w]{2})([\w]{2})", RegexOptions.Compiled | RegexOptions.IgnoreCase);
        //byte[] bts = new byte[2];
        //foreach (Match m in mc)
        //{
        //    bts[0] = (byte)int.Parse(m.Groups[2].Value, NumberStyles.HexNumber);
        //    bts[1] = (byte)int.Parse(m.Groups[1].Value, NumberStyles.HexNumber);
        //    r += Encoding.Unicode.GetString(bts);
        //}
        //return r;
    }
}
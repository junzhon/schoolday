using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace dotnetApp
{
    public sealed class SqlHelper
    {
        //public static readonly string Connection = ConfigurationManager.ConnectionStrings["Students"].ConnectionString;

        public static string ConnectName;  //该属性表示 Web.Config 中的链接名称
        public static string Connecting;   //该属性表示 直接给定链接字符串

        //for SQL Server 数据库(私有的属性访问器，根据ConnectName、Connecting 确定链接字符串)
        private static string Connection
        {
            //只读属性
            get
            {
                string Path;
                if (ConnectName != null)
                    Path = ConfigurationManager.ConnectionStrings[ConnectName].ToString();
                else if (Connecting != null)
                    Path = Connecting;
                else
                    //设置缺省连接
                    Path = "Data Source=.\\SQLSERVER1;Initial Catalog=WebClass;Integrated Security=True";
                    //Path = ConfigurationManager.ConnectionStrings["Students"].ConnectionString;
                return Path;
            }
        }

        //本类中的方法均为静态方法，不需要进行实例化        
        //if (conn.State == ConnectionState.Closed) { 
        //    conn.Open(); 
        //}
        //  if (conn.State == ConnectionState.Open || conn.State == ConnectionState.Broken)
        //conn.Close(); 


        //执行Select SQL语句 返回数据记录
        public static SqlDataReader getDataReader(string sql)
        {
            string Path = Connection;
            SqlConnection conn = new SqlConnection(Path);
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State.ToString() == "Closed") conn.Open();
            //CloseConnection解决流读取数据模式下，数据库连接不能有效关闭的情况
            SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return myReader;
        }

        public static SqlDataReader getDataReader(string sql, params SqlParameter[] values)
        {
            string Path = Connection;
            SqlConnection conn = new SqlConnection(Path);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddRange(values);
            //cmd.Parameters.AddWithValue(values);
            if (conn.State.ToString() == "Closed") conn.Open();
            SqlDataReader myReader = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            return myReader;
        }

        //插入、更新、删除（执行 Insert/Update/Delete SQL语句)
        public static int ExecuteSql(string sql)
        {
            string Path = Connection;
            SqlConnection conn = new SqlConnection(Path);
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State.ToString() == "Closed") conn.Open();
            int num = cmd.ExecuteNonQuery();
            if (conn.State.ToString() == "Open") conn.Close();
            return num;
        }

        public static int ExecuteSql(string sql, params SqlParameter[] values)
        {
            string Path = Connection;
            SqlConnection conn = new SqlConnection(Path);
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddRange(values);
            if (conn.State.ToString() == "Closed") conn.Open();
            int num = cmd.ExecuteNonQuery();
            if (conn.State.ToString() == "Open") conn.Close();
            return num;
        }

        //返回数据集(DataSet)
        public static DataSet getDataSet(string sql)
        {
            string Path = Connection;
            SqlConnection conn = new SqlConnection(Path);
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter myAdapter = new SqlDataAdapter();
            myAdapter.SelectCommand = cmd;
            DataSet ds = new DataSet();
            if (conn.State.ToString() == "Closed") conn.Open();
            myAdapter.Fill(ds);
            if (conn.State.ToString() == "Open") conn.Close();
            return ds;
        }

        //返回数据集中的表(DataTable)
        public static DataTable getDataTable(string sql)
        {
            string Path = Connection;
            SqlConnection conn = new SqlConnection(Path);
            SqlCommand cmd = new SqlCommand(sql, conn);
            SqlDataAdapter myAdapter = new SqlDataAdapter();
            myAdapter.SelectCommand = cmd;
            DataTable dt = new DataTable();
            if (conn.State.ToString() == "Closed") conn.Open();
            myAdapter.Fill(dt);
            if (conn.State.ToString() == "Open") conn.Close();
            return dt;
        }

        //返回记录数
        public static int getCount(string sql)
        {
            string Path = Connection;
            SqlConnection conn = new SqlConnection(Path);
            SqlCommand cmd = new SqlCommand(sql, conn);
            if (conn.State.ToString() == "Closed") conn.Open();
            int count = (int)cmd.ExecuteScalar();
            if (conn.State.ToString() == "Open") conn.Close();
            return count;
        }

        //可空数据的输入:
        //SqlParameter中,如果是"",则数据库中的数据为""或者0.
        //如何SqlParameter是Null,程序运行报错"没有提供参数."
        //如何表示数据库中的Null?SqlParameter用DBNull.Value.
        //如果数据库中的值是Null,AOD.net读取为DBNull.Value.而该DBNull.Value不能转换为string.
        //可空类型,int?   bool?
        public static object FromDBValue(object value)
        {
            if (value == DBNull.Value)
            {
                return null;
            }
            else
            {
                return value;
            }
        }

        public static object ToDBValue(object value)
        {
            if (value == null)
            {
                return DBNull.Value;
            }
            else
            {
                return value;
            }
        }


        //for Access 数据库
        //private static string Connection
        //{
        //    get
        //    {
        //        string DBName = "App_Data/gstbook.mdb";
        //        string Path = string.Format("PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA Source={0}", HttpContext.Current.Server.MapPath(DBName));
        //        //string Path =string.Format("PROVIDER=Microsoft.Jet.OLEDB.4.0;DATA Source={0}",HttpContext.Current.Server.MapPath(ConfigurationManager.AppSettings[DBPath]));	
        //        return Path;
        //    }
        //}

    }
}
package com.dao;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
/**
 * 数据库操作工具类
 * 1）自动从db.properties文件中加载数据连接信息，如果找不到这个文件则提供默认值
 * 2）具备连接数据库，关闭连接的能力
 * 3）可以执行添加，删除，修改的操作
 * @author dey
 * @since 2017-7-25
 * @version 1.0
 * **/
public class BaseDao {
	  static  String driver="com.mysql.jdbc.Driver";
	  static  String url="jdbc:mysql://localhost:3306/dog";
	  static  String username="root";
	  static  String password="123";
	  //静态代码块（只会访问静态变量以及静态方法），只会执行一次
	  static{
		  initDb();
	  };
      private Connection conn=null;//连接对象
      private PreparedStatement ps=null;//预处理命令
      private ResultSet rs=null;//结果集对象
      //从配置文件db.properties中加载数据库连接信息
      public static void initDb(){
    	    Properties  prop=new Properties();
    	  InputStream in=BaseDao.class.getClassLoader().getResourceAsStream("db.properties");
    	    try {
				prop.load(in);//从配置文件中加载信息
				//将配置文件中加载的信息赋值给变量
				driver=prop.getProperty("driver");
				url=prop.getProperty("url");
				username=prop.getProperty("username");
				password=prop.getProperty("password");
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				try {
					in.close();//关闭文件流
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
      }
      //构造方法
      public BaseDao(){
    	  
      }
      public BaseDao(Connection conn){
    	  try {
			if(conn!=null || conn.isClosed()==false){
				    this.conn=conn;
			  }
		} catch (SQLException e) {
			e.printStackTrace();
		}
      }
     //数据库连接是否自动提交事务
//      private boolean oldAutoCommit=false;
     
    //连接数据库
      public Connection connect(){
	    	    try {
	    	    	  if(conn ==null || conn.isClosed()){
						Class.forName(driver);
						this.conn=DriverManager.getConnection(url,username,password);
	    	    	  }
				} catch (Exception e) {
					e.printStackTrace();
				}
    	   return conn;
      }
      //断开连接
      public void close(){
    	  try {
    		  if(rs!=null){
    			  rs.close();
    		  }
    		  if(ps!=null){
    			  ps.close();
    		  }
    		  if(conn!=null && !conn.isClosed() ){
    			  conn.close();
    		  }
    		  conn=null;
		} catch (Exception e) {
			e.printStackTrace();
		}
      }
      
      public int execute(String sql,Object[] params){
    	  int affactRows=0;//记录有多少条数据
	       try {
			    this.connect();//连接数据库
			    ps=this.conn.prepareStatement(sql);
			    if(params !=null && params.length>0){
			    	for (int i = 0; i < params.length; i++) {
						  ps.setObject(i+1, params[i]);
					}
			    }
			    affactRows=ps.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				this.close();//关闭数据库
			}
	        return affactRows;
      }
	public PreparedStatement getPs() {
		return ps;
	}
	public void setPs(PreparedStatement ps) {
		this.ps = ps;
	}
	public ResultSet getRs() {
		return rs;
	}
	public void setRs(ResultSet rs) {
		this.rs = rs;
	}
	public Connection getConn() {
		return conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
   
}



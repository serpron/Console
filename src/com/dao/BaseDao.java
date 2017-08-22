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
 * ���ݿ����������
 * 1���Զ���db.properties�ļ��м�������������Ϣ������Ҳ�������ļ����ṩĬ��ֵ
 * 2���߱��������ݿ⣬�ر����ӵ�����
 * 3������ִ����ӣ�ɾ�����޸ĵĲ���
 * @author dey
 * @since 2017-7-25
 * @version 1.0
 * **/
public class BaseDao {
	  static  String driver="com.mysql.jdbc.Driver";
	  static  String url="jdbc:mysql://localhost:3306/dog";
	  static  String username="root";
	  static  String password="123";
	  //��̬����飨ֻ����ʾ�̬�����Լ���̬��������ֻ��ִ��һ��
	  static{
		  initDb();
	  };
      private Connection conn=null;//���Ӷ���
      private PreparedStatement ps=null;//Ԥ��������
      private ResultSet rs=null;//���������
      //�������ļ�db.properties�м������ݿ�������Ϣ
      public static void initDb(){
    	    Properties  prop=new Properties();
    	  InputStream in=BaseDao.class.getClassLoader().getResourceAsStream("db.properties");
    	    try {
				prop.load(in);//�������ļ��м�����Ϣ
				//�������ļ��м��ص���Ϣ��ֵ������
				driver=prop.getProperty("driver");
				url=prop.getProperty("url");
				username=prop.getProperty("username");
				password=prop.getProperty("password");
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				try {
					in.close();//�ر��ļ���
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
      }
      //���췽��
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
     //���ݿ������Ƿ��Զ��ύ����
//      private boolean oldAutoCommit=false;
     
    //�������ݿ�
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
      //�Ͽ�����
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
    	  int affactRows=0;//��¼�ж���������
	       try {
			    this.connect();//�������ݿ�
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
				this.close();//�ر����ݿ�
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



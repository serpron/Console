package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.News;

public class NewsDao extends BaseDao {
	public List<News> findAll(){
		List<News> list=new ArrayList<News>();
		Connection conn=null;
		try{
			conn=this.connect();
			String sql="select * from news";
    		PreparedStatement ps=conn.prepareStatement(sql);
    		ResultSet rs=ps.executeQuery();
    		while(rs.next()){
    			News news=new News();
    			news.setnId(rs.getInt("nId"));
    			news.setnTid(rs.getInt("nTid"));
    			news.setnTitle(rs.getString("nTitle"));
    			news.setnAuthor(rs.getString("nAuthor"));
    			news.setnCreateDate(rs.getDate("nCreateDate"));
    			news.setnPicPath(rs.getString("nPicPath"));
    			news.setnContent(rs.getString("nContent"));
    			news.setnModifyDate(rs.getDate("nModifyDate"));
    			news.setnSummary(rs.getString("nSummary"));
    			list.add(news); 
    		}
		}catch(Exception e){
    		e.printStackTrace();
    		//throw new RuntimeException(e);
    	}finally{
    		close();
    	}
		return list;
	}
	public void add( News news){
		String sql="insert into News (nTid,nTitle,nAuthor,nCreateDate,nPicPath,nSummary,nContent) values(?,?,?,?,?,?,?)";
		Object[] params=new Object[]{news.getnTid(),news.getnTitle(),
				news.getnAuthor(),news.getnCreateDate(),news.getnPicPath(),news.getnSummary(),news.getnContent()};
		this.execute(sql, params);
	}
	public void delete(String[] nids){
		String sql="delete from news where nid in(";
		for(int i=0;i<nids.length;i++){
			sql+=" ?";
			if(i!=nids.length-1)
				sql+=",";
		}
		sql +=")";
		this.execute(sql, nids);
		
	}

}


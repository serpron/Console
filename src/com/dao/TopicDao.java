package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.bean.Topic;

public class TopicDao extends BaseDao {
	
	public List<Topic> findAll(){
		List<Topic> list = new ArrayList<Topic>();
 		Connection conn=null;
 		try {
 			conn=connect();
 			String sql="select * from topic order by tid";
 			PreparedStatement ps=conn.prepareStatement(sql);
 			ResultSet rs=ps.executeQuery();
 			while (rs.next()) {
 				Topic topic =new Topic();
 				topic.setTid(rs.getInt("tid"));
 				topic.setTname(rs.getString("tname"));
 				list.add(topic);
 			}
 		} catch (Exception e) {
 			e.printStackTrace();
 		}finally{
 			this.close();
 		}
 		return list;		
	}
	
	public void delete(String [] tids){
		String sql = "delete from topic where tid in( ";
		for(int i=0;i<tids.length;i++){
			sql += "?";
			if(i!=tids.length-1)
				sql += ",";
		}
		sql += ")";
		this.execute(sql, tids);
	}
}

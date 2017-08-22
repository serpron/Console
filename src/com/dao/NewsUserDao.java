package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;
import com.bean.NewsUsers;

public class NewsUserDao extends BaseDao{
     public NewsUsers findByName(String name,String pwd){
    	 NewsUsers newsUsers=null;
    		Connection conn=null;
    		try {
    			conn=connect();
    			String sql="select * from news_users where uname=? and upwd=?";
    			PreparedStatement ps=conn.prepareStatement(sql);
    			ps.setString(1, name);
    			ps.setString(2, pwd);
    			ResultSet rs=ps.executeQuery();
    			while (rs.next()) {
    				newsUsers=new NewsUsers();
    				newsUsers.setUid(rs.getInt("uid"));
    				newsUsers.setUname(rs.getString("uname"));
    				newsUsers.setUpwd(rs.getString("upwd"));
    			}
    		} catch (Exception e) {
    			e.printStackTrace();
    		}finally{
    			this.close();
    		}
    		System.out.println(newsUsers);
    	 return newsUsers;
     }
     public void add(NewsUsers user){
    	 this.connect();
    	 String sql="insert into news_users(uid,uname,upwd) values(?,?,?)";
    	 Object[] params={user.getUid(),user.getUname(),user.getUpwd()};
    	 this.execute(sql, params);
     }
     public static void main(String[] args) {
		Scanner input =new Scanner(System.in);
		System.out.print("yonghmign");
		String uname=input.next();
		System.out.print("mima");
		String upwd=input.next();
	    NewsUsers user=new NewsUsers();
		user.setUname(uname);
		user.setUpwd(upwd);
		NewsUserDao dao=new NewsUserDao();
		dao.add(user);
		NewsUsers users=dao.findByName(uname,upwd);
		System.out.println(users.getUname()+users.getUpwd());
		
	}
}

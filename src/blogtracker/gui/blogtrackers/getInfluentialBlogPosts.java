/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package blogtracker.gui.blogtrackers;

import blogtracker.util.UtilFunctions;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;


/**
 *
 * @author skumar34
 */
public class getInfluentialBlogPosts extends UtilFunctions
{
	public getInfluentialBlogPosts()
	{
		//empty constructor for Flex to initialize this class;
	}

	public String getPost(int postID)
	{
		//System.out.println(postID);
		String post =  getBlogPost(postID);
		return post;
	}


	//	public List<InfluentialBlogPost> getinflblogposts(double commentWeight, double inpLinkWeight, double outLinkWeight, java.util.Date startDate, java.util.Date endDate, ArrayList<Integer> selsites)
	//	{
	//
	//		try
	//		{
	//			java.text.SimpleDateFormat dFormat=new java.text.SimpleDateFormat("yyyy-MM-dd");
	//			String selSitesQuery = getSelSitesQuery(selsites);
	//			Connection conn = getConn();
	//			Statement stmt = conn.createStatement();
	//			String sqlStatement = "SELECT blogpost_id, title,post, num_comments,num_outlinks,num_inlinks,post_length,blogger  FROM blogposts WHERE "+selSitesQuery+" (date >= '" +dFormat.format(startDate) + "' AND date <= '" + dFormat.format(endDate) + "') ORDER BY date";
	//			ResultSet rs = stmt.executeQuery(sqlStatement);
	//
	//			ArrayList<InfluentialBlogPost> blogpostList=new ArrayList<InfluentialBlogPost>();
	//
	//			while(rs.next())
	//			{
	//				int postID = rs.getInt("blogpost_id");
	//				int comments = rs.getInt("num_comments");
	//				String title = rs.getString("title");
	//				int numOutLinks = rs.getInt("num_outlinks");
	//				int numInLinks = rs.getInt("num_inlinks");
	//				int postLength = rs.getInt("post_length");
	//				String bloggerName=rs.getString("blogger");
	//				String postContent=rs.getString("post");
	//				double lengthFactor= 0.0;
	//				//2 776 6269
	//				if(postLength <= 350)
	//					lengthFactor = 1.0;
	//				if(postLength > 350 && postLength <=1500)
	//					lengthFactor = 2.0;
	//				if(postLength > 1500)
	//					lengthFactor = 3.0;
	//				double scalingFactor = lengthFactor;
	//				double outLinksNormalized = numOutLinks/lengthFactor;
	//
	//				double influenceFlow = (commentWeight*comments) + (inpLinkWeight*numInLinks) -(outLinkWeight* outLinksNormalized);
	//
	//				double influence = scalingFactor * influenceFlow;
	//
	//				//boolean flagFound=false;
	//				InfluentialBlogPost inflpst = new InfluentialBlogPost(bloggerName, postID, title, influence, postContent);
	//				blogpostList.add(inflpst);
	//			}
	//
	//			ArrayList<InfluentialBlogPost> finalBloggersList=new ArrayList<InfluentialBlogPost>();
	//
	//
	//			for(InfluentialBlogPost temp: blogpostList)
	//			{ //System.out.println(temp.getBlogger()+" "+temp.getInfluenceScore());
	//				if(temp == null)
	//				{
	//					continue;
	//				}
	//				double infscore = temp.getInfluenceScore();
	//				if(!Double.isInfinite(infscore)||!Double.isNaN(infscore))
	//				{
	//					finalBloggersList.add( new InfluentialBlogPost( temp.getBlogger(),temp.getBlogpostID(),temp.getTitle(),temp.getInfluenceScore(),temp.getPostContent()));
	//
	//				}//new InfluentialBlogPost(bloggersList.get(i).getBloggerName(),bloggersList.get(i).getInfluenceScore());
	//
	//			}
	//			InfluentialBlogPost[] finalPostList = new InfluentialBlogPost[finalBloggersList.size()];
	//
	//			for(int i=0;i<finalBloggersList.size();i++)
	//			{
	//				finalPostList[i]  = finalBloggersList.get(i);
	//			}
	//			Arrays.sort(finalPostList, Collections.reverseOrder());  //sort the array of objects on the basis of the frequency value.
	//			//                double maxInfluence = 0.0;
	//			//                if(finalBloggersList.length>1)
	//			//                    maxInfluence = finalBloggersList[0].getInfluenceScore();
	//			//
	//			//                for(int k=0;k<finalBloggersList.length;k++)
	//			//                {
	//			//                    finalBloggersList[k].setInfluenceScore(finalBloggersList[k].getInfluenceScore()/maxInfluence);
	//			//                }
	//			blogpostList.clear();
	//
	//			for(int k=0;k<finalPostList.length;k++)
	//			{
	//				//finalBloggersList[k].setInfluenceScore(finalBloggersList[k].getInfluenceScore()/maxInfluence);
	//				blogpostList.add(finalPostList[k]);
	//			}
	//			conn.close();
	//			return blogpostList;
	//		}
	//		catch(Exception e)
	//		{
	//
	//			e.printStackTrace();
	//			return null;
	//		}
	//	}

	public List<InfluentialBlogPost> getinflblogposts(double commentWeight, double inpLinkWeight, double outLinkWeight, java.util.Date startDate, java.util.Date endDate, String selsites)
	{

		try
		{
			java.text.SimpleDateFormat dFormat=new java.text.SimpleDateFormat("yyyy-MM-dd");

			Connection conn = getConn();
			Statement stmt = conn.createStatement();
			String sqlStatement = "SELECT blogpost_id, title,post, num_comments,num_outlinks,num_inlinks,post_length,blogger  FROM blogposts WHERE "+selsites+" and (date >= '" +dFormat.format(startDate) + "' AND date <= '" + dFormat.format(endDate) + "') ORDER BY date";
			ResultSet rs = stmt.executeQuery(sqlStatement);

			ArrayList<InfluentialBlogPost> blogpostList=new ArrayList<InfluentialBlogPost>();

			while(rs.next())
			{
				int postID = rs.getInt("blogpost_id");
				int comments = rs.getInt("num_comments");
				String title = rs.getString("title");
				int numOutLinks = rs.getInt("num_outlinks");
				int numInLinks = rs.getInt("num_inlinks");
				int postLength = rs.getInt("post_length");
				String bloggerName=rs.getString("blogger");
				String postContent=rs.getString("post");
				double lengthFactor= 0.0;

				if(postLength <= 350)
					lengthFactor = 1.0;
				if(postLength > 350 && postLength <=1500)
					lengthFactor = 2.0;
				if(postLength > 1500)
					lengthFactor = 3.0;
				double scalingFactor = lengthFactor;
				double outLinksNormalized = numOutLinks/lengthFactor;

				double influenceFlow = (commentWeight*comments) + (inpLinkWeight*numInLinks) -(outLinkWeight* outLinksNormalized);

				double influence = scalingFactor * influenceFlow;

				InfluentialBlogPost inflpst = new InfluentialBlogPost(bloggerName, postID, title, influence, postContent);
				blogpostList.add(inflpst);
			}

			ArrayList<InfluentialBlogPost> finalBloggersList=new ArrayList<InfluentialBlogPost>();
			for(InfluentialBlogPost temp: blogpostList)
			{ 
				if(temp == null)
				{
					continue;
				}
				double infscore = temp.getInfluenceScore();
				if(!Double.isInfinite(infscore)||!Double.isNaN(infscore))
				{
					finalBloggersList.add( new InfluentialBlogPost( temp.getBlogger(),temp.getBlogpostID(),temp.getTitle(),temp.getInfluenceScore(),temp.getPostContent()));
				}
			}
			InfluentialBlogPost[] finalPostList = new InfluentialBlogPost[finalBloggersList.size()];

			for(int i=0;i<finalBloggersList.size();i++)
			{
				finalPostList[i]  = finalBloggersList.get(i);
			}
			Arrays.sort(finalPostList, Collections.reverseOrder());  //sort the array of objects on the basis of the frequency value.
			blogpostList.clear();

			for(int k=0;k<finalPostList.length;k++)
			{
				blogpostList.add(finalPostList[k]);
			}
			conn.close();
			return blogpostList;
		}
		catch(Exception e)
		{

			e.printStackTrace();
			return null;
		}
	}

}